<%@page import="product.proDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.proDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<%
	proDAO pd = new proDAO(); //객체 생성
	ArrayList<proDTO> list = pd.getProlist(); //게시글 목록 조회
	//arraylist = 가변형 배열(string,int, 객체 등)에 형과 상관없이 다 넣을 수 있다.
	
	pageContext.setAttribute("list",list); // boardDAO 가 들어 있는 배열 list
	
	
%>
  <table>
	
	<tr>
		<c:forEach var="l" begin="0" end="3" items="${list}" varStatus="st">
			<td>
				<a href="pro_detail.jsp?proID=${l.proID}">
					<img src="${l.img }">
				</a>
			</td>
		</c:forEach>
	</tr>
	

    </table>
</body>
</html>