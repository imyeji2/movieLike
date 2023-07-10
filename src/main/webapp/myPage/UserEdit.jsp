<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="edit_user">
		<form name="frmRegist" method="post" action="#">
			
			<div class="form-floating">
				<input type="email" class="form-control" id="registerId" name="userId" placeholder="예) name@example.com"> 
				<label for="registerId">이메일 주소</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="registerPassword" name="pwd" placeholder="비밀번호를 입력해주세요"> 
				<label for="registerPassword">비밀번호</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="registerPassword2" name="pwd2" placeholder="비밀번호를 입력해주세요"> 
				<label for="registerPassword">비밀번호 확인</label>
			</div>
			<div class="match">
				<div class="form-floating">
					<input type="text" class="form-control" id="registerName" name="name" placeholder="예) 홍길동"> 
					<label for="registerName">이름</label>
				</div>
				<div class="gender">
					<input type="radio" name="gender" id="man" value="남"> 
					<label for="man">남자</label> 
					<input type="radio" name="gender" id="woman" value="여"> <label for="woman">여자</label>
				</div>
			</div>
			<div class="form-floating">
				<input type="tel" class="form-control" id="registerBirth" name="birth" placeholder="예) 19990101" maxlength="8"> 
				<label for="registerBirth">생년월일 (8글자)</label>
			</div>
			<button class="edit-bt" type="submit">정보 수정</button>
		</form>
	</div>