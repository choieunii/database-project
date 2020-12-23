<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String session_id = (String) session.getAttribute("userid");
String session_name = (String) session.getAttribute("username");
String log;

if (session_id == null) {
	log = "<a href=login.jsp>로그인</a>";
} else {
	log = "<a href=logout.jsp>로그아웃</a>";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
a{
color: #212121;
 text-decoration: none;
}
a:hover{
color: purple;
font-weight: bold;
border-bottom: 2px solid purple;
}
</style>
<body>
	<div
		style="display: flex; flex-direction: row; justify-content: space-around; align-content: center; margin-top: 40px; margin-right: 30px;width: 100%;">
		<span style="font-size: 40px; font-weight: bold;">MY MUSIC</span> <a
			href="music.jsp">음악정보</a> <a href="artist.jsp">가수정보</a> <a
			href="album.jsp">앨범정보</a> <a href="musicboard.jsp">음악포스팅</a> <a
			href="playlist.jsp">플레이리스트</a> <div
			style="margin-right: 30px;"><%=log %></div>
	</div>
</body>
</html>