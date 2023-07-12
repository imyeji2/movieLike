<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.member.model.UserService"%>
<%@page import="com.semi.member.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="service" class="com.semi.member.model.UserService" scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("userId");
	String pwd = request.getParameter("pwd");

	
	String msg="수정에 실패하였습니다.",url="/myPage/myPageMain.jsp";
	try{
		int cnt = service.updatePWD(userId, pwd);

		if(cnt>0){
			msg = "수정되었습니다.";
		}
		
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	

%>
<jsp:forward page="../inc/message.jsp"></jsp:forward>
</body>
</html>