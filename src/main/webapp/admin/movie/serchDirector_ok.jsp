<%@page import="com.semi.director.model.DirectorService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.actor.model.ActorService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1.파라미터 처리
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");

	//2.db 처리
	DirectorService service = new DirectorService();
	try{
		int result = service.chekByDirectorName(name);
		System.out.println("배우 동명이인 검색 결과 result="+result);
		out.print(result);
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	

%>
