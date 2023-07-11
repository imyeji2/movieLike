<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin.css" />
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
				<form name="frmLogin" method="post" action ="<%=request.getContextPath() %>/login/login_ok.jsp">
			<div class = "admin-id">
					<div class="form-floating">
						<input type="email" class="form-control" id="floatingInput" name ="userId" placeholder="name@example.com" value ="<%=ck_value%>"> 
						<label for="floatingInput">이메일 주소</label>
					</div>
					<div class="form-floating">
						<input type="password" class="form-control" id="floatingPassword" name = "pwd" placeholder="Password"> 
						<label for="floatingPassword">비밀번호</label>
					</div>
			</div>
			<div class = "admin-pwd">
			
			</div>
			</form>
		</div>
	</div>
</section>
</div>
</body>
</html>