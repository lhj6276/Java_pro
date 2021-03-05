<%@page import="board.boardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="board" class="board.boardDTO" scope="page"/>
<jsp:setProperty property="title" name="board"/>
<jsp:setProperty property="content" name="board"/>
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
		
		
		//로그인 한 회원만 글 쓰기 가능
		if(userid == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 먼저 해주세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}else{
			boardDAO bd = new boardDAO();
			int result = bd.writeContent(userid, board.getTitle(), board.getContent());
			
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('게시글 작성이 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('게시글이 작성되었습니다.')");
				script.println("location.href='board.jsp'");
				script.println("</script>");
			}
			
		}
	
	%>
</body>
</html>