<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세보기</title>
<script type="text/javascript">

</script>
</head>
<body>
<div class="warp">
	<h5>리뷰 상세보기</h5>
	
	<div class="content_box">
						
		<div class="ed_btn" >
			<button class="btn btn-outline-secondary" type="button" id="button-edit">수정</button>
			<button class="btn btn-outline-secondary" type="button" id="button-delete" onclick="delOk()">삭제</button>
		</div>
		<table class="table table-bordered">
						<colgroup>
						      <col style="width:20%;" />
						      <col style="width:80%;" />
						</colgroup>
							<tr>
						      <th scope="col">번호</th>
						      <td scope="col"><%=vo2.getBoardNo()%></td>
						    </tr>
							<tr>
						      <th>제목</th>
						      <td><%=vo2.getBoardTitle() %></td>
						    </tr>
							<tr>
						      <th>작성자</th>
						      <td><%=vo2.getAdminID() %></td>
						    </tr>
							<tr>
						      <th>조회수</th>
						      <td><%=vo2.getBoardView() %></td>
						    </tr>
							<tr>
						      <th>등록일</th>
						      <td><%=sdf.format(vo2.getBoardRegdate())%></td>
						    </tr>
							<tr>
							<div class="in_text">
						      <th style = "padding-top : 25px ">내용</th>
						     </div>
						      <td><%=vo2.getBoardContent() %></td>
						    </tr>
		</table>
		</div>
</body>
</html>