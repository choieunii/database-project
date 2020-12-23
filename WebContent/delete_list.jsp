<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String musicid = request.getParameter("music_id");
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
mySQL = "delete from pj_listorder where musicid = "+ musicid;
System.out.print(mySQL);
rs = stmt.executeQuery(mySQL);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert("플레이 리스트에서 제거되었습니다");
	location.href = "playlist.jsp";
</script>
</head>
<body>

</body>
</html>