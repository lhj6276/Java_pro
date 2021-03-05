<%@page import="product.proDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.proDAO"%>
<%@page import="user.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>yankee candle</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="slick/slick.min.js"></script>
    <script src="js/script.js"></script>
    <script>
    function login(security,proID){
        //alert("security : " + security);
        //alert("proID : " + proID);
        
        if(security == "U"){
        	//alert('리뷰');
        	location.href="pro_detail.jsp?proID="+proID;
        }else{
        	alert('로그인 후 이용 가능합니다.');
        	location.href="login.jsp";
        }
        
    }
    </script>
</head>

<body>
<%
		//세션 체크
		String userid = null;
		String security = null;
		proDAO pd = new proDAO(); //객체 생성
		ArrayList<proDTO> list = pd.getProlist(); //게시글 목록 조회
		//arraylist = 가변형 배열(string,int, 객체 등)에 형과 상관없이 다 넣을 수 있다.
	
		if(session.getAttribute("userid") != null){
			userid = (String)session.getAttribute("userid");
			System.out.println("userid:"+ userid );
			userDAO ud = new userDAO();
			security = ud.getSecurity(userid);
			System.out.println("security:"+ security );
		}else{
			security = "";
			System.out.println("security : " + security);
		}
		
		pageContext.setAttribute("s", security);
		pageContext.setAttribute("list", list);
		//pageContext.setAttribute("pid", ) 
		
		
	%>
	
		<%
		
			if(security.equals("U")){
		%>	
			 <a href="logout.jsp">로그아웃</a>
			<a href="board.jsp">게시판</a>	
		<%
			}else{
		 %>
		 	 <a href="login.jsp">로그인/회원가입</a>
		 
		 <%
			}
		 %>
			  <!--  <a href="test.jsp">		
			<img src="images/offers4.png">
			</a>-->

    <div id="wrap">
        <header>
            <div id="head_wrap">
                <video loop="loop" autoplay muted>
                    <!--video tag - autoplay/muted 자동재생-->
                    <source src="video/Candles-26866_1280.mp4">
                </video>
                <h1 class="logo">
                    <a href="index.html"><img src="images/logo.png" alt="logo"></a>
                </h1>
                <nav>
                    <ul>
                        <li><a href="#">BRAND</a></li>
                        <li><a href="#">PRODUCT</a></li>
                        <li><a href="#">FRANCHISE</a></li>
                        <li><a href="#">COMMUNITY</a></li>
                    </ul>
                </nav>
                <div class="bg">
                    <h1 class="logo">
                        <a href="index.html"><img src="images/logo_over.png" alt="logo"></a>
                    </h1>
                    <ul class="main_menu">
                        <li>
                            <a href="#">brand</a>
                            <ul class="sub_menu">
                                <li><a href="#">company</a></li>
                                <li><a href="#">history</a></li>
                                <li><a href="#">location</a></li>
                                <li><a href="#">&nbsp;</a></li>
                                <li><a href="#">&nbsp;</a></li>
                                <li><a href="#">&nbsp;</a></li>
                                <li><a href="#">&nbsp;</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">product</a>
                            <ul class="sub_menu">
                                <li><a href="#">candle</a></li>
                                <li><a href="#">diffuser</a></li>
                                <li><a href="#">car fragrances</a></li>
                                <li><a href="#">home fragrances</a></li>
                                <li><a href="#">home deco & accessory</a></li>
                                <li><a href="#">gift</a></li>
                                <li><a href="#">what's new</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">franchise</a>
                            <ul class="sub_menu">
                                <li><a href="#">franchise information</a></li>
                                <li><a href="#">business outlook</a></li>
                                <li><a href="#">franchise condition</a></li>
                                <li><a href="#">franchise faq</a></li>
                                <li><a href="#">store make inquiries</a></li>
                                <li><a href="#">store</a></li>
                                <li><a href="#">&nbsp;</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">community</a>
                            <ul class="sub_menu">
                                <li><a href="#">notice</a></li>
                                <li><a href="#">media & broadcast</a></li>
                                <li><a href="#">question & answer</a></li>
                                <li><a href="#">&nbsp;</a></li>
                                <li><a href="#">&nbsp;</a></li>
                                <li><a href="#">&nbsp;</a></li>
                                <li><a href="#">&nbsp;</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="side_bar">
                    <input type="checkbox" id="side_btn">
                    <label for="side_btn">
                        <span></span>
                        <span></span>
                        <span></span>
                    </label>
                    <div class="side_navi">
                        <ul>
                            <li>
                                <a href="#">BRAND</a>
                                <ul class="side_submenu">
                                    <li><a href="#">company</a></li>
                                    <li><a href="#">history</a></li>
                                    <li><a href="#">location</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">PRODUCT</a>
                                <ul class="side_submenu">
                                    <li><a href="#">candle</a></li>
                                    <li><a href="#">diffuser</a></li>
                                    <li><a href="#">car fragrances</a></li>
                                    <li><a href="#">home fragrances</a></li>
                                    <li><a href="#">home deco & accessory</a></li>
                                    <li><a href="#">gift</a></li>
                                    <li><a href="#">what's new</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">FRANCHISE</a>
                                <ul class="side_submenu">
                                    <li><a href="#">franchise information</a></li>
                                    <li><a href="#">business outlook</a></li>
                                    <li><a href="#">franchise condition</a></li>
                                    <li><a href="#">franchise faq</a></li>
                                    <li><a href="#">store make inquiries</a></li>
                                    <li><a href="#">store</a></li>
                                    <li><a href="#">&nbsp;</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">COMMUNITY</a>
                                <ul class="side_submenu">
                                    <li><a href="#">notice</a></li>
                                    <li><a href="#">media & broadcast</a></li>
                                    <li><a href="#">question & answer</a></li>
                                    <li><a href="#">&nbsp;</a></li>
                                    <li><a href="#">&nbsp;</a></li>
                                    <li><a href="#">&nbsp;</a></li>
                                    <li><a href="#">&nbsp;</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <label for="side_btn">
                        <div class="side_bg"></div>
                    </label>
                </div>
            </div>
        </header>
        <div class="clear"></div>
        <section id="aboutus">
            <div class="inner">
                <h3 class="sec_title">about us</h3>
                <ul>
                    <li>
                        <div class="circle_box">
                            <img src="images/icon1.png" alt="icon1">
                            <p>최상의 식품등급<br>파라핀 왁스</p>
                        </div>
                    </li>
                    <li>
                        <div class="circle_box">
                            <img src="images/icon2.png" alt="icon2">
                            <p>천연 면심지</p><br>
                        </div>
                    </li>
                    <li>
                        <div class="circle_box">
                            <img src="images/icon3.png" alt="icon3">
                            <p>프리미엄 품질의<br>천연 에센셜오일</p>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
        <section id="brand">
            <div class="white_bg">
                <h3>작지만 아름다운 시작</h3>
                <p>
                    양키캔들의 설립자인 마이크 키트리지(Mike Kittredge)는 그의 나이 17살 때인 1969년 미국 동북부 메사추세스주에<br>있는 작은 농촌마을
                    디어필드(Deerfield)의 부모님 집 지하실에서 처음으로 향초를 만들었습니다.....
                </p>
                <button class="more">more</button>
            </div>
        </section>
        <section id="product">
            <div class="inner">
                <h3 class="sec_title">product</h3>
                <div class="slick-container">
                    <div class="item">
                        <a href="#"><img src="images/product.png" alt="pro1"></a>
                        <a href="test.jsp" class="over_img"><img src="images/product_over.png" alt="pro1_1"></a>
                        <p>가든 피크닉<br>(Garden Picnic)</p>
                    </div>
                    <div class="item">
                        <a href="#"><img src="images/product2.png" alt="pro2"></a>
                        <a href="#" class="over_img"><img src="images/product2_over.png" alt="pro2_1"></a>
                        <p>썸머 데이드림<br>(Summer Daydream)</p>
                    </div>
                    <div class="item">
                        <a href="#"><img src="images/product3.png" alt="pro3"></a>
                        <a href="#" class="over_img"><img src="images/product3_over.png" alt="pro3_1"></a>
                        <p>쿠반 모히토<br>(Cuban Mojito)</p>
                    </div>
                    <div class="item">
                        <a href="#"><img src="images/product4.png" alt="pro4"></a>
                        <a href="#" class="over_img"><img src="images/product4_over.png" alt=" pro4_1"></a>
                        <p>어 캄앤콰이어트 플레이스<br>(A Calm & Quiet Place)</p>
                    </div>
                    <div class="item">
                        <a href="#"><img src="images/product5.png" alt="pro1"></a>
                        <a href="#" class="over_img"><img src="images/product5_over.png" alt="pro1_1"></a>
                        <p>가든 피크닉<br>(Garden Picnic)</p>
                    </div>
                    <div class="item">
                        <a href="#"><img src="images/product6.png" alt="pro2"></a>
                        <a href="#" class="over_img"><img src="images/product6_over.png" alt="pro2_1"></a>
                        <p>썸머 데이드림<br>(Summer Daydream)</p>
                    </div>
                    <div class="item">
                        <a href="#"><img src="images/product7.png" alt="pro3"></a>
                        <a href="#" class="over_img"><img src="images/product7_over.png" alt="pro3_1"></a>
                        <p>쿠반 모히토<br>(Cuban Mojito)</p>
                    </div>
                    <div class="item">
                        <a href="#"><img src="images/product8.png" alt="pro4"></a>
                        <a href="#" class="over_img"><img src="images/product8_over.png" alt=" pro4_1"></a>
                        <p>어 캄앤콰이어트 플레이스<br>(A Calm & Quiet Place)</p>
                    </div>
                </div>
            </div>
        </section>
        <section id="review">
            <div class="bg">
                <div class="inner">
                    <h3 class="sec_title">review</h3>
                    <c:forEach var="l" begin="0" end="3" items="${list }" varStatus="st">
                    <div class="review_box">
                       	<div class="review_more" onclick="login('${s }','${l.proID}')">
                       		<h5>more &gt;</h5>
                       	</div>

                        <h5>${l.proTitle }</h5>
                        <img src="${l.img }" alt="review_pro" class="review_img">
                        <img src="images/heart.png" alt="heart" class="heart">
                        <p>
                            <span class="blue">${l.sub_content }</span><br>
                            ${l.content }
                        </p>
                    </div>
                    </c:forEach>
                    
                </div>
            </div>
        </section>
        <footer>
            <div class="inner">
                <h1 class="logo">
                    <a href="index.html"><img src="images/logo.png" alt="logo"></a>
                </h1>
                <ul class="info">
                    <li>
                        <p>상호 : (주)아로마무역대표 : 임미숙</p>
                    </li>
                    <li>
                        <p>본사 : 380-871) 충청북도 충주시 기업도시2로 27(영평리 571)</p>
                    </li>
                    <li>
                        <p>서울사무소 : 135-871) 서울시 강남구 영동대로 607, 9층(삼성동, 랜드마크타워)</p>
                    </li>
                    <li>
                        <p>대표전화 : 1544-5885 사업자번호 : 220-81-99275</p>
                    </li>
                    <li>
                        <p>Copyright &copy; (주)아로마무역. All rights reserved. | 개인정보취급방침 | 이용약관</p>
                    </li>
                </ul>
                <ul class="social_icon">
                    <li><a href="#"><img src="images/social_icon1.png" alt="icon1"></a></li>
                    <li><a href="#"><img src="images/social_icon2.png" alt="icon2"></a></li>
                    <li><a href="#"><img src="images/social_icon3.png" alt="icon3"></a></li>
                    <li><a href="#"><img src="images/social_icon4.png" alt="icon4"></a></li>
                </ul>
            </div>
        </footer>
    </div>
</body>

</html>
	