<%@page import="com.semi.member.model.UserService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="userService" class="com.semi.member.model.UserService" scope="session"></jsp:useBean>
<%
	String userId = request.getParameter("userId");
	int result = 0;
	
	if (userId != null && !userId.isEmpty()) {
		// 이메일 형식 유효성 검사 정규 표현식

			String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
			
	
		// 이메일 형식 검사
		if (userId.matches(emailRegex)) {
			
			try {
				result = userService.duplicatedId(userId);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

%>
<meta charset="UTF-8">
<title>이메일 중복 체크</title>
<style type="text/css">
p{
	color:red;
}

</style>
<script type="text/javascript" src = "<%=request.getContextPath()%>/js/jquery-3.7.0.min.js" ></script>
<script type="text/javascript">
$(function(){
	

	$('#use-bt').click(function(){
		$(opener.document).find("#registerId").val("<%=userId%>");
		$(opener.document).find("#chkId").val("Y");
		self.close();
	});
	
	$('form[name=frmId]').submit(function(){
		if($('#userId').val().length < 1){
			$('.error').show();
			event.preventDefault;
		}
	});
});
</script>
</head>
<body>
	<h3>이메일 중복 체크</h3>
	<br>
	<form name="frmId" method="post" action="../login/checkId.jsp">
	<div class="chk">
		<input type="text" name ="userId" id="userId" value = "<%=userId %>">
		<input type="submit" id="submit" value = "확인">
		<span class = "error" style="display: none">아이디를 입력하세요</span>
		
		<%if(result == UserService.UNUSABLE_ID){ %>
			<div class = "msg">
				<p>이미 등록된 아이디 입니다.</p>
			</div>	
		<%}else if(result == UserService.USABLE_ID){ %>
			<input type="button" value="사용하기" id="use-bt">
			<div class = "msg">
				<p>사용 가능한 아이디 입니다.</p>
			</div>
		<%}else{%>
			<div class = "msg">
				<p>이메일 형식으로 작성하세요.</p>
			</div>
			<%} %>
	</div>
	</form>
</body>
</html>