<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>

<!-- 
	영화 등록 기능 정리
	1. 영화 검색 버튼누르면 팝업 -> 영화 진흥원 api에서 정보 받아와서 항목 선택하면 등록 폼에 데이터 뿌려줌(영화 정보 항목들)
	2. 카테고리 추가 -> 추가 버튼 누르면 팝업으로 카테고리 리스트 보여주고, 등록, 수정, 삭제 가능(중복 카테고리 등록 불가)
	3. 배우 등록 ->버튼 클릭시 팝업으로 배우 리스트 보여주고/배우 검색/배우등록(중복 등록 불가)->이름, 이미지 넣어서/수정/삭제 가능
	 -> 등록할 배우 선택하면 팝업 닫히고 등록 페이지 배우 항목에 해당 배우 추가
	4. 감독 등록 ->버튼 클릭시 팝업으로 감독 리스트 보여주고/감독 검색/감독 등록(중복 등록 불가)->이름, 이미지 넣어서/수정/삭제 가능
	-> 등록할 감독 선택하면 팝업 닫히고 등록 페이지 감독 항목에 해당 감독 추가
	5. 등록 버튼 클릭시 -> 영화 정보 db에 저장되고 배우, 배우 항목들은 캐스팅 db에 저장됨


 -->
<script type="text/javascript">
$(function(){
	$('.movie_btn').click(function(){
		if($(this).attr('name')==='movie'){
			var popup = window.open('serchMovie.jsp', 'Movieserch', 'width=800px,height=650px,scrollbars=yes');
		}else{
		var type=$(this).attr('name');
		var popup = window.open('serch'+type+'.jsp', 'serch', 'width=800px,height=800px,scrollbars=yes');
		}
	});
	
	$('input[name=Director]').click(function(){
		var cnt = $(this).fint('.movieWrite_box_in').length();		
		alert(cnt);
	})
});

</script>
		<section id="movieWrite">
		<div class="movieWrite_wrap"><!-- 전체div -->
			<div class="movieWrite_box"> <!-- 상단 타이틀 div -->
				<h4>영화 등록</h4>
				<p><a href="movieList.jsp">영화관리</a>>영화등록</p>
			</div>
			<form name="movieWrite" method="post" action="movieWrite_ok.jsp">
				<div class="movieWrite_box"><!-- 입력폼 div -->
					<input type="button" class="movie_btn btn btn-primary" name="movie" value="영화 검색" >
					<p class="clear">영화 정보</p>
		
					<div class="movieWrite_box1">
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">영화제목</div>
							<div class="movieWrite_box_in_right">
								<input class="form-control info_txt" type="text"
								placeholder="제목을 입력하세요" name="title" id="movie_tit">
							</div>
						</div><!-- movieWrite_box_in -->
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">줄거리</div>
							<div class="movieWrite_box_in_right">
							<textarea class="form-control info_txt" id="synop" placeholder="줄거리를 입력하세요"></textarea>
							</div><!-- movieWrite_box_in_right -->
						</div><!-- movieWrite_box_in -->			
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">상영시간</div>
							<div class="movieWrite_box_in_right">
								<input class="form-control info_txt" type="text"
								placeholder="상영시간 입력하세요" name="title" id="runningTiem">		
							</div>
						</div><!-- movieWrite_box_in -->
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">개봉연도</div>
							<div class="movieWrite_box_in_right">
								<input class="form-control info_txt" type="text"
								placeholder="개봉 연도를 입력하세요" name="title" id="openDate">	
							</div>
						</div><!-- movieWrite_box_in -->
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">연령가</div>
							<div class="movieWrite_box_in_right" id="ageRate">
								<input class="form-control info_txt" type="text"
								placeholder="연령가를 입력하세요" name="title" id="ageRate">								
							</div>
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
								<div class="movieWrite_box_in_right1">
									<select class="form-select form-select-sm">
										<option selected>로맨스</option>
										<option value="1">액션</option>
										<option value="2">공포</option>
										<option value="3">SF</option>
										<option value="4">코미디</option>
										<option value="5">애니</option>
									</select>
								</div>
								<div class="movieWrite_box_in_right2">
									<input type="button" name="addCategory" value="카테고리 추가">
								</div>
							</div>
						</div><!-- movieWrite_box_in -->															
					</div><!-- movieWrite_box1 -->
				</div><!-- movieWrite_box -->	
				<br>
				<div class="movieWrite_box"><!-- 입력폼 div -->
					<input type="button" class="movie_btn btn btn-primary" name="Actor" value="배우등록" >
					<p class="clear">출연진 정보</p>
						
					<div class="movieWrite_box1" id="actorBox">
					
					</div><!-- movieWrite_box1 -->												
				</div><!-- movieWrite_box -->
				
				<br>
				<div class="movieWrite_box"><!-- 입력폼 div -->
					<input type="button" class="movie_btn btn btn-primary" name="Director" value="감독등록" >
					<p class="clear">감독 정보</p>
						
					<div class="movieWrite_box1" id="directorBox">														
					</div><!-- movieWrite_box1 -->
				</div><!-- movieWrite_box -->
				<br>
				<div class="btn_grop">
					<input type="submit" class="btn_grop_input" value="등록">
					<input type="button" class="btn_grop_input" value="삭제">
				</div>
			</form>		
		</div><!-- 전체div movieWrite_wrap-->
	</section> 
	</div><!-- admin_menu->aside, session 감싸는 div -->	
</div><!-- admin_menu->wrap -->


</body>
</html>