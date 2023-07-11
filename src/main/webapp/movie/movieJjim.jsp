<%@page import="com.semi.pick.PickService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String movieNo = request.getParameter("movieno");
	String userid = request.getParameter("userid");
	String isJjim = request.getParameter("isJjim");
	
	System.out.println(movieNo + userid + isJjim);
	
	PickService pickService = new PickService();
	if(Integer.parseInt(isJjim) == 1){
		pickService.insertPick(Integer.parseInt(movieNo), userid);
		%><script>
			location.href = "movieDetail.jsp?no="+<%=movieNo%>;
		</script><%
	}else if(Integer.parseInt(isJjim) == 2){
		pickService.deletePick(Integer.parseInt(movieNo), userid);
		%><script>
		location.href = "movieDetail.jsp?no="+<%=movieNo%>;
		</script><%
	}else{
		%><script>
			alert('잘못된 접근입니다');
			history.go(-1);
		</script><%
	}
%>
</body>
</html>