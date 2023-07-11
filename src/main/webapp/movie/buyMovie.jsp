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
<style>
	.refundMain{
		padding: 12% 21% 0% 22%;
	}
	.form-floating>.form-control-plaintext~label, .form-floating>.form-control:focus~label, .form-floating>.form-control:not(:placeholder-shown)~label, .form-floating>.form-select~label {
    color: rgba(var(--bs-body-color-rgb),.65);
    transform: scale(.85) translateY(-0.5rem) translateX(0.15rem);
    font-size: 17px;
    font-weight: bolder;
	}
	.form-floating>.form-control-plaintext:focus, .form-floating>.form-control-plaintext:not(:placeholder-shown), .form-floating>.form-control:focus, .form-floating>.form-control:not(:placeholder-shown) {
    padding-top: 2rem;
    padding-bottom: 0.625rem;
    background: lightcyan;
    font-weight:800;
	}
	.form-control:disabled {
    background-color: var(--bs-secondary-bg);
    opacity: 1;
    width: 100%;
    margin: 0% 0% 3% 0%;
    display: flex;
    justify-content: center;
	}
	.refundH1{
		padding: 0% 0% 0% 21%;
	}
.refundBox{
}
#textbox{

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
		
		MovieService movieService = new MovieService();
		UserService userService = new UserService();
		MovieVO vo = null;
		UserVO userVo = null;
		try{
		vo = movieService.selectByMovieNo(Integer.parseInt(no));
		 userVo = userService.selectUserByUserId(userid);
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	%>
	<div class = "refundMain">
		<div>
		<h1 class = "refundH1">&nbsp;구매 페이지</h1>
		</div>
			<form id="refundForm" action="buyMovie_Ok.jsp" method="post">
				<div>
					<h1 class = "refundH1">아이디 : <%=userid%></h1>
				</div>
				<div>
					<h1 class = "refundH1">영화 : <%=vo.getTitle()%></h1>
				</div>
				<div id = "textbox">
					<div class="form-floating mb-3">
						  <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" value="<%=userVo.getPoint()%>" disabled>
						  <label for="floatingInput">보유금액</label>
					</div>
					<div class="form-floating">
						  <input type="email" class="form-control" id="floatingPassword" placeholder="Password" name="price"value="<%=vo.getPrice()%> 원 " disabled>
						  <label for="floatingPassword">영화 가격</label>
					</div>
					</div>
				<div>
					<button type="submit" class="btn btn-success">구입하기</button>
					<button type="button" class="btn btn-danger" name="quit">취소</button>
				</div>
				<input type = "hidden" value="no" name = "no">
			</form>
		</div>
</body>
</html>