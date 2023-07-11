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
	<section id="movieList"><!-- 전체 페이지 제어 width:100%-->
	<br><br><br>
		<article class="moviListBox"><!-- 리스트 중 1줄 width:80%-->
			<div class="movieItemBox"><!-- 리스트 중 1개  -->
				<div><!-- 기본box -->
					<div class="movieImg img-thumbnail">
						<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
						<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
							<p class="movieItemBox_hover_tit">스파이더맨 : 어크로스 더 유니버스</p>
							<p class="movieItemBox_hover_genre">액션</p>
							<p class="movieItemBox_hover_txt">스파이더맨 VS 스파이더맨?! 여러 성장통을 겪으며 새로운 스파이더맨이 된 ‘마일스 모랄레스’. 그 앞에 다른 평행세계의 스파이더우먼 ‘그웬’이 다시 나타난다. 모든 차원의 멀티버스 속 스파이더맨들을 만나게 되지만, 질서에 대한 신념이 부딪히며 예상치 못한 균열이 생기는데… 상상 그 이상을 넘어서는 멀티버스의 세계가 열린다!</p>
						</div><!-- hover box -->	
					</div>
				</div>
				<p class="movieItemBox_info1 text-truncate">스파이더맨 : 어크로스 더 유니버스</p>
			</div><!-- 기본box -->
			<div class="movieItemBox"><!-- 리스트 중 1개  -->
				<div><!-- 기본box -->
					<div class="movieImg img-thumbnail">
						<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
						<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
						</div><!-- hover box -->	
					</div>
				</div>
				<p class="movieItemBox_info1 text-truncate">스파이더맨 : 어크로스 더 유니버스</p>
			</div><!-- 기본box -->
			<div class="movieItemBox"><!-- 리스트 중 1개  -->
				<div><!-- 기본box -->
					<div class="movieImg img-thumbnail">
						<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
						<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
						</div><!-- hover box -->	
					</div>
				</div>
				<p class="movieItemBox_info1 text-truncate">스파이더맨 : 어크로스 더 유니버스</p>
			</div><!-- 기본box -->				
			<div class="movieItemBox"><!-- 리스트 중 1개  -->
				<div><!-- 기본box -->
					<div class="movieImg img-thumbnail">
						<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
						<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
						</div><!-- hover box -->	
					</div>
				</div>
				<p class="movieItemBox_info1 text-truncate">스파이더맨 : 어크로스 더 유니버스</p>
			</div><!-- 기본box -->				
			<div class="movieItemBox"><!-- 리스트 중 1개  -->
				<div><!-- 기본box -->
					<div class="movieImg img-thumbnail">
						<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
						<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
						asd
						</div><!-- hover box -->	
					</div>
				</div>
				<p class="movieItemBox_info1 text-truncate">스파이더맨 : 어크로스 더 유니버스</p>
			</div><!-- 기본box -->
			<div class="movieItemBox"><!-- 리스트 중 1개  -->
				<div><!-- 기본box -->
					<div class="movieImg img-thumbnail">
						<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
						<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
						</div><!-- hover box -->	
					</div>
				</div>
				<p class="movieItemBox_info1 text-truncate">스파이더맨 : 어크로스 더 유니버스</p>
			</div><!-- 기본box -->
		</article><!-- 리스트 중 1줄 -->
		<article class="moviListBox"><!-- 리스트 중 1줄 width:80%-->
			<div class="movieItemBox"><!-- 리스트 중 1개  -->
				<div><!-- 기본box -->
					<div class="movieImg img-thumbnail">
						<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
						<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
						</div><!-- hover box -->	
					</div>
				</div>
				<p class="movieItemBox_info1 text-truncate">스파이더맨 : 어크로스 더 유니버스</p>
			</div><!-- 기본box -->
			<div class="movieItemBox"><!-- 리스트 중 1개  -->
				<div><!-- 기본box -->
					<div class="movieImg img-thumbnail">
						<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
						<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
						</div><!-- hover box -->	
					</div>
				</div>
				<p class="movieItemBox_info1 text-truncate">스파이더맨 : 어크로스 더 유니버스</p>
			</div><!-- 기본box -->
			<div class="movieItemBox"><!-- 리스트 중 1개  -->
				<div><!-- 기본box -->
					<div class="movieImg img-thumbnail">
						<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
						<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
						</div><!-- hover box -->	
					</div>
				</div>
				<p class="movieItemBox_info1 text-truncate">스파이더맨 : 어크로스 더 유니버스</p>
			</div><!-- 기본box -->				
			<div class="movieItemBox"><!-- 리스트 중 1개  -->
				<div><!-- 기본box -->
					<div class="movieImg img-thumbnail">
						<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
						<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
						</div><!-- hover box -->	
					</div>
				</div>
				<p class="movieItemBox_info1 text-truncate">스파이더맨 : 어크로스 더 유니버스</p>
			</div><!-- 기본box -->				
			<div class="movieItemBox"><!-- 리스트 중 1개  -->
				<div><!-- 기본box -->
					<div class="movieImg img-thumbnail">
						<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
						<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
						</div><!-- hover box -->	
					</div>
				</div>
				<p class="movieItemBox_info1 text-truncate">스파이더맨 : 어크로스 더 유니버스</p>
			</div><!-- 기본box -->
			<div class="movieItemBox"><!-- 리스트 중 1개  -->
				<div><!-- 기본box -->
					<div class="movieImg img-thumbnail">
						<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
						<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
						</div><!-- hover box -->	
					</div>
				</div>
				<p class="movieItemBox_info1 text-truncate">스파이더맨 : 어크로스 더 유니버스</p>
			</div><!-- 기본box -->
		</article><!-- 리스트 중 1줄 -->
		<article class="moviListBox"><!-- 리스트 중 1줄 width:80%-->
			<div class="movieItemBox"><!-- 리스트 중 1개  -->
				<div><!-- 기본box -->
					<div class="movieImg img-thumbnail">
						<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
						<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
						</div><!-- hover box -->	
					</div>
				</div>
				<p class="movieItemBox_info1 text-truncate">스파이더맨 : 어크로스 더 유니버스</p>
			</div><!-- 기본box -->
			<div class="movieItemBox"><!-- 리스트 중 1개  -->
				<div><!-- 기본box -->
					<div class="movieImg img-thumbnail">
						<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
						<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
						</div><!-- hover box -->	
					</div>
				</div>
				<p class="movieItemBox_info1 text-truncate">스파이더맨 : 어크로스 더 유니버스</p>
			</div><!-- 기본box -->
			<div class="movieItemBox"><!-- 리스트 중 1개  -->
				<div><!-- 기본box -->
					<div class="movieImg img-thumbnail">
						<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
						<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
						</div><!-- hover box -->	
					</div>
				</div>
				<p class="movieItemBox_info1 text-truncate">스파이더맨 : 어크로스 더 유니버스</p>
			</div><!-- 기본box -->				
			<div class="movieItemBox"><!-- 리스트 중 1개  -->
				<div><!-- 기본box -->
					<div class="movieImg img-thumbnail">
						<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
						<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
						</div><!-- hover box -->	
					</div>
				</div>
				<p class="movieItemBox_info1 text-truncate">스파이더맨 : 어크로스 더 유니버스</p>
			</div><!-- 기본box -->				
			<div class="movieItemBox"><!-- 리스트 중 1개  -->
				<div><!-- 기본box -->
					<div class="movieImg img-thumbnail">
						<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
						<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
						</div><!-- hover box -->	
					</div>
				</div>
				<p class="movieItemBox_info1 text-truncate">스파이더맨 : 어크로스 더 유니버스</p>
			</div><!-- 기본box -->
			<div class="movieItemBox"><!-- 리스트 중 1개  -->
				<div><!-- 기본box -->
					<div class="movieImg img-thumbnail">
						<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
						<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
						</div><!-- hover box -->	
					</div>
				</div>
				<p class="movieItemBox_info1 text-truncate">스파이더맨 : 어크로스 더 유니버스</p>
			</div><!-- 기본box -->
		</article><!-- 리스트 중 1줄 -->				
	</section><!-- 전체 페이지 제어 -->
			<br><br><br><Br><br>
<%@ include file="../inc/bottom.jsp" %>	

		
	<!-- 		    <div style="width:100%;">
		    		<div class="main_box1 f_left">
		    			<input type="hidden" name="movieNo" value="1">
		    			<div class="main_poster img-thumbnail">
		    				<img src="../images/movie/엘리멘탈.jpg">
		    			</div>main_poster
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
		    			</div>main_movie_info
		    		</div>main_box1_margin
		    		<div class="main_box1 f_left">
		    			<input type="hidden" name="movieNo" value="2">
		    			<div div class="main_poster img-thumbnail">
		    				<img src="../images/movie/Indiana_Jones_and_the_Dial_of_Destiny.jpg">
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
		    			</div>main_movie_info		    			
		    		</div>
		    		<div class="main_box1 f_left">
		    			<input type="hidden" name="movieNo" value="3">
		    			<div class="main_poster img-thumbnail">
		    				<img src="../images/movie/The_Roundup.jpg">
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
		    			</div>main_movie_info		    			
		    		</div>
		    		<div class="main_box1 f_left">
		    			<div class="main_poster img-thumbnail">
		    				<img src="../images/movie/SpiderMan_Across_the_Spider_Verse.jpg">
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
		    			</div>main_movie_info		    			
		    		</div>	
		    		<div class="main_box1 f_left">
		    			<div class="main_poster img-thumbnail">
		    				<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
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
		    			</div>main_movie_info		    			
		    		</div>		
		    		<div class="main_box1 f_left">
		    			<div class="main_poster img-thumbnail">
		    				<img src="../images/movie/Mission_Impossible_Dead_Reckoning_PartOne.jpg">
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
		    			</div>main_movie_info		    			
		    		</div>			    			    				    					    					    	
			    </div>carousel-item -->
