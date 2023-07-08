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
<!-- 기본 js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/movieAPI.js"></script>
<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 생성 css -->
<%
	//1.파라미터 받기
	String type=request.getParameter("type");

	//if(type==null||type.isEmpty()){
		
		/*<script type="text/javascript">
			alert("잘못된 접근입니다.");
			self.close();
		</script>
	}*/
	
	String title="";
	
	if(type.equals("actor")){
		title="배우";
	}else if(type.equals("director")){
		title="감독";
	}

%>
<title><%=title%> 검색</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style type="text/css">
body{
	width: 580px;
	height:330px;
	margin:0 auto;
	padding:10px 10px 10px 10px;
	background:#f3f3f3;
}

.warp{
	width:550px;
	height:300px;
}

.warp h5{
	margin:20px 0px 10px 30px;
}

.addPopBox{
	width:500px;
	padding:30px 25px 30px 25px;
	background:#fff;
	margin:0 auto;
}

 .infoBox{
 	overflow: hidden;
 	padding:10px 10px 10px 10px;
 	border-top: 1px solid #b1b1b1;
 }
 .infoBox_line{
 	border-bottom: 1px solid #b1b1b1;
 }

.infoBox_left{
	width:90px;
	float: left;
	text-align: center;
	line-height: 38px;
}

.infoBox_right{
	width:320px;
	margin-left:20px;
	float: left;
}

.infoBox_btn{
	width:500px;
	margin: 0 auto;
	
}
.infoBox_btn input{
	width:100%;
	background:#0d6efd;
	border: 0;
	outline: none;
	line-height: 40px;
	color:#fff;
}

.infoBox_btn input:hover{
	background:#0b5ed7;
}

.warning{
	text-align: center;
	color:#0d6efd;
	padding-top:10px;
	font-weight: 600;
}
	
</style>

<script>
	$(function(){
		$('.warning').hide();
		

		
		$('#addPeople').click(function(){
			
			if($('#peopleName').val().length<1){
				alert("이름을 입력해주세요");
				$(this).focus();
				return false;
			}
			
			if(!$('#fileImg').val()){
				alert("파일을 첨부해주세요");
				$(this).focus();
				return false;
			}else if($("#fileImg").val() != "") {		
				var ext = $("#fileImg").val().split(".").pop().toLowerCase();		    
				if($.inArray(ext, ["jpg", "jpeg", "png", "gif"]) == -1) {
					alert("이미지 파일만 등록 가능합니다.");
					$("#fileImg").val("");
					return false;
				}
			}
			
			var maxSize = 1 * 1024 * 1024; // 1MB
			var fileSize = $("#fileImg")[0].files[0].size;
			if(fileSize > maxSize){
				alert("첨부파일 사이즈는 1MB 이내로 등록 가능합니다.");
				$("#fileImg").val("");
				return false;
			}				
	
		});
	});

</script>
</head>
<body>
<div class="warp">
	<h5><%=title %> 추가</h5>
	<form name="frmWrite" method="post" enctype="multipart/form-data" action="addActor_ok.jsp">
		<div class="addPopBox">
			<div class="infoBox">
				<div class="infoBox_left"><%=title %>명</div>
				<div class="infoBox_right">
					<input class="form-control info_txt" type="text" placeholder="이름을 입력하세요" name="name" id="peopleName">
				</div>
			</div>
			<div class="infoBox">
				<div class="infoBox_left"><%=title %> 이미지</div>
				<div class="infoBox_right">
					<input class="form-control" type="file" name="img" id="fileImg">
				</div>
			</div><!-- movieWrite_box_in -->
			<div class="infoBox_line"></div>
			<div class="warning">이미 등록된 <%=title %>입니다.</div>
		</div>
		<div class="infoBox_btn">
			<input type="button" value="등록하기" id="addPeople">
		</div>	
	</form>		
</div>
</body>
</html>