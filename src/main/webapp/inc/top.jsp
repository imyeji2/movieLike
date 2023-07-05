<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 반응형에 필요 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 기본 js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 생성 css -->
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
						<img src="<%=request.getContextPath()%>/images/logo.png" alt="로고"/>
					</a>
				</li>
				<li><a href="#">로맨스</a></li>
				<li><a href="#">액션</a></li>
				<li><a href="#">공포</a></li>
				<li><a href="#">SF</a></li>
				<li><a href="#">코미디</a></li>
				<li><a href="#">애니</a></li>
			</ul>
		</nav>
		
		<div class="header_menu f_right">
			<div class="serch_box f_left">
				<div class="serch_img f_left">
					<img src="<%=request.getContextPath()%>/images/serch.svg" alt="검색이미지">
				</div>
				<div class="header_serch f_left">
					<input type="text" class="serch_txt" id="serch" placeholder="영화를 검색해보세요">
				</div>
			</div><!-- serch_box -->
			
			<div class="f_left">
				<input type="button" class="login_btn" value="로그인">
			</div><!-- login_btn -->
		</div><!-- header_menu -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	</header>
	
	<!-- 서다희 작업 -->
	<div class="popup members-popup">
		<div class="popup-background"></div>
		<div class="popup-wrapper">
			<div class="popup-inner">
				<div class="close-btn">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
					  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
					</svg>
				</div>
				<div id = "logo">
					<img src = "../images/logo.png">
				</div>
				
				<!-- 로그인 -->
				<div class="login">
					<form>
						<div class="form-floating">
							<input type="email" class="form-control" id="floatingInput" placeholder="name@example.com"> 
							<label for="floatingInput">이메일 주소</label>
						</div>
						<div class="form-floating">
							<input type="password" class="form-control" id="floatingPassword" placeholder="Password"> 
							<label for="floatingPassword">비밀번호</label>
						</div>
						<div class = "submit">
							<input type="submit" value="로그인" name = "login">
						</div>
					</form>
					<div class="members">
						<div class="find">
							<a href="#">아이디 찾기</a>
							<div class="wall"></div>
							<a href="#">비밀번호 찾기</a>
						</div>
						<a class="register-btn">
							<p>회원가입</p>
						</a>
					</div>
				</div>
				
				<!-- 회원가입  -->
				<div class="register">
					<form>
						<div class="form-floating">
							<input type="email" class="form-control" id="registerId" placeholder="예) name@example.com"> 
							<label for="registerId">이메일 주소</label>
						</div>
						<div class="form-floating">
							<input type="password" class="form-control" id="registerPassword" placeholder="비밀번호를 입력해주세요"> 
							<label for="registerPassword">비밀번호</label>
						</div>
						<div class="match">
							<div class="form-floating">
								<input type="text" class="form-control" id="registerName" placeholder="예) 홍길동"> 
								<label for="registerName">이름</label>
							</div>
							<div class="gender">
								<input type="radio" name="gender" id="man">
								<label for="man">남자</label>
								<input type="radio" name="gender" id="woman">
								<label for="woman">여자</label>
							</div>
						</div>
						<div class="form-floating">
							<input type="tel" class="form-control" id="registerBirth" placeholder="예) 19990101" maxlength="8"> 
							<label for="registerBirth">생년월일 (8글자)</label>
						</div>
						<button class="confirm" type="button">확인</button>
					</form>
				</div>
				
			</div>
		</div>
	</div>
</div>
<script>
	$('.login_btn').click(function(){
		$('.login').show();
		$('.register').hide();
		$('.popup.members-popup').addClass('open');
	});
	
	$('.popup-background').click(function(){
		$('.popup').removeClass('open');
	});
	$('.close-btn').click(function(){
		$('.popup').removeClass('open');
	});
	
	$('.register-btn').click(function(){
		$('.login').hide();
		$('.register').show();
	});
	
	$('.confirm').click(function(){
		let id = $('#registerId').val();
		let pass = $('#registerPassword').val();
		let name = $('#registerName').val();
		let man = $('#man').is(':checked');
		let woman = $('#woman').is(':checked');
		let birth = $('#registerBirth').val();
		
		if ( id == '') {
			alert('이메일을 확인해주세요');
			return false;
		}else if ( pass == "" ) {
			alert('비밀번호를 확인해주세요');
			return false;
		}else if ( name == "" || name.length < 2 ) {
			alert('이름을 확인해주세요');
			return false;
		}else if ( man == false && woman == false ) {
			alert('성별을 선택해주세요');
			return false;
		}else if ( birth == '' || birth.length < 8 ) {
			alert('생년월일을 확인해주세요');
			return false;
		}else {
			alert('회원가입이 완료되었습니다');
			$('.register').hide();
			$('.login').show();
		}
	});
</script>
	
