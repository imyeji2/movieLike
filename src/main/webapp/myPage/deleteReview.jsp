<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.review.model.ReviewService"%>
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
	String reviewNo = request.getParameter("reviewNo");

	ReviewService service = new ReviewService();
	try{
		int cnt = service.deleteReview(Integer.parseInt(reviewNo));
		if(cnt > 0){%>
		<script type="text/javascript">
			window.close();
			window.opener.location.reload();
		</script>	
	<%}else{%>
		<script type="text/javascript">
			window.close();
			window.opener.location.reload();
		</script>	
	<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
			
%>
</body>
</html>