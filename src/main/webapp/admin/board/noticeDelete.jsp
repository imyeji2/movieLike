<%@page import="com.semi.common.Utility"%>
<%@page import="java.io.File"%>
<%@page import="com.semi.board.model.BoardVO"%>
<%@page import="com.semi.board.model.BoardService"%>
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
	request.setCharacterEncoding("utf-8");
	String[] arrNo = request.getParameterValues("chk");
	 
	int reuslt=0;
	try{
		BoardService service = new BoardService();
		int cnt=0;
		for(int i=0; i<arrNo.length;i++){
			/* BoardVO  vo = service.selectByNo(Integer.parseInt(arrNo[i])); */
			
			cnt= service.deleteBoard(Integer.parseInt(arrNo[i]));
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