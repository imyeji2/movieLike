<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_ok</title>
</head>
<body>
<jsp:useBean id="userService" class="com.semi.member.model.UserService" scope="session"></jsp:useBean>
<%
	//1.
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("userId");
	String pwd = request.getParameter("pwd");
	String chkSave = request.getParameter("chkSave");
	
	//2
	String msg = "로그인에 실패하셨습니다.", url = "index.jsp";
	
	try{
		int result = userService.checkLogin(userId, pwd);
		
		if(result == userService.LOGIN_OK){
			//세션 저장
			session.setAttribute("userId", userId);
	
			//아이디 저장 눌린 경우 쿠키저장
			if(chkSave != null){
				Cookie ck = new Cookie("ck_userId",userId);
				ck.setPath("/");//path지정 최상위 경로
				ck.setMaxAge(7*24*60*60);//7일 유효기간
				response.addCookie(ck);
			}else{
				Cookie ck = new Cookie("ck_userId",userId);
				ck.setPath("/");
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			msg = userId + " 님 환영합니다!";
			url = "index.jsp";
			
		}else if(result == userService.DISAGREE_PWD){
			msg = "비밀번호를 확인해주세요."; 
		}else if(result == userService.NONE_ID){
			msg = "해당 아이디가 존재하지 않습니다.";
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