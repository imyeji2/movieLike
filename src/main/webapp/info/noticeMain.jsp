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
<!-- ck에디터  -->
<script src="//cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
<!-- 생성 css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/DCSS/notice.css" />

<script type="text/javascript">
   $(function(){
      $('.admin_menu_box_in').hide();
      
      //마우스 오버 시 반전 효과
      $('.admin_menu_box').hover(function(){
         var img =$(this).find('img').attr('name');
         $(this).addClass('admin_menu_box_hover');
         $(this).find('img').attr('src','<%=request.getContextPath()%>/images/admin/admin_menu_icon_'+img+'(b).svg');

      },function(){
         var img =$(this).find('img').attr('name');
         $(this).removeClass('admin_menu_box_hover');
         $(this).find('img').attr('src','<%=request.getContextPath()%>/images/admin/admin_menu_icon_'+img+'.svg');
      });
     
      
      $('.admin_menu_box').click(function(){
    	  $(this).addClass('admin_menu_box_hover');
      });
      
      $('#statistics').click(function(){
         $('#statistics_menu').slideToggle();
         
      });
      
      $('#board').click(function(){
          $('#board_menu').slideToggle();
       });   

   });
</script>
<title>무비라이크 - 공지/FAQ</title>
</head>
<style>

</style>

<body>
   <div class="wrap"><!-- 전체 div -->
      <header>
			<%@ include file="../inc/top.jsp" %>  
      </header>
      <div class="admin_content">
          <aside id="admin_menu">
               <div class="admin_menu_box" id="movie">
                  <img src="<%=request.getContextPath()%>/images/admin/admin_menu_icon_movie.svg" name="movie" alt="영화관리아이콘 ">
                  <span style="margin-left:20px"><a href="<%=request.getContextPath()%>/info/notice.jsp">공지사항</a></span>
               </div>
               <div class="admin_menu_box" id="main">
                  <img src="<%=request.getContextPath()%>/images/admin/admin_menu_icon_main.svg" name="main" alt="메인관리아이콘 ">
                  <span style="margin-left:20px"><a href="<%=request.getContextPath()%>/info/faq.jsp">FAQ</a></span>
               </div>   
               
          </aside> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
                                               