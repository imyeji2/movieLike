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
	String userid = request.getParameter("userid");
	
	PointService service = new PointService();
	try{
		int cnt = service.refundPoint(Integer.parseInt(no), Integer.parseInt(price));
		if(cnt > 0){%>
			<script type = "text/javascript">
				window.close();
				window.opener.location.reload()
			</script>
		<%}else{%>
			<script type = "text/javascript">
				alert('환불 실패!');
				window.close();
			</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
</body>
</html>