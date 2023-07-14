<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.common.PagingVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="com.semi.movie.model.MovieVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.movie.model.MovieService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>


<%
	String serch = request.getParameter("serch");
	


	MovieService service = new MovieService();
	List<MovieVO> list = null;
	MovieVO vo=null;
	
	
	if(serch==null||serch.isEmpty()){
		serch="";
		try{
			list = service.selectMovieAll();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}else{
		try{
			list=service.serchtMovie(serch);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
		
	//페이징 처리
	
	int currentPage = 1; //현재 페이지
	
	if(request.getParameter("currentPage")!=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	
	//현재 페이지랑 무관한 변수
	
	int totalRecord = list.size(); //총 레코드 개수
	int pageSize = 5; //한페이지에 보여주는 레코드 수
	int blockSize = 5; // 한 블럭에 보여줄 페이지 수

	PagingVO pageVo = new PagingVO(currentPage, totalRecord, pageSize, blockSize);
	
%>
<script>

	function movie_write(){
		location.href="movieWrite.jsp";
	}
	
	$(function(){
		$('#serchBtn').click(function(){
			location.href="movieList.jsp?serch=<%=serch%>";
		});
		
		$('#add').click(function(){
			var chkCount = $('input[name=chk]:checked').length; 
			if(chkCount>0){
				alert("선택을 해제해 주세요");
			}else{
				var popup = window.open('addActorPopUp.jsp?', 'add', 'width=600px,height=350px,scrollbars=yes');
			}
		});
		
		$('#checkAll').click(function(){
			if($(this).is(':checked')){
				 $("input[name=chk]").prop("checked", true);
			}else{
				$("input[name=chk]").prop("checked", false);
			}
		})
		
		
		$('#eidt').click(function(){
			var chkCount = $('input[name=chk]:checked').length; 
			var chkArr = $('input[name=chk]:checked').attr('id');
			if(chkCount>1){
				alert("수정할 항목을 하나만 선택해 주세요");
			}else if(chkCount<=0){
				alert("수정할 항목을 선택해주세요");
			}else{
				location.href="movieEdit.jsp?no="+chkArr;				
			}
		});
		
		$('#del').click(function(){
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
	});
	
</script>
						
	<section id="noticeList">
			<article id="notice_content">
				<h2>영화 리스트</h2>
				
				<div class="top_btn">
					<button type="button" class="btn btn-primary" onclick="movie_write()">+ 등록하기</button>
				</div>
				
				<div class="notice_box">
					
					<div class="content_box" style="height:100%;">
						<br><br>
						<form name="serchFrm" method="get" action="movieList.jsp">
						<div class="bottom_input">
							<div class="input-group" style="width:350px; margin: 0 auto">
							  <input type="text" class="form-control" placeholder="제목을 입력하세요." aria-label="Recipient's username" 
							  	aria-describedby="button-addon2" title="검색어 입력" name="serch" value="<%=serch%>">
							  <button class="btn btn-outline-secondary" type="submit" id="serchBtn">검색</button>
							</div>
							
							<div class="ed_btn">
								<button class="btn btn-outline-secondary" type="button" id="eidt">수정</button>
								<button class="btn btn-outline-secondary" type="button" id="del">삭제</button>
							</div>
						</div>
						</form>
						<div class="search_result">           

						</div>
						
						<table class="table table-bordered" style="border:1px solid gary">
						
						  <colgroup>
						      <col style="width:5%;" />
						      <col style="width:5%;" />
						      <col style="width:30%;" />
						      <col style="width:15%;" />      
						      <col style="width:10%;" />   
						      <col style="width:4%;" />    
						   </colgroup>
						  <thead class="table-light">
						    <tr style="text-align: center">
						      <th scope="col">
						      <input class="form-check-input" type="checkbox" id="checkAll">
								</th>
						      <th scope="col">포스터</th>
						      <th scope="col">제목</th>
						      <th scope="col">감독</th>
						      <th scope="col">개봉일</th>
						      <th scope="col">상태</th>
						    </tr>
						  </thead>
						<tbody>
						<%
							if(list==null||list.isEmpty()){%>
								<tr style="text-align: center">
									<td colspan="5">등록된 글이 없습니다.</td>
								</tr>
						<% }else{
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
							int num = pageVo.getNum();
						  	int curPos = pageVo.getCurPos();
						  	
							for(int i=0; i<pageVo.getPageSize();i++){
	
								if(num<1) break;
									
								vo=list.get(curPos++);
								num--;	
						        String formattedDate = sdf.format(vo.getOpendate());

						%>
							<tr style="text-align: center; line-height: 77px;">
								<td>
									<input class="form-check-input" type="checkbox"  name="chk" value="<%=vo.getMovieNo()%>" id="<%=vo.getMovieNo()%>">
								</td>
								<td>
									<img src="../../images/movie/content/<%=vo.getPoster()%>" style="width:50px;">
								</td>
								<td style="text-align: left;"><a href="movieDetail?no=<%=vo.getMovieNo()%>"></a><%=vo.getTitle() %></td>
								<td><a href="#"></a><%=vo.getDirectorNo1() %></td>
								<td><%=formattedDate %></td>
								<td><%=vo.getMovieStatus() %></td>
							</tr>		
						<%} 
						}
						%>				
						</tbody>
					</table>
					<br><br>
					</div>
				</div>
				<div class="page_box">
					<nav aria-label="page">
						<ul class="pagination">
							<%if(pageVo.getFirstPage()>1){%>
									<li class="page-item"><a class="page-link" href="movieList.jsp?currentPage=<%=pageVo.getFirstPage()-1%>&serch=<%=serch%>">Previous</a></li>	
								<%} %>
							
								<% for(int i = pageVo.getFirstPage(); i <= pageVo.getLastPage(); i++){
									if(i>pageVo.getTotalPage()) break;
									if(i == currentPage){ %>
										<li class="page-item active" aria-current="page"><a class="page-link" href="movieList.jsp?currentPage=<%=i%>&serch=<%=serch%>"><%=i %></a></li>
								<%	}else{ %>
										<li class="page-item"><a class="page-link" href="movieList.jsp?currentPage=<%=i%>&serch=<%=serch%>"><%=i %></a></li>
								<%	}//if %>
								<%}//for %>
							
								<!-- 다음 블럭으로 이동 -->
								<%if(pageVo.getLastPage()< pageVo.getTotalPage()){%>
									<li class="page-item"><a class="page-link" 
									href="movieList.jsp?currentPage=<%=pageVo.getLastPage()+1%>&serch=<%=serch%>">Next</a></li>
								<%} %>
						</ul>
					</nav>
				</div>				
		
			</article>			
		</section> 
	</div><!-- admin_menu->aside, session 감싸는 div -->	
</div><!-- admin_menu->wrap -->


</body>
</html>