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
	$('#addGenre').click(function(){


	});
	
	
	
	
});
</script>

<%
	
	String no=request.getParameter("no");
	

	boolean isEdit=false;
	String txt="등록";
	String url ="addActor_ok.jsp";
	String name="";
	String img="";
	String action="addPeople";
	
	if(no!=null&&!no.isEmpty()){
		isEdit=true;
		txt = "수정";
		url="editActor_ok.jsp";
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
					<input class="form-control info_txt" type="text" placeholder="이름을 입력하세요" name="name" id="peopleName" value="<%=name%>" autocomplete="on">
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