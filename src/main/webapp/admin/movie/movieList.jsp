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

<script>

	function movie_write(){
		location.href="movieWrite.jsp";
	}
	
</script>
<%
	MovieService service = new MovieService();
	List<MovieVO> list = null;
	MovieVO vo=null;
	
	try{
		list = service.selectMovieAll();
	}catch(SQLException e){
		e.printStackTrace();
	}
	

%>
						
	<section id="noticeList">
			<article id="notice_content">
				<h2>영화 리스트</h2>
				
				<div class="top_btn">
					<button type="button" class="btn btn-primary" onclick="movie_write()">+ 등록하기</button>
				</div>
				
				<div class="notice_box">
					
					<div class="content_box" style="height:100%;">
						<br><br>
						<div class="bottom_input">
							<div class="input-group" style="width:350px; margin: 0 auto">
							  <input type="text" class="form-control" placeholder="제목을 입력하세요." aria-label="Recipient's username" 
							  	aria-describedby="button-addon2" name="searchKeyword" title="검색어 입력" value="">
							  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
							</div>
							
							<div class="ed_btn">
								<button class="btn btn-outline-secondary" type="button" id="button-edit">수정</button>
								<button class="btn btn-outline-secondary" type="button" id="button-delete">삭제</button>
							</div>
						</div>
						<div class="search_result">           
							
							   <p> 검색어: 건 검색 되었습니다.</p> 
							
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
						      <th scope="col">선택</th>
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
							for(int i=0; i<list.size();i++){
								vo=list.get(i);
						        String formattedDate = sdf.format(vo.getOpendate());

						%>
							<tr style="text-align: center; line-height: 77px;">
								<td><input type="checkbox" name="check" value="<%=vo.getMovieNo()%>"></td>
								<td>
									<img src="../../images/movie/poster/<%=vo.getPoster()%>" style="width:50px;">
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
				
				
			</article>			
		</section> 
	</div><!-- admin_menu->aside, session 감싸는 div -->	
</div><!-- admin_menu->wrap -->


</body>
</html>