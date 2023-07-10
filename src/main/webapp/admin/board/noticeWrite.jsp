<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>

<%
   String boardNo = request.getParameter("boardNo");
   boolean isEdit=false;
%>

<script language="javascript" src="/semi/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
   $(function(){
      $('.top_btn').click(function(){
         location.href = 'noticeList.jsp';
      });
      
      /* //등록 버튼을 눌렀을 때
      $('#submit').click(function(){
         $('.infobox').each(function(idx, item){
            if($(this).val().length < 1){
               alert($(this).prev().text() + '를 입력하세요');
               $(this).focus();
               event.preventDefault();
               return false; //each를 탈출한다 (break 역할)
            }
         });
      }); */
   });
   
</script>

<style>
  .ck-editor__editable { height: 400px; }
  .ck-content { font-size: 12px; }
</style>

<body>
   
   <section id="noticeWrite">
         <article id="detail_content">
            <h2>공지/FAQ</h2>
            
            <div class="top_btn">
               <button type="button" class="btn btn-primary" >
                  <a href="noticeList.jsp">등록하기</a></button>
            </div>
            <div class="top_btn">
               <button type="button" class="btn btn-primary" style="background:gray; border:solid 1px gray">
                  <a href="noticeList.jsp">취소하기</a></button>
            </div>
            
            <%-- <%if(!isEdit){ %> 
               action="write_ok.jsp"
            <%   }else{ %>
               action="edit_ok.jsp"
            <%   }    %> --%> 
            
            <div class="notice_box">
               <div class="top_box">
                  <div class="top_text">
                     <span class="span_notice">공지사항 등록</span>
                  </div>         
               </div> 
               
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
                        <textarea id="content" name="content" rows="40"></textarea>
                     </form>
                     
                     <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
                     <script>
                        ClassicEditor.create(document.querySelector('#editor'));
                     </script>
                  </div>
               </div>   
            </div>
   </section> 
   </div><!-- admin_menu->aside, session 감싸는 div -->   
</div><!-- admin_menu->wrap -->
<script>

CKEDITOR.replace( 'content', {
    
   filebrowserImageUploadUrl: '/semi/admin/uploadIMG.php'
    
});
    
</script>

</body>
</html>