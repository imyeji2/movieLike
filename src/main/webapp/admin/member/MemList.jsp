<%@page import="com.semi.board.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.board.model.BoardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>

<style>



</style>
<script type="text/javascript">
	$(function(){
		$('.content_box tbody tr').hover(function(){
			$(this).css('background','#f8f9fa');
		},function(){
			$(this).css('background','');
		});
		
		$('.top_text').find('span').click(function(){
			$('.top_text').find('span').css('font-weight','')
			$(this).css('font-weight', 'bold');
		});
		
		
		
	});

</script>

<body>

	<section id="noticeList">
			<article id="notice_content">
				<h2>회원 정보</h2>
				
				<div class="top_btn">
					<button type="button" class="btn btn-primary">+ 등록하기</button>
				</div>

				<div class="search_result"></div>
						
				<table class="table table-bordered">
					<colgroup>
						<col style="width:50px;"/>
						<col style="width:100px;"/>
						<col style="width:100px;"/>
						<col style="width:70px;"/>
						<col style="width:150px;"/>
						<col style="width:100px;"/>
						<col style="width:150px;"/>    
					</colgroup>
						<thead class="table-light">
						   <tr style="text-align: center">
						      <th scope="col">No</th>
						      <th scope="col">ID</th>
						      <th scope="col">이름</th>
						      <th scope="col">성별</th>
						      <th scope="col">생년월일</th>
						      <th scope="col">팝콘</th>
						      <th scope="col">탈퇴일</th>
						   </tr>
						 </thead>
					<tbody>

						<tr style="text-align: center">
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
					<div class="select-box">
						<select class="form-select" aria-label="Default select example">
						  <option selected>정렬 순서</option>
						  <option value="1">최신순</option>
						  <option value="2">오래된순</option>
						  <option value="3">조회수순</option>
						</select>
					</div>
						<div class="bottom_input">
							<div class="input-group mb-3">
							  <input type="text" class="form-control" placeholder="제목을 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
							  <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
							</div>
							<div class="ed_btn">
								<button class="btn btn-outline-secondary" type="button" id="button-edit">수정</button>
								<button class="btn btn-outline-secondary" type="button" id="button-delete">삭제</button>
							</div>
						</div>
				
			</article>
			
	</section> 
   </div><!-- admin_menu->aside, session 감싸는 div -->   
</div><!-- admin_menu->wrap -->
</body>
</html>