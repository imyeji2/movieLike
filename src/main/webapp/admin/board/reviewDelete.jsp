<%@page import="com.semi.common.Utility"%>
<%@page import="java.io.File"%>
<%@page import="com.semi.review.model.ReviewVO2"%>
<%@page import="com.semi.review.model.ReviewService2"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String[] arrNo = request.getParameterValues("chk");
	 
	int reuslt=0;
	try{
		ReviewService2 service2 = new ReviewService2();
		int cnt=0;
		for(int i=0; i<arrNo.length;i++){
			/* ReviewVO  vo = service.selectByNo(Integer.parseInt(arrNo[i])); */
			
			cnt= service2.deleteReview(Integer.parseInt(arrNo[i]));
			reuslt++;
       	}
	
		if(cnt>0){ %>
			<script type="text/javascript">
				alert("<%=reuslt%>건이 삭제 되었습니다.");
				location.href="noticeList.jsp";
			</script>
<% 
		}else{ %>
			<script>
				alert("삭제에 실패했습니다. 다시 시도해 주세요");
				history.back();
			</script>	
	<%	}
	}catch(SQLException e){
		e.printStackTrace();
	}
	

%>
</body>
</html>