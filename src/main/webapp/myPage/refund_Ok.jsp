<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.point.model.PointService"%>
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
	String no = request.getParameter("no");
	String price = request.getParameter("price");
	
	PointService service = new PointService();
	try{
		int cnt = service.refundPoint(Integer.parseInt(no), Integer.parseInt(price));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
</body>
</html>