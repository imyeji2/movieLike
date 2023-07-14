<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<%
	String boardNo = request.getParameter("boardNo");

	if(boardNo==null || boardNo.isEmpty()){ %>
		<script type="text/javascript">
			alert('잘못된 URL입니다.');
			location.href="noticList.jsp";
		</script>
		
	<%  return;
	}
	
	//2. db작업
	BoardDAO boardDao = new BoardDAO();
	
	try{
		int cnt = boardDao.updateBoardView(Integer.parseInt(boardNo));
		
		//3. 결과 처리
		if(cnt>0){
			response.sendRedirect("noticeDetail.jsp?boardNo=" + boardNo);
		}else{ %>
			<script type="text/javascript">
				alert('조회수 증가 실패!');
				history.back();
			</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
	

	
%>
</body>
</html>