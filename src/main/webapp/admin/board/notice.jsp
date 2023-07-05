<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>
<link rel="stylesheet" type="text/css" href="../../css/dami.css" />
<script type="text/javascript" src = "../../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('.content_box tbody tr').hover(function(){
			$(this).css('background','#f8f9fa');
		},function(){
			$(this).css('background','');
		});
	});

</script>

	
	<section id="noticeList">
			<article id="notice_content">
				<h1>공지/FAQ 등록</h1>
				
				<div class="top_btn">
					<button type="button" class="btn btn-primary">+ 등록하기</button>
				</div>
				
				<div class="notice_box">
					<div class="top_box">
						<div class="top_text">
							<span id="span_notice">공지사항</span> | <span id="span_faq">FAQ</span>
						</div>			
					</div>
					
					<div class="content_box">
						<select class="form-select" aria-label="Default select example">
						  <option selected>정렬 순서</option>
						  <option value="1">최신순</option>
						  <option value="2">오래된순</option>
						  <option value="3">조회수순</option>
						</select>
						
						<div class="input-group mb-3">
						  <input type="text" class="form-control" placeholder="제목을 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
						  <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
						</div>
						
						<table class="table table-bordered">
						  <colgroup>
						      <col style="width:10%;" />
						      <col style="width:50%;" />
						      <col style="width:10%;" />
						      <col style="width:10%;" />      
						      <col style="width:10%;" />      
						   </colgroup>
						  <thead class="table-light">
						    <tr>
						      <th scope="col">번호</th>
						      <th scope="col">제목</th>
						      <th scope="col">작성일</th>
						      <th scope="col">조회</th>
						      <th scope="col">관리</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">1</th>
						      <td>공지</td>
						      <td>2023-07-05</td>
						      <td>128</td>
						      <td><input type="button" class="notice_edit_btn" value="수정"> 
						      <input type="button" class="notice_delete_btn" value="삭제"> </td>
						    </tr>
						    <tr>
						      <th scope="row">2</th>
						      <td>공지</td>
						      <td>2023-06-24</td>
						      <td>184</td>
						      <td><input type="button" class="notice_edit_btn" value="수정"> 
						      <input type="button" class="notice_delete_btn" value="삭제"> </td>
						    </tr>
						    <tr>
						      <th scope="row">3</th>
						      <td>공지</td>
						      <td>2023-06-18</td>
						      <td>251</td>
						      <td><input type="button" class="notice_edit_btn" value="수정"> 
						      <input type="button" class="notice_delete_btn" value="삭제"> </td>
						    </tr>
						  </tbody>
						</table>
					</div>
				</div>
				
				
			</article>
			
	</section> 
	


</body>
</html>