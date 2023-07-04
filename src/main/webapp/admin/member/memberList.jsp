<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/memList.css" />
<script type="text/javascript" src = "../../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('.box tbody tr').hover(function(){
			$(this).css('background','skyblue');
		},function(){
			$(this).css('background','');
		});
	});

</script>
	<section id="movieList">
		<h2>회원 관리</h2>
		
	<article>
		<div class = "button">
			<input type="submit" value="등록">
			<input type="button" value="수정">
			<input type="button" value="삭제">
		</div>
	</article>
	<article>
		<div class = "table">
			<table class = "box" 
			summary = "회원정보를 관리하는 테이블로써, 번호, 아이디, 이름, 성별, 생년월일, 팝콘포인트, 탈퇴일에 대한 정보를 제공합니다.">
				<colgroup>
					<col style="width:50px;"/>
					<col style="width:100px;"/>
					<col style="width:100px;"/>
					<col style="width:70px;"/>
					<col style="width:150px;"/>
					<col style="width:100px;"/>
					<col style="width:150px;"/>
				</colgroup>
				<thead>
					<tr>
						<th>NO</th>
						<th>ID</th>
						<th>이름</th>
						<th>성별</th>
						<th>생년월일</th>
						<th>팝콘</th>
						<th>탈퇴일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>123</td>
						<td>김똥개</td>
						<td>여자</td>
						<td>2000-05-05</td>
						<td>100</td>
						<td>2023-06-05</td>
					</tr>
				</tbody>
			</table>
		</div>
	</article>
	<article>
		<div class="page">
		
		</div>
	</article>
	<article>
		<div class = "search">
			<form name = "frmSearch" method="post" action="memberList.jsp">
				<select name = "searchCon">
					<option value = "id">ID</option>			
					<option value = "name">이름</option>			
					<option value = "gender">성별</option>			
				</select>
				<input type ="text" name = "searchKeyword" title = "검색어 입력" >
				<input type ="submit" value="검색">
			</form>
		</div>
	</article>
	</section> 
</div>

</body>
</html>