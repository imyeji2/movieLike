<%@page import="com.semi.collection.model.collectionService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.collection.model.collectionVO"%>
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

	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String[] movieArr =request.getParameterValues("movieNo");
	
	System.out.println(movieArr.length);
	
	collectionVO vo = new collectionVO();
	collectionService service = new collectionService();
	int result = 0;
	try{
		for(int i=0; i<movieArr.length;i++){
			vo.setCollectionTitle(title);
			vo.setContent(content);
			vo.setMovieNo(Integer.parseInt(movieArr[i]));
			int cnt=service.insertCollection(vo);
			result++;
		}
		
		if(movieArr.length==result){%>
			<script>
				alert("등록이 완료되었습니다.");
				location.href="collectionList.jsp";
			</script>
		<% }else{ %>
			<script>
				alert("등록에 실패하였습니다.");
				history.back();
			</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
	

%>
</body>
</html>