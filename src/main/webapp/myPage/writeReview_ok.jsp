<%@page import="com.semi.review.model.ReviewVO"%>
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
	String userid = request.getParameter("userid");
	String movieNo = request.getParameter("movieNo");
	String content = request.getParameter("content");

	ReviewService service = new ReviewService();
	ReviewVO vo = new ReviewVO();
	
	vo.setUserId(userid);
	vo.setMovieNo(Integer.parseInt(movieNo));
	vo.setComments(content);
	
	try{
	int cnt = service.insertReview(vo);
		if(cnt > 0){%>
		<script type="text/javascript">
			alert('리뷰 등록 완료!');
			window.opener.location.reload();
			window.close();
		</script>	
	<%}else{%>
		<script type="text/javascript">
			alert('리뷰 등록 실패!');
			location.go(-1);
		</script>	
	<%}
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
%>
</body>
</html>