<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
th, td {
	padding: 8px;;
}
</style>
<%
	String albumid = request.getParameter("albumid");
Connection myConn = null;
Statement stmt = null;
Statement stmt2 = null;
ResultSet rs = null;
ResultSet rs2 = null;
String SQL = "";
String sql_comment="";
String albumdescription = "";
String albumname = "";

String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
String user = "ST2018112021"; // 본인 아이디(ex.ST0000000000)
String passwd = "ST2018112021"; // 본인 패스워드(ex.ST0000000000)
String dbdriver = "oracle.jdbc.driver.OracleDriver";

try {
	Class.forName(dbdriver);
	myConn = DriverManager.getConnection(dburl, user, passwd);
	stmt = myConn.createStatement();
	stmt2 = myConn.createStatement();
} catch (SQLException ex) {
	System.err.println("SQLException: " + ex.getMessage());
}
SQL = "select albumdescription, albumname from pj_album where albumid =" + albumid;
sql_comment = "select albumcomment from pj_albumcomment where albumid='"+albumid+"'order by CommentDate";
rs = stmt.executeQuery(SQL);
rs2 = stmt2.executeQuery(sql_comment);
if (rs.next()) {
	albumname = rs.getString("albumname");
	albumdescription = rs.getString("albumdescription");
}
%>
<body>
	<%@ include file="top.jsp"%>
	<form method="post" action="comment_insert.jsp">
	<div
		style="display: flex; flex-direction: column; justify-content: center; align-content: center;">
		<div style="margin-top: 50px;";"></div>
		<table border="0" align="center" width="850"
			border-collapse="collapse">
			<tr>
				<td align="center" bgcolor="#337ab7" width="80"><font
					color=white>한줄평을 남겨주세요</font></td>
			</tr>
			<tr>
				<td align="center" style="font-weight:bold;"><%=albumname%></td>
			</tr>
			<%if(albumdescription!=null){%>
			<tr>
				<td><%=albumdescription%></td>
			</tr>
			<%}%>
			<%
			while(rs2.next()){
			%>
			<tr>
			<td td align="center" style="background-color:white;"><%=rs2.getString("albumcomment") %></td>
			</tr>
			<%} %>
			<tr>
				<td align="center"><input type = "text" name = "albumcomment" style="width: 670px; height: 30px;"></input>
				<input type="hidden" name="albumid" value="<%=albumid%>"></input>
				<input type="submit" value="등록" style="background-color: #ffffff; margin-left: 10px; width: 50px; height: 35px; border: 2px solid #337ab7;"></input></td>
			</tr>
		</table>
	</div>
	</form>
</body>
<%@include file="footer.jsp" %>
</html>