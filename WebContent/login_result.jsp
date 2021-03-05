<%@page import="java.io.PrintWriter"%>
<%@page import="user.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="us" class="user.userDTO"></jsp:useBean>
<jsp:setProperty property="userid" name="us"/>
<jsp:setProperty property="userpw" name="us"/>
<jsp:setProperty property="username" name="us"/>
<jsp:setProperty property="useremail" name="us"/>
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
		
		if(userid != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어 있습니다.')");
			script.println("location.href='index.jsp'");
			script.println("</script>");
		}
		
	
		String cmd = request.getParameter("cmd");
		System.out.println("cmd : " + cmd);
		userDAO ud = new userDAO();
		String id = us.getUserid();
		String pw = us.getUserpw();
		
		int result = ud.login(id,pw);
		System.out.println(result);
		
		switch(cmd){
		
		case "SIGN IN":
			//로그인
			if(result == 1){ //로그인 성공
				PrintWriter script = response.getWriter(); //html 태그 사용하기 위함
				session.setAttribute("userid", us.getUserid());
				script.println("<script>");
				script.println("alert('로그인이 되었습니다.')");
				script.println("location.href='index.jsp'");
				script.println("</script>");
			}else if(result == 0){ //pw 틀림
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 틀렸습니다. 다시 입력해주세요.')");
				script.println("history.back()");
				script.println("</script>");
			}else if(result == -1){ //가입되지 않음
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('가입되지 않은 회원입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else if(result == -2){ //db 오류
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('DB 오류 입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			break;
		
		case "SIGN UP":
			//회원가입
			
			result = ud.join(us);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 가입 된 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				//session.setAttribute("userid", us.getUserid());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입이 완료되었습니다.')");
				script.println("location.href='index.jsp'");
				script.println("</script>");
			}
		}	
		
	%>
</body>
</html>