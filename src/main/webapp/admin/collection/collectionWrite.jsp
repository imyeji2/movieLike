<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.genre.model.GenreVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.genre.model.GenreService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>

<!-- 
	컬렉션 등록 기능 정리
	1. 


 -->
<script type="text/javascript">
$(function(){
	
	$('#addCollection').click(function(){
		var cnt = $('#collectionBox').find('.movieWrite_box_in').length;	
		if(cnt==10){
			alert('컬렉션은 최대 10개까지 등록할 수 없습니다.');
			return false;
		}else{
			var popup = window.open('addMovie.jsp', 'serch', 'width=800px,height=650px,scrollbars=yes');
		}
	});	
	
	$(document).on('click', '.movieWrite_box_in_right a', function() {
		  $(this).closest('.movieWrite_box_in').remove();
	});
	
	$('#saveCollection').click(function(){
		if($('#collection_tit').val().length<1){
			alert("제목을 입력하세요");
			$('#collection_tit').focus();
			return false;
		}
		
		if($('#content').val().length<1){
			alert("제목을 입력하세요");
			$('#content').focus();
			return false;
		}
		
		if($('#collectionBox').find('.movieWrite_box_in').length==0){
			alert("영화를 등록해주세요");
			$('#collectionBox').focus()
			return false;
		}
	});
});

</script>
		<section id="movieWrite">
		<div class="movieWrite_wrap"><!-- 전체div -->
			<div class="movieWrite_box"> <!-- 상단 타이틀 div -->
				<h4>컬렉션 등록</h4>
				<p><a href="collectionList.jsp">컬렉션 리스트</a>>컬렉션 등록</p>
			</div>
			<form name="collectionWrite" method="post" action="collectionWrite_ok.jsp">
				<div class="movieWrite_box"><!-- 입력폼 div -->
					<p class="clear">컬렉션 정보</p>
		
					<div class="movieWrite_box1">
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">컬렉션 제목</div>
							<div class="movieWrite_box_in_right">
								<input class="form-control info_txt" type="text"
								placeholder="제목을 입력하세요" name="title" id="collection_tit">
							</div>
						</div><!-- movieWrite_box_in -->
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">컬렉션 설명</div>
							<div class="movieWrite_box_in_right">
							<textarea class="form-control info_txt" id="content" name="content" placeholder="설명을 입력하세요"></textarea>
							</div><!-- movieWrite_box_in_right -->
						</div><!-- movieWrite_box_in -->				
					</div><!-- movieWrite_box1 -->
				</div><!-- movieWrite_box -->
				<br>

				<div class="movieWrite_box"><!-- 입력폼 div -->
					<input type="button" class="movie_btn btn btn-primary" name="collection" value="영화 등록" id="addCollection">
					<p class="clear">컬렉션 리스트</p>
					<div class="movieWrite_box1" id="collectionBox">
					</div><!-- movieWrite_box1 -->												
				</div><!-- movieWrite_box -->	
				<br>
				<div class="btn_grop">
					<input type="submit" class="btn_grop_input" value="등록" id="saveCollection">
					<input type="button" class="btn_grop_input" value="삭제">
				</div>				
			</form>		
		</div><!-- 전체div movieWrite_wrap-->
	</section> 
	</div><!-- admin_menu->aside, session 감싸는 div -->	
</div><!-- admin_menu->wrap -->


</body>
</html>