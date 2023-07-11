<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/DCSS/admin_login.css" >
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class ="wrap">
<header>
	<div>
        <img src="<%=request.getContextPath()%>/images/logo-white.png" class="logo_img">
    </div>
</header>    
<section>
	<div class = "box">
		<div class = "inner box">
			<form name="frmLogin" method="post" action ="<%=request.getContextPath() %>/admin_login/admin_login_ok.jsp">
				<div id="logo">
					<img src="<%=request.getContextPath()%>/images/logo-black.png">
				</div>
				<div class = "admin-id">
					<div class="form-floating">
						<input type="id" class="form-control" id="floatingInput" name ="adminId" placeholder="ID"> 
						<label for="floatingInput">아이디</label>
					</div>
					<div class="form-floating">
						<input type="password" class="form-control" id="floatingPassword" name = "adminPwd" placeholder="Password"> 
						<label for="floatingPassword">비밀번호</label>
					</div>
					<div class="submit">
						<input type="submit" value="로그인" class="login-bt">
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
</div>
</body>
</html>