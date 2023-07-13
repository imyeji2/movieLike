<%@page import="com.semi.member.model.UserService"%>
<%@page import="java.sql.SQLException"%>
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
	//1
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("userId");
	
	//2
	UserService service = new UserService();

	try{
		int cnt = service.updateOutdate(userId);
		
		//3
		if(cnt>0){%>
		<script type="text/javascript">
			alert("탈퇴처리 되었습니다.");
			location.href = "<%=request.getContextPath()%>index.jsp";
		</script>
		<%}else {%>
		<script type="text/javascript">
			alert("탈퇴 처리 실패");
			history.back();
		</script>
		<%} %>
	<% }catch(SQLException e){
		e.printStackTrace();
	}
	
%>
</body>
</html>