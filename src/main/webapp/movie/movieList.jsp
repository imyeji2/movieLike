<%@page import="com.semi.movie.model.MovieListService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.movie.model.MovieListVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>    
<script>
	$(function(){
		
		$('.main_box1').hover(function() {
			  $(this).css("cursor", "pointer");
			}, function(){
			  $(this).css("cursor", "none");
			});
		
		$('.main_box1').click(function(){
			var no =$(this).find('input[name=movieNo]').val();
			location.href="movie/movieDetail.jsp?no="+no;
		});
		
		$('.movieItemBox_hover').hide();
		
		$('.movieItemBox').hover(function() {
				$(this).find($('.movieItemBox_hover')).show();
			}, function(){
				$(this).find($('.movieItemBox_hover')).hide();
			});
	
		
	});
	
</script>

<%
	String genre = request.getParameter("genreNo");
	if(genre==null||genre.isEmpty()){
%>		
	<script>
		alert('잘못된 접근입니다.');
		location.href='<%=request.getContextPath()%>/index.jsp';
	</script>
<%
	return;	

	}
	MovieListService service = new MovieListService();
	MovieListVO vo = null;
	List<MovieListVO> list = null;
	int line = 0;
	int startPage=0;
	int endPage=0;
	
	try{
		list = service.selectMovieByGenre(Integer.parseInt(genre));
		line = list.size()/6;
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	if(list==null||list.isEmpty()){%>
	<section id="movieList" stYle="margin:0px;"><!-- 전체 페이지 제어 width:100%-->
		<article class="moviListAlert">
			<div class="moviListAlertInfo">
				<div class="moviListAlertInfo1">
					<img src="../images/popcorn.png">
				</div>
				<div class="moviListAlertInfo2">
					<p>라이터들의 취향을 반영한 영화를 곧 상영 예정입니다.</p>
					<p>팝콘과 함께 잠시만 기다려주세요.</p>
				</div>
			</div>
		</article>
	</section>
		
	<%}else{%>
	<section id="movieList"><!-- 전체 페이지 제어 width:100%-->
	<br><br><br>
<%
		for(int i=0;i<line+1;i++){	
			startPage=i*6;
			endPage = startPage+6;
			if(endPage>=list.size()){
				endPage=list.size();
			}
	%>
		<article class="moviListBox"><!-- 리스트 중 1줄 width:80%-->
		<%
				for(int j=startPage;j<endPage;j++){
					vo = list.get(j);
		%>
			<a href="movieDetail.jsp?no=<%=vo.getMovieNo() %>">
				<div class="movieItemBox"><!-- 리스트 중 1개  -->
					<div><!-- 기본box -->
						<div class="movieImg img-thumbnail">
							<img src="../images/movie/content/<%=vo.getPoster()%>">
							<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
								<p class="movieItemBox_hover_tit"><%=vo.getTitle() %></p>
								<p class="movieItemBox_hover_genre"><%=vo.getGenreName() %></p>
								<p class="movieItemBox_hover_txt"><%=vo.getSynop()%></p>
							</div><!-- hover box -->	
						</div>
					</div><!-- 기본box -->
					<p class="movieItemBox_info1 text-truncate"><%=vo.getTitle() %></p>
				</div><!-- 리스트 중 1개 -->
			</a>
		<%	
				}
				
			
		%>	
		</article><!-- 리스트 중 1줄 -->	

		<%}%>
	<br><br><br><Br><br>
	</section><!-- 전체 페이지 제어 -->
	
	<% }%>

			
<%@ include file="../inc/bottom.jsp" %>	

