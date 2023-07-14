<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.semi.faq.model.FaqVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.faq.model.FaqDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="noticeMain.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String keyword=request.getParameter("searchKeyword"); //제목으로 검색 파라미터
	
	
	FaqDAO faqDao = new FaqDAO();
	List<FaqVO> list = new ArrayList<>();
	try {
		list = faqDao.selectAll(keyword);
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
%>
<style>
section {
	width: 100%;
	padding: 0;
	box-sizing: border-box;
	margin: 0 auto;
	background: white
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<section id="noticeList">
	<article id="notice_content">
		<h2>FAQ</h2>
		<div class="notice_box">
			<div class="top_box">
				<div class="top_text">
					<span class="span_notice" style="color: #000;">FAQ</a></span>
				</div>
			</div>

			<div class="content_box">


				<table class="table table-bordered">
					<colgroup>
						<col style="width: 6%;" />
						<col style="width: 6%;" />
						<col style="width: 45%;" />
						<col style="width: 12%;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>

					<!--게시판 내용 반복문 시작  -->
					<div class="accordion accordion-flush" id="accordionFlushExample">
						<%
							String[] strNum = {"One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"};
							int currNum = 0;
							
							//10번씩 반복
							for (int i = 0; i < pageSize; i++) {
								if (num < 1) break;

								FaqVO vo = list.get(curPos++);
								
								if("faq".equals(vo.getBoardCategory())) {
									
							%>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse"
									data-bs-target="#flush-collapse<%=strNum[currNum] %>"
									aria-expanded="false"
									aria-controls="flush-collapse<%=strNum[currNum] %>">
									<%=vo.getBoardTitle()%>
								</button>
							</h2>
							<div id="flush-collapse<%=strNum[currNum] %>"
								class="accordion-collapse collapse"
								data-bs-parent="#accordionFlushExample">
								<div class="accordion-body"><%=vo.getBoardContent() %></div>
							</div>
						</div>
						<%
							currNum++;
								} //if
								num--;
							} //for
							%>
						<!--반복처리 끝  -->
					</tbody>
				</table>
				<div class="page_box">
					<nav aria-label="page">

						<ul class="pagination">
							<%if(firstPage > 1){%>
							<li class="page-item disabled"><a
								href="faqList.jsp?currentPage=<%=firstPage-1%>&searchKeyword=<%=keyword %>">이전</a>
							</li>
							<%} %>

							<!-- [1][2][3][4][5]-->
							<%for(int i=firstPage ; i<=lastPage ; i++){
								      if(i>totalPage) break;
									  
								      if(i==currentPage){ %>
							<li class="page-item active" aria-current="page"><a
								class="page-link"><%=i %></a></li>
							<% }else{%>
							<li class="page-item active" aria-current="page"><a
								href="faqList.jsp?currentPage=<%=i %>&searchKeyword=<%=keyword %>"><%=i %></a>
							</li>
							<%}//if
   									 }//for %>

							<!-- 다음 블럭으로 이동 -->
							<%if(lastPage < totalPage){%>
							<li class="page-item"><a class="page-link"
								href="faqList.jsp?currentPage=<%=lastPage+1%>&searchKeyword=<%=keyword %>">다음</a>
							</li>
							<%} %>
						</ul>
					</nav>
				</div>

				<div class="bottom_input">
					<div class="input-group" style="width: 350px; margin: 0 auto">
						<input type="text" class="form-control" placeholder="제목을 입력하세요."
							aria-label="Recipient's username"
							aria-describedby="button-addon2" name="searchKeyword"
							title="검색어 입력" value="<%=keyword%>">
						<button class="btn btn-outline-secondary" type="submit"
							id="button-addon2">검색</button>
					</div>
				</div>


			</div>
		</div>
	</article>

</section>
