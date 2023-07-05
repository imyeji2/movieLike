<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>
<script type="text/javascript">


	</script>
		<section id="movieWrite">
		<div class="movieWrite_wrap"><!-- 전체div -->
			<div class="movieWrite_box"> <!-- 상단 타이틀 div -->
				<h4>영화 등록</h4>
				<p><a href="movieList.jsp">영화관리</a>><a href="movieWrite.jsp">영화등록</a></p>
			</div>
			
			<div class="movieWrite_box"><!-- 입력폼 div -->
			
				<input type="button" class="movie_btn" name="movie_serch_btn" value="영화 검색" >
				<p class="clear">영화 정보</p>
	
				<div class="movieWrite_box1">
					<div class="movieWrite_box_in">
						<div class="movieWrite_box_in_left">영화제목</div>
						<div class="movieWrite_box_in_right">그해, 우리는</div>
					</div><!-- movieWrite_box_in -->
					<div class="movieWrite_box_in">
						<div class="movieWrite_box_in_left">줄거리</div>
						<div class="movieWrite_box_in_right">
							asldkalksjdlkasjdakjsdladjlkasjdaksdj<br>
							asldkalksjdlkasjdakjsdladjlkasjdaksdj<br>
							asldkalksjdlkasjdakjsdladjlkasjdaksdj<br>
							asldkalksjdlkasjdakjsdladjlkasjdaksdj<br>
						</div><!-- movieWrite_box_in_right -->
					</div><!-- movieWrite_box_in -->			
					<div class="movieWrite_box_in">
						<div class="movieWrite_box_in_left">상영시간</div>
						<div class="movieWrite_box_in_right">160분</div>
					</div><!-- movieWrite_box_in -->
					<div class="movieWrite_box_in">
						<div class="movieWrite_box_in_left">개봉일</div>
						<div class="movieWrite_box_in_right">2023년</div>
					</div><!-- movieWrite_box_in -->
					<div class="movieWrite_box_in">
						<div class="movieWrite_box_in_left">연령가</div>
						<div class="movieWrite_box_in_right">15세 이용가</div>
					</div><!-- movieWrite_box_in -->		
				</div><!-- movieWrite_box1 -->
			</div><!-- movieWrite_box -->
			<br>
			<div class="movieWrite_box"><!-- 입력폼 div -->
				<p>입력 정보</p>
					
				<div class="movieWrite_box1">
					<div class="movieWrite_box_in">
						<div class="movieWrite_box_in_left">팝콘금액</div>
						<div class="movieWrite_box_in_right">
							<input class="form-control info_txt" type="text" placeholder="팝콘가를 입력하세요" name="price">
						</div>
					</div><!-- movieWrite_box_in -->
					<div class="movieWrite_box_in">
						<div class="movieWrite_box_in_left">예고편URL</div>
						<div class="movieWrite_box_in_right">
							<input class="form-control info_txt info_txt"  type="text" placeholder="URL을 입력하세요" name="url">
						</div><!-- movieWrite_box_in_right -->
					</div><!-- movieWrite_box_in -->			
					<div class="movieWrite_box_in">
						<div class="movieWrite_box_in_left">스틸이미지</div>
						<div class="movieWrite_box_in_right">
							<input class="form-control" type="file" id="formFile">
						</div>
					</div><!-- movieWrite_box_in -->
					<div class="movieWrite_box_in">
						<div class="movieWrite_box_in_left">포스터이미지</div>
						<div class="movieWrite_box_in_right">
							<input class="form-control" type="file" id="formFile">
						</div>
					</div><!-- movieWrite_box_in -->
					<div class="movieWrite_box_in">
						<div class="movieWrite_box_in_left">장르</div>
						<div class="movieWrite_box_in_right">
						<select class="form-select form-select-sm">
							<option selected>Open this select menu</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
						</select>
						</div>
					</div><!-- movieWrite_box_in -->															
				</div><!-- movieWrite_box1 -->
			</div><!-- movieWrite_box -->	
			<br>
			<div class="movieWrite_box"><!-- 입력폼 div -->
				<input type="button" class="movie_btn" id="actor_serch" value="배우 추가" >
				<p class="clear">출연진 정보</p>
					
				<div class="movieWrite_box1">
					<div class="movieWrite_box_in">
						<div class="movieWrite_box_in_left">이름</div>
						<div class="movieWrite_box_in_right">100</div>
					</div><!-- movieWrite_box_in -->															
				</div><!-- movieWrite_box1 -->
			</div><!-- movieWrite_box -->
			<br>
			<div class="movieWrite_box"><!-- 입력폼 div -->
				<input type="button" class="movie_btn" name="director_serch" value="감독추가" >
				<p class="clear">감독 정보</p>
					
				<div class="movieWrite_box1">
					<div class="movieWrite_box_in">
						<div class="movieWrite_box_in_left">이름</div>
						<div class="movieWrite_box_in_right">100</div>
					</div><!-- movieWrite_box_in -->															
				</div><!-- movieWrite_box1 -->
			</div><!-- movieWrite_box -->
			<br>
			<div class="btn_grop">
				<input type="submit" class="btn_grop_input" value="등록">
				<input type="button" class="btn_grop_input" value="삭제">
			</div>
							
		</div><!-- 전체div movieWrite_wrap-->
		</section> 
	</div><!-- admin_menu->aside, session 감싸는 div -->	
</div><!-- admin_menu->wrap -->


</body>
</html>