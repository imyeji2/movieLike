<%@page import="com.semi.member.model.UserVO"%>
<%@page import="com.semi.member.model.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="com.semi.email.EmailSender" %>
  
<%
	String userId = request.getParameter("userId");

	if(userId == null || userId.isEmpty()){%>
		<script>
		alert('이메일 전송 실패!');
		location.href= "<%=request.getContextPath()%>/index.jsp";
		</script>
	<%}else{
		UserService service = new UserService();
		UserVO vo = service.selectUserByUserId(userId);
		String fromAddress = "iiuu21700@gmail.com"; // 발신자 이메일 주소
		String toAddress = userId; // 수신자 이메일 주소
		String subject = "MOVIELIKE 비밀번호 재설정 메일입니다"; // 메일 제목
		String content = "지금은 세미프로젝트입니다! 재설정은 안해도 괜찮아요~~ 비번  "+ vo.getPwd() +" 이니까요~~"; // 메일 내용
	
		EmailSender emailsender = new EmailSender();
		emailsender.sendEmail(fromAddress, toAddress, subject, content);%>
		<script>
		alert('이메일 전송 완료!');
		location.href= "<%=request.getContextPath()%>/index.jsp";
		</script>
	<%}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

		

</script>
</head>
<body>

</body>
</html>