<%@page import="com.semi.movie.model.MovieListService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.semi.movie.model.MovieService"%>
<%@page import="com.semi.movie.model.MovieDAO"%>
<%@page import="com.semi.movie.model.MovieVO"%>
<%@page import="com.semi.movie.model.MovieListVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.genre.model.GenreVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.genre.model.GenreService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>

<%

	String no = request.getParameter("no");
	if(no==null||no.isEmpty()){%>
	<script>
		alert("잘못된 접근입니다.");
		history.back();
	</script>
<%	
	return;

	}

	MovieListVO vo = new MovieListVO();
	MovieListService service = new MovieListService();
	
	try{
		vo = service.selectMovie(Integer.parseInt(no));	
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy월 MM월 dd일");
	
%>
		<section id="movieWrite">
		<div class="movieWrite_wrap"><!-- 전체div -->
			<div class="movieWrite_box"> <!-- 상단 타이틀 div -->
				<h4>영화 등록</h4>
				<p><a href="movieList.jsp">영화관리</a>>영화등록</p>
			</div>
			<form name="movieWrite" method="post" enctype="multipart/form-data" action="movieWrite_ok.jsp">
				<div class="movieWrite_box"><!-- 입력폼 div -->
				
					<p class="clear">영화 정보</p>
		
					<div class="movieWrite_box1">
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">영화제목</div>
							<div class="movieWrite_box_in_right">
								<%=vo.getTitle() %>
							</div>
						</div><!-- movieWrite_box_in -->
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">줄거리</div>
							<div class="movieWrite_box_in_right"><%=vo.getSynop()%></div><!-- movieWrite_box_in_right -->
						</div><!-- movieWrite_box_in -->			
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">상영시간</div>
							<div class="movieWrite_box_in_right"><%=vo.getRunningTime() %>분</div>
						</div><!-- movieWrite_box_in -->
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">개봉연도</div>
							<div class="movieWrite_box_in_right"><%=sdf.format(vo.getOpendate()) %></div>
						</div><!-- movieWrite_box_in -->
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">연령가</div>
							<div class="movieWrite_box_in_right"><%=vo.getAgeRate() %></div>
						</div><!-- movieWrite_box_in -->		
					</div><!-- movieWrite_box1 -->
				</div><!-- movieWrite_box -->
				<br>
				<div class="movieWrite_box"><!-- 입력폼 div -->
					<p>입력 정보</p>
						
					<div class="movieWrite_box1">
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">팝콘금액</div>
							<div class="movieWrite_box_in_right"><%=vo.getPoster() %>개</div>
						</div><!-- movieWrite_box_in -->
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">예고편URL</div>
							<div class="movieWrite_box_in_right">
								<div class="movie_player">
								<iframe src="<%=vo.getUrl() %>" frameborder="0"  allowfullscreen>
				  				 </iframe>
								</div>
							</div><!-- movieWrite_box_in_right -->
						</div><!-- movieWrite_box_in -->			
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">스틸이미지</div>
							<div class="movieWrite_box_in_right">
								<img src="../../images/movie/stillCut/<%=vo.getStilcut()%>">
							</div>
						</div><!-- movieWrite_box_in -->
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">포스터이미지</div>
							<div class="movieWrite_box_in_right">
								<img src="../../images/movie/poster/<%=vo.getPoster()%>">
							</div>
						</div><!-- movieWrite_box_in -->
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">장르</div>
							<div class="movieWrite_box_in_right">
								<div class="movieWrite_box_in_right1"><%=vo.getGenreName()%> %></div>
							</div>
						</div><!-- movieWrite_box_in -->															
					</div><!-- movieWrite_box1 -->
				</div><!-- movieWrite_box -->	
				<br>
				<div class="movieWrite_box"><!-- 입력폼 div -->
					<input type="button" class="movie_btn btn btn-primary" name="Actor" value="배우등록" id="addActor">
					<p class="clear">출연진 정보</p>
						
					<div class="movieWrite_box1" id="actorBox">
					
					</div><!-- movieWrite_box1 -->												
				</div><!-- movieWrite_box -->
				
				<br>
				<div class="movieWrite_box"><!-- 입력폼 div -->
					<input type="button" class="movie_btn btn btn-primary" name="Director" value="감독등록" id="addDirector">
					<p class="clear">감독 정보</p>
						
					<div class="movieWrite_box1" id="directorBox">														
					</div><!-- movieWrite_box1 -->
				</div><!-- movieWrite_box -->
				<br>
				<div class="btn_grop">
					<input type="submit" class="btn_grop_input" value="등록" id="saveMovie">
					<input type="button" class="btn_grop_input" value="삭제">
				</div>
			</form>		
		</div><!-- 전체div movieWrite_wrap-->
	</section> 
	</div><!-- admin_menu->aside, session 감싸는 div -->	
</div><!-- admin_menu->wrap -->


</body>
</html>