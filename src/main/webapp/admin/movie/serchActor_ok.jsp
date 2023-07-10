<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.actor.model.ActorService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//1.파라미터 처리
	String name = request.getParameter("name");

	//2.db 처리
	ActorService service = new ActorService();
	try{
		int cnt = service.chekByActorName(name);
		System.out.println("배우 동명이인 검색 결과 cnt="+cnt);
		request.setAttribute("cnt", cnt);
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
	//5.
	

%>
</body>
</html>