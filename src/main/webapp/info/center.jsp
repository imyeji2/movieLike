<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/DCSS/login.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="myPageBarAni.js"></script>
<style type="text/css">
#menu {
    float: left;
    position: relative;
    height: 100%;
    width: 15%;
    margin-left: 65px;
    margin-top: 60px;;
}
.wrap {
    position: relative;
}
#notice {
    margin-bottom: 15px;
}
span a {
    font-size: 20px;
}

</style>
<%
  int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 0;
%>
</head>
<body>
<div class = "wrap">
	<aside id="menu">
		<div class = "outline">
			<div class="content" style="display: none" id="notice" style="<%= (currentPage == 0) ? "display: block" : "display: none" %>">
				<span><a href="javascript:void(0)" onclick="showContent">공지사항</a></span>
		    </div>
		    <div class="content" style="display: none" id="faq" style="<%= (currentPage == 0) ? "display: block" : "display: none" %>">
		       <span><a href="javascript:void(0)">FAQ</a></span>
		    </div> 
		</div>      
	</aside> 
	<div class = "inner-content">
		
		<!-- 공지사항 -->
		<div class= "noticeWrap">
			
			<%@ include file="notice.jsp"%>
		</div>
		
		<!-- FAQ -->
		<div class = "FAQ">
			<%@ include file="faq.jsp"%>
		</div>
	</div>
</div>
</body>
</html>
<%@ include file="../inc/bottom.jsp"%>
	