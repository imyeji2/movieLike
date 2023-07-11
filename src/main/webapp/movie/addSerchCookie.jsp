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
	String serch=request.getParameter("serch");
	if(serch==null){
		serch="";
	}
	Cookie cookie = new Cookie("serchText",serch);
	response.addCookie(cookie);
%>
<script>
	location.href="movieSerch.jsp?serch=<%=serch%>";
</script>
</body>
</html>