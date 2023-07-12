<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.board.model.BoardVO"%>
<%@page import="com.semi.board.model.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>

<%

	String boardNo=request.getParameter("boardNo");
	boolean isEdit=false;
	String pageTitle="", btLabel="";
	if(boardNo!=null && !boardNo.isEmpty()){
		isEdit=true; 
		
		pageTitle="수정하기";
		btLabel="수정";
	}else{ 
		pageTitle="등록하기";
		btLabel="등록";		
	}	
	
	String boardTitle="", adminId="", boardContent="";
	if(isEdit){
		BoardDAO boardDao = new BoardDAO();
		
		try{
			BoardVO vo=boardDao.selectByNo(Integer.parseInt(boardNo));
			
			boardTitle=vo.getBoardTitle();
			adminId=vo.getAdminID();
			boardContent=vo.getBoardContent();		
		}catch(SQLException e){
			e.printStackTrace();
		}			
		
		if(boardContent==null) boardContent="";
	}
	
%>

<script language="javascript" src="/semi/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
   $(function(){
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

<style>
  .ck-editor__editable { height: 500px; }
  .ck-content { font-size: 12px; }
</style>

<body>
<div class="divForm" style="width:100%">
<form name="frmWrite" method="post" 
 	<%if(!isEdit){ %> 
         action="noticeWrite_ok.jsp"
    <%   }else{ %>
         action="noticeEdit_ok.jsp"
    <%   }    %> >
   <section id="noticeWrite">
         <article id="detail_content">
            <h2>공지/FAQ</h2>
            
            <div class="top_btn">
               <button type="button" id="submit" class="btn btn-primary" >
                  <a href="noticeList.jsp"><%=btLabel %></a></button>
            </div>
            <div class="top_btn">
               <button type="button" id="cancel" class="btn btn-primary" style="background:gray; border:solid 1px gray">
                  <a href="noticeList.jsp">취소하기</a></button>
            </div>
            
            <div class="notice_box">
               <div class="top_box">
                  <div class="top_text">
                     <p>공지사항 > <%=pageTitle %></p> 
                  </div>         
               </div> 
               <input type="hidden" name="boardNo" value="<%=boardNo%>">
               
               <div class="content_box">
                  <div class="textDiv">
                     <div class="text_title">   
                           <label for="title">제목</label>
                           <input type="text" id="title" name="title" class="infobox" value="" />
                        </div>
                        <div class="text_name">
                           <label for="name">작성자 ID</label>
                           <input type="text" id="name" name="name" class="infobox" value=""/>
                        </div>
                     </div>
                  <div class="textarea_box">
                     <form action="" method="post">
                        <textarea id="content" class="infobox" name="content" rows="40">
                        <script>
						$(function () {
							CKEDITOR.replace('contents', {
								filebrowserUploadUrl :'imgupload.jsp'
							});
						});
						
						CKEDITOR.config.extraPlugins = "base64image";
						
						</script>
                        </textarea>
                     </form>
                  </div>
               </div>  
               </table> 
            </div>
   </section> 
   </form>
   </div><!-- admin_menu->aside, session 감싸는 div -->   
</div><!-- admin_menu->wrap -->

<script>

CKEDITOR.replace( 'content', {
    
   /* filebrowserImageUploadUrl: '/semi/admin/uploadIMG.php' */
   filebrowserImageUploadUrl: '/semi/admin/board/img' 

    
});
    
</script>

</body>
</html>