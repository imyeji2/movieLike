<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 반응형에 필요 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 기본 js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 생성 css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin.css" />
<style type="text/css">

</style>
<script type="text/javascript">
	$(function(){
		$('.admin_menu_box_in').hide();
		
		//마우스 오버 시 반전 효과
		$('.admin_menu_box').hover(function(){
			var img =$(this).find('img').attr('name');
			$(this).addClass('admin_menu_box_hover');
			$(this).find('span').css('color','#232a31')
			$(this).find('img').attr('src','../images/admin/admin_menu_icon_'+img+'(b).svg');

		},function(){
			var img =$(this).find('img').attr('name');
			$(this).removeClass('admin_menu_box_hover');
			$(this).find('span').css('color','#fff')
			$(this).find('img').attr('src','../images/admin/admin_menu_icon_'+img+'.svg');
		});
		
		$('#statistics').click(function(){
			$('.admin_menu_box_in').slideToggle();
		});
		
	});
</script>
<title>무비라이크-관리자 페이지</title>
</head>
<body>
 <div class="wrap">
    <aside id="admin_menu">
    
	   	<div class="admin_menu_box">
	   		<img src="../images/admin/admin_menu_icon_movie.svg" name="movie" alt="영화관리아이콘 ">
	   		<span style="margin-left:20px"><a href="#">영화 관리</a></span>
	   	</div>
	   	<div class="admin_menu_box">
	   		<img src="../images/admin/admin_menu_icon_main.svg" name="main" alt="메인관리아이콘 ">
	   		<span style="margin-left:20px"><a href="#">메인페이지 관리</a></span>
	   	</div>	
	   	<div class="admin_menu_box">
	   		<img src="../images/admin/admin_menu_icon_member.svg" name="member" alt="회원영관리아이콘 ">
	   		<span style="margin-left:20px"><a href="#">회원 정보 관리</a></span>
	   	</div>	
	   	<div class="admin_menu_box">
	   		<img src="../images/admin/admin_menu_icon_board.svg" name="board" alt="게시판관리아이콘 ">
	   		<span style="margin-left:20px"><a href="#">공지/FAQ등록</a></span>
	   	</div>	
	   	<div class="admin_menu_box">
	   		<img src="../images/admin/admin_menu_icon_review.svg" name="review" alt="리뷰관리아이콘 ">
	   		<span style="margin-left:20px"><a href="#">리뷰 관리</a></span>
	   	</div>	
	   	<div class="admin_menu_box" id="statistics">
	   		<img src="../images/admin/admin_menu_icon_statistics.svg" name="statistics" alt="통계관리아이콘 ">
	   		<span style="margin-left:20px"><a href="#">통계</a></span>
	   	</div>
	 
	 	 <div class="admin_menu_box_in">
	 		<div>
	 			<img src="../images/admin/admin_menu_icon_arrow.svg">
	 			<span><a href="#">카테고리별</a></span>
	 		</div>
	 		<div>
	 			<img src="../images/admin/admin_menu_icon_arrow.svg">
	 			<span><a href="#">매출금액</a></span>
	 		</div>
	 		<div>
	 			<img src="../images/admin/admin_menu_icon_arrow.svg">
	 			<span><a href="#">찜하기</a></span>
	 		</div> 		
	 		<div>
	 			<img src="../images/admin/admin_menu_icon_arrow.svg">
	 			<span><a href="#">판매수별</a></span>
	 		</div>  		 		
	 	</div>
	   	<div class="admin_menu_box">
	  		<img src="../images/admin/admin_menu_icon_logout.svg" name="logout" alt="통계관리아이콘 ">
	  		<span style="margin-left:20px"><a href="#">로그아웃</a></span>
	   	</div> 
    </aside>
</div> 	 		   	   	   	   				
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>