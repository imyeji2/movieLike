<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.semi.director.model.DirectorService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.semi.director.model.DirectorVO"%>
<%@page import="com.semi.actor.model.ActorVO"%>
<%@page import="com.semi.movie.model.MovieListService"%>
<%@page import="com.semi.movie.model.MovieListVO"%>
<%@page import="com.semi.movie.model.MovieVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.movie.model.MovieService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 반응형에 필요 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/movieAPI.js"></script>
<!-- 기본 js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 생성 css -->
<script>
$(function() {
	
/* 	$('.serch_tabel').hide(); */
	
	$('#serch_txt').on('keypress', function(e){
		if (e.keyCode  == '13'){
			if($('#serch_txt').val().length<1){
				alert("검색어를 입력해주세요");
				return falas;
			}		

		}
	});	


	$('#serchMovie').click(function(){
		if($('#serch_txt').val().length<1){
			alert("검색어를 입력해주세요");
			return falas;
		}
	});
	
   
});

function sendWrite(no, name, img) {
	  var htmlContent = 
	    '<div class="movieWrite_box_in">' +
	      '<div class="movieWrite_box_in_left">' +
	        '<img src="../../images/movie/content/' + img + '" style="width: 60px;">' +
	        '<input type="hidden" name="movieNo" value="' + no + '">' +
	      '</div>' +
	      '<div class="movieWrite_box_in_right" style="width:70%;line-height: 85px;">' + name + '</div>' +
	      '<div class="movieWrite_box_in_right" style="width:10%;line-height: 85px; text-align:center;"><a href="#">삭제</a></div> '+
	    '</div>';

	  $(opener.document).find('#collectionBox').append(htmlContent);
	  self.close();
}

</script>
<title>영화 검색</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


<style type="text/css">
	.warp{
		width: 750px;
		height:600px;
		margin:0 auto;
		padding:25px 25px 25px 25px;
	}
	
	.warp h5{
		margin:30px 0px 10px 10px;
	}
	
	.serch_tabel{
		margin-bottom: 30px;
	}
	
	.serch_tabel a{
		color: #212529;
		text-decoration: none;
	}
	
	.serch_tabel a:hover{
		text-decoration: underline;
	}
		
	.page_box{
		width:350px;
		margin:0 auto;
		text-align: center;
	}
	
	.popup_footer{
		overflow:hidden;;
	}
	.del_btn_box{
		position:relative;
		top:-55px;
		right:-640px;
	}
	
	td{
		cursor: pointer;
	}

</style>
</head>
<body>
<%
	String serch = request.getParameter("serch");
	if(serch==null||serch.isEmpty()){
		serch="";
	}
	
	
	List<MovieVO> list = null;
	MovieVO vo = null;
	MovieService service = new MovieService();
	
	if(serch!=null&& !serch.isEmpty()){
		
		try{
			list = service.serchtMovie(serch);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	

%>
<div class="warp">
	<h5>영화 검색</h5>
	<div>
		<form name="movieSerFrm" method="get" action="addMovie.jsp?serch=<%=serch%>">
			<div class="input-group mb-3">
				 <input type="text" id="serch_txt" class="form-control" placeholder="영화명을 입력하세요"
				  aria-label="serchtxt" aria-describedby="button-addon2" value="<%=serch%>" name="serch">
				 <button class="btn btn-outline-secondary" type="button" id="serchMovie">검색</button>
			</div>
		</form>
	</div>
	<div class="serch_tabel" id="movieTable">
		<table class="table table-hover" style="text-align:center;">
		  <thead>
		    <tr>
			  <th scope="col" style="width:100px;">포스터</th>
		      <th scope="col" style="width:350px;">영화명</th>
		      <th scope="col" style="width:200px;">감독</th>
		      <th scope="col" style="width:100px;">연령가</th>
		    </tr>
		  </thead>
		  <tbody>
		  
		  <%if(list==null||list.isEmpty()){%>
		  <tr style="line-height:88px;">
		  	<td colspan="4">검색된 내용이 없습니다.</td>
		  </tr>

		  <%}else{ 
	  			
				DirectorVO dirVo=null;
				DirectorService dirService = new DirectorService();
				
		  		for(int i=0; i<list.size();i++){
		  			vo=list.get(i);
		  			
		  			dirVo = dirService.selectByDirectorNo(vo.getDirectorNo1());
		  			String directorNames=dirVo.getDirectorName();
		  			
		  			if(vo.getDirectorNo2()>0){
		  				dirVo =dirService.selectByDirectorNo(vo.getDirectorNo2());
		  				directorNames+=","+dirVo.getDirectorName();
		  			}

		  %>	
		  	
		  		
			<tr style="line-height:88px;">			
			  <td class="text-truncate" style="max-width: 100px;">
			  	<img src="../../images/movie/content/<%=vo.getPoster() %>" style="width:50px">
			  </td>
		      <td class="text-truncate" style="width:350px;">
					<a href="#" onclick="sendWrite(<%=vo.getMovieNo()%>, '<%=vo.getTitle()%>', '<%=vo.getPoster()%>');">
				 	 <%=vo.getTitle() %>
					</a> 
		      	</td>
		      	
		      	<td class="text-truncate" style="width:200px;"><%=directorNames %></td>
		      	<td class="text-truncate" style="width:100px;"><%=vo.getAgeRate() %>세 연령가</td>
		    </tr>		
		    <%} 
		    }%>  		    		    		    		    
		  </tbody>
		</table>	
	</div>
</div>

</body>
</html>
