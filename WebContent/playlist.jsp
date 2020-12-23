<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
th, td {
	padding:8px;
}
t

.music_name:hover {
	font-color: blue;
}
</style>
<meta charset="utf-8">
<title>음악정보</title>
<%
	if (session_id == null) {
%>
<script>
	alert("로그인이 필요합니다.");
	location.href = "login.jsp";
</script>
<%
	}
%>
</head>
<body>
	<%
		Connection myConn = null;
	Statement stmt = null;
	Statement stmt2 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	String listSQL = "";
	String playSQL = "";
	String playList = "";

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
	listSQL = "select M.musicid, M.musicname, A.artistname, Al.albumname, M.musiclikecount from pj_music M, pj_artist A, pj_album Al, pj_artist_album AA, pj_album_music AM, pj_listorder L Where M.musicid = AM.musicid and Al.albumid = AM.albumid and A.artistid = AA.artistid and Al.albumid = AA.albumid and L.musicid = M.musicid order by To_number(M.musicid)";
	playSQL = "select playlistname from pj_playlist where userid = '" + session_id + "'";
	rs = stmt.executeQuery(listSQL);
	rs2 = stmt2.executeQuery(playSQL);
	if (rs2.next()) {
		playList = rs2.getString("playlistname");
	}
	%>
	<form action="delete_list.jsp" method="post" name="list" id="list">
		<div
			style="display: flex; flex-direction: column; justify-content: center; align-content: center;">
			<div
				style="width: 97%; display: flex; flex-direction: row; justify-content: space-around; align-content: center; font-size: 30px; font-weight: bold; margin: 20px 0 10px 5px;">
				<%=playList%><input type="submit" name="listdelete" value="삭제"
					style="height: 30px; width: 70px; background-color: #ffffff; border: 1px solid #563d7c; border-radius:8px;"></input>
			</div>
			<table border="0" align="center" width="850"
				border-collapse="collapse">
				<tr bgcolor="#337ab7" >
					<td align="center" border="0"; width="60"><font
						color=white>NO</font></td>
					<td align="center" border=none; width="150"><font
						color=white>제목</font></td>
					<td align="center" width="150"><font
						color=white>아티스트</font></td>
					<td align="center"  width="150"><font
						color=white>앨범</font></td>
					<td align="center"  width="60"><font
						color=white>삭제</font></td>
				</tr>
				<%
					while (rs.next()) {
					String music_id = rs.getString("musicid");
					String music_name = rs.getString("musicname");
					String artist_name = rs.getString("artistname");
					String album_name = rs.getString("albumname");
					int likecount = rs.getInt("musiclikecount");
				%>
				<tr>
					<td align="center"><%=music_id%></td>
					<td align="center" class="music_name"><%=music_name%></td>
					<td align="center"><%=artist_name%></td>
					<td align="center"><%=album_name%></td>
					<td align="center"><input type="checkbox" name="music_id"
						value="<%=music_id%>"></input></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</form>
</body>
<%@include file="footer.jsp"%>
</html>