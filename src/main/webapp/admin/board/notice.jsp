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
					<div class="top_text">
						<span id="span_notice">공지사항</span> | <span id="span_faq">FAQ</span>
					</div>			
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
					
					<table border="1px" align="center">
						<colgroup>
					      <col style="width:10%;" />
					      <col style="width:50%;" />
					      <col style="width:10%;" />
					      <col style="width:10%;" />
					      <col style="width:10%;" />      
					      <col style="width:10%;" />      
					   </colgroup>
					   <thead>
					     <tr>
					       <th scope="col">번호</th>
					       <th scope="col">제목</th>
					       <th scope="col">댓글수</th>
					       <th scope="col">작성일</th>
					       <th scope="col">조회</th>
					       <th scope="col">관리</th>
					     </tr>
					   </thead> 
						
					</table>
				</div>
				
				
				
			</article>
			
	</section> 
	


</body>
</html>