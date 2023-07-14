<%@page import="com.semi.review.model.ReviewVO2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세보기</title>
</head>
<body>
<%
	ReviewVO2 vo2 = new ReviewVO2();
 
	String reviewNo = request.getParameter("reviewNo");
	
%>
<div class="warp">
	<h5>리뷰 상세보기</h5>
	
	<div class="content_box">
						
		<table class="table table-bordered">
						<colgroup>
						      <col style="width:20%;" />
						      <col style="width:80%;" />
						</colgroup>
							<tr>
						      <th scope="col">번호</th>
						      <td scope="col"><%=vo2.getReviewNo()%></td>
						    </tr>
							<tr>
						      <th>제목</th>
						      <td><%=vo2.getTitle() %></td>
						    </tr>
							<tr>
						      <th>작성자</th>
						      <td><%=vo2.getUserId() %></td>
						    </tr>
							<tr>
						      <th>조회수</th>
						      <td><%=vo2.getReviewStatus() %></td>
						    </tr>
							<tr>
						      <th>별점</th>
						      <td><%=vo2.getScore() %></td>
						    </tr>
							<tr>
							<div class="in_text">
						      <th style = "padding-top : 25px ">내용</th>
						     </div>
						      <td><%=vo2.getComments() %></td>
						    </tr>
		</table>
		</div>
</body>
</html>