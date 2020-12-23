<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, oracle.sql.*, oracle.jdbc.driver.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
th, td {
	padding: 8px;
}

tr:hover {
	background-color: #e9ecef;
	border-bottom: 3px solid #337ab7;
}

.name:hover {
	color: purple;
	font-weight: bold;
}
</style>
<meta charset="utf-8">
<title>음악정보</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
Connection myConn = null;
CallableStatement cstmt = null;
OracleCallableStatement ocstmt = null;
ResultSet rs = null;
ResultSet cursor = null;
String search = request.getParameter("search");
String result = null;
String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
String user = "ST2018112021"; // 본인 아이디(ex.ST0000000000)
String passwd = "ST2018112021"; // 본인 패스워드(ex.ST0000000000)
String dbdriver = "oracle.jdbc.driver.OracleDriver";

try {
	Class.forName(dbdriver);
	System.out.println(search);
	myConn = DriverManager.getConnection(dburl, user, passwd);
} catch (SQLException ex) {
	System.err.println("SQLException: " + ex.getMessage());
}

cstmt = myConn.prepareCall("{call SEARCHALBUM(?, ?, ?)}");
cstmt.setString(1, search);
cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
cstmt.registerOutParameter(3, OracleTypes.CURSOR);
try {
	cstmt.execute();
	result = cstmt.getString(2);
	ocstmt = (OracleCallableStatement) cstmt;
	cursor = ocstmt.getCursor(3);
%>
<script type="text/javascript">
function albumid(id){
	location.href="album_comment.jsp?albumid="+id;
}
</script>
<body style="margin: 0px; padding: 0px; border: 0px;">
	<%@ include file="top.jsp"%>
	<div
		style="display: flex; flex-direction: column; justify-content: center; align-content: center;">
		<div
			style="width: 100%; display: flex; flex-direction: row; justify-content: center; align-content: center; font-size: 25px; font-weight: bold; margin-top: 10px; margin-bottom: 20px;">
			검색결과</div>
		<table border="0" align="center" width="850"
			border-collapse="collapse" bgcolor="#ffffff";>
			<tr>
				<td align="center" bgcolor="#337ab7" width="80"><font
					color=white>순위</font></td>
				<td align="center" bgcolor="#337ab7" width="150"><font
					color=white>앨범</font></td>
				<td align="center" bgcolor="#337ab7" width="140"><font
					color=white>아티스트</font></td>
				<td align="center" bgcolor="#337ab7" width="140"><font
					color=white>출시일</font></td>
				<td align="center" bgcolor="#337ab7" width="130"><font
					color=white>감독</font></td>
				<td align="center" bgcolor="#337ab7" width="130"><font
					color=white>좋아요수</font></td>
			</tr>
			<%
				while (cursor.next()) {
					String album_id = cursor.getString(1);
					String album_name = cursor.getString(2);
					String artist_name = cursor.getString(3);
					String album_birthdate = cursor.getString(4);	
					String splitbirth = album_birthdate.substring(0, 10);
					String album_director = cursor.getString(5);
					int album_likecount = cursor.getInt(6);
			%>
			<tr>
				<td align="center"><%=album_id %></td>
				<td align="center" class="name" id="<%=album_id %>" onclick="albumid(this.id)"><%=album_name %></td>
				<td align="center"><%=artist_name %></td>
				<td align="center"><%=splitbirth%></td>
				<td align="center"><%=album_director %></td>
				<td align="center"><%=album_likecount %></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
<%
	} catch (SQLException ex) {
System.err.println("SQLException: " + ex.getMessage());
%>
<script>
	alert("검색 결과가 없습니다.");
	location.href = "album.jsp";
</script>
<%
	} finally {
if (cstmt != null)
	try {
		myConn.commit();
		cstmt.close();
		myConn.close();
	} catch (SQLException ex) {

	}
}
%>
<%@include file="footer.jsp"%>
</html>