<%@page import="java.text.Format"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.member.model.UserVO"%>
<%@page import="com.semi.common.PagingVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.member.model.UserService"%>
<%@page import="com.semi.member.model.UserDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>
<%@ include file="../../admin_login/login_chk.jsp"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/user.js"></script>
<script type="text/javascript">
	$(function(){
		//글 리스트 호버 
		$('.content_box tbody tr').hover(function(){
			$(this).css('background','#f8f9fa');
		},function(){
			$(this).css('background','');
		});

		//수정버튼
		$('#button-edit').click(function(){
			// 체크된 체크박스의 값을 가져옴
			var checkedIds = [];
			$('input[type="checkbox"]:checked').each(function() {
				checkedIds.push($(this).closest('tr').find('.user-id').text()); // 사용자 ID를 가져옴
			});
			
			
			if(checkedIds.length === 0) {
				alert('수정할 회원을 선택해주세요.');
				return;
			}else if(checkedIds.length > 1) {
				alert('한명의 회원만 수정 가능합니다.');
				return;
			}
			
		});
		
		//삭제 버튼
		$('#button-delete').click(function(){
			// 체크된 체크박스의 값을 가져옴
			var checkedIds = [];
			$('input[type="checkbox"]:checked').each(function() {
				checkedIds.push($(this).closest('tr').find('.user-id').text()); // 사용자 ID를 가져옴
			});
			
			if(checkedIds.length === 0) {
				alert('탈퇴할 회원을 선택해주세요.');
				return;
			}else if(checkedIds.length > 1) {
				alert('한명의 회원만 탈퇴 가능합니다.');
				return;
			}
			
			if(confirm('선택한 회원을 탈퇴처리할까요?')) {
				// 폼을 동적으로 생성하여 데이터 전송
				var form = document.createElement('form');
				form.setAttribute('method', 'POST');
				form.setAttribute('action', '<%=request.getContextPath()%>/admin/member/memDelete_ok.jsp');
				
				var hiddenField = document.createElement('input');
				hiddenField.setAttribute('type', 'hidden');
				hiddenField.setAttribute('name', 'userId');
				hiddenField.setAttribute('value', checkedIds.join(','));
				
				form.appendChild(hiddenField);
				
				document.body.appendChild(form);
				form.submit();
			}
			

			
		});
			
	});

</script>

<body>
<%
	//1. 검색 경우 파라미터 받아오기
	request.setCharacterEncoding("utf-8");
	String keyword = request.getParameter("searchKeyword");
	String condition = request.getParameter("searchCondition");
	
	//2.db 작업
	UserService userService = new UserService();
	List<UserVO> list = null;
	
	try{
		if(condition != null && condition.equals("outdate")){
			list = userService.selectOutUser();
		}else{
			list = userService.selectAll(keyword, condition);
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3.결과 출력
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	if(keyword == null) keyword = "";
	
	
	//페이징 처리
	
	int currentPage = 1; //현재 페이지
	
	if(request.getParameter("currentPage")!=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	
	//현재 페이지랑 무관한 변수
	
	int totalRecord = list.size(); //총 레코드 개수
	int pageSize = 10; //한페이지에 보여주는 레코드 수
	int blockSize = 10; // 한 블럭에 보여줄 페이지 수

	PagingVO pageVo = new PagingVO(currentPage, totalRecord, pageSize, blockSize);
	
	

%>

	<section id="noticeList">
			<article id="notice_content">
				<h2>회원 관리</h2>
				
				<div class="notice_box">
					<div class="top_box">
						<div class="top_text">
							<span class="span_review">회원 관리</span>
						</div>			
					</div> 

						
					<div class="content_box">
						<div class="search_result">           						
							<%=list.size()%>건 검색되었습니다.
						</div>
						
						<div class="search_input">
							<form name = "frmSearch" method ="post" action="memberList.jsp">
								<select class="form-select" name="searchCondition" aria-label="Default select example">
								  <option selected>카테고리</option>	
								  <option value="name"
								  		<% if("name".equals(condition)) {%> 
								  			selected = "selected" <%} %>
								  >이름</option>
								  
								  <option value="gender"
								  		<% if("gender".equals(condition)) {%>
								  			selected = "selected" <%} %>
								  >성별</option>
								  
								  <option value="outdate"
								  		<% if("outdate".equals(condition)) {%> 
								  			selected = "selected" <%} %>
								  >탈퇴회원</option>
								  
								</select>
								
									<div class="input-group" style="width:370px">
									  <input type="text" name = "searchKeyword" class="form-control" placeholder="검색어를 입력하세요" value = "<%=keyword%>"aria-label="Recipient's username" aria-describedby="button-addon2">
									  <button class="btn btn-outline-secondary" type="submit" id="button-addon2" >검색</button>
									</div>
								</form>
							<div class="ed_btn">
								<button class="btn btn-outline-secondary" type="button" id="button-delete">탈퇴</button>
							</div>
						</div>
						
						<table class="table table-bordered">
						  <colgroup>
						      <col style="width:5%;" />
						      <col style="width:25%;" />
						      <col style="width:15%;" />
						      <col style="width:10%;" />      
						      <col style="width:20%;" />      
						      <col style="width:10%;" />      
						      <col style="width:20%;" />      
						   </colgroup>
						  <thead class="table-light">
						    <tr style="text-align: center">
						      <th scope="col">선택</th>
						      <th scope="col">ID</th>
						      <th scope="col">이름</th>
						      <th scope="col">성별</th>
						      <th scope="col">생년월일</th>
						      <th scope="col">팝콘</th>
						      <th scope="col">탈퇴일</th>
						    </tr>
						  </thead>
						<tbody>
						<%if(list == null || list.isEmpty()){ %>
							<tr><td colspan="7" class = "align_center">회원이 존재하지 않습니다.</td></tr>
						<%}else{ 
						
							int num = pageVo.getNum();
						  	int curPos = pageVo.getCurPos();
							
							for(int i = 0; i<pageVo.getPageSize(); i++){
								if(num<1) break;
								
								UserVO vo = list.get(curPos++);
								num--;	
							
								//
/* 								if("outdate".equals(condition) && vo.getOutDate() == null){
									continue;
								} */
						%>
							<tr style="text-align:center">
								<td><input type="checkbox" id="chkid"></td>
								<td class = "user-id"><%=vo.getUserId() %></td>
								<td><%=vo.getName() %></a></td>
								<td><%=vo.getGender() %></td>
								<td><%=vo.getBirth() %></td>
								<td><%=vo.getPoint() %></td>
								<td><% if(vo.getOutDate() != null ){%>
								<%=sdf.format(vo.getOutDate()) %>
								<%} %></td>
							</tr> 
							
							<%}//for %>
						<%}//if %>
						
						</tbody>
					</table>
						<div class="page_box">
							<nav aria-label="page">
								<ul class="pagination">
									<%if(pageVo.getFirstPage()>1){%>
											<li class="page-item"><a class="page-link" href="memberList.jsp?currentPage=<%=pageVo.getFirstPage()-1%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition %>">Previous</a></li>	
										<%} %>
									
										<% for(int i = pageVo.getFirstPage(); i <= pageVo.getLastPage(); i++){
											if(i>pageVo.getTotalPage()) break;
											if(i == currentPage){ %>
												<li class="page-item active" aria-current="page"><a class="page-link" href="memberList.jsp?currentPage=<%=i%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition %>"><%=i %></a></li>
										<%	}else{ %>
												<li class="page-item"><a class="page-link" href="memberList.jsp?currentPage=<%=i%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition %>"><%=i %></a></li>
										<%	}//if %>
										<%}//for %>
									
										<!-- 다음 블럭으로 이동 -->
										<%if(pageVo.getLastPage()< pageVo.getTotalPage()){%>
											<li class="page-item"><a class="page-link" 
											href="memberList.jsp?currentPage=<%=pageVo.getLastPage()+1%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition %>">Next</a></li>
										<%} %>
								</ul>
							</nav>
						</div>
				</div>
				<form name = "editUserBox" method="post" action="memEdit_ok.jsp">
					<div class = "outline">
						<div class "popcorn">
						</div>
						
					</div>
				</form>
			</article>
			
	</section> 
   </div><!-- admin_menu->aside, session 감싸는 div -->   
</div><!-- admin_menu->wrap -->
</body>
</html>