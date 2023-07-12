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
	
	String boardNo = request.getParameter("boardNo");
	String boardTitle = request.getParameter("boardTitle");
	String adminID = request.getParameter("adminID");
	String boardCategory = request.getParameter("boardCategory");
	String boardContent = request.getParameter("boardContent");
	
	BoardDAO boardDao = new BoardDAO();
	BoardVO vo = new BoardVO();
	
	vo.setBoardNo(Integer.parseInt(boardNo));
	vo.setBoardTitle(boardTitle);
	vo.setAdminID(adminID);
	vo.setBoardCategory(boardCategory);
	vo.setBoardContent(boardContent);
	
	try{
		int cnt = boardDao.updateBoard(vo);
		
		if(cnt>0){ %>
			<script type="text/javascript">
				alert("글 수정 완료");
				location.href="noticeDetail.jsp?boardNo=<%=boardNo %>";
			</script>
		<% }else{ %>
			<script type="text/javascript">
				alert("글 수정 실패");
				location.href="noticeDetail.jsp?boardNo=<%=boardNo %>";
			</script>
		<% }
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>