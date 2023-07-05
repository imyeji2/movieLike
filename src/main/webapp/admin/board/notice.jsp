<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>

	
	<section id="noticeList">
			<article id="notice_content">
				<h1>공지/FAQ 등록</h1>
				
				<div class="top_btn">
					<button type="button" class="btn btn-primary">+ 등록하기</button>
				</div>
				
				<div class="top_box">
					<span id="span_notice">공지사항</span> | <span id="span_faq">FAQ</span>
				</div>
				
				<div class="content_box">
					<select class="form-select" aria-label="Default select example">
					  <option selected>정렬 순서</option>
					  <option value="1">최신순</option>
					  <option value="2">댓글순</option>
					  <option value="3">조회수순</option>
					</select>
					
					<div class="input-group mb-3">
					  <input type="text" class="form-control" placeholder="제목을 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
					  <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
					</div>
				</div>
				
				
			</article>
			
	</section> 
	


</body>
</html>