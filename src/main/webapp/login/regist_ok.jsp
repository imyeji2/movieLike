<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="userService" class="com.semi.member.model.UserService" scope="session"></jsp:useBean>
<jsp:useBean id="userVo" class="com.semi.member.model.UserVO" scope="page"></jsp:useBean>

<%
	//1
	request.setCharacterEncoding("utf-8");
	
	String userId = request.getParameter("userId");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String birth = request.getParameter("birth");
	
	userVo.setUserId(userId);
	userVo.setPwd(pwd);
	userVo.setName(name);
	userVo.setGender(gender);
	userVo.setBirth(birth);

	String msg = "회원가입에 실패하셨습니다.", url = "login.jsp";

	try{
		int cnt = userService.insertUser(userVo);
		
		if(cnt > 0){
			msg = "회원가입 되었습니다.";
			url = "login.jsp";
		}
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="<%=request.getContextPath() %>/inc/message.jsp"></jsp:forward>
</body>
</html>