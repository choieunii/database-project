<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
input {
	width: 350px;
	height: 40px;
	margin-top: 10px;
}
</style>
<meta charset="utf-8">
<title>음악정보</title>
</head>
<body>
	<%@ include file="top.jsp"%>
	<div
		style="display: flex; flex-direction: row; justify-content: center; align-content: center;">
		<div style="display: flex; flex-direction: column; width: 350px;">
			<div
				style="font-size: 30px; font-weight: bold; margin-top: 80px; margin-bottom: 20px;">
				<center>Login</center>
			</div>
			<form method=post action="login_verify.jsp">
				<input type="text" name="userID"></input> <input type="password"
					name="userPassword"></input>
				<input type="submit" name="submit" value="Login"
					style="width: 358px; height: 50px; margin-top: 20px; background-color: #337ab7; color: #ffffff;"></input>
			</form>
		</div>
	</div>
</body>
</html>