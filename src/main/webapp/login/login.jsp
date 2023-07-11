<%@page import="com.semi.member.model.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	
<%
	//쿠키 읽어오기
	
	String ck_value="";
	Cookie[] ckArr = request.getCookies();
	if(ckArr != null){
		for(int i = 0; i < ckArr.length; i++){
			String ck_name = ckArr[i].getName();
			if(ck_name.equals("ck_userId")){
				ck_value = ckArr[i].getValue();
				break;
			}
		}
	}

%>
<!-- 서다희 작업 -->
<div class="popup members-popup">
	<div class="popup-background"></div>
	<div class="popup-wrapper">
		<div class="popup-inner">
			<div class="close-btn">
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
					fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                 <path
						d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z" />
               </svg>
			</div>
			<div id="logo">
				<img src="<%=request.getContextPath()%>/images/logo-black.png">
			</div>

			<!-- 로그인 -->
			<div class="login">
				<form name="frmLogin" method="post" action ="<%=request.getContextPath() %>/login/login_ok.jsp">
					<div class="form-floating">
						<input type="email" class="form-control" id="floatingInput" name ="userId" placeholder="name@example.com" value ="<%=ck_value%>"> 
						<label for="floatingInput">이메일 주소</label>
					</div>
					<div class="form-floating">
						<input type="password" class="form-control" id="floatingPassword" name = "pwd" placeholder="Password"> 
						<label for="floatingPassword">비밀번호</label>
					</div>
					<div class="saveId">
						<input type="checkbox" id="saveId-chk" name ="chkSave" <%if(ck_value != null && !ck_value.isEmpty()){ %>
							checked = "checked" <%} %>> 
						<label for="saveId-chk" style="color: #000;">이 계정을 기억하시겠습니까?</label>
					</div>
					<div class="submit">
						<input type="submit" value="로그인" class="login-bt">
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
			
			<!-- 약관동의 -->
			<div class = "agreement">
				<form>
					<iframe src = "<%=request.getContextPath() %>/login/provision.html" width="100%" height="450px"></iframe>
					<br>
					<input type="button" name="agree" id="chkagree" value="위 약관에 동의하며 회원가입 진행"> 
				</form>
			</div>
			
			<!-- 회원가입  -->
			<div class="register">
				<form name="frmRegist" method="post" action="<%=request.getContextPath() %>/login/regist_ok.jsp">
					<div class ="firstdiv">
						<div class="form-floating">
							<input type="email" class="form-control" id="registerId" name="userId" placeholder="예) name@example.com"> 
							<label for="registerId">이메일 주소</label>
						</div>
						<div class="dup">
							<input type="button" id = "btnChkId" value="중복체크">
						</div>	
					</div>
					<div class="form-floating">
						<input type="password" class="form-control" id="registerPassword" name="pwd" placeholder="비밀번호를 입력해주세요"> 
						<label for="registerPassword">비밀번호</label>
					</div>
					<div class="form-floating">
						<input type="password" class="form-control" id="registerPassword2" name="pwd2" placeholder="비밀번호를 입력해주세요"> 
						<label for="registerPassword">비밀번호 확인</label>
					</div>
					<div class="match">
						<div class="form-floating">
							<input type="text" class="form-control" id="registerName" name="name" placeholder="예) 홍길동"> 
							<label for="registerName">이름</label>
						</div>
						<div class="gender">
							<input type="radio" name="gender" id="man" value="남"> 
							<label for="man">남자</label> 
							<input type="radio" name="gender" id="woman" value="여"> 
							<label for="woman">여자</label>
						</div>
					</div>
					<div class="form-floating">
						<input type="tel" class="form-control" id="registerBirth" name="birth" placeholder="예) 19990101" maxlength="8"> 
						<label for="registerBirth">생년월일 (8글자)</label>
					</div>
					<button class="confirm" type="submit">회원가입</button>
				</form>
			</div>
			<input type ="hidden" name="chkId" id="chkId">
		</div>
	</div>
</div>
</div>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/user.js"></script>
<script>
	$('.login_btn').click(function() {
		$('.login').show();
		$('.register').hide();
		$('.agreement').hide();
		$('.popup.members-popup').addClass('open');
	});

	$('.popup-background').click(function() {
		$('.popup').removeClass('open');
	});
	$('.close-btn').click(function() {
		$('.popup').removeClass('open');
	});

	$('.register-btn').click(function() {
		$('.login').hide();
		$('.register').hide();
		$('.agreement').show();
	});
	
	$('#chkagree').click(function(){
		$('.login').hide();
		$('.register').show();
		$('.agreement').hide();
		
	})
	

	$('.confirm').click(function() {
		var id = $('#registerId').val();
		var pass = $('#registerPassword').val();
		var pass2 = $('#registerPassword2').val();
		var name = $('#registerName').val();
		var man = $('#man').is(':checked');
		var woman = $('#woman').is(':checked');
		var birth = $('#registerBirth').val();

		if (id == '' || !id.includes('@')) {
			alert('이메일을 확인해주세요');
			$('#registerId').focus();
			return false;
		}

		if (pass == "") {
			alert('비밀번호를 확인해주세요');
			$('#registerPassword').focus();
			return false;
		}
		
		if (pass != pass2){
			alert("비밀번호가 일치하지 않습니다.");
			$('#registerPassword2').focus();
			return false;
		}

		if (name == "" || name.length < 2) {
			alert('이름을 확인해주세요');
			$('#registerName').focus();
			return false;
		}

		if (man == false && woman == false) {
			alert('성별을 선택해주세요');
			$('#gender').focus();
			return false;
		}

		if (birth == '' || birth.length < 8) {
			alert('생년월일을 확인해주세요');
			$('#registerBirth').focus();
			return false;
		}

		if($('#chkId').val()!='Y'){
	         alert('아이디 중복확인을 해주세요.');
	         $('#btnChkId').focus();
	         return false;
	    }

	});
	
	$('#registerId').on('blur', function() {
		var id = $('#registerId').val();
		
	})

	$('.login-bt').click(function() {

		var floatingInput = $('#floatingInput').val();
		var floatingPassword = $('#floatingPassword').val();

		if (floatingInput == '') {
			alert('이메일을 확인해주세요');
			return false;
		} else if (floatingPassword == '') {
			alert('비밀번호를 확인해주세요');
			return false;
		}

	});
</script>
