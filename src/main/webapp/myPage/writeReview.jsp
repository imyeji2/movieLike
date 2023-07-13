<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.movie.model.MovieVO"%>
<%@page import="com.semi.movie.model.MovieService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#quit').click(function() {
		if(confirm('작성을 그만두시겠습니까?')){
			window.close();
		}
	});
});
</script>
<style type="text/css">
	.main{
		 background: rgb(28, 34, 62);
		 width: 100%;
		 height: 100%;
		 padding: 5% 5% 5% 5%
	}
  	span{
	   	color:lightgreen;
	   	font-weight: bold;
 	}
 	.input-group {
	    position: relative;
	    display: flex;
	    flex-wrap: wrap;
	    align-items: stretch;
	    width: 100%;
	    height: 50%;
	}
	.input-group-text {
    display: flex;
    align-items: center;
    padding: 0.375rem 0.75rem;
    font-size: 1.2rem;
    font-weight: bold;
    line-height: 1.5;
    color: #212529;
    text-align: center;
    white-space: nowrap;
    background-color: #e9ecef;
    border: 1px solid #ced4da;
    border-radius: 0.375rem;
}
	#content{
		height: 200px;
	}
	.mb-3 {
    margin-bottom: 1rem!important;
    width: 100%;
	}
	.box{
		height: 80%;
		width: 100%;
		background: white;
		opacity: 0.8;
		padding: 5% 5% 5% 5%;
		border-radius: 2em;
	}
	.btnbox{
		margin-top : 2%;
		display: flex;
		justify-content: center;
	}
	button{
    margin: 1%;
    width: 16%;
    height: 50px;

	}
	.input-group:not(.has-validation)>.dropdown-toggle:nth-last-child(n+3), .input-group:not(.has-validation)>.form-floating:not(:last-child)>.form-control, .input-group:not(.has-validation)>.form-floating:not(:last-child)>.form-select, .input-group:not(.has-validation)>:not(:last-child):not(.dropdown-toggle):not(.dropdown-menu):not(.form-floating) {
    border-top-right-radius: 0;
    text-align: center;
    border-bottom-right-radius: 0;
}
</style>
</head>


<body>
<%

	String userid = request.getParameter("userid");
	String movieNo = request.getParameter("movieNo");
	
	MovieService movieService = new MovieService();
	MovieVO movieVo = null;
	try{
	movieVo = movieService.selectByMovieNo(Integer.parseInt(movieNo));
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<!-- 700 430 -->
<form name="review" action="writeReview_ok.jsp" method="post">
<input type="hidden" name="movieNo" value="<%=movieVo.getMovieNo()%>">
	<div class="main">
		<div class = "box">
			<div class="input-group mb-3" id = "title" >
				<input type = "hidden" name="userid" value="<%=userid %>">
			  <input type="text" disabled class="form-control" placeholder="" aria-label="Username" 
			  				aria-describedby="basic-addon1" value="<%=userid%>" style= "font-weight:bold;width: 40%">
			  
			  <input type="text" disabled class="form-control" placeholder="" aria-label="Username" 
			  				aria-describedby="basic-addon1" value="<%=movieVo.getTitle()%>"style="font-weight:bold;margin-left:5%; width: 20%">
  				
  				<select class="form-select" aria-label="Default select example" style="width: 30%" name = "grade">
					<option selected value="0">별점</option>
				  	<option value="1">★☆☆☆☆</option>
				  	<option value="2">★★☆☆☆</option>
				  	<option value="3">★★★☆☆</option>
				  	<option value="4">★★★★☆</option>
				  	<option value="5">★★★★★</option>
				</select>
			</div>
		
			<div class="input-group" id = "content">
		  		<span class="input-group-text">리뷰내용</span>
		  		<textarea class="form-control" name="content" aria-label="With textarea" style="font-weight:bold;"></textarea>
			</div>
			<div class = "btnbox">
				<button type="submit" class="btn btn-success">리뷰 등록</button>
				<button type="button" id = "quit" class="btn btn-light">취소</button>
			</div>
		</div>
	</div><!-- movieWrite_box_in -->		
</form>
</body>
</html>