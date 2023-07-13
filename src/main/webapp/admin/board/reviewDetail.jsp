<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script>

	$(function()
		$('#eidt').click(function(){
			var chkCount = $('input[name=chk]:checked').length; 
			var chkArr = $('input[name=chk]:checked').attr('id');
			if(chkCount<=0){
				alert("삭제할 항목을 선택해주세요");
			}else{
				var popup = window.open('reviewPopUp.jsp?reviewNo='+chkArr, 'delete', 'width=600px,height=350px,scrollbars=yes');
				
			}
		});
	});
	
<body>

</body>
</html>