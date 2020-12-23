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
th,td {
	padding: 8px;;
}
</style>
<%
	String artistid = request.getParameter("artistid");
Connection myConn = null;
Statement stmt = null;
ResultSet rs = null;
String SQL = "";
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

SQL = "select artistcomment from pj_artistcomment where artistid='"+artistid+"'order by CommentDate";
rs = stmt.executeQuery(SQL);

%>
<body style="margin:0px; padding:0px; border: 0px;">
	<%@ include file="top.jsp" %>
	<form method="post" action="comment_insert.jsp">
	<div
		style="display: flex; flex-direction: column; justify-content: center; align-content: center;">
		<div
			style ="margin-top:50px;"></div>
		<table border="0" align="center" width="850"
			border-collapse="collapse">
			<tr>
				<td align="center" bgcolor="#337ab7"width="80"><font color=white>응원 메시지를 남겨주세요</font></td>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
			<td td align="center" style="background-color:white;"><%=rs.getString("artistcomment") %></td>
			</tr>
			<% }%>
			<tr>
			<td align="center"><input type="text" name="artistcomment" style="width: 670px; height: 30px;"></input>
			<input type="hidden" name="artistid" value="<%=artistid%>"></input>
			<input type="submit" value="등록" style="background-color: #ffffff; margin-left: 10px; width: 50px; height: 35px; border: 2px solid #337ab7;"></input></td>
			</tr>
			</table>
			</div>
			</form>
</body>
<%@include file="footer.jsp" %>
</html>