<%@page import="java.io.File"%>
<%@page import="com.semi.common.Utility"%>
<%@page import="com.semi.actor.model.ActorVO"%>
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
		ActorService service = new ActorService();
		int cnt=0;
		for(int i=0; i<arrNo.length;i++){
			ActorVO  vo = service.selectByActorNo(Integer.parseInt(arrNo[i]));
			String fileName = vo.getActorImg();
			//배우 삭제
			cnt= service.deleteActor(Integer.parseInt(arrNo[i]));
			
       	    //첨부된 파일도 삭제처리
       	    if(fileName!=null && !fileName.isEmpty()){
			    
				//이미지 업로드 경로
				String saveDir=Utility.ACTOR_PATH;
				
				File myfile = new File(saveDir, fileName);
				
				//기존 파일이 있으면 파일삭제
				if (myfile.exists()){
					boolean bool=myfile.delete();
					System.out.println("파일삭제여부:"+bool);
				}
       	    }
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