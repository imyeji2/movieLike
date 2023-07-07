<%@page import="com.semi.member.model.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- 서다희 작업 -->
   <div class="popup members-popup">
      <div class="popup-background"></div>
      <div class="popup-wrapper">
         <div class="popup-inner">
            <div class="close-btn">
               <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                 <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
               </svg>
            </div>
            <div id = "logo">
               <img src = "<%=request.getContextPath() %>/images/logo-black.png">
            </div>
            
            <!-- 로그인 -->
            <div class="login">
               <form>
                  <div class="form-floating">
                     <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com"> 
                     <label for="floatingInput">이메일 주소</label>
                  </div>
                  <div class="form-floating">
                     <input type="password" class="form-control" id="floatingPassword" placeholder="Password"> 
                     <label for="floatingPassword">비밀번호</label>
                  </div>
                  <div class = "saveId">
                  	 <input type="checkbox" id="saveId-chk" >
                  	 <label for = "saveId-chk" style="color: #000;">이 계정을 기억하시겠습니까?</label>
                  </div>
                  <div class = "submit">
                     <input type="submit" value="로그인" class = "login-bt">
                  </div>
               </form>
               <div class="members">
                  <div class="find">
                     <a href="#">아이디 찾기</a>
                     <div class="wall"></div>
                     <a href="#">비밀번호 찾기</a>
                  </div>
                  <a class="register-btn">
                     <p>회원가입</p>
                  </a>
               </div>
            </div>
            
            <!-- 회원가입  -->
            <div class="register">
               <form name ="frmRegist" method = "post" action="regist_ok.jsp">
                  <div class="form-floating">
                     <input type="email" class="form-control" id="registerId" name = "userId" placeholder="예) name@example.com"> 
                     <label for="registerId">이메일 주소</label>
                  </div>
                  <div class="form-floating">
                     <input type="password" class="form-control" id="registerPassword" name = "pwd" placeholder="비밀번호를 입력해주세요"> 
                     <label for="registerPassword">비밀번호</label>
                  </div>
                  <div class="form-floating">
                     <input type="password" class="form-control" id="registerPassword2" name = "pwd2" placeholder="비밀번호를 입력해주세요"> 
                     <label for="registerPassword">비밀번호 확인</label>
                  </div>
                  <div class="match">
                     <div class="form-floating">
                        <input type="text" class="form-control" id="registerName" name = "name" placeholder="예) 홍길동"> 
                        <label for="registerName">이름</label>
                     </div>
                     <div class="gender">
                        <input type="radio" name="gender" id="man">
                        <label for="man">남자</label>
                        <input type="radio" name="gender" id="woman">
                        <label for="woman">여자</label>
                     </div>
                  </div>
                  <div class="form-floating">
                     <input type="tel" class="form-control" id="registerBirth" name="birth" placeholder="예) 19990101" maxlength="8"> 
                     <label for="registerBirth">생년월일 (8글자)</label>
                  </div>
                  <button class="confirm" type="submit" >회원가입</button>
               </form>
            </div>
            
         </div>
      </div>
   </div>
</div>
<script>
   $('.login_btn').click(function(){
      $('.login').show();
      $('.register').hide();
      $('.popup.members-popup').addClass('open');
   });
   
   $('.popup-background').click(function(){
      $('.popup').removeClass('open');
   });
   $('.close-btn').click(function(){
      $('.popup').removeClass('open');
   });
   
   $('.register-btn').click(function(){
      $('.login').hide();
      $('.register').show();
   });
   
   $('.confirm').click(function(){
      var id = $('#registerId').val();
      var pass = $('#registerPassword').val();
      var name = $('#registerName').val();
      var man = $('#man').is(':checked');
      var woman = $('#woman').is(':checked');
      var birth = $('#registerBirth').val();
      
      if ( id == '' || !id.includes('@') ) {
         alert('이메일을 확인해주세요');
         return false;
      }
      
      if ( pass == "" ) {
         alert('비밀번호를 확인해주세요');
         return false;
      }
      
      if ( name == "" || name.length < 2 ) {
         alert('이름을 확인해주세요');
         return false;
      }
      
      if ( man == false && woman == false ) {
         alert('성별을 선택해주세요');
         return false;
      }
      
      if ( birth == '' || birth.length < 8 ) {
         alert('생년월일을 확인해주세요');
         return false;
      }
      
    $('#registerId').on('blur',function(){
   	
    }) 
      
/*       else {
         alert('회원가입이 완료되었습니다');
         $('.register').hide();
         $('.login').show();
      } */
   });
   
   $('.login-bt').click(function(){
      
      var floatingInput = $('#floatingInput').val();      
      var floatingPassword = $('#floatingPassword').val();      
      
      if(floatingInput == ''){
         alert('이메일을 확인해주세요');
         return false;
      }else if(floatingPassword == ''){
         alert('비밀번호를 확인해주세요');
         return false;
      }
      
   });
</script>
   