<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file = "top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
    function oneCheckbox(a){
        var obj = document.getElementsByName("type");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != a){
                obj[i].checked = false;
            }
        }
    }
</script>

<body>
<form method="post" action="board_insert_db.jsp">
  <input type="hidden" name="userid" size="30" value="<%= session_id %>">
  <div
		style="display: flex; flex-direction: column; justify-content: center; align-content: center;">
		<div
			style="width: 100%; display: flex; flex-direction: row; justify-content: center; align-content: center; font-size: 20px; font-weight: bold; margin-top: 30px; margin-bottom: 30px;">
			<div>좋아하는 노래/가수/앨범 을 추천해 주세요</div><div><button style=" margin-left: 10px; height: 30px; width: 70px; background-color: #ffffff; border: 1px solid #563d7c; border-radius:8px;" type="submit" id ="boardinsert">등록</button></div></div>
		<table border="0" align="center" 
			border-collapse="collapse">
			<tr>
				<td align="center" bgcolor="#337ab7"width="150"><font color=white>제목</font></td>
				<td><input type="text" name = "title" style="width: 500px; height:30px;"></input> </td>
			</tr>
			<tr>
				<td align="center" bgcolor="#337ab7" width="150"><font color=white>LIKE</font></td>
				<td><input type="text" name = "like" style="width: 500px; height:30px;"></input> </td>
			</tr>
			<tr>
				<td align="center" bgcolor="#337ab7" width="150"><font color=white>이유</font></td>
				<td><input type="text" name="reason" style="width: 500px; height:300px;"></input> </td>
			</tr>
		</table>
	</div>
	</form>
</body>
</html>