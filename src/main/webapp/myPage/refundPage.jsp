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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type = "text/javascript">
$(function() {
	$('button[name=quit]').click(function() {
		window.close();
	});
});
</script>
<body>
<%
	String no = request.getParameter("no");
	String price = request.getParameter("price");
	String userid = request.getParameter("userid");
%>

<h1>환불 페이지</h1>
<form id="refundForm" action="refund_Ok.jsp" method="post">
	<h1>아이디 : <%=userid %></h1>
	구매 번호 <input type="text" name = "no" value="<%=no%>"><br>
	가격 <input type="text" name = "price" value="<%=price%>"><br>
	<input type="submit" value="환불하기">
	<button name="quit">취소</button>
</form>
</body>
</html>