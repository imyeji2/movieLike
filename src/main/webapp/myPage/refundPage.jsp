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
.refundMain {
	padding: 12% 21% 0% 22%;
}

.form-floating>.form-control-plaintext ~label, .form-floating>.form-control:focus
	~label, .form-floating>.form-control:not(:placeholder-shown) ~label,
	.form-floating>.form-select ~label {
	color: rgba(var(--bs-body-color-rgb), .65);
	transform: scale(.85) translateY(-0.5rem) translateX(0.15rem);
	font-size: 17px;
	font-weight: bolder;
}

.form-floating>.form-control-plaintext:focus, .form-floating>.form-control-plaintext:not(:placeholder-shown),
	.form-floating>.form-control:focus, .form-floating>.form-control:not(:placeholder-shown)
	{
	padding-top: 2rem;
	padding-bottom: 0.625rem;
	background: lightcyan;
	font-weight: 800;
}

.form-control:disabled {
	background-color: var(--bs-secondary-bg);
	opacity: 1;
	width: 100%;
	margin: 0% 0% 3% 0%;
	display: flex;
	justify-content: center;
}

.refundH1 {
	padding: 0% 0% 0% 21%;
}

.refundBox {
	
}

#textbox {
	
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
	String price = request.getParameter("price");
	String userid = request.getParameter("userid");
	%>
	<div class="refundMain">
		<div>
			<h1 class="refundH1">&nbsp;환불 페이지</h1>
		</div>
		<form id="refundForm" action="refund_Ok.jsp" method="post">
			<div>
				<h1 class="refundH1">
					아이디 :
					<%=userid%></h1>
				<input type="hidden" name = "userid" value="<%=userid%>">
				<input type="hidden" name = "no" value="<%=no%>">
				<input type="hidden" name = "price" value="<%=no%>">
			</div>
			<div id="textbox">
				<div class="form-floating mb-3">
					<input type="email" class="form-control" id="floatingInput"
						placeholder="name@example.com"  value="<%=no%>" disabled>
					<label for="floatingInput">구매 번호</label>
				</div>
				<div class="form-floating">
					<input type="email" class="form-control" id="floatingPassword"
						placeholder="Password" value="<%=price%> 원 " disabled>
					<label for="floatingPassword">환불 가격</label>
				</div>
			</div>
			<button type="submit" class="btn btn-success">환불하기</button>
		<button type="button" class="btn btn-danger" name="quit">취소</button>
		</form>
		
	</div>
</body>
</html>