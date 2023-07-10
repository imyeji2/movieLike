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
%>

<h1>환불 페이지</h1>
<form action="post" action="refund_Ok.jsp"></form>
	구매 번호 <input type="text" name = "no" value="<%=no%>">
	가격 <input type="text" name = "price" value="<%=price%>">
	<input type="submit" value="환불하기">
</form>
</body>
</html>