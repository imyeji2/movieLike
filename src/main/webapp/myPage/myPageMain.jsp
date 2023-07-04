<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<script type = "text/javascript">

</script>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="custom.css" rel="stylesheet">
<%@ include file="../inc/top.jsp"%>
</head>
<%

%>
<body id = "myPageBody">
	<div id="myPageMain">
		<div id="myPageHeader" class="main" style="overflow: hidden">
			<div id="profileImg"></div>
		</div>
		<div id="myPageBody" class="main">
			<div id="bodyBar">
			  <nav id = "myPageMenu">
			        <a href="javascript:void(0);" onclick = "showContent(0);">내정보수정</a>
			        <a href="javascript:void(0);" onclick = "showContent(1);">찜목록</a>
			        <a href="javascript:void(0);" onclick = "showContent(2);">구매이력</a>
			        <a href="javascript:void(0);" onclick = "showContent(3);">팝콘(충전/이력)</a>
			        <a href="javascript:void(0);" onclick = "showContent(4);">리뷰관리</a>
		        <div id="horizontal-underline"></div>
		   	 </nav>
			</div>
			<div class = "mainContent">
				<div class = "content" style = "display : none" id = "myInfo">
					<!-- 정보수정 -->		
				</div>
				<div class = "content" style = "display : none" id = "jjim">
					<!-- 찜목록 -->
					<table class="table table-dark table-hover">
						<tr>
							<th>영화이름</th>
						</tr>
					</table>
				</div>	
				<div class = "content" style = "display : none" id = "payHistory">
					<!-- 영화 구매 이력 -->
					<table class="table table-dark table-hover">
						<tr>
							<th class ="dateCol">영화결제일</th><th>금액</th><th>구분</th>
						</tr>
						<tr>
							<td>1</td><td>1</td><td>1</td>
						</tr>
						<tr>
							<td>2</td><td>2</td><td>2</td>
						</tr>
						<tr>
							<td>3</td><td>3</td><td>3</td>
						</tr>
					</table>
				</div>
				<div class = "content" style = "display : none" id = "popcorn">
					<!-- 팝콘 충전/환불 이력 -->
					<table class="table table-dark table-hover">
						<tr>
							<th class ="dateCol">팝콘충전일</th><th>금액</th><th>구분</th>
						</tr>
						<tr>
							<td>1</td><td>1</td><td>1</td>
						</tr>
						<tr>
							<td>2</td><td>2</td><td>2</td>
						</tr>
						<tr>
							<td>3</td><td>3</td><td>3</td>
						</tr>
					</table>
				</div>
				<div class = "content" style = "display : none" id = "review">
					<!-- 리뷰 목록 -->
					<table class="table table-dark table-hover">
						<tr>
							<th>영화이름</th><th>리뷰내용(간소화)</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="myPage.js"></script>
  </body>
</body>
</html>
<%@ include file="../inc/bottom.jsp"%>