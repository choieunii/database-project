<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String session_id = (String) session.getAttribute("userid");
%>
<%
	int musicid = Integer.parseInt(request.getParameter("musicid"));

Connection myConn = null;
String sql = null;
String sql_select = null;
String sql_playlist = null;
Statement stmt = null;
ResultSet rs = null;
String result = null;
int new_no = 0, cnt = 0;

String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
String user = "ST2018112021"; // 본인 아이디(ex.STxxxxxxxxxx)
String passwd = "ST2018112021"; // 본인 패스워드(ex.STxxxxxxxxxx)
String dbdriver = "oracle.jdbc.OracleDriver";


try{
	Class.forName(dbdriver);
	myConn = DriverManager.getConnection(dburl, user, passwd);
}catch (SQLException ex){
	System.err.println("SQLException : "+ ex.getMessage());
}
CallableStatement cstmt = myConn.prepareCall("{call insertList(?,?,?)}");
cstmt.setInt(1, musicid);
cstmt.setString(2, session_id);
cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
try{
	cstmt.execute();
	result = cstmt.getString(3);
System.out.print(result);
}catch(SQLException ex){
	System.err.println("SQLException : " + ex.getMessage());
	if (ex.getErrorCode() == 20001)
		result = "로그인이 필요합니다.";
	if (ex.getErrorCode() == 20002)
		result = "동일 음악이 플레이 리스트에 존재합니다.";
}finally{
	if(cstmt != null)
		try{
			myConn.commit();
			cstmt.close();
			myConn.close();
		}catch(SQLException ex){
			
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
	alert("<%=result%>");
	location.href = "music.jsp";
</script>
<body>

</body>
</html>