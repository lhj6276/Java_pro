<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//세션 체크
		String userid = null;
		
		if(session.getAttribute("userid") != null){
			userid = (String)session.getAttribute("userid");
		}
	%>
	<form action="write_result.jsp" method="post">
		<table border=1>
			<tr>
				<td><input type="text" name="title" placeholder="제목을 입력해 주세요."></td>
			</tr>
			<tr>
				<td><textarea name="content" placeholder="내용을 입력하세요."></textarea></td>
			</tr>
		</table>
		<input type="submit" value="등록">
	</form>
	
</body>
</html>