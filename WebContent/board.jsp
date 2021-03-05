<%@page import="board.boardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<div id="wrap">
	<%
		String userid = null;
		if(session.getAttribute("userid") != null){
			userid = (String)session.getAttribute("userid");
		
	%>
		<a href="logout.jsp">로그아웃</a>
	
	<%
		}else{
	%>
		<a href="login.jsp">로그인 / 회원가입</a>
	<%
		}
	%>
	
	<%
			//세션 체크
			//String userid = null;
		
			/*if(session.getAttribute("userid") != null){
				userid = (String)session.getAttribute("userid");
			}*/
	%>
	
	
	<!-- 검색 기능 -->
	<form action="board.jsp">
		<select name="f">
			<option ${(param.f == "title") ? "selected" : "" } value="title">제목</option>
			<option ${(param.f == "userid") ? "selected" : "" } value="userid">작성자</option>
		</select>
		
		<input type="text" name="q" value="${param.q }" placeholder="검색어를 입력해주세요">
		<input type="submit" value="검색">
	</form>

    <table class="table table-striped">
    	<thead>
	        <tr>
	            <th>번호</th>
	            <th>제목</th>
	            <th>작성자</th>
	            <th>작성일</th>
	            <th>조회수</th>
	        </tr>
        </thead>
        <%
        	String param = request.getParameter("p");
        	//System.out.println("param : " + param);
        	int paging = 0;	
        
        	if(param != null){
        		paging = Integer.parseInt(param);
        	}else{
        		paging = 1;
        	}
        	String query = request.getParameter("q"); //검색어
        	
        	//첫 접속 시 query 나 field에 값이 없으면 오류가 나서 공백을 넣는다.
        	if(query == null){
        		query = "";
        	}
        	String field = request.getParameter("f"); //title or 게시글 작성자 선택
        	
        	if(field == null){
        		field = "title";
        	}
        	
        	
        	boardDAO bd = new boardDAO(); //객체 생성
        	ArrayList<boardDTO> list = bd.getlist(paging, field, query); //게시글 목록 조회
        	//arraylist = 가변형 배열(string,int, 객체 등)에 형과 상관없이 다 넣을 수 있다.
        	int count = bd.getCount(field,query); //게시글 갯수
        	pageContext.setAttribute("list",list); // boardDAO 가 들어 있는 배열 list
        	pageContext.setAttribute("count", count); // count는 조회 된 총 글의 수
        	pageContext.setAttribute("field", field); // 검색 조건 선택(title, userid) 한 값
        	pageContext.setAttribute("query", query); // 검색어 값
        	
        	//for(int i = 0; i < list.size(); i++){
			//}
        	//list.get(i).getNum()
        %>
        <tbody>
        <c:set var="page" value="${empty param.p ? 1 : param.p}"></c:set>
    	<c:set var="startNum" value="${page - (page - 1) % 5 }"></c:set>
    	<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count / 10), '.')}"></c:set>
        <c:forEach var="l" items="${list}" varStatus="st">
        
        <tr>
            <td>${l.num}</td>
            <td>
            	<a href="view.jsp?num=${l.num}&p=${param.p }&f=${field }&q=${query}">${l.title}</a>
            </td>
            <td>${l.userid}</td>
            <td>${l.regdate}</td>
            <td>${l.hit}</td>
        </tr>
        </c:forEach>
        </tbody>
		
    </table>
    
    
    <!-- 현재페이지 -->
    <!--  <div>
    	<h3>현재 페이지</h3>
    	<div>
    		<span>${(empty param.p) ? 1 : param.p}</span> / ${lastNum} pages
    	</div>
    </div>-->
    
    	
    	
    	
    <!-- 페이징 -->
    <a href="write.jsp" class="btn btn-default pull-right">글쓰기</a>
    <div class="text-center">
    <!-- 이전 -->
    
    	<c:if test="${startNum > 1 }">
    		<a href="?p=${startNum - 1 }&f=${field}&q=${query}">이전</a>
    	</c:if>
   		<c:if test="${startNum <= 1 }">
    		<a href="#" onclick="alert('첫 페이지 입니다.');">이전</a>
    	</c:if>
    <ul class="pagination">
    	<c:forEach var="i" begin="0" end="4">
	    	<c:if test="${param.p == (startNum+i) }"> <!-- 현재 활성화 된 페이지 번호 색상 변경 -->
	    		<c:set var="style" value="font-weight:bold; color:#333;"></c:set>
	    	</c:if>
	    	<c:if test="${param.p != (startNum+i) }"> <!-- 활성화 되지 않은 페이지는 변경 X -->
	    		<c:set var="style" value="color:#333"></c:set>
	    	</c:if>
    		<c:if test="${(startNum+i) <= lastNum }"> <!-- 존재하는 글 갯수만큼 페이지 번호 표현 -->
		    	<li>
		    		<a style="${style}" href="?p=${startNum+i }&f=${field}&q=${query}">${startNum+i }</a>
		    	</li>
	    	</c:if>
    	</c:forEach>
    	
    	
    </ul>
    <!-- 다음 -->
    <c:if test="${startNum + 5 <= lastNum }">
    		<a href="?p=${startNum + 5 }&f=${field}&q=${query}">이후</a>
    </c:if>
    <c:if test="${startNum +5 > lastNum }">
    		<a href="#" onclick="alert('마지막 페이지 입니다.');">이후</a>
   	</c:if>
    </div>
    
    
    
    
	
	</div>
</body>
</html>