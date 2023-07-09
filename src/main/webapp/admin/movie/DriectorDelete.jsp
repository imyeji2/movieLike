<%@page import="com.semi.director.model.DirectorService"%>
<%@page import="com.semi.actor.model.ActorService"%>
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
	//1. 파라미터 받기
	request.setCharacterEncoding("utf-8");
	String[] arrNo = request.getParameterValues("chk");
	int reuslt=0;
	try{
		DirectorService service = new DirectorService();
		int cnt=0;
		for(int i=0; i<arrNo.length;i++){
			cnt= service.deleteDirector(Integer.parseInt(arrNo[i]));
			reuslt++;
		}
		
		if(cnt>0){%>
			<script type="text/javascript">
				alert("<%=reuslt%>건이 삭제 되었습니다.");
				location.href="serchActor.jsp";
			</script>
<% 
		}else{%>
			<script>
				alert("삭제에 실패했습니다. 다시 시도해 주세요");
				history.back();
			</script>	
<%			
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	


%>
</body>
</html>