<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.board.model.BoardVO"%>
<%@page import="com.semi.board.model.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>
<script src = "${path}/ckeditor/ckeditor.js"></script>

<%

	String boardNo=request.getParameter("boardNo");
	boolean isEdit=false;
	String pageTitle="", btLabel="";
	if(boardNo!=null && !boardNo.isEmpty()){
		isEdit=true; //수정 
		
		pageTitle="수정하기";
		btLabel="수정";
	}else{ //등록
		pageTitle="등록하기";
		btLabel="등록";		
	}	
	
	String boardTitle="", adminId="", boardContent="", boardCategory="", boardStatus="";
	if(isEdit){
		BoardDAO boardDao = new BoardDAO();
		
		try{
			BoardVO vo=boardDao.selectByNo(Integer.parseInt(boardNo));
			
			boardTitle=vo.getBoardTitle();
			adminId=vo.getAdminID();
			boardContent=vo.getBoardContent();		
			boardCategory=vo.getBoardCategory();
			boardStatus=vo.getBoardStatus();
		}catch(SQLException e){
			e.printStackTrace();
		}			
		
		if(boardContent==null) boardContent="";
	}
	
%>

<script language="javascript" src="/semi/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
   $(function(){
	  CKEDITOR.replace('content');

	  var content = CKEDITOR.instances.content.getData();
	  var result=content.replace(/<\/?p>/gi, '');
	            
	  $('#submit').click(function(){
	      CKEDITOR.instances.content.setData(result);
      })
      
	  $('.text_title').focus(); 
	   
      $('.top_btn').click(function(){
         location.href = 'noticeList.jsp';
      });
      
      $('#submit').click(function(){
         $('.infobox').each(function(idx, item){
            if($(this).val().length < 1){
               alert($(this).prev().text() + '를 입력하세요');
               $(this).focus();
               event.preventDefault();
            }
         });
      });
      
      
   });
   
</script>

</script>
		<section id="movieWrite">
		<div class="movieWrite_wrap"><!-- 전체div -->
			<div class="movieWrite_box"> <!-- 상단 타이틀 div -->
				<h4>공지사항 등록</h4>
				<p><a href="movieList.jsp">공지/FAQ</a> > 공지사항 등록</p>
			</div>
			<form name="movieWrite" method="post" enctype="multipart/form-data" action="movieWrite_ok.jsp">
				<div class="movieWrite_box"><!-- 입력폼 div -->
				
					<div class="movieWrite_box1">
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">제목</div>
							<div class="movieWrite_box_in_right">
								<input class="form-control info_txt" type="text"
								placeholder="제목을 입력하세요" name="title" id="movie_tit">
							</div>
						</div><!-- movieWrite_box_in -->
									
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">관리자 ID</div>
							<div class="movieWrite_box_in_right">
								<input class="form-control info_txt" type="text"
								placeholder="관리자 ID를 입력하세요" name="runningTiem" id="runningTiem">		
							</div>
						</div><!-- movieWrite_box_in -->
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">노출 상태</div>
							<div class="movieWrite_box_in_right">
								<input class="form-control info_txt" type="text"
								placeholder="Y" name="openDate" id="openDate">	
							</div>
						</div><!-- movieWrite_box_in -->
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">내용</div>
							<div class="movieWrite_box_in_right">
							<textarea id = "editor4" name = "editor4"></textarea>
								<script>CKEDITOR.replace('editor4',{filebrowserUploadUrl:'/mine/imageUpload.do'});</script>
							</div><!-- movieWrite_box_in_right -->
						</div><!-- movieWrite_box_in -->
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

<script>

CKEDITOR.replace( 'content', {
    
   //filebrowserImageUploadUrl: '/semi/admin/uploadIMG.php'
   filebrowserImageUploadUrl: '/semi/admin/board/img' 

    
});
    
</script>

</body>
</html>