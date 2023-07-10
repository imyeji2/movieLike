<%@page import="com.semi.common.Utility"%>
<%@page import="com.semi.director.model.DirectorService"%>
<%@page import="com.semi.director.model.DirectorVO"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.actor.model.ActorService"%>
<%@page import="com.semi.actor.model.ActorVO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
		
		String fileName = multi.getFilesystemName("editImg");
		
		//1. 요청 파라미터 읽어오기
		String name = multi.getParameter("name");
		String no = multi.getParameter("directorNo");
		String oldFileName = multi.getParameter("oldFileName");
		System.out.println("파일명"+fileName);
		System.out.println("이름"+name);
		
		//2.db작업
		DirectorVO vo = new DirectorVO();
		DirectorService service = new DirectorService();
		vo.setDirectorNo(Integer.parseInt(no));
		vo.setDirectorName(name);
		vo.setDirectorImg(fileName);
		
		
		int cnt = service.updateDirector(vo);
		
		if(cnt>0){
            //새로운 파일을 첨부한 경우, 기존 파일이 있을 때만 기존파일을 삭제한다
            if(fileName != null && !fileName.isEmpty()){
           	 if(oldFileName != null && !oldFileName.isEmpty()){
                  File myfile = new File(location, oldFileName);
                  if(myfile.exists()){
                     boolean bool = myfile.delete();
                     System.out.println("기존파일 삭제 : " + bool);
                  }
               }
            }	
            %>    
			<script type="text/javascript">
				alert("수정이 완료되었습니다.");
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