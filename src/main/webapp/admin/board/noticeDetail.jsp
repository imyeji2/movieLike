<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>

<body>

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
					
						<div class="ed_btn">
							<div class="ed_btn1">
								<button class="btn btn-outline-secondary" type="button" id="button-delete">삭제</button>
							</div>
							<div class="ed_btn2">
								<button class="btn btn-outline-secondary" type="button" id="button-edit" >
									<a href="<%=request.getContextPath()%>/board/noticeEdit.jsp">수정</a>
								</button>
							</div>
						</div>
						
						<table class="table table-bordered">
						<colgroup>
						      <col style="width:20%;" />
						      <col style="width:80%;" />
						</colgroup>
							<tr>
						      <th scope="col">번호</th>
						      <td scope="col">1</td>
						    </tr>
							<tr>
						      <th>제목</th>
						      <td>공지</td>
						    </tr>
							<tr>
						      <th>작성자</th>
						      <td>나다미</td>
						    </tr>
							<tr>
						      <th>조회수</th>
						      <td>128</td>
						    </tr>
							<tr>
						      <th>등록일</th>
						      <td>2023-07-10</td>
						    </tr>
							<tr>
							<div class="in_text">
						      <th style = "padding-top : 25px ">내용</th>
						     </div>
						      <td>공지합니다.<br>rhdwlrhdwl<br>rhdwlrhdwl<br>rhdwlrhdwl</td>
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