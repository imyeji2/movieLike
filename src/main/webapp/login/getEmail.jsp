<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="userService" class="com.semi.member.model.UserService" scope="session"></jsp:useBean>
<%
	String userId = request.getParameter("userId");
	
	if(userId == null || userId.isEmpty()){
		userId = "";
	}

%>
<meta charset="UTF-8">
<title>이메일 중복 체크</title>
<script type="text/javascript" src = "<%=request.getContextPath()%>/js/jquery-3.7.0.min.js" ></script>
<script type="text/javascript">

</script>
</head>
<style type="text/css">

	.checkId {
		position: absolute;
		height: 100%;
		width: 100%;
		top: 0;
		left: 0;
		display: flex;
		justify-content: center;
		align-items: center;
		background-color: rgba(0, 0, 0, 0.1); /** 얘 수정 하면 된다 **/
	}
	
	.checkId-inner {
		background-color: rgba(255, 255, 255, 0.5);
		width: 500px;
		height: 300px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		border-radius: 5px;
	}
	
	.checkId-inner h3 {
		font-weight: 600;
	    text-align: center;
	    font-size: 23px;
	    user-select: none;
	}
	
	.chk #userId {
		outline: none;
		padding: 0 15px;
		height: 58px;
		border-radius: 10px;
		border: 1px solid #ced4da;
		color: #000;
		font-weight: 400;
		font-size: 16px;
		transition: all 0.35s;
	}
	
	.chk #userId:placeholder {
		color: #ced4da;
		font-weight: 300;
	}
	
	.chk #userId:focus {
		border: 1px solid #13C181;
		caret-color: #13C181;
	}
	
	.chk #submit {
		border: 0;
		background-color: #13C181;
		color: #fff;
		border-radius: 5px;
		width: 100px;
		height: 58px;
		font-size: 16px;
		cursor: pointer;
		transition: all 0.35s;
	}
	
	.chk #submit:hover {
		opacity: 0.8
	}
	
	.notice {
		margin: 10px 0 0;
	}
	
	.notice input {
		display: block;
		color: #303030;
		font-weight: 600;
		border: 0;
		border-bottom: 1px solid #303030;
		padding-bottom: 3px;
		background: none;
		cursor: pointer;
		margin: auto;
	}
	
	.msg {
		text-align: center;
		font-size: 13px;
		color: #707070;
	}
	
	.msg p {
		margin: 10px 0 0;
	}
	
	.error {
		color: #ff0000;
	}

</style>
<body>
	<div class="checkId">
		<div class="checkId-inner">
			<h3>비밀번호 찾기</h3>
			<form name="frmId" method="post" action="../login/sendMail.jsp">
				<div class="chk">
					<input type="email" name ="userId" id="userId" value ="<%=userId %>" placeholder="이메일 형식">
					<input type="submit" id="submit" value = "확인">
				</div>
				<span class = "error" style="display: none">아이디를 입력하세요</span>
				
			</form>
		</div>
	</div>
</body>
</html>