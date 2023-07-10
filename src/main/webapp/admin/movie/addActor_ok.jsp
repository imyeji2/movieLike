<%@page import="com.semi.common.Utility"%>
<%@page import="com.semi.actor.model.ActorVO"%>
<%@page import="com.semi.actor.model.ActorService"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>	
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
</script>
<title>Insert title here</title>
</head>
<body>
<%	
		
		//실제 물리적 저장 경로
		String location = Utility.ACTOR_PATH;
		System.out.println(location);
		//최대사이즈
		int maxSize = 1* 1024 * 1024; 
		//인코딩
		String encoding="utf-8";
		
		try{
			//중복된 이름 변경해서 저장해주는 객체 생성
			DefaultFileRenamePolicy df = new DefaultFileRenamePolicy();
			//form 태그에서 설정해준 multipart/form-data를 받아 주는 객체
			MultipartRequest multi = 
				new MultipartRequest(request,location,maxSize,encoding,df);
			System.out.println("파일 업로드 완료!");
			
			String fileName = multi.getFilesystemName("img");
			
			//1. 요청 파라미터 읽어오기
			String name = multi.getParameter("name");
			System.out.println("파일명"+fileName);
			System.out.println("이름"+name);
			
			//2.db작업
			ActorVO vo = new ActorVO();
			ActorService service = new ActorService();
			vo.setActorName(name);
			vo.setActorImg(fileName);
			
			
			int cnt = service.insertActor(vo);
			
			if(cnt>0){%>
				<script type="text/javascript">
					alert("등록이 완료되었습니다.");
					opener.parent.location.reload();
					self.close();
				</script>
		<% }else{ %>
			<script type="text/javascript">
				alert("정보를 다시 확인하세요");
				history.back();
			</script>
		<%} 
		
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	
	
	


%>

</body>
</html>