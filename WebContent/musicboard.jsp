<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
th, td {
	padding: 8px;;
}
</style>
<meta charset="utf-8">
<title>게시판</title>
</head>
<%
	Connection myConn = null;
Statement stmt = null;
ResultSet rs = null;
String mySQL = "";

String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
String user = "ST2018112021"; // 본인 아이디(ex.ST0000000000)
String passwd = "ST2018112021"; // 본인 패스워드(ex.ST0000000000)
String dbdriver = "oracle.jdbc.driver.OracleDriver";

try {
	Class.forName(dbdriver);
	myConn = DriverManager.getConnection(dburl, user, passwd);
	stmt = myConn.createStatement();
} catch (SQLException ex) {
	System.err.println("SQLException: " + ex.getMessage());
}

mySQL = "select * from pj_USER_POST";
rs = stmt.executeQuery(mySQL);
%>
<body>
	<%@ include file="top.jsp"%>
	<div
		style="display: flex; flex-direction: column; justify-content: center; align-content: center;">
		<div
			style="width: 100%; display: flex; flex-direction: row; justify-content: center; align-content: center; font-size: 20px; font-weight: bold; margin-top: 30px; margin-bottom: 30px;">
			<div>좋아하는 노래/가수/앨범를 추천해 주세요</div>
			<div>
				<button style="margin-left: 20px; height: 30px; width: 70px; background-color: #ffffff; border: 1px solid #563d7c; border-radius:8px;"
					onclick="boardOnClick()">추천</button>
			</div>
		</div>
		<table border="0" align="center" width="850"
			border-collapse="collapse">
			<tr>
				<td align="center" bgcolor="#337ab7" width="200"><font
					color=white>제목</font></td>
				<td align="center" bgcolor="#337ab7" width="200"><font
					color=white>LIKE</font></td>
				<td align="center" bgcolor="#337ab7" width="400"><font
					color=white>이유</font></td>
				<td align="center" bgcolor="#337ab7" width="150"><font
					color=white>작성자</font></td>

			</tr>
			<%
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("PostName")%></td>
				<td><%=rs.getString("likecontent")%></td>
				<td><%=rs.getString("postdescription")%></td>
				<td><%=rs.getString("userid")%></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
<%@include file="footer.jsp"%>
<script>
function boardOnClick(){
	var session_id ="<%=session_id%>";
	if(session_id=="null"){
		alert("로그인이 필요합니다.");
	}
	else{
		console.log("확인");
		location.href='board_insert.jsp';
	}
}
</script>
</html>