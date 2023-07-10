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
	// ���� ���� ����
	UUID uid = UUID.randomUUID();
	
	OutputStream out = null;
	PrintWriter printWriter = null;
	
	//���ڵ�
	response.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	try{
		//���� �̸� ��������
		String fileName = upload.getOriginalFilename();
		byte[] bytes = upload.getBytes();
		
		//�̹��� ��� ����
		String path = "C:\\Users\\wowo1\\Pictures\\Saved Pictures" + "ckImage/";	// �̹��� ��� ����(���� �ڵ� ����)
		String ckUploadPath = path + uid + "_" + fileName;
		File folder = new File(path);
		System.out.println("path:"+path);	// �̹��� ������ console�� Ȯ��
		//�ش� ���丮 Ȯ��
		if(!folder.exists()){
			try{
				folder.mkdirs(); // ���� ����
		}catch(Exception e){
			e.getStackTrace();
		}
	}
	
	out = new FileOutputStream(new File(ckUploadPath));
	out.write(bytes);
	out.flush(); // outputStram�� ����� �����͸� �����ϰ� �ʱ�ȭ
	
	String callback = request.getParameter("CKEditorFuncNum");
	printWriter = response.getWriter();
	String fileUrl = "/food/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // �ۼ�ȭ��
	
	// ���ε�� �޽��� ���
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