<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/DCSS/login.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.content {
    margin-top: 58px;
    padding: 0 150px;
}
h3, h5 {
    display: flex;
    justify-content: center;
    text-align: center;
    align-items: center;

}

#map {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    margin-left: 80px;
}

</style>
</head>
<body>
	<div class="outter">
		<div>
			<h3>무비라이크 MOVIE LIKE</h3>
		</div>
		<br>
		<div>
			<h5>무비라이크는 모두의 다름이 인정받고</h5>
			<h5>개인의 취향이 존중받는,</h5> 
			<h5>더 다양한 세상을 만들어갑니다.</h5> 
		</div>
		<div class="content">
			<div id = "map">
				 <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.2442268854556!2d127.02180137559239!3d37.50215757205542!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca158c8d916fd%3A0xfbd237c1e7f1a4d6!2z7J207KCg7JWE7J207YuwKElUKeyVhOy5tOuNsOuvuO2VmeybkA!5e0!3m2!1sko!2skr!4v1689233558499!5m2!1sko!2skr" width="300" height="300" id="map" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
			</div>
		</div>
	</div>
</body>
</html>
<%@ include file="../inc/bottom.jsp"%>
