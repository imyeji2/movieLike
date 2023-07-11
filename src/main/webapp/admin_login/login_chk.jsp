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
	String l_adminId = (String)session.getAttribute("adminId");
	String ctxPath = request.getContextPath();
	if(l_adminId == null || l_adminId.isEmpty()){%>
	
		<script type="text/javascript">
			alert("로그인을 해야만 접근할 수 있는 페이지 입니다.");
			location.href = "<%=ctxPath%>/admin_login/admin_login.jsp"
		</script>
	<%
		return;
	}
%>
</body>
</html>