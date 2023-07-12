<%@page import="com.semi.member.model.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="my-information">
		<div class="certification">
			<h3 class="page-title">본인인증</h3>
			<form name="" method="post" action="#">
				<div class="form-floating">
					<input type="password" class="form-control" id="certiPass" name="certiPass" placeholder="비밀번호를 입력해주세요"> 
					<label for="certiPass">비밀번호</label>
				</div>
				<button type="button" class="certi-confirm certi-btn">확인</button>
				<!-- 나중에 개발할때 type submit으로 변경해 -->
			</form>
		</div>
		<div class="edit_user">
			<h3 class="page-title">비밀번호 변경</h3>
			<form name="frmRegist" method="post" action="UserEdit_ok.jsp">
				
				<div class="form-floating">
					<input type="email" class="form-control" id="registerId" name="userId" value="<%=userId %>" placeholder="예) name@example.com" readonly> 
					<label for="registerId">이메일 주소</label>
				</div>
				<div class="match">
					<div class="form-floating">
						<input type="text" class="form-control" id="registerName" name="name" value="<%=name %>" placeholder="예) 홍길동" readonly> 
						<label for="registerName">이름</label>
					</div>
					<div class="gender" >					
						<input type="radio" name="edit-gender" id="edit-man" value="남"<% if(gender.equals("남")) %> checked disabled> <% else %> disabled >
						<label for="edit-man">남자</label> 
						<input type="radio" name="edit-gender" id="edit-woman" value="여" <% if(gender.equals("여")) %> checked disabled> <% else %> disabled >
						<label for="edit-woman">여자</label>
					</div>
				</div>
				<div class="form-floating">
					<input type="tel" class="form-control" id="registerBirth" name="birth" value="<%=birth %>" placeholder="예) 19990101" maxlength="8" readonly> 
					<label for="registerBirth">생년월일 (8글자)</label>
				</div>
				<div class="form-floating">
					<input type="password" class="form-control" id="registerPassword" name="pwd" placeholder="비밀번호를 입력해주세요"> 
					<label for="registerPassword">비밀번호</label>
				</div>
				<div class="form-floating">
					<input type="password" class="form-control" id="registerPassword2" name="pwd2" placeholder="비밀번호를 입력해주세요"> 
					<label for="registerPassword">비밀번호 확인</label>
				</div>
				<button class="certi-confirm edit-bt" type="submit">정보 수정</button>
			</form>
			<form name ="frmOutUser" method = "post" action="#" >
				<button class="certi-confirm out-bt" type="button">회원 탈퇴</button>
			</form>
		</div>
	
	</div>

	<script>
		$('.certi-btn').click( ()=>{
			var certiPass = $('#certiPass').val();
			
			if ( certiPass == "<%=pwd%>") {
				$('.certification').hide();
				$('.edit_user').show();
			}else {
				alert('비밀번호를 확인해주세요.')
			}
		});
		
		$('')
	</script>