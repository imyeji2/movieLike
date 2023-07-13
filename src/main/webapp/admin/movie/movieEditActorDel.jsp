
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.casting.model.CastingService"%>
<%@page import="com.semi.casting.model.CastingVO"%>
<%
		 //1.파라미터 처리
		request.setCharacterEncoding("utf-8");
		String movieNo = request.getParameter("no");
		String actorNo = request.getParameter("actorNo");
		System.out.println(movieNo);
		System.out.println(actorNo);

		//2.db 처리
		CastingService service = new CastingService();
		
		
		try{
			int cnt =service.deleteCasting(Integer.parseInt(actorNo), Integer.parseInt(movieNo));
			out.print(cnt);
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		


	%>