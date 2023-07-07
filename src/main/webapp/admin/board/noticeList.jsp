<%@page import="com.semi.board.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.board.model.BoardDAO"%>
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
		
		//공지사항|FAQ 선택시 볼드
		$('.top_text').find('span').click(function(){
			$('.top_text').find('span').css('font-weight','')
			$(this).css('font-weight', 'bold');
		});
		
		$('.top_btn').click(function(){
			location.href = 'noticeWrite.jsp';
		});
		
		$('#button-delete').click(function(){
			if(confirm('정말 삭제하시겠습니까?')){
				return false;
			}
		});
			
	});

</script>

<body>

<%-- <%
request.setCharacterEncoding("utf-8");
	String keyword=request.getParameter("searchKeyword");
	String condition=request.getParameter("searchCondition");
	
	BoardDAO boardDao = new BoardDAO();
	List<BoardVO> list = null;
	try {
		list = boardDao.selectAll(keyword, condition);
	} catch (SQLException e) {
		e.printStackTrace();
	}

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	//검색창(keyword) null이면 공백으로 처리
	if (keyword == null)
		keyword = "";

	//페이징 처리
	int currentPage = 1; //현재 페이지

	if (request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}

	//[1] 현재 페이지와 무관한 변수
	int totalRecord = list.size(); //총 레코드 개수
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
%> --%>

	<section id="noticeList">
			<article id="notice_content">
				<h2>공지/FAQ</h2>
				
				<div class="top_btn">
					<button type="button" class="btn btn-primary">
						<a href="noticeWrite.jsp"></a>+ 등록하기</button>
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
							   <p> 검색어: <%=keyword %>, <%=list.size() %>건 검색 되었습니다.</p> 
							<%} %> --%>
						</div>
						
						<div class="bottom_input">
							<div class="input-group" style="width:350px; margin: 0 auto">
							  <input type="text" class="form-control" placeholder="제목을 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
							  <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
							</div>
							
							<div class="ed_btn">
								<button class="btn btn-outline-secondary" type="button" id="button-edit">수정</button>
								<button class="btn btn-outline-secondary" type="button" id="button-delete">삭제</button>
							</div>
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
						      <th scope="col">등록일</th>
						      <th scope="col">조회수</th>
						    </tr>
						  </thead>
						<tbody>

							<tr style="text-align: center">
								<th><input type="checkbox"></th>
								<th scope="row">1</th>
								<td style="text-align: left"><a href="#">공지</a></td>
								<td>2023-07-05</td>
								<td>128</td>
							</tr> 
							<%-- <%
							if (list == null || list.isEmpty()) {
							%>
							<tr>
								<td colspan="6" class="align_center">글이 존재하지 않습니다.</td>
							</tr>
							<%
							} else {
							%>
							<!--게시판 내용 반복문 시작  -->
							<%
							//10번씩만 반복
							for (int i = 0; i < pageSize; i++) {
								if (num < 1)
									break;

								BoardVO vo = list.get(curPos++);
								num--;
							%>
							<tr style="text-align: center">
								<th><input type="checkbox"></th>
								<td><%=vo.getBoardNo()%></td>
								<td style="text-align: left"><a
									href="countUpdate.jsp?no=<%=vo.getBoardNo()%>"><%=vo.getBoardTitle()%></a>
								</td>
								<td><%=sdf.format(vo.getBoardRegdate())%></td>
								<td><%=vo.getBoardStatus()%></td>
							</tr>
							<%
							} //for
							%>
							<!--반복처리 끝  -->
							<%
							} //if
							%> --%>
						</tbody>
					</table>
						<div class="page_box">
							<nav aria-label="page">
								<ul class="pagination">
									<li class="page-item disabled"><a class="page-link">Previous</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item active" aria-current="page"><a
										class="page-link" href="#">2</a></li>
									<li class="page-item" aria-current="page"><a
										class="page-link" href="#">3</a></li>
									<li class="page-item" aria-current="page"><a
										class="page-link" href="#">4</a></li>
									<li class="page-item" aria-current="page"><a
										class="page-link" href="#">5</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">Next</a>
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