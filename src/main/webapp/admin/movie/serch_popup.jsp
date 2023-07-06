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
	
	$('.serch_tabel').hide();
	
	$('#serch_txt').on('keypress', function(e){
		if (e.keyCode  == '13'){
			if($('#serch_txt').val().length<1){
				alert("검색어를 입력해주세요");
				return falas;
			}
			$('.serch_tabel').hide();
			$('tbody tr').remove();
			serchMovieApi();
			return false;			

		}
	});	


	$('#serchMovie').click(function(){
		if($('#serch_txt').val().length<1){
			alert("검색어를 입력해주세요");
			return falas;
		}
		$('.serch_tabel').hide();
		$('tbody tr').remove();
		serchMovieApi();
		return false;
	});
	
 	$(document).on("click","tbody tr",function(){
 		var movieCd = $(this).attr('id');
 		sendMovieInfo(movieCd);
		/* alert('야야야야');
		var title=$(this).find('td').attr('name','title').attr('id');
		alert(title);
		//opener.document.getElementById("movie_tit").text = key;
		//self.close(); */
	});
   
});

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

<div class="warp">
	<h5>영화 검색</h5>
	<div>
		<div class="input-group mb-3">
			 <input type="text" id="serch_txt" class="form-control" placeholder="영화명을 입력하세요" aria-label="serchtxt" aria-describedby="button-addon2">
			 <button class="btn btn-outline-secondary" type="button" id="serchMovie">검색</button>
		</div>
	</div>
	<div class="serch_tabel" id="movieTable">
		<table class="table table-hover" style="text-align:center;">
		  <thead>
		    <tr>
			  <th scope="col">영화명</th>
		      <th scope="col">감독</th>
		      <th scope="col">제작국가</th>
		      <th scope="col">개봉일</th>
		    </tr>
		  </thead>
		  <tbody>
		  		    		    		    		    
		  </tbody>
		</table>	
	</div>
</div>

</body>
</html>
