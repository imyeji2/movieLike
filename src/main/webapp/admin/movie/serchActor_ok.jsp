<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>
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
			int result = service.chekByActorName(name);
			System.out.println("배우 동명이인 검색 결과 result="+result);
			request.setAttribute("result", result);
			out.print(result);
			response.getWriter().write(result);
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		


	%>
</body>
</html>