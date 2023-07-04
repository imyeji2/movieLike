<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login</title>
<script type="text/javascript" src = "../js/jquery-3.7.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style type="text/css">
body {
    background-color: #101322;
}

.sub {
    background-color: rgba(255, 255, 255, 0.7);
    position: relative;
    margin: -500px auto;
    height: 700px;
    width: 500px;
}

#back {filter: blur(2px) brightness(80%);}

div#logo {
    display: flex;
    justify-content: center;
    height: 100px;

}

input[type="text"] {
    width: 250px;
    height: 25px;
    margin: 10px;
}

.sub{
  border-radius: 20px 20px 0 0;
}

input[type=text] {
  display: inline-block;
  border-radius: 8px;
}

</style>
</head>
<body>

<div class="login">
	<div id = "back">
		<img src = "../images/login-bg.png">
	</div>
	<div class = "sub">
		<div id = "logo">
			<img src = "../images/logo.png">
		</div>
		<div class="form-floating mb-3">
			<input type="email" class="form-control" id="floatingInput" placeholder="name@example.com"> 
			<label for="floatingInput">Email address</label>
		</div>
		<div class="form-floating">
			<input type="password" class="form-control" id="floatingPassword" placeholder="Password"> 
			<label for="floatingPassword">Password</label>
		</div>
	
<!-- 		<div class = "name">
			<label>ID</label>
			<input type="text" name = "id">
		</div>
		<div class = "pwd">
			<label>비밀번호</label>
			<input type="text" name = "pwd">
		</div> -->
		<hr>
		<a href = "find.jsp" id = "find">아이디/비밀번호 찾기</a>
		<span>계정이 없으신가요?</span>
		<a href = "regist.jsp" id = "regist">회원가입</a>
	</div>
	
</div>
</body>
</html>