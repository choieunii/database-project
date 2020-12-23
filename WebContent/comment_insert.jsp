<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String session_id = (String) session.getAttribute("userid");
%>
<%
if(session_id!=null){
String id = null;
String comment = null;
String sql = null;
String album_sql = "Insert into pj_albumcomment(albumid, userid, commentdate, albumcomment) values (?,?,?,?)";
String artist_sql = "Insert into pj_artistcomment(artistid, userid, commentdate, artistcomment) values (?,?,?,?)";

if(request.getParameter("albumid")!=null){
id = request.getParameter("albumid");
comment = new String(request.getParameter("albumcomment").getBytes("8859_1"), "utf-8");
sql = album_sql;
}else{
id = request.getParameter("artistid");
comment = new String(request.getParameter("artistcomment").getBytes("8859_1"), "utf-8");
sql = artist_sql;
}

Connection myConn = null;
ResultSet rs = null;

String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
String user = "ST2018112021"; // 본인 아이디(ex.STxxxxxxxxxx)
String passwd = "ST2018112021"; // 본인 패스워드(ex.STxxxxxxxxxx)
String dbdriver = "oracle.jdbc.OracleDriver";

try{
	Class.forName(dbdriver);
	myConn = DriverManager.getConnection(dburl, user, passwd);
}catch(SQLException ex){
	System.err.println("SQLException : " + ex.getMessage());
}
try {
	PreparedStatement pstmt = myConn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, session_id);
	java.util.Date utilDate = new java.util.Date();
	java.sql.Timestamp sqlDate = new java.sql.Timestamp(utilDate.getTime());
	pstmt.setTimestamp(3, sqlDate);
	pstmt.setString(4, comment);
	pstmt.executeUpdate();
	System.out.print("업데이트");
} catch (Exception ex) {
	System.err.println("SQLException 2: " + ex.getMessage());
}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
var albumid = "<%=request.getParameter("albumid")%>";
var artistid = "<%=request.getParameter("artistid")%>";
var sessionid = "<%=session_id%>";
if(sessionid=="null"){alert("로그인이 필요합니다.");}
if(albumid=="null" ||albumid ==""){
	location.href = "artist_comment.jsp?artistid="+artistid;
}else{
	location.href = "album_comment.jsp?albumid="+albumid;
}
</script>