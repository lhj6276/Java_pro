<%@page import="board.boardDAO"%>
<%@page import="board.boardDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	function del(id){
		let comment = confirm("삭제 하시겠습니까?");
		
		if(comment == true){
			location.href="delete.jsp?num=" + id;
		}else{
			history.back();
		}
	}
</script>
	<%
	
		int num = 0;
		String param = request.getParameter("num");
		int proID = 0;
		String pro = request.getParameter("proID");
		
		
		if(param != null){
			num = Integer.parseInt(param);
		}
		if(pro != null){
			proID = Integer.parseInt(pro);
		}
		
		if(num == 0 && proID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}
		
		
		boardDAO bd = new boardDAO();
		
		//들어올 때마다 조회 수 증가
		boardDTO bt = new boardDAO().getContent(num);
		
		if(proID != 0){
			
		}
		bd.addHit(bt.getHit(), num);
		//쿠키를 이용한 새로고침 조회 수 증가 함
		Cookie[] cookies = request.getCookies();
		Cookie viewCookie = null;
		
		if(cookies != null && cookies.length > 0){
			for(int i = 0; i< cookies.length; i++){
				if(cookies[i].getName().equals("cookie" + num)){ //getName() 크롬 - f12 - application - name
					System .out.println("처음 쿠키 생성 후 back");
					viewCookie = cookies[i];
				}
			}
		}
		
		
		//view 쿠키가 생성되지 않았다면, hit 카운트 증가 후 쿠키 생성
		if(viewCookie == null){
			Cookie newCookie = new Cookie("cookie" + num , "|" + num + "|"); //name , value
			response.addCookie(newCookie);
			bd.addHit(bt.getHit(), num);
		}
		
	%>
	
	<table border=1>
		<tr>
			<th>제목</th>
			<td><%= bt.getTitle() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= bt.getUserid() %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%= bt.getRegdate() %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%= bt.getHit() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%= bt.getContent() %></td>
		</tr>
	</table>
	
	<a href="board.jsp?p=${empty param.p ? 1 : param.p}&f=${param.f}&q=${param.q}">목록으로</a>
	<a href="update.jsp?num=<%= num %>">수정</a>
	<input type="button" onclick="del(${param.num})" value="삭제">
	<!--  <a href="delete.jsp?num=<%= num %>">삭제</a>-->
	
</body>
</html>