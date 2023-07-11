<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<%
	String t_userId = (String)session.getAttribute("userId");
	boolean t_isLogin = false;
	if(t_userId != null && !t_userId.isEmpty()){ //로그인 된 경우
		t_isLogin = true;
	}
	
%>
<meta charset="UTF-8">
<!-- 부트스트랩 반응형에 필요 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 기본 js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/movieAPI.js"></script>
<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- 생성 css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css" />
<link href="custom.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/custom.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/movie.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/DCSS/login.css" >

<title>무비라이크-영화를 좋아하는 사람들을 위한 무비 라이크</title>

</head>
<body>
 <div>
	<header>
		<nav class="f_left">
			<ul>
				<li>
					<a href="<%=request.getContextPath()%>/index.jsp">
						<img src="<%=request.getContextPath()%>/images/logo-white.png" alt="로고" class="logo_img"/>
					</a>
				</li>
				<li><a href="<%=request.getContextPath()%>/movie/movieList.jsp?genreNo=1">로맨스</a></li>
				<li><a href="movieList.jsp?genreNo=2">액션</a></li>
				<li><a href="movieList.jsp?genreNo=3">공포</a></li>
				<li><a href="movieList.jsp?genreNo=4">SF</a></li>
				<li><a href="movieList.jsp?genreNo=5">코미디</a></li>
				<li><a href="movieList.jsp?genreNo=6">애니</a></li>
			</ul>
		</nav>
		
		<div class="header_menu f_right">
			<div class="serch_box f_left">
				<div class="serch_img f_left">
					<img src="<%=request.getContextPath()%>/images/serch.svg" alt="검색이미지">
				</div>
				
				<%				
					String cookieCheck = request.getHeader("Cookie");
					String serchTxt="";
					if(cookieCheck != null) {
						Cookie[] cookies = request.getCookies();
					    for(Cookie cookie : cookies) {
					    	if(cookie.getName().equals("serchText")){
					    		serchTxt = cookie.getValue();
					    	}
					    }
					}
				%>
				<form name="serchFrm" method="get" action="<%=request.getContextPath()%>/movie/addSerchCookie.jsp">
					<div class="header_serch f_left">
						<input type="text" class="serch_txt" name="serch" 
								placeholder="영화를 검색해보세요" value="<%=serchTxt%>">
					</div>
				</form>
			</div><!-- serch_box -->
			
			<div class="f_left">
				<%if(t_isLogin){ %>
					<input type="button" class="mypage" value="Mypage" onclick = "location.href='<%=request.getContextPath()%>/myPage/myPageMain.jsp'">
					<input type="button" class="logout_btn" value="Logout" 
					onclick = "location.href='<%=request.getContextPath()%>/login/logout.jsp'">
				
				<%}else{ %>
					<input type="button" class="login_btn" value="Login">
				<%} %>
			</div><!-- login_btn -->
		</div><!-- header_menu -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	</header>
<%@ include file="../login/login.jsp" %>		

	
