<%@page import="board.boardDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete page</title>
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
		}
		
		int num = 0;
		
		//게시글 번호 조회
		if(request.getParameter("num") != null){
			//System.out.println(request.getParameter("num"));
			num = Integer.parseInt(request.getParameter("num"));
		}
		
		//게시글 번호가 없으면 없는 게시글
		if(num == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 게시글 입니다.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}

		boardDTO bt = new boardDAO().getContent(num);
		
		if(!userid.equals(bt.getUserid())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제 할 권한이 없습니다.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}else{
			boardDAO bd = new boardDAO();
			int result = bd.delContent(num);
			
			
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('게시글 삭제를 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('게시글이 삭제 되었습니다.')");
				script.println("location.href='board.jsp'");
				script.println("</script>");
			}
			
		}
		
	%>
</body>
</html>