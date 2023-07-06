<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>

<script type="text/javascript" src = "../../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		//글 리스트 호버 
		$('.content_box tbody tr').hover(function(){
			$(this).css('background','#f8f9fa');
		},function(){
			$(this).css('background','');
		});
		
		//공지사항|FAQ 선택시 볼드
		$('.top_text').find('span').click(function(){
			$('.top_text').find('span').css('font-weight','')
			$(this).css('font-weight', 'bold');
		});
		
		
		
	});

</script>

	<section id="noticeList">
			<article id="notice_content">
				<h2>공지/FAQ 등록</h2>
				
				<div class="top_btn">
					<button type="button" class="btn btn-primary">+ 등록하기</button>
				</div>
				
				<div class="notice_box">
					<div class="top_box">
						<div class="top_text">
							<span class="span_notice"><a href="#"></a>공지사항</span> | 
							<span class="span_notice"><a href="#"></a>FAQ</span>
						</div>			
					</div> 

					
					<div class="content_box">
						<!-- <select class="form-select" aria-label="Default select example">
						  <option selected>정렬 순서</option>
						  <option value="1">최신순</option>
						  <option value="2">오래된순</option>
						  <option value="3">조회수순</option>
						</select> -->
						
						<div class="search_result">           
							<%-- <%if(keyword!=null && !keyword.isEmpty()){%>
							   <p> 검색어: <%=keyword %>, <%=totalRecord %>건 검색 되었습니다.</p> 
							<%} %> --%>
						</div>
						
						<table class="table table-bordered">
						  <colgroup>
						      <col style="width:5%;" />
						      <col style="width:10%;" />
						      <col style="width:50%;" />
						      <col style="width:20%;" />      
						      <col style="width:10%;" />      
						   </colgroup>
						  <thead class="table-light">
						    <tr>
						      <th scope="col">선택</th>
						      <th scope="col">번호</th>
						      <th scope="col">제목</th>
						      <th scope="col">작성일</th>
						      <th scope="col">조회</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th><input type="checkbox"></th>
						      <th scope="row">1</th>
						      <td>공지</td>
						      <td>2023-07-05</td>
						      <td>128</td>
						    </tr>
						    <tr>
						      <th><input type="checkbox"></th>
						      <th scope="row">2</th>
						      <td>공지</td>
						      <td>2023-06-24</td>
						      <td>184</td>
						    </tr>
						    <tr>
						      <th><input type="checkbox"></th>
						      <th scope="row">3</th>
						      <td>공지</td>
						      <td>2023-06-18</td>
						      <td>251</td>
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