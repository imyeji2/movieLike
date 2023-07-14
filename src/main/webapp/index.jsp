<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp" %>    
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
	})
	
</script>
	<section id="main">
		<article class="main_box">
			<p class="main_title">박스오피스 top10</p>
			<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
			  <div class="carousel-inner">
			    <div class="carousel-item active" data-bs-interval="3000">
		    		<div class="main_box1 f_left">
		    			<input type="hidden" name="movieNo" value="1">
		    			<div class="main_poster img-thumbnail">
		    				<img src="images/movie/엘리멘탈.jpg">
		    			</div><!-- main_poster -->
		    			<div class="main_movie_info">
		    				<p class="movie_info1">엘리멘탈</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>미국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 3.9</p>
		    				<p class="movie_info2">
		    					<span>예매율 31%</span>
		    					<span>누적관객 169만명</span>
		    				</p>
		    			</div><!-- main_movie_info -->
		    		</div><!-- main_box1_margin -->
		    		<div class="main_box1 f_left">
		    			<input type="hidden" name="movieNo" value="2">
		    			<div div class="main_poster img-thumbnail">
		    				<img src="images/movie/Indiana_Jones_and_the_Dial_of_Destiny.jpg">
		    			</div>
		    			<div class="main_movie_info">
		    				<p class="movie_info1">인디아나 존스 : 운명의 다이얼</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>미국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 3.3</p>
		    				<p class="movie_info2">
		    					<span>예매율 19%</span>
		    					<span>누적관객 24만명</span>
		    				</p>
		    			</div><!-- main_movie_info -->		    			
		    		</div>
		    		<div class="main_box1 f_left">
		    			<input type="hidden" name="movieNo" value="3">
		    			<div class="main_poster img-thumbnail">
		    				<img src="images/movie/The_Roundup.jpg">
		    			</div>
		    			<div class="main_movie_info">
		    				<p class="movie_info1">범죄도시3</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>한국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 3.1</p>
		    				<p class="movie_info2">
		    					<span>예매율 9.1%</span>
		    					<span>누적관객 997만명</span>
		    				</p>
		    			</div><!-- main_movie_info -->		    			
		    		</div>
		    		<div class="main_box1 f_left">
		    			<div class="main_poster img-thumbnail">
		    				<img src="images/movie/SpiderMan_Across_the_Spider_Verse.jpg">
		    			</div>
		    			<div class="main_movie_info">
		    				<p class="movie_info1">스파이더맨:어크로스 더 유니버스</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>미국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 4.3</p>
		    				<p class="movie_info2">
		    					<span>예매율 8.7%</span>
		    					<span>누적관객 50만명</span>
		    				</p>
		    			</div><!-- main_movie_info -->		    			
		    		</div>	
		    		<div class="main_box1 f_left">
		    			<div class="main_poster img-thumbnail">
		    				<img src="images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
		    			</div>
		    			<div class="main_movie_info">
		    				<p class="movie_info1">미션임파서블 : 데드 레코...</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>미국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 3.9</p>
		    				<p class="movie_info2">
		    					<span>예매율 7.6%</span>
		    					<span>누적관객 169만명</span>
		    				</p>
		    			</div><!-- main_movie_info -->		    			
		    		</div>			    				    					    					    	
			    </div><!-- carousel-item -->
			    <div class="carousel-item" data-bs-interval="3000">
		    		<div class="main_box1 f_left">
		    			<div class="main_poster img-thumbnail">
		    				<img src="images/movie/엘리멘탈.jpg">
		    			</div><!-- main_poster -->
		    			<div class="main_movie_info">
		    				<p class="movie_info1">엘리멘탈</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>미국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 3.9</p>
		    				<p class="movie_info2">
		    					<span>예매율 31%</span>
		    					<span>누적관객 169만명</span>
		    				</p>
		    			</div><!-- main_movie_info -->
		    		</div><!-- main_box1_margin -->
		    		<div class="main_box1 f_left">
		    			<div div class="main_poster img-thumbnail">
		    				<img src="images/movie/Indiana_Jones_and_the_Dial_of_Destiny.jpg">
		    			</div>
		    			<div class="main_movie_info">
		    				<p class="movie_info1">인디아나 존스 : 운명의 다이얼</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>미국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 3.3</p>
		    				<p class="movie_info2">
		    					<span>예매율 19%</span>
		    					<span>누적관객 24만명</span>
		    				</p>
		    			</div><!-- main_movie_info -->		    			
		    		</div>
		    		<div class="main_box1 f_left">
		    			<div class="main_poster img-thumbnail">
		    				<img src="images/movie/The_Roundup.jpg">
		    			</div>
		    			<div class="main_movie_info">
		    				<p class="movie_info1">범죄도시3</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>한국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 3.1</p>
		    				<p class="movie_info2">
		    					<span>예매율 9.1%</span>
		    					<span>누적관객 997만명</span>
		    				</p>
		    			</div><!-- main_movie_info -->		    			
		    		</div>
		    		<div class="main_box1 f_left">
		    			<div class="main_poster img-thumbnail">
		    				<img src="images/movie/SpiderMan_Across_the_Spider_Verse.jpg">
		    			</div>
		    			<div class="main_movie_info">
		    				<p class="movie_info1">스파이더맨:어크로스 더 유니버스</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>미국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 4.3</p>
		    				<p class="movie_info2">
		    					<span>예매율 8.7%</span>
		    					<span>누적관객 50만명</span>
		    				</p>
		    			</div><!-- main_movie_info -->		    			
		    		</div>	
		    		<div class="main_box1 f_left">
		    			<div class="main_poster img-thumbnail">
		    				<img src="images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
		    			</div>
		    			<div class="main_movie_info">
		    				<p class="movie_info1">미션임파서블 : 데드 레코..</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>미국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 3.9</p>
		    				<p class="movie_info2">
		    					<span>예매율 7.6%</span>
		    					<span>누적관객 169만명</span>
		    				</p>
		    			</div><!-- main_movie_info -->		    			
		    		</div>	
			    </div>
			  </div>
			  <button class="carousel-control-prev main_prev_btn" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
			   <img src="images/arrow-left-circle-fill.svg" aria-hidden="true">
			    <!-- <span class="carousel-control-prev-icon" aria-hidden="true"></span> -->
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next main_next_btn" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
			    <img src="images/arrow-right-circle-fill.svg" aria-hidden="true">
			    <!-- <span class="carousel-control-next-icon" aria-hidden="true"></span> -->
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		</article>









< 		<article class="main_box">
			<p class="main_title">여름밤 맥주와 함께하는 로맨스🍻</p>
			<div id="carouselExampleInterval2" class="carousel slide" data-bs-ride="false">
			  <div class="carousel-inner">
			    <div class="carousel-item active" data-bs-interval="3000">
			    
		    		<div class="main_box1 f_left">
		    			<input type="hidden" name="movieNo" value="1">
		    			<div class="main_poster img-thumbnail">
		    				<img src="images/movie/엘리멘탈.jpg">
		    			</div>main_poster
		    			<div class="main_movie_info">
		    				<p class="movie_info1">엘리멘탈</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>미국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 3.9</p>
		    			</div>main_movie_info
		    		</div>main_box1_margin
		    		<div class="main_box1 f_left">
		    			<input type="hidden" name="movieNo" value="2">
		    			<div div class="main_poster img-thumbnail">
		    				<img src="images/movie/Indiana_Jones_and_the_Dial_of_Destiny.jpg">
		    			</div>
		    			<div class="main_movie_info">
		    				<p class="movie_info1">인디아나 존스 : 운명의 다이얼</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>미국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 3.3</p>

		    			</div>main_movie_info		    			
		    		</div>
		    		<div class="main_box1 f_left">
		    			<input type="hidden" name="movieNo" value="3">
		    			<div class="main_poster img-thumbnail">
		    				<img src="images/movie/The_Roundup.jpg">
		    			</div>
		    			<div class="main_movie_info">
		    				<p class="movie_info1">범죄도시3</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>한국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 3.1</p>

		    			</div>main_movie_info		    			
		    		</div>
		    		<div class="main_box1 f_left">
		    			<div class="main_poster img-thumbnail">
		    				<img src="images/movie/SpiderMan_Across_the_Spider_Verse.jpg">
		    			</div>
		    			<div class="main_movie_info">
		    				<p class="movie_info1">스파이더맨:어크로스 더 유니버스</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>미국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 4.3</p>

		    			</div>main_movie_info		    			
		    		</div>	
		    		<div class="main_box1 f_left">
		    			<div class="main_poster img-thumbnail">
		    				<img src="images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
		    			</div>
		    			<div class="main_movie_info">
		    				<p class="movie_info1">미션임파서블 : 데드 레코...</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>미국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 3.9</p>

		    			</div>main_movie_info		    			
		    		</div>			    				    					    					    	
			    </div>carousel-item
			    <div class="carousel-item" data-bs-interval="3000">
		    		<div class="main_box1 f_left">
		    			<div class="main_poster img-thumbnail">
		    				<img src="images/movie/엘리멘탈.jpg">
		    			</div>main_poster
		    			<div class="main_movie_info">
		    				<p class="movie_info1">엘리멘탈</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>미국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 3.9</p>

		    			</div>main_movie_info
		    		</div>main_box1_margin
		    		<div class="main_box1 f_left">
		    			<div div class="main_poster img-thumbnail">
		    				<img src="images/movie/Indiana_Jones_and_the_Dial_of_Destiny.jpg">
		    			</div>
		    			<div class="main_movie_info">
		    				<p class="movie_info1">인디아나 존스 : 운명의 다이얼</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>미국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 3.3</p>

		    			</div>main_movie_info		    			
		    		</div>
		    		<div class="main_box1 f_left">
		    			<div class="main_poster img-thumbnail">
		    				<img src="images/movie/The_Roundup.jpg">
		    			</div>
		    			<div class="main_movie_info">
		    				<p class="movie_info1">범죄도시3</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>한국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 3.1</p>

		    			</div>main_movie_info		    			
		    		</div>
		    		<div class="main_box1 f_left">
		    			<div class="main_poster img-thumbnail">
		    				<img src="images/movie/SpiderMan_Across_the_Spider_Verse.jpg">
		    			</div>
		    			<div class="main_movie_info">
		    				<p class="movie_info1">스파이더맨:어크로스 더 유니버스</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>미국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 4.3</p>

		    			</div>main_movie_info		    			
		    		</div>	
		    		<div class="main_box1 f_left">
		    			<div class="main_poster img-thumbnail">
		    				<img src="images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
		    			</div>
		    			<div class="main_movie_info">
		    				<p class="movie_info1">미션임파서블 : 데드 레코..</p>
		    				<p class="movie_info2">
			    				<span>2023</span>
			    				<span>&middot;</span>
			    				<span>미국</span>
		    				</p>
		    				<p class="movie_info2">평균 ★ 3.9</p>

		    			</div>main_movie_info		    			
		    		</div>	
			    </div>
			  </div>
			  <button class="carousel-control-prev main_prev_btn" type="button" data-bs-target="#carouselExampleInterval2" data-bs-slide="prev">
			   <img src="images/arrow-left-circle-fill.svg" aria-hidden="true">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next main_next_btn" type="button" data-bs-target="#carouselExampleInterval2" data-bs-slide="next">
			    <img src="images/arrow-right-circle-fill.svg" aria-hidden="true">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		</article>	 	
	</section>
	<br><br><br><Br><br>
<%@ include file="inc/bottom.jsp" %>	