<%@page import="com.semi.admin.model.AdminService"%>
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
<jsp:useBean id="admService" class="com.semi.admin.model.AdminService" scope="session"></jsp:useBean>
<%
	//1
	request.setCharacterEncoding("utf-8");

	String adminId = request.getParameter("adminId");
	String adminPwd = request.getParameter("adminPwd");
	
	//2
	String msg = "로그인 실패", url = "admin_login/admin_login.jsp";
	
	try{
		//3
		int rst = admService.checkLogin(adminId, adminPwd);
		
		if(rst == AdminService.LOGIN_OK){
			session.setAttribute("adminId",adminId);
			
			msg = "로그인 완료";
			url = "admin/movie/movieList.jsp";
		}else if(rst == AdminService.DISAGREE_PWD){
			msg = "비밀번호를 체크하세요.";
		}else if(rst == AdminService.NONE_ID){
			msg = "아이디가 존재하지 않습니다.";
		}
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	request.setAttribute("msg",msg);
	request.setAttribute("url", url);

%>
<jsp:forward page="../inc/message.jsp"></jsp:forward>
</body>
</html>