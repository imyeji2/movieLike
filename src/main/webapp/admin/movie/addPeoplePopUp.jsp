<%@page import="com.semi.common.Utility"%>
<%@page import="com.semi.actor.model.ActorVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.semi.actor.model.ActorService"%>
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
<script type="text/javascript" src="../../js/jquery-3.7.0.min.js"></script>
<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 생성 css -->

<title>배우 검색</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style type="text/css">
body{
	width: 580px;
	height:100%px;
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
	padding:30px 25px 10px 25px;
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

.infoBox_left img{
	width:100%;
	text-align: center;

}

.infoBox_right{
	width:320px;
	margin-left:20px;
	float: left;
}

.infoBox_txt{
	width:325px;
	margin:5px 0px 0px 15px;
	float: left;
	font-size: 15px;
	font-weight: 700;
}

.infoBox_txt span{
	
}

.infoBox_txt p{
	margin-bottom:5px;
	color:red;
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

.addBtn{
	width:100%;
	height: 39px;
}

.addBtn input{
	width:100%;
	height:100%;
}
	
</style>
	
<script>

$(function(){
	$('#addPeople').click(function(){
		if ($('#peopleName').val().length < 1) {
			alert("이름을 입력해주세요");
			$(this).focus();
			return false;
		}
		
		if (!$('#fileImg').val()) {
			alert("파일을 첨부해주세요");
			$(this).focus();
			return false;
		} else if ($("#fileImg").val() != "") {
			var ext = $("#fileImg").val().split(".").pop().toLowerCase();
			if ($.inArray(ext, ["jpg", "jpeg", "png", "gif"]) == -1) {
				alert("이미지 파일만 등록 가능합니다.");
				$("#fileImg").val("");
				return false;
			}
		}
		
		var maxSize = 1 * 1024 * 1024; // 1MB
		var fileSize = $("#fileImg")[0].files[0].size;
		
		if (fileSize > maxSize) {
			alert("첨부파일 사이즈는 1MB 이내로 등록 가능합니다.");
			$("#fileImg").val("");
			return false;
		}
		  $('#actorFrm').submit(); 
	/* 
 		var name=$('#peopleName').val();
		$.ajax({
			  type: 'POST',
			  url: '/CheckActorServlet', // 서블릿 파일 경로
			  data: { name: name }, // 전송할 데이터 (이름 변수 전달)
			  success: function(result) {
			    // 서버 응답 성공 시 실행할 함수
			    if (result < 1) {
			      $('#actorFrm').submit();
			    } else {
			      if (!confirm('같은 이름의 배우가 있습니다. 등록하시겠습니까?')) {
			        self.close();
			      } else {
			        $('#actorFrm').submit();
			      }
			    }
			  },
			  error: function() {
			    // 서버 응답 실패 시 실행할 함수
			    alert('서버 오류가 발생했습니다.');
			  }
			});  */

	});
	
	
	//수정일 때는 이미지 첨부 없이도 저장 되게
	$('#editPeple').click(function(){
		if ($('#peopleName').val().length < 1) {
			alert("이름을 입력해주세요");
			$(this).focus();
			return false;
		}
		
		
		//이미지가 첨부 된 경우
		if ($("#fileImg2").val() != "") {
			var ext = $("#fileImg2").val().split(".").pop().toLowerCase();
			if ($.inArray(ext, ["jpg", "jpeg", "png", "gif"]) == -1) {
				alert("이미지 파일만 등록 가능합니다.");
				$("#fileImg2").val("");
				return false;
			}
		
		
			var maxSize = 1 * 1024 * 1024; // 1MB
			var fileSize = $("#fileImg2")[0].files[0].size;
			
			if (fileSize > maxSize) {
				alert("첨부파일 사이즈는 1MB 이내로 등록 가능합니다.");
				$("#fileImg2").val("");
				return false;
			}
		}

		$('#actorFrm').submit(); 
	});	
	
	
		 
	 $('#fileImg2').change(function(){
		    setImageFromFile(this, '#peopleImg');
		});

		function setImageFromFile(input, expression) {
		    if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function (e) {
		    $(expression).attr('src', e.target.result);
		  }
		  reader.readAsDataURL(input.files[0]);
		  }
		}

	
	
});
</script>

<%
	//기능 설명
	//이름랑 이미지 넣고 등록하기 버튼 클릭
	//해당 이름을 가지고 있는 배우가 있으면 등록할지 여부를 다시 체크
	//등록하겠다고 하면 등록, 아니면 창 끄기
	//문제 -> 모든 기능 실행 후 서브밋 기능이 제대로 작동 안함
	//방안1. ajax사용 -> 매핑 파일 때문인지 404에러남 
	//일단 다른 기능들 추가 하고 수정예정
	
	String no=request.getParameter("no");
	String type=request.getParameter("type");
	
	if(no==null||no.isEmpty()){
		if(type==null||type.isEmpty()){
%>
		<script type="text/javascript">
			alert("잘못된 접근입니다.");
			self.close();
		</script>	
<%		
		}
	}
	
	boolean isEdit=false;
	String txt="등록";
	String url ="addPeople_ok.jsp";
	String name="";
	String img="";
	String action="addPeople";
	
	if(no!=null&&!no.isEmpty()){
		isEdit=true;
		txt = "수정";
		url="editPeople_ok.jsp";
		action="editPeple";
	}
	
	ActorVO vo = null;
	if(isEdit){
		ActorService service = new ActorService();
	
		try{
			vo=service.selectByActorNo(Integer.parseInt(no));
			name = vo.getActorName();
			img =vo.getActorImg();
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	
	

	

%>
</head>
<body>


	
<div class="warp">
	<h5>배우 <%=txt %></h5>
	<form id ="actorFrm" name="frmWrite" method="post" enctype="multipart/form-data" action="<%=url%>">
		<input type="hidden" name="actorNo" value=<%=no %>>
		<input type="hidden" name="oldFileName" value="<%=img%>">
		<div class="addPopBox">
			<div class="infoBox">
				<div class="infoBox_left">배우명</div>
				<div class="infoBox_right">
					<input class="form-control info_txt" type="text" placeholder="이름을 입력하세요" name="name" id="peopleName" value="<%=name%>">
				</div>
			</div>
			<%if(!isEdit){ %>
			<div class="infoBox">
				<div class="infoBox_left">배우 이미지</div>
				<div class="infoBox_right">
					<input class="form-control" type="file" name="img" id="fileImg">
				</div>
			</div><!-- movieWrite_box_in -->
		
			<div class="infoBox_line"></div>
			<%} %>
			
			<%if(isEdit){ %>
			<div class="infoBox">
				<div class="infoBox_left" style="line-height: 100px;">
					<img src ="../../images/movie/actor/<%=img %>" name ="img" id="peopleImg">
				</div>
				<div class="infoBox_txt">
					<span>기존 첨부파일 : </span><%=img %>
					<p>새로 지정할 경우 기존 파일은 삭제됩니다.</p>	
					<div class="addBtnBox">
						<input class="form-control" type="file" name="editImg" id="fileImg2">
					</div>
				</div>
			</div><!-- movieWrite_box_in -->			
			<div class="infoBox_line"></div>
			<%} %>
		</div>
		<div class="infoBox_btn">
			<input type="button" value="<%=txt %>하기" id="<%=action%>">
		</div>	
	</form>		
</div>

</body>
</html>