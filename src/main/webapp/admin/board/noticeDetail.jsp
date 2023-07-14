<%@page import="com.semi.board.model.BoardVO"%>
<%@page import="com.semi.board.model.BoardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>
<script type="text/javascript">
	$(function(){
		delOk() {
			if(!confirm('삭제하시겠습니까?')){
				return false;
			}
		}
	});

</script>
<body>
	<%
		String boardNo = request.getParameter("boardNo");
		if(boardNo==null || boardNo.isEmpty()){ %>
			<script type="text/javascript">
				alert('잘못된 url입니다.');
				location.href="noticeList.jsp";
			</script>
		
		<%	return;
		}
		
		BoardDAO boardDao = new BoardDAO();
		BoardVO vo = null;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		try{
			vo = boardDao.selectByNo(Integer.parseInt(boardNo));
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		String boardContent = vo.getBoardContent();
		if(boardContent!=null){ 
			boardContent=boardContent.replace("\r\n", "<br>");
		}else{
			boardContent = "";
		}
		
	%>
	<section id="noticeDetail">
			<article id="detail_content">
				<h2>공지/FAQ</h2>
				
				<div class="top_btn">
					<button type="button" class="btn btn-primary">
					<a href="noticeList.jsp">목록</a></button>
				</div>
				
				<div class="notice_box">
					<div class="top_box">
						<div class="top_text">
							<p>공지사항 > 상세보기</p> 
						</div>			
					</div> 

					
					<div class="content_box">
						
						<div class="ed_btn" >
								<button class="btn btn-outline-secondary" type="button" id="button-edit">수정</button>
								<button class="btn btn-outline-secondary" type="button" id="button-delete" onclick="delOk()">삭제</button>
						</div>
						
						<%-- <div class="ed_btn">
							<div class="ed_btn1">
								<button class="btn btn-outline-secondary" type="button" id="button-delete">
									<a href='noticeDelete.jsp?boardNo=<%=boardNo%>'>삭제</button>
							</div>
							<div class="ed_btn2">
								<button class="btn btn-outline-secondary" type="button" id="button-edit">
									<a href='noticeWrite.jsp?boardNo=<%=boardNo%>'>수정</a>
								</button>
							</div>
						</div> --%>
						<table class="table table-bordered">
						<colgroup>
						      <col style="width:20%;" />
						      <col style="width:80%;" />
						</colgroup>
							<tr>
						      <th scope="col">번호</th>
						      <td scope="col"><%=vo.getBoardNo()%></td>
						    </tr>
							<tr>
						      <th>제목</th>
						      <td><%=vo.getBoardTitle() %></td>
						    </tr>
							<tr>
						      <th>작성자</th>
						      <td><%=vo.getAdminID() %></td>
						    </tr>
							<tr>
						      <th>조회수</th>
						      <td><%=vo.getBoardView() %></td>
						    </tr>
							<tr>
						      <th>등록일</th>
						      <td><%=sdf.format(vo.getBoardRegdate())%></td>
						    </tr>
							<tr>
							<div class="in_text">
						      <th style = "padding-top : 25px ">내용</th>
						     </div>
						      <td><%=vo.getBoardContent() %></td>
						    </tr>
						</table>
					</div>
				</div>
			</article>
			
	</section> 
   </div><!-- admin_menu->aside, session 감싸는 div -->   
</div><!-- admin_menu->wrap -->
</body>
</html>