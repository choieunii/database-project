<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String session_id = (String) session.getAttribute("userid");
%>
<%
String userid = request.getParameter("userid");
String title = new String(request.getParameter("title").getBytes("8859_1"), "utf-8");
String type = request.getParameter("type");
String like = new String(request.getParameter("like").getBytes("8859_1"), "utf-8");
String reason = new String(request.getParameter("reason").getBytes("8859_1"), "utf-8");
String sql = null;
String sql_select = null;
Statement stmt = null;
Connection myConn = null;
ResultSet rs = null;

String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
String user = "ST2018112021"; // 본인 아이디(ex.STxxxxxxxxxx)
String passwd = "ST2018112021"; // 본인 패스워드(ex.STxxxxxxxxxx)
String dbdriver = "oracle.jdbc.OracleDriver";

try {
	Class.forName(dbdriver);
	System.out.println("111");
	myConn = DriverManager.getConnection(dburl, user, passwd);
} catch (SQLException ex) {
	System.err.println("SQLException: " + ex.getMessage());
}


sql = "Insert into pj_USER_POST(userid, postname, postdate, likecontent, postdescription, postlikecount) values (?,?,?,?,?,?)";

System.out.println(sql);
try {
	PreparedStatement pstmt = myConn.prepareStatement(sql);
	pstmt.setString(1, userid);
	pstmt.setString(2, title);
	java.util.Date utilDate = new java.util.Date();
	java.sql.Timestamp sqlDate = new java.sql.Timestamp(utilDate.getTime());
	pstmt.setTimestamp(3, sqlDate);
	pstmt.setString(4, like);
	pstmt.setString(5, reason);
	pstmt.setInt(6, 0);
	pstmt.executeUpdate();
	System.out.print("업데이트");
} catch (SQLException ex) {
	System.out.print("에러발생");
	ex.printStackTrace();
	String sMessage = "";
	if (ex.getErrorCode() == 20001)
	{	sMessage = "제목을 입력해주세요";}
	else if (ex.getErrorCode() == 20002)
	{	sMessage = "Like를 입력해주세요";}
	else
	{	sMessage = "내용을 입력해주세요";}
	%>
	<script>
	alert("<%=sMessage%>");
		location.href = "board_insert.jsp";
	</script>
	<%
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	location.href = "musicboard.jsp";
</script>