<%@page import="com.semi.actor.model.ActorService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.semi.movie.model.MovieVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.movie.model.MovieService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %> 

<%
	String userid = (String)session.getAttribute("userId");
	String movieNo = request.getParameter("movieno");
	
	if(movieNo == null || movieNo.isEmpty()){%>
		<script>
			alert('잘못된 URL입니다');
			history.go(-1);
		</script>
	<%}
	ActorService actorService = new ActorService();
	MovieService movieService = new MovieService();
	MovieVO vo = null;
	try{
		vo = movieService.selectByMovieNo(Integer.parseInt(movieNo));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	String movieGenre = "";						//영화 장르 분류 !! 
	if(vo.getGenreNo() == 1){					//이렇게 한 이유 : 영화 테이블은 장르번호컬럼밖에 없어서
			movieGenre = "로맨스";
	}else if(vo.getGenreNo() == 2){
			movieGenre = "액션";
	}else if(vo.getGenreNo() == 3){
			movieGenre = "공포";
	}else if(vo.getGenreNo() == 4){
			movieGenre = "SF";
	}else if(vo.getGenreNo() == 5){
			movieGenre = "코미디";
	}else if(vo.getGenreNo() == 6){
			movieGenre = "애니";
	}
	
	
	String actor1 = actorService.selectByActorNo(vo.get);
	String actor2 = "";
	
	
	
	
	
	
	
	
	String content = vo.getSynop();				//시놉시스 줄 나눔
	if(content!=null){  // \r\n  => <br>
		content=content.replace("\r\n","<br>");
	}else{
		content="";
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY");
%>
   
	<section id="movieDetail">
		<article>
			<div class="movie_top">
				<img src="../images/movie/stillCut/그시절, 우리가 좋아했던 소녀, 스틸컷.jpg">
				<div class="movie_info_txt">
					<h1><%=vo.getTitle() %></h1>				<!-- 영화 제목 -->
					<p><span><%=vo.getAgeRate() %></span></p>	<!-- 연령 고지 -->
					<p><span><%=movieGenre %></span> | <span><%= sdf.format(vo.getOpendate())%></span> | <span><%=vo.getRunningTime() %></span><p>	
					<!-- 순서대로   영화 장르 / 개봉일 / 러닝타임 -->	
				</div>
			</div>
		</article>
				
		<article>
			<div class="movie_info">
				<div class="movie_info_left">
					<img src="../images/movie/poster/그시절, 우리가 좋아했던 소녀_포스터.jpg">
				</div>
				<div class="movie_info_right">
					<div class="movie_info_grade">
						<div>
							<div>
								<span>평점 ★ 7.3</span>
							</div>
						</div>
					</div>
					<div class="movie_info_detail">
						<p>상세 설명</p>
						<%=content %>
						<br>
						<P>감독 : <%=vo.getDirectorNo1() %></P>		<!-- 영화 감독 -->
						<%if(vo.getDirectorNo2() > 0){ %>
						<p>보조 감독 : <%=vo.getDirectorNo2() %></p>
						<%} %>
						<P>출연 : 가진동, 천옌시</P>
					</div>
					<div class="movi_info_btn"> 
						<div class="movie_buy_btn">단건 구매 800팝콘</div>
						<div class="movie_pick_btn">
							<img src="../images/like_off.svg">
						</div>
					</div>
				</div><!-- movie_info_right -->
			</div><!-- movie_info -->
		</article>	
<!-- 			
		<article>
			
			<div class="movie_actor">
			<h4>출연/제작</h4>
			<div class="movie_box_size">
					<div id="carouselExampleControls" class="carousel slide" data-bs-ride="false">
					  <div class="carousel-inner">
					    <div class="carousel-item active box_control">
					    	<div class="movie_actor_box">
					    		<div class="movie_actor_box1">
					    			<img src="../images/movie/actor/가진동.jpg" alt="배우 이미지">
					    		</div>
					    		<div class="movie_actor_box2">
					    			<div class="actor_name">가진동</div>
					    			<div class="actor_role">주연</div>
					    		</div>
					    	</div>
					    	<div class="movie_actor_box"></div>
					    	<div class="movie_actor_box"></div>
					    	<div class="movie_actor_box"></div>
					    	<div class="movie_actor_box"></div>
					      <img src="..." class="d-block w-100" alt="...">
					    </div>
					    	<div class="movie_actor_box">
					    		<div class="movie_actor_box1">
					    			<img src="../images/movie/actor/가진동.jpg" alt="배우 이미지">
					    		</div>
					    		<div class="movie_actor_box2">
					    			<div class="actor_name">가진동</div>
					    			<div class="actor_role">주연</div>
					    		</div>
					    	</div>
					    	<div class="movie_actor_box"></div>
					    	<div class="movie_actor_box"></div>
					    	<div class="movie_actor_box"></div>
					    	<div class="movie_actor_box"></div>
					      <img src="..." class="d-block w-100" alt="...">
					    </div>					    
					    <div class="carousel-item">
					      <img src="..." class="d-block w-100" alt="...">
					    </div>
					    <div class="carousel-item">
					      <img src="..." class="d-block w-100" alt="...">
					    </div>
					  </div>
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					  </button>
					</div>
				</div>
			
			</div> 
		</article>	-->
		

		<article>
			
			<div class="movie_video">
				<div class="movie_tit">예고편</div>
			
				<div class="movie_player">
					<iframe src="https://www.youtube.com/embed/t7ZG1hbTudQ" frameborder="0"  allowfullscreen>
				   </iframe>
				</div>
			</div>
		</article>
		
		<article class="movie_review">
			<div class="movie_tit">코멘트</div>
			<div class="movie_review_box">
				<div class="movie_review_conbox"></div>
				<div class="movie_review_conbox"></div>
				<div class="movie_review_conbox"></div>
				<div class="movie_review_conbox"></div>
			</div>
		</article>
			
	</section>
<%@ include file="../inc/bottom.jsp" %>