<%@page import="java.util.ArrayList"%>
<%@page import="product.proDTO"%>
<%@page import="product.proDAO"%>
<%@page import="board.boardDAO"%>
<%@page import="board.boardDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <style>
        body{
            padding-top: 100px;
        }
        #wrap{
            width: 80%;
            margin: 0 auto;

        }
    </style>
</head>
<body>
	<%
		String pro = request.getParameter("proID");
		System.out.println("pro:" + pro);
		
		if(pro == null){
			pro = "";
		}
		
		if(pro == ""){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		
		proDAO pd = new proDAO();
		
		//들어올 때마다 조회 수 증가
		proDTO pt = new proDAO().getDetail(pro);
		pageContext.setAttribute("p", pt);
		
		boardDAO bd = new boardDAO();
		ArrayList<boardDTO>list = bd.getrelist(pro); //해당 제품과 연동 된 게시글
		pageContext.setAttribute("list", list);
		
		
	%>
	<div id="wrap">
		<table class="table table-striped">
			<tr>
				<td rowspan="2">
					<img src="${p.img }">
				</td>
				<td>
					${p.proTitle }
				</td>
			</tr>
			<tr>
				<td>
					${p.content }
				</td>
			</tr>
		</table>
		
		<table class="table table-striped">
			<c:forEach var="l" items="${list}" >
			<tr>
				<td>
					${l.title }
				</td>
				<td>
					${l.userid }
				</td>
				<td>
					${l.regdate }
				</td>
				<td>
					${l.proTitle }
				</td>
				<td>
					${l.content }
				</td>
				<td>
					${l.star }
				</td>
			</tr>
			</c:forEach>
		</table>
		<a href="board.jsp" class="btn btn-default pull-right">게시판</a>
	</div>
</body>
</html>