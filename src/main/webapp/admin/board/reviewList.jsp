<%@page import="com.semi.review.model.ReviewVO2"%>
<%@page import="com.semi.review.model.ReviewDAO2"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>
<script type="text/javascript">
	$(function(){
		//글 리스트 호버 
		$('.content_box tbody tr').hover(function(){
			$(this).css('background','#f8f9fa');
		},function(){
			$(this).css('background','');
		});
		
		$('#button-delete').click(function(){
			var chkCount = $('input[name=chk]:checked').length; 
			var chk = $('input[name=chk]:checked').attr('id');
			if(chkCount<=0){
				alert("수정할 항목을 선택해주세요");
			}else{
				if(confirm("정말 삭제하시겠습니까?")){
					$('form').submit(); 
				}
			}
		});
		
		$('#detailRev').click(function(){
			window.open('reviewDetail.jsp', 'review', 'width=800px,height=800px,scrollbars=yes');
		});
			
	});

</script>

<body>

<%
request.setCharacterEncoding("utf-8");
	String keyword=request.getParameter("searchKeyword");
	String condition=request.getParameter("searchCondition");
	
	ReviewDAO2 reviewDao2 = new ReviewDAO2();
	List<ReviewVO2>list2 = null;
	try {
		list2 = reviewDao2.selectAll(keyword, condition);
	} catch (SQLException e) {
		e.printStackTrace();
	}

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	//검색창(keyword) null이면 공백으로 처리
	if (keyword == null) keyword = "";

	//페이징 처리
	int currentPage = 1; //현재 페이지

	if (request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}

	//[1] 현재 페이지와 무관한 변수
	int totalRecord = list2.size(); //총 레코드 개수
	int pageSize = 10; //한 페이지에 보여주 레코드 수
	int blockSize = 5; //한 블럭에 보여줄 페이지 수
	int totalPage = (int) Math.ceil((float) totalRecord / pageSize); //총 페이지 수

	//[2] 현재 페이지를 이용해서 계산해야 하는 변수
	int firstPage = currentPage - ((currentPage - 1) % blockSize); //1,11,21..블럭의 시작페이지
	int lastPage = firstPage + (blockSize - 1); //10,20,30.. 블럭의 마지막 페이지

	//페이지당 ArrayList에서의 시작 index => 0,5,10,15..
	int curPos = (currentPage - 1) * pageSize;

	//페이지당 글 리스트 시작 번호
	int num = totalRecord - curPos;
%>

	<section id="noticeList">
			<article id="notice_content">
				<h2>리뷰 관리</h2>
				
				<div class="notice_box">
					<div class="top_box">
						<div class="top_text">
							<span class="span_review">리뷰 관리</span>
						</div>			
					</div> 

						
					<div class="content_box">
					
						<div class="search_result">           
						</div>
						
						<div class="search_input">
							<form name = "frmSearch" method ="post" action="noticList.jsp">
								<select class="form-select" name="searchCondition" aria-label="Default select example">
							  <option value="title" 
							  	<%if("title".equals(condition)){ %>
				            		selected="selected" 
				            	<%} %>
				            	>영화 제목</option>
							  <option value="category"
							  	<%if("category".equals(condition)){ %>
				            		selected="selected" 
				            	<%} %>
				            	>리뷰 내용</option>
							  <option value="writer"
							  	<%if("writer".equals(condition)){ %>
				            		selected="selected" 
				            	<%} %>
				            	>작성자</option>
							</select>
							
							<div class="input-group" style="width:370px">
							  <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
							  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
							</div>
							
							<div class="ed_btn">
								<input type="button" class="review_btn btn btn-primary" name="Review" value="삭제" id="delReview">
							</div>
						</div>
						<div class="search_result">           
							<%if(keyword!=null && !keyword.isEmpty()){%>
							   <p> 검색어: <%=keyword %>, <%=list2.size() %>건 검색 되었습니다.</p> 
							<%} %>
						</div>
						<form name="delFrm" method="post" action="">
							<table class="table table-bordered">
							  <colgroup>
							      <col style="width:5%;" />
							      <col style="width:5%;" />
							      <col style="width:30%;" />
							      <col style="width:30%;" />      
							      <col style="width:15%;" />      
							      <col style="width:15%;" />      
							   </colgroup>
							  <thead class="table-light">
							    <tr style="text-align: center">
							      <th scope="col">선택</th>
							      <th scope="col">번호</th>
							      <th scope="col">영화 제목</th>
							      <th scope="col">리뷰 내용</th>
							      <th scope="col">작성자</th>
							      <th scope="col">별점</th>
							    </tr>
							  </thead>
							<tbody>
								
								<!--게시판 내용 반복문 시작  -->
								<%
								//10번씩 반복
								for (int i = 0; i < pageSize; i++) {
									if (num < 1) break;
	
									ReviewVO2 vo2 = list2.get(curPos++);
									num--;
								%>
								<tr style="text-align: center">
									<th><input type="checkbox" name="chk"></th>
									<th scope="row"><%=vo2.getReviewNo()%></th>
									<td style="text-align: left; text-indent: 15px">
										<a onclick="detailRev" href="reviewDetail.jsp?reviewNo=<%=vo2.getReviewNo()%>" ><%=vo2.getTitle()%></a></td>
									<td style="text-align: left">
										<a onclick="detailRev" href="reviewDetail.jsp?reviewNo=<%=vo2.getReviewNo()%>" ><%=vo2.getComments() %></a></td>
									<td><%=vo2.getUserId() %></td>
									<td><%=vo2.getScore()%></td>
								</tr> 
								<%
								} //for
								%>
								<!--반복처리 끝  -->
								</tbody>
							</table>
						</form>
						<div class="page_box">
							<nav aria-label="page">
								<ul class="pagination">
									<li class="page-item disabled"><a class="page-link">이전</a>
									</li>
									<li class="page-item active" aria-current="page"><a 
										class="page-link" href="#">1</a></li>
									<li class="page-item" ><a
										class="page-link" href="#">2</a></li>
									<li class="page-item" aria-current="page"><a
										class="page-link" href="#">3</a></li>
									<li class="page-item" aria-current="page"><a
										class="page-link" href="#">4</a></li>
									<li class="page-item" aria-current="page"><a
										class="page-link" href="#">5</a></li>
									<li class="page-item"><a class="page-link" href="#">다음</a>
									</li>
								</ul>
							</nav>
						</div>
					
				</div>
				
				
			</article>
			
	</section> 
   </div><!-- admin_menu->aside, session 감싸는 div -->   
</div><!-- admin_menu->wrap -->
</body>
</html>