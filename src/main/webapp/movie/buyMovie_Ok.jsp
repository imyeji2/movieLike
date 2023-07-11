<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.payHistory.model.PayHistoryService"%>
<%@page import="com.semi.payHistory.model.PayHistoryDAO"%>
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
String userid = request.getParameter("userid");
	String no = request.getParameter("no");
	PayHistoryService payService = new PayHistoryService();
	try{
	int cnt = payService.insertPayHistory(Integer.parseInt(no), userid);
		if(cnt > 0){%>
		<script>
			alert("구매 완료!");
			window.close();
		</script><%
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>

</body>
</html>