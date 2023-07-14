<%@page import="com.semi.review.model.ReviewDAO2"%>
<%@page import="com.semi.review.model.ReviewService2"%>
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
	request.setCharacterEncoding("utf-8");	

	String reviewno = request.getParameter("reviewno");
	String targetid = request.getParameter("you");
	String pointid = request.getParameter("me");

	ReviewDAO2 dao = new ReviewDAO2();
	try{
		int cnt = dao.likeCountUpdate(targetid, pointid, Integer.parseInt(reviewno));
	if(cnt > 0){
		%><script>
		alert('좋아연~!');
		history.go(-1);
		window.opener.location.reload();
		</script>
		<%
	}else{
		%><script>
		alert('안좋아....아니.. 못좋아..');
		history.go(-1);
		</script>
		<%
	}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
</body>
</html>