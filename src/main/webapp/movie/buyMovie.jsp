<%@page import="com.semi.member.model.UserVO"%>
<%@page import="com.semi.member.model.UserService"%>
<%@page import="com.semi.payHistory.model.PayHistoryService"%>
<%@page import="com.semi.movie.model.MovieVO"%>
<%@page import="com.semi.movie.model.MovieService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.point.model.PointService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div{
	text-align: center;
    padding: 1% 0% 1% 0%;
    font-size: 110%;
    font-weight: bold;
}

.row:nth-child(odd){
background : lightgrey;
}
popcornChargeMain{
}
.btn-success {
    --bs-btn-color: #fff;
    --bs-btn-bg: #198754;
    --bs-btn-border-color: #198754;
    --bs-btn-hover-color: #fff;
    --bs-btn-hover-bg: #157347;
    --bs-btn-hover-border-color: #146c43;
    --bs-btn-focus-shadow-rgb: 60,153,110;
    --bs-btn-active-color: #fff;
    --bs-btn-active-bg: #146c43;
    --bs-btn-active-border-color: #13653f;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #fff;
    --bs-btn-disabled-bg: #198754;
    --bs-btn-disabled-border-color: #198754;
    width: 15%;
    height: 100%;
    font-size: 65%;
    font-weight: bold;
}
.btn-light {
    --bs-btn-color: #000;
    --bs-btn-bg: #f8f9fa;
    --bs-btn-border-color: #f8f9fa;
    --bs-btn-hover-color: #000;
    --bs-btn-hover-bg: #d3d4d5;
    --bs-btn-hover-border-color: #c6c7c8;
    --bs-btn-focus-shadow-rgb: 211,212,213;
    --bs-btn-active-color: #000;
    --bs-btn-active-bg: #c6c7c8;
    --bs-btn-active-border-color: #babbbc;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #000;
    --bs-btn-disabled-bg: #f8f9fa;
    --bs-btn-disabled-border-color: #f8f9fa;
    width: 15%;
    height: 100%;
    font-size: 65%;
    font-weight: bold;
}
.input-group {
    position: relative;
    display: flex;
    flex-wrap: wrap;
    align-items: stretch;
    width: 100%;
    height: 100%;
    padding: 0% 14% 0% 29%;
    margin: -1% 0% 0% 0%;
}
.form-select {
      display: block;
    width: 58%;
    padding: 0.375rem 2.25rem 0.375rem 0.75rem;
    -moz-padding-start: calc(0.75rem - 3px);
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    background-color: #fff;
    background-image: url(data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m2 5 6 6 6-6'/%3e%3c/svg%3e);
    background-repeat: no-repeat;
    background-position: right 0.75rem center;
    background-size: 16px 12px;
    border: 1px solid #ced4da;
    border-radius: 0.375rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    padding: 1% 6% 1% 0%;
    margin-left: 28%;
    text-align: center;
    
}

</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('button[name=quit]').click(function() {
			window.close();
		});
	});
</script>

<body>
	<%
		String no = request.getParameter("no");
		String userid = request.getParameter("userid");
		
		if(userid == null || userid.isEmpty()){
			%><script>alert('먼저 로그인 해주세요');
			window.close();</script><%
		}
		
		MovieService movieService = new MovieService();
		UserService userService = new UserService();
		MovieVO vo = new MovieVO();
		UserVO userVo = new UserVO();
		try{
		vo = movieService.selectByMovieNo(Integer.parseInt(no));
		 userVo = userService.selectUserByUserId(userid);
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
		<form id="buyMovieForm" action="buyMovie_Ok.jsp" method="post">
		<input type = "hidden" value="<%=no%>" name = "no">
		<input type = "hidden" value="<%=userid%>" name = "userid">
		<div class="container text-center">
		  <div class="row">
		    <div class="col">영화 구매</div>
		  </div>
		  
		  <div class="row">
		    <div class="col">아이디</div><div class="col"><%=userid %></div>
		    <input type="hidden" name = "userid" value="<%=userid%>">
		  </div>
		  
		  <div class="row">
		    <div class="col">영화 이름</div>
		    <div class="col">
		   		<%=vo.getTitle()%>
		    </div>
		  </div>
		  
		  <div class="row">
		    <div class="col">보유 팝콘</div>
		    <div class="col">
			    <div class="input-group input-group-sm mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-sm">팝콘</span>
					  <input type="text" class="form-control" name = "price" disabled value="<%=userVo.getPoint()/100%>" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
				</div>
		    </div>
		  </div>
		  
		  <div class="row">
		    <div class="col">영화 가격</div>
		    <div class="col">
			    <div class="input-group input-group-sm mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-sm">팝콘</span>
					  <input type="text" class="form-control" name = "price" disabled value="<%=vo.getPrice()%> 개 " aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
				</div>
		    </div>
		  </div>
		  
		  <div class="row">
		    <div class="col">
			    <button type="submit" class="btn btn-success">구매</button>
			    <button type="button" class="btn btn-light">취소</button>
		    </div>
		  </div>
		</div>
		</form>
</body>
</html>