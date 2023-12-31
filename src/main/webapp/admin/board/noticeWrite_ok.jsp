<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.semi.board.model.BoardVO"%>
<%@page import="com.semi.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>

<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String boardTitle = request.getParameter("boardTitle");
	String adminID = request.getParameter("adminID");
	String boardContent = request.getParameter("boardContent");
	String boardStatus = request.getParameter("boardStatus");
	
	BoardDAO boardDao = new BoardDAO();
	BoardVO vo = new BoardVO();
	
	vo.setBoardTitle(boardTitle);
	vo.setAdminID(adminID);
	vo.setBoardContent(boardContent);
	vo.setBoardStatus(boardStatus);
	
	try{
		int cnt = boardDao.insertBoard(vo);
		
		if(cnt>0){ %>
			<script type="text/javascript">
				alert("공지사항 등록 완료!");
				location.href="noticeList.jsp";
			</script>
		<% }else{ %>
			<script type="text/javascript">
				alert("공지사항 등록 실패!");
				location.href="noticeWrite.jsp";
			</script>
		<% }
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>