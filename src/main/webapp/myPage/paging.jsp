<%@page import="com.semi.common.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//페이징 처리
	int currentPage=1;  //현재 페이지
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	//[1] 현재 페이지와 무관한 변수
	int totalRecord=pointList.size(); //총 레코드 개수, 17
	int pageSize=15; //한 페이지에 보여주 레코드 수
	int blockSize=5;  //한 블럭에 보여줄 페이지 수
	int totalPage = (int)Math.ceil((float)totalRecord/pageSize); //총 페이지 수, 4
	
	//[2] 현재 페이지를 이용해서 계산해야 하는 변수
	int firstPage = currentPage - ((currentPage-1)%blockSize); //1,11,21..블럭의 시작페이지
	int lastPage=firstPage+(blockSize-1); //10,20,30.. 블럭의 마지막 페이지
	
	//페이지당 ArrayList에서의 시작 index => 0,5,10,15..
	int curPos = (currentPage-1)*pageSize;
	
	//페이지당 글 리스트 시작 번호
	int num=totalRecord-curPos;
	
	
	if(pointList==null || pointList.isEmpty()){ %>
  	<tr><td colspan="5" class="align_center">글이 존재하지 않습니다.</td></tr>
  <%}else{ %>
  	<!--게시판 내용 반복문 시작  -->	
  	<%
  	//5번씩만 반복
  	for(int i=0;i<pageSize;i++){
  		if(num<1) break;
  		
  		PointVO vo=pointListList.get(curPos++);
  		num--;
  	%>	
		<tr>
			<td><%=sdf.format(vo.getPointRegdate()) %></td>
			<td><%=vo.getPointPrice() %></td>
			<td><%=vo.getPointKind() %></td>
			<%if(vo.getPointKind().equals("구매") ){ %>
				<button class = "refund">환불</button>
			<%}%>
		</tr> 
	<%}//for %>
  	<!--반복처리 끝  -->
  <%}//if %>
  
  <!-- 페이지 번호 추가 -->		
	<!-- 이전 블럭으로 이동 -->
	<%if(firstPage>1){%>
		<a href="list.jsp?currentPage=<%=firstPage-1%>">
			<img src="../images/first.JPG">
		</a>	
	<%} %>
						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%for(int i=firstPage;i<=lastPage;i++){
		if(i>totalPage) break;
	
	    if(i == currentPage){ %>
         <span style="color: blue;font-weight: bold;font-size: 1em"><%=i%></span>
   <%   }     
	}//for %>
	
	<!-- 다음 블럭으로 이동 -->
	<%if(lastPage< totalPage){%>
		<a href="list.jsp?currentPage=<%=lastPage+1%>">
			<img src="../images/last.JPG">
		</a>	
	<%} %>
	
	<!--  페이지 번호 끝 -->
%>