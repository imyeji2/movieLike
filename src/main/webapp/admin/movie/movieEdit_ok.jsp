<%@page import="java.io.File"%>
<%@page import="com.semi.casting.model.CastingService"%>
<%@page import="com.semi.casting.model.CastingVO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.semi.movie.model.MovieService"%>
<%@page import="com.semi.movie.model.MovieVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.semi.common.Utility"%>
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
	String imgURL = "C:\\Users\\ezen\\Documents\\GitHub\\SemiProject\\src\\main\\webapp\\images\\movie\\content";
	
	System.out.println(imgURL);
	//최대사이즈
	int maxSize = 3* 1024 * 1024; 
	//인코딩
	String encoding="utf-8";
	
	try{
		//중복된 이름 변경해서 저장해주는 객체 생성
		DefaultFileRenamePolicy df = new DefaultFileRenamePolicy();
		//form 태그에서 설정해준 multipart/form-data를 받아 주는 객체
		MultipartRequest multi = 
			new MultipartRequest(request,imgURL,maxSize,encoding,df);
		String poster = multi.getFilesystemName("poster");
		System.out.println("포스터 업로드 완료!");
	
		String stilcut = multi.getFilesystemName("stilcut");
		System.out.println("스틸컷 업로드 완료!");
		
		//1. 요청 파라미터 읽어오기
		//영화 파라미터
		String movieNo = multi.getParameter("movieNo");
		String title = multi.getParameter("title");
		String genreNo = multi.getParameter("genreNo");
		String synop = multi.getParameter("synop");
		String runningTiem = multi.getParameter("runningTiem");
		String openDate = multi.getParameter("openDate");
		String ageRate = multi.getParameter("ageRate");
		String price = multi.getParameter("price");
		String url = multi.getParameter("url");
		String oldPoster = multi.getParameter("oldPoster");
		String oldStilcut = multi.getParameter("oldStilcut");
		
		SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMdd");
		Date date = inputFormat.parse(openDate);
		Timestamp open = new Timestamp(date.getTime());

		//감독,배우는 배열로
		String[] directorArr = multi.getParameterValues("directorNo");
		String[] actorArr = multi.getParameterValues("actorNo");
		
		MovieVO vo= new MovieVO();
		vo.setTitle(title);
		vo.setGenreNo(Integer.parseInt(genreNo));
		vo.setSynop(synop);
		vo.setRunningTime(runningTiem);
		vo.setOpendate(open);
		vo.setAgeRate(Integer.parseInt(ageRate));
		vo.setPrice(Integer.parseInt(price));
		vo.setUrl(url);
		vo.setPoster(poster);
		vo.setStilcut(stilcut);
		vo.setDirectorNo1(Integer.parseInt(directorArr[0]));
		if(directorArr.length>1){
			vo.setDirectorNo2(Integer.parseInt(directorArr[1]));
		}
	
		
		MovieService service = new MovieService();
		int cnt = service.insertMovie(vo);
		
		//영화 등록하고 등록한 영화 번호 받아오기
		vo=service.selectMovieByNo(title);
		
		
		if(cnt>0){	
            //새로운 파일을 첨부한 경우, 기존 파일이 있을 때만 기존파일을 삭제한다
            if(poster != null && !poster.isEmpty()){
           	 if(oldPoster != null && !oldPoster.isEmpty()){
                  File myfile = new File(imgURL, oldPoster);
                  if(myfile.exists()){
                     boolean bool = myfile.delete();
                     System.out.println("포스터 기존파일 삭제 : " + bool);
                  }
               }
            }	
			
            
            if(stilcut != null && !stilcut.isEmpty()){
              	 if(oldStilcut != null && !oldStilcut.isEmpty()){
                     File myfile = new File(imgURL, oldPoster);
                     if(myfile.exists()){
                        boolean bool = myfile.delete();
                        System.out.println("스틸컷 기존파일 삭제 : " + bool);
                     }
                  }
               }	
   			            
			//영화가 등록되면 캐스팅 등록
			//배우 파라미터
			int castingCnt=0;
			for(int i=0;i<actorArr.length;i++){
				System.out.println(actorArr[i]);
				CastingService castingServ = new CastingService();
				CastingVO castingVO = new CastingVO();
				castingVO.setActorNo(Integer.parseInt(actorArr[i]));
				castingVO.setMovieNo(vo.getMovieNo());
				int cnt2=castingServ.insertCasting(castingVO);
				castingCnt++;
				System.out.println("캐스팅 등록 결과 cnt="+cnt2+"매개변수vo"+castingVO);
			}
			
			System.out.println("영화 등록 완료 cnt="+cnt+", 캐스팅 등록 완료 castingCnt="+castingCnt);
	 		%>
	 		<script type="text/javascript">
				alert("등록이 완료되었습니다.");
				location.href="movieList.jsp";
				
			</script>
	 		
		<% }else{%>
		
			<script type="text/javascript">
				alert("등록에 실패했습니다.");
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