<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>

<script>
	function movie_write(){
		location.href="movieWrite.jsp";
	}
</script>

	<section id="noticeList">
			<article id="notice_content">
				<h2>영화 리스트</h2>
				
				<div class="top_btn">
					</a><button type="button" class="btn btn-primary" onclick="movie_write()">+ 등록하기</button>
				</div>
				
				<div class="notice_box">
					
					<div class="content_box">
						<div class="search_result">    
						</div>
						<table class="table table-bordered">
						  <colgroup>
						      <col style="width:7%;" />
						      <col style="width:10%;" />
						      <col style="width:60%;" />
						      <col style="width:15%;" />      
						      <col style="width:10%;" />      
						   </colgroup>
						  <thead class="table-light">
						    <tr style="text-align: center">
						      <th scope="col">선택</th>
						      <th scope="col">번호</th>
						      <th scope="col">제목</th>
						      <th scope="col">작성일</th>
						      <th scope="col">조회수</th>
						    </tr>
						  </thead>
						<tbody>

							<tr style="text-align: center">
								<th><input type="checkbox"></th>
								<th scope="row">1</th>
								<td style="text-align: left"><a href="#"></a>공지</td>
								<td>2023-07-05</td>
								<td>128</td>
							</tr>						
						</tbody>
					</table>
						
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
						
					</div>
				</div>
				
				
			</article>			
		</section> 
	</div><!-- admin_menu->aside, session 감싸는 div -->	
</div><!-- admin_menu->wrap -->


</body>
</html>