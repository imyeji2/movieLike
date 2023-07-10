<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
public void imageUpload(HttpServletRequest request,
		HttpServletResponse response, MultipartHttpServletRequest multiFile
		, @RequestParam MultipartFile upload) throws Exception{
	// 랜덤 문자 생성
	UUID uid = UUID.randomUUID();
	
	OutputStream out = null;
	PrintWriter printWriter = null;
	
	//인코딩
	response.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	try{
		//파일 이름 가져오기
		String fileName = upload.getOriginalFilename();
		byte[] bytes = upload.getBytes();
		
		//이미지 경로 생성
		String path = "C:\\Users\\wowo1\\Pictures\\Saved Pictures" + "ckImage/";	// 이미지 경로 설정(폴더 자동 생성)
		String ckUploadPath = path + uid + "_" + fileName;
		File folder = new File(path);
		System.out.println("path:"+path);	// 이미지 저장경로 console에 확인
		//해당 디렉토리 확인
		if(!folder.exists()){
			try{
				folder.mkdirs(); // 폴더 생성
		}catch(Exception e){
			e.getStackTrace();
		}
	}
	
	out = new FileOutputStream(new File(ckUploadPath));
	out.write(bytes);
	out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
	
	String callback = request.getParameter("CKEditorFuncNum");
	printWriter = response.getWriter();
	String fileUrl = "/food/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면
	
	// 업로드시 메시지 출력
	printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
	printWriter.flush();
	
	}catch(IOException e){
		e.printStackTrace();
	} finally {
		try {
		if(out != null) { out.close(); }
		if(printWriter != null) { printWriter.close(); }
	} catch(IOException e) { e.printStackTrace(); }
	}
	return;
}


%>
</body>
</html>