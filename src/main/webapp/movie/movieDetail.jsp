<%@page import="com.semi.casting.model.CastingListVO"%>
<%@page import="com.semi.casting.model.CastingListService"%>
<%@page import="com.semi.pick.PickVO"%>
<%@page import="com.semi.pick.PickService"%>
<%@page import="com.semi.review.model.ReviewVO"%>
<%@page import="com.semi.review.model.ReviewService"%>
<%@page import="com.semi.director.model.DirectorService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.casting.model.CastingVO"%>
<%@page import="com.semi.casting.model.CastingService"%>
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
	String movieNo = request.getParameter("no");
	
	if(movieNo == null || movieNo.isEmpty()){%>
		<script>
			alert('잘못된 URL입니다');
			history.go(-1);
		</script>
	<%}
	CastingService castingService = new CastingService();
	ActorService actorService = new ActorService();
	MovieService movieService = new MovieService();
	DirectorService directorService = new DirectorService();
	ReviewService reviewService = new ReviewService();
	PickService pickService = new PickService();
	
	MovieVO movieVo = null;
	List<CastingVO> CastingList= null;
	List<ReviewVO> reviewList = null;
	List<PickVO> pickList = null;
	try{
		movieVo = movieService.selectByMovieNo(Integer.parseInt(movieNo));
		CastingList = castingService.selectCastingByMovieNo(Integer.parseInt(movieNo));
		reviewList = reviewService.selectByMovieNo(Integer.parseInt(movieNo));
		pickList = pickService.selectPick(userid);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	String movieGenre = "";						//영화 장르 분류 !! 
	if(movieVo.getGenreNo() == 1){					//이렇게 한 이유 : 영화 테이블은 장르번호컬럼밖에 없어서
			movieGenre = "로맨스";
	}else if(movieVo.getGenreNo() == 2){
			movieGenre = "액션";
	}else if(movieVo.getGenreNo() == 3){
			movieGenre = "공포";
	}else if(movieVo.getGenreNo() == 4){
			movieGenre = "SF";
	}else if(movieVo.getGenreNo() == 5){
			movieGenre = "코미디";
	}else if(movieVo.getGenreNo() == 6){
			movieGenre = "애니";
	}
	StringBuilder actorSb = new StringBuilder();
	if(CastingList != null && !CastingList.isEmpty()){	//캐스팅리스트가 존재한다면
		for(CastingVO actors : CastingList){			//캐스팅리스트size만큼 반복
			actorSb.append(actorService.selectByActorNo(actors.getActorNo()).getActorName()).append(", ");
			// =>actorService의 번호로 배우 조회하는 메서드 => .getActorName 이용
			// 반복문만큼 actorSb에 배우이름 + ", " append
		}
		actorSb.deleteCharAt(actorSb.length()-2);	//마지막 배우가 입력된뒤 맨 뒤에있는 쉼표 제거
	}

	
	String content = movieVo.getSynop();				//시놉시스 줄 나눔
	if(content!=null){  // \r\n  => <br>
		content=content.replace("\r\n","<br>");
	}else{
		content="";
	}

	boolean isPick = false;
	if(pickList != null && !pickList.isEmpty()){
		for(int i = 0; i < pickList.size(); i++){
			if(pickList.get(i).getMovieNo() == Integer.parseInt(movieNo)){
				isPick = true;	//찜 목록에 있다는 뜻
			}
		}
	}
	
	
	
	
	
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY");
%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.movie_buy_btn').click(function(){
		var param = $('#buy_movie').val();
		window.open('buyMovie.jsp?' + param, '_blank', 'resizable=no,width=500,height=500');
	});
	function reloading(){
		location.reload();
	}
	
	$('#moreActor').hide();
	
	$('#more').click(function(){
		$('#moreActor').slideToggle('slow');
	});
});
</script>
   
	<section id="movieDetail">
		<article>
			<div class="movie_top">
				<img src="../images/movie/content/<%=movieVo.getStilcut()%>">
				<div class="movie_info_txt">
					<h1><%=movieVo.getTitle() %></h1>				<!-- 영화 제목 -->
					<p><span><%=movieVo.getAgeRate() %></span></p>	<!-- 연령 고지 -->
					<p><span><%=movieGenre %></span> | <span><%= sdf.format(movieVo.getOpendate())%></span> | <span><%=movieVo.getRunningTime() %></span><p>	
					<!-- 순서대로   영화 장르 / 개봉일 / 러닝타임 -->	
				</div>
			</div>
		</article>
				
		<article>
			<div class="movie_info">
				<div class="movie_info_left">
					<img src="../images/movie/content/<%=movieVo.getPoster()%>">
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
						<%=content.replace("\r\n", "<br>") %>
						<br>
						<P>감독 : <%=directorService.selectByDirectorNo(movieVo.getDirectorNo1()).getDirectorName() %></P>		<!-- 영화 감독 -->
						<%if(movieVo.getDirectorNo2() > 0){ %>
						<p>보조 감독 : <%=directorService.selectByDirectorNo(movieVo.getDirectorNo2()).getDirectorName() %></p>
						<%} %>
						<P>출연 : <%=actorSb %></P>						<!-- 출연 배우 !# 50번째줄에서 구함 #! -->
					</div>
					<div class="movi_info_btn"> 
						<div class="movie_buy_btn">
							<a href ="javascript:void(0)">
								<input type="hidden" value="no=<%=movieNo%>&userid=<%=userid%>" id="buy_movie">
								단건 구매 <%=movieVo.getPrice() %>팝콘
							</a>
						</div> <!-- 실제금액/100 = 1팝콘 -->
						<div class="movie_pick_btn">
							<a href = "javascript:void(0)">
							<% if (isPick) { %>
							    <a href = "movieJjim.jsp?userid=<%=userid%>&movieno=<%=movieNo%>&isJjim=2" onclick="reloading()"><img id="jjimStatus" src="../images/like_on.svg" ></a>
							<% } else { %>
							    <a href = "movieJjim.jsp?userid=<%=userid%>&movieno=<%=movieNo%>&isJjim=1" onclick="reloading()"><img id="jjimStatus" src="../images/like_off.svg"></a>
							<% } %>
							</a>
						</div>
					</div>
				</div><!-- movie_info_right -->
			</div><!-- movie_info -->
		</article>	
			
		<article>
			<div class="movie_actor">
				<h4>출연/제작</h4>
				<div class="castingBox">
			<%
			
			
				CastingListService service = new CastingListService();
				CastingListVO vo = new CastingListVO();
				List<CastingListVO> list =null;
				
				int startPage=0;
				int endPage =0;
				int line=0;
				
				try{
					list=service.selectCastingMovie(Integer.parseInt(movieNo));
					
				}catch(SQLException e){
					e.printStackTrace();
				}
				
				
				if(list==null||list.isEmpty()){
					
				}else{
					
					line = list.size()/5;
				
				
				
					for(int i=0; i<line+1;i++){
						startPage = i*5;
						endPage=startPage+5;
						if(endPage>list.size()){
							endPage=list.size();
						}
						
						if(line==1){
			%>	
					<div class="movie_box_size">
				
				<%
				
						for(int j=startPage; j<endPage; j++){
							
							vo=list.get(j);
				%>
			    	<div class="movie_actor_box">
			    		<div class="movie_actor_box1">
			    			<img src="../images/movie/actor/<%=vo.getActorImg() %>" alt="배우 이미지">
			    		</div>
			    		<div class="movie_actor_box2">
			    			<p class="actor_name">[배우]</p>
			    			<p class="actor_name"><%=actorSb %></p>
			    			<p class="actor_name"><%=vo.getActorName() %></p>
			    		</div>
			    	</div><!-- movie_actor_box -->
			  		  <%} %>	    				    	
					</div>

				<%}else{ %>
				
					<div id="moreActor">
				<%
				
					for(int j=startPage; j<endPage; j++){
						vo=list.get(j);

				%>
			    	<div class="movie_actor_box">
			    		<div class="movie_actor_box1">
			    			<img src="../images/movie/actor/<%=vo.getActorImg() %>" alt="배우 이미지">
			    		</div>
			    		<div class="movie_actor_box2">
			    			<p class="actor_name">[배우]</p>
			    			<p class="actor_name"><%=vo.getActorName() %></p>
			    		</div>
			    	</div><!-- movie_actor_box -->
			    <%} %>						
				    </div>
		<%} 
		}
				}
		%>
				
				<div class="moreActorBtn" id="more">더보기</div>
			</div><!-- castingBox -->	
		</div><!-- movie_actor -->
		</article>	
		

		<article>
			<div class="movie_video">
				<div class="movie_tit">예고편</div>
			
				<div class="movie_player">
					<iframe src="<%=movieVo.getUrl() %>" frameborder="0"  allowfullscreen>
				   </iframe>
				</div>
			</div>
		</article>
		
		<article class="movie_review">
			<div class="">
				<div class="movie_tit1" >코멘트+(갯수)</div>
				<div class="movie_tit2"><a href="#">더보기</a></div>
			</div>
				<br>
				<div class="clear">
				<%if(reviewList != null && !reviewList.isEmpty()){%>
				<div class="movie_review_conbox"></div>
				<%}else{ 
				
					line = reviewList.size()/4;
					startPage =0;
					endPage =0;
					for(int i=0;i<line+1;i++){
						startPage=i*5;
						endPage=startPage+5;
						if(endPage>reviewList.size()){
							endPage=reviewList.size();
						}
				%>
					<div class="movie_review_box">
					<%for(int j=startPage; j<endPage;j++){ %>
						<div class="movie_review_conbox">
							<div class="movie_review_conbox1" >
								<span>이름</span><span>(별점:)</span>
							</div>
							<div class="movie_review_conbox2">
							내용.replace("\r\n","<br>")
							</div>
							
							<div class="movie_review_conbox3">
								<span><a href="">좋아요</a></span><span>좋아요갯수</span>
							</div>
						</div>
					<%} %>
					</div>
				<%} %>
				</div>
				<%} %>
			<br><br>
		</article>
			
	</section>
<%@ include file="../inc/bottom.jsp" %>