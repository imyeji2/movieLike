<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.board.model.BoardVO"%>
<%@page import="com.semi.board.model.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>
<%-- <script src = "${path}/ckeditor/ckeditor.js"></script> --%>
<!-- <script>
	var ckeditor_config = {
			resize_enaleb : false,
			enterMode : CKEDITOR.ENTER_BR,
			shiftEnterMode : CKEDITOR.ENTER_P,
			filebrowserUploadUrl : "/common/ckUpload"
	};
</script> -->

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
	
	String boardTitle="", adminId="", boardContent="", boardStatus="";
	if(isEdit){
		BoardDAO boardDao = new BoardDAO();
		
		try{
			BoardVO vo=boardDao.selectByNo(Integer.parseInt(boardNo));
			
			boardTitle=vo.getBoardTitle();
			adminId=vo.getAdminID();
			boardContent=vo.getBoardContent();		
			boardStatus=vo.getBoardStatus();
		}catch(SQLException e){
			e.printStackTrace();
		}			
		
		if(boardContent==null) boardContent="";
	}
	
%>

<script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
<script type="text/javascript">
   $(function(){
	  CKEDITOR.replace('boardContent');

	  $('#submit').click(function(){
		  var boardContent = CKEDITOR.instances.boardContent.getData();
		  var result=boardContent.replace(/<\/?p>/gi, '');
	      CKEDITOR.instances.boardContent.setData(result);
	      
	      if(result.length < 1) {
	    	  alert('내용을 입력하세요');
	    	  return false;
	      };
      });
      
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
				<p>공지/FAQ > 공지사항 등록</p>
			</div>
			<form name="movieWrite" method="get" enctype="multipart/form-data" action="noticeWrite_ok.jsp">
				<div class="movieWrite_box"><!-- 입력폼 div -->
				
					<div class="movieWrite_box1">
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">제목</div>
							<div class="movieWrite_box_in_right">
								<input class="form-control info_txt" type="text"
								placeholder="제목을 입력하세요" name="boardTitle" id="boardTitle">
							</div>
						</div>
									
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">관리자 ID</div>
							<div class="movieWrite_box_in_right">
								<input class="form-control info_txt" type="text"
								placeholder="관리자 ID를 입력하세요" name="adminID" id="adminID">	
							</div>
						</div>
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">노출 상태</div>
							<div class="movieWrite_box_in_right">
								<input class="form-control info_txt" type="text"
								placeholder="Y" name="boardStatus" id="boardStatus">	
							</div>
						</div>
						<div class="movieWrite_box_in">
							<div class="movieWrite_box_in_left">내용</div>
							<div class="movieWrite_box_in_right">
							<textarea id = "boardContent" name = "boardContent" ></textarea>
							</div>
						</div>
					</div>
				</div>
				
				<br>
				<div class="btn_grop">
					<input type="submit" class="btn_grop_input" value="등록" id="saveReview">
					<input type="button" class="btn_grop_input" value="취소">
				</div>
			</form>		
		</div>
	</section> 
	</div><!-- admin_menu->aside, session 감싸는 div -->	
</div><!-- admin_menu->wrap -->

</body>
</html>