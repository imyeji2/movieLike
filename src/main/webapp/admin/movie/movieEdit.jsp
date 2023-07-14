<%@page import="com.semi.casting.model.CastingListService"%>
<%@page import="com.semi.casting.model.CastingListVO"%>
<%@page import="com.semi.actor.model.ActorService"%>
<%@page import="com.semi.actor.model.ActorVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.semi.movie.model.MovieListService"%>
<%@page import="com.semi.movie.model.MovieService"%>
<%@page import="com.semi.movie.model.MovieListVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.genre.model.GenreVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.genre.model.GenreService"%>
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
 
<%	String no = request.getParameter("no"); %>
<script type="text/javascript">
$(function(){
	
	$(document).on('click', '.movieWrite_box_in_right a', function() {
		  var actorNo = $(this).closest('.movieWrite_box_in').find('input[name="actorNo"]').val();
		  var directorNo = $(this).closest('.movieWrite_box_in').find('input[name="directorNo"]').val();

		  if(actorNo.lenth>1){
			  if (confirm('정말 삭제하시겠습니까?')) {
			    $.ajax({
			      type: 'POST',
			      url: 'movieEditActorDel.jsp?no=<%=no%>', // Servlet file path
			      data: { actorNo: actorNo }, 
			      success: function(result) {
			        if (result>0) {
			          alert('삭제가 완료되었습니다.');
			          $(this).closest('.movieWrite_box_in').remove();
			          return false;
			        } else {
			          alert('아직 등록전인 배우입니다.');
			        }
			      },
			      error: function() {
			        
			        alert('서버 오류가 발생했습니다.');
			      }
			    });
			  }
			  
		  }else{
			  if (confirm('정말 삭제하시겠습니까?')) {
				    $.ajax({
				      type: 'POST',
				      url: 'movieEditDirectorDel.jsp?no=<%=no%>', // Servlet file path
				      data: { actorNo: actorNo }, 
				      success: function(result) {
				        if (result>0) {
				          alert('삭제가 완료되었습니다.');
				          $(this).closest('.movieWrite_box_in').remove();
				          return false;
				        } else {
				          alert('아직 등록전인 감독입니다.');
				        }
				      },
				      error: function() {
				        
				        alert('서버 오류가 발생했습니다.');
				      }
				    });
				  }			  
			  
			  
		  }
		});

	
	
	$('#addMovie').click(function(){
		var popup = window.open('serchMovie.jsp', 'Movieserch', 'width=800px,height=650px,scrollbars=yes');
	});
	
	$('#addActor').click(function(){
		var popup = window.open('serchActor.jsp', 'serch', 'width=800px,height=800px,scrollbars=yes');
	});
	
	$('#addDirector').click(function(){
		var cnt = $('#directorBox').find('.movieWrite_box_in').length;	
		if(cnt==2){
			alert('더 이상 등록할 수 없습니다.');
			return false;
		}else{
			var popup = window.open('serchDirector.jsp', 'serch', 'width=800px,height=800px,scrollbars=yes');
		}
	});	
	
	
	$('#saveMovie').click(function(){
		if($('#movie_tit').val().length<1){
			alert("제목을 입력하세요");
			$('#movie_tit').focus();
			return false;
		}
		
		if($('#synop').val().length<1){
			alert("줄거리를 입력하세요");
			$('#synop').focus();
			return false;
		}

		if($('#runningTiem').val().length<1){
			alert("상영시간을 입력하세요");
			$('#runningTiem').focus();
			return false;
		}
		
		if($('#openDate').val().length<1){
			alert("개봉연도를 입력하세요");
			$('#openDate').focus();
			return false;
		}		

		if($('#ageRate').val().length<1){
			alert("연령가를 입력하세요");
			$('#ageRate').focus();
			return false;
		}			

		if($('#price').val().length<1){
			alert("팝콘가를 입력하세요");
			$('#price').focus();
			return false;
		}	



		if($('#url').val().length<1){
			alert("예고편 주소를 입력하세요");
			$('#url').focus();
			return false;
		}

		
		if (!$('#stilcut').val()) {
			alert("스틸컷을 첨부해주세요");
			$('#stilcut').focus()
			return false;
		} else if ($("#stilcut").val() != "") {
			var ext = $("#stilcut").val().split(".").pop().toLowerCase();
			if ($.inArray(ext, ["jpg", "jpeg", "png", "gif"]) == -1) {
				alert("이미지 파일만 등록 가능합니다.");
				$("#stilcut").val("");
				$('#stilcut').focus();
				return false;
			}
		}
		
		var maxSize = 1 * 1024 * 1024; // 1MB
		var fileSize = $("#stilcut")[0].files[0].size;
		
		if (fileSize > maxSize) {
			alert("첨부파일 사이즈는 1MB 이내로 등록 가능합니다.");
			$("#stilcut").val("");
			$('#stilcut').focus();
			return false;
		}
		
		
		
		if (!$('#poster').val()) {
			alert("포스터를 첨부해주세요");
			$('#stilcut').focus()
			return false;
		} else if ($("#poster").val() != "") {
			var ext = $("#poster").val().split(".").pop().toLowerCase();
			if ($.inArray(ext, ["jpg", "jpeg", "png", "gif"]) == -1) {
				alert("이미지 파일만 등록 가능합니다.");
				$("#poster").val("");
				$('#poster').focus();
				return false;
			}
		}
		
		var maxSize = 1 * 1024 * 1024; // 1MB
		var fileSize = $("#poster")[0].files[0].size;
		
		if (fileSize > maxSize) {
			alert("첨부파일 사이즈는 1MB 이내로 등록 가능합니다.");
			$("#poster").val("");
			$('#poster').focus();
			return false;
		}		

		if($('#actorBox').find('.movieWrite_box_in').length==0){
			alert("배우를 등록해주세요");
			$('#actorBox').focus()
			return false;
		}
		
		
		if($('#directorBox').find('.movieWrite_box_in').length==0){
			alert("감독을 등록해주세요");
			$('#directorBox').focus()
			return false;
		}
		

	});
});

</script>

<%


	if(no==null||no.isEmpty()){%>
	<script>
		alert('잘못된 url입니다.');
		location.href="movieList.jsp";
	</script>
		
<%	
		return;
	}
	
	MovieListVO vo = new MovieListVO();
	MovieListService servise = new MovieListService();
	String synop="";
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	try{
		vo = servise.selectMovie(Integer.parseInt(no));
		synop= vo.getSynop();
		synop=synop.replace("\r\n", "<br>");
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
		<section id="movieWrite">
		<div class="movieWrite_wrap"><!-- 전체div -->
			<div class="movieWrite_box"> <!-- 상단 타이틀 div -->
				<h4>영화 등록</h4>
				<p><a href="movieList.jsp">영화관리</a>>영화등록</p>
			</div>
			<form name="movieWrite" method="post" enctype="multipart/form-data" action="movieWrite_ok.jsp">
				<div class="movieWrite_box"><!-- 입력폼 div -->
					<input type="hidden" name="movieNo" value="<%=vo.getMovieNo() %>">
					<input type="hidden" name="oldPoster" value="<%=vo.getPoster()%>">
					<input type="hidden" name="oldStilcut" value="<%=vo.getStilcut()%>">
					
					<input type="button" class="movie_btn btn btn-primary" name="movie" value="영화 검색" id="addMovie">
					<p class="clear">영화 정보</p>
		
					<div class="movieWrite_box1">
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">영화제목</div>
							<div class="movieWrite_box_in_right">
								<input class="form-control info_txt" type="text"
								placeholder="제목을 입력하세요" name="title" id="movie_tit" value="<%=vo.getTitle()%>">
							</div>
						</div><!-- movieWrite_box_in -->
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">줄거리</div>
							<div class="movieWrite_box_in_right">
							<textarea class="form-control info_txt" id="synop" name="synop" placeholder="줄거리를 입력하세요"><%=synop%></textarea>
							
							</div><!-- movieWrite_box_in_right -->
						</div><!-- movieWrite_box_in -->			
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">상영시간</div>
							<div class="movieWrite_box_in_right">
								<input class="form-control info_txt" type="text"
								placeholder="상영시간 입력하세요" name="runningTiem" id="runningTiem" value="<%=vo.getRunningTime()%>">		
							</div>
						</div><!-- movieWrite_box_in -->
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">개봉연도</div>
							<div class="movieWrite_box_in_right">
								<input class="form-control info_txt" type="text"
								placeholder="개봉 연도를 입력하세요" name="openDate" id="openDate" value="<%=sdf.format(vo.getOpendate())%>">	
							</div>
						</div><!-- movieWrite_box_in -->
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">연령가</div>
							<div class="movieWrite_box_in_right">
								<input class="form-control info_txt" type="text"
								placeholder="연령가를 입력하세요" name="ageRate" id="ageRate" value="<%=vo.getAgeRate()%>">								
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
								<input class="form-control info_txt" type="text" placeholder="팝콘가를 입력하세요" name="price" id="price" value="<%=vo.getPrice()%>">
							</div>
						</div><!-- movieWrite_box_in -->
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">예고편URL</div>
							<div class="movieWrite_box_in_right">
								<input class="form-control info_txt info_txt"  type="text" placeholder="URL을 입력하세요" name="url" id="url" value=<%=vo.getUrl() %>>
							</div><!-- movieWrite_box_in_right -->
						</div><!-- movieWrite_box_in -->			
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">스틸이미지</div>
							<div class="movieWrite_box_in_right">
								<input class="form-control" type="file" id="stilcut" name="stilcut">
								<p>기존 첨부파일 :<%=vo.getStilcut() %> </p>
								<p>새로 지정할 경우 기존 파일은 삭제됩니다.</p>	
							</div>
						</div><!-- movieWrite_box_in -->
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">포스터이미지</div>
							<div class="movieWrite_box_in_right">
								<input class="form-control" type="file" id="poster" name="poster">
								<p>기존 첨부파일 :<%=vo.getPoster()%> </p>
								<p>새로 지정할 경우 기존 파일은 삭제됩니다.</p>									
							</div>
						</div><!-- movieWrite_box_in -->
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">장르</div>
							<div class="movieWrite_box_in_right">
								<select class="form-select form-select-sm" id="genreNo" name="genreNo">
								<%
									GenreService genreService = new GenreService();
									List<GenreVO> list = null;
									GenreVO gernVo = null;
									
									try{
										list = genreService.selectGenreAll();
										
										if(list==null || list.isEmpty()){%>
										<option selected value="0">없음</option>	
									<%	}else{ 
											for(int i=0; i<list.size();i++){
												gernVo=list.get(i);
												if(vo.getGenreNo()==gernVo.getGenreNo()){
									%>
												<option value="<%=gernVo.getGenreNo()%>" selected><%=gernVo.getGenreName() %></option>
									<%	
												}else{%>
												
												<option value="<%=gernVo.getGenreNo()%>"><%=gernVo.getGenreName() %></option>
											<%	}
											
											}
										} 
									}catch(SQLException e){
											e.printStackTrace();
										}
								%>

								</select>
							</div>
						</div><!-- movieWrite_box_in -->															
					</div><!-- movieWrite_box1 -->
				</div><!-- movieWrite_box -->	
				<br>
				<div class="movieWrite_box"><!-- 입력폼 div -->
					<input type="button" class="movie_btn btn btn-primary" name="Actor" value="배우등록" id="addActor">
					<p class="clear">출연진 정보</p>
						
					<div class="movieWrite_box1" id="actorBox">
					<%
						CastingListVO castingVo = null;
						CastingListService castingService = new CastingListService();
						List<CastingListVO> castingList= null;
						try{
							castingList =castingService.selectCastingMovie(vo.getMovieNo());
						}catch(SQLException e){
							e.printStackTrace();
						}
					
						for(int c=0; c<castingList.size();c++){
							castingVo = castingList.get(c);
					%>
					    <div class="movieWrite_box_in" id="actorBox">
					      <div class="movieWrite_box_in_left">
					        <img src="../../images/movie/actor/<%=castingVo.getActorImg() %>" style="width: 60px;">
					        <input type="hidden" name="actorNo" value="<%=castingVo.getActorNo()%>">
					      </div>
					      <div class="movieWrite_box_in_right" style="line-height: 65px;"><%=castingVo.getActorName() %></div>
					     <div class="movieWrite_box_in_right" style="width:10%;line-height: 85px; text-align:center;"><a href="#" id="delActor">삭제</a></div>
					    </div>
					 <%} %>
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