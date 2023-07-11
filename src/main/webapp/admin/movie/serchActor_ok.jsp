<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.actor.model.ActorService"%>

	<%
		 //1.파라미터 처리
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");

		//2.db 처리
		ActorService service = new ActorService();
		try{
			int result = service.chekByActorName(name);
			out.print(result);
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		


	%>