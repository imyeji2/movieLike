<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.collection.model.CollectionListVO"%>
<%@page import="com.semi.collection.model.CollectionListService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>

<%
	String serch = request.getParameter("serch");

	CollectionListService service = new CollectionListService();
	List<CollectionListVO> list = null;
	CollectionListVO vo = null;
	
	if(serch==null||serch.isEmpty()){
		serch="";	
		try{
			list = service.selectCollectionAll();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}else{
		try{
			list = service.serchCollectionAll(serch);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
%>
		
<script>

	function movie_write(){
		location.href="collectionWrite.jsp";
	}
	
	$(function(){
		$('#serchBtn').click(function(){
			location.href="movieList.jsp?serch=<%=serch%>";
		});
	});
</script>
				
	<section id="noticeList">
			<article id="notice_content">
				<h2>컬렉션 리스트</h2>
				
				<div class="top_btn">
					<button type="button" class="btn btn-primary" onclick="movie_write()">+ 등록하기</button>
				</div>
				
				<div class="notice_box">
					
					<div class="content_box">
						<br><br>
						<div class="bottom_input">
						<form name="serchFrm" method="get" action="collectionList.jsp">
							<div class="input-group" style="width:350px; margin: 0 auto">
							  <input type="text" class="form-control" placeholder="제목을 입력하세요." aria-label="Recipient's username" 
							  	aria-describedby="button-addon2" name="serch" title="검색어 입력" value="">
							  <button class="btn btn-outline-secondary" type="submit" id="serchBtn">검색</button>
							</div>
						</form>
							<div class="ed_btn">
								<button class="btn btn-outline-secondary" type="button" id="button-edit">수정</button>
								<button class="btn btn-outline-secondary" type="button" id="button-delete">삭제</button>
							</div>
						</div>
						<div class="search_result">           
							
						</div>
						<table class="table table-bordered">
						  <colgroup>
						      <col style="width:5%;" />
						      <col style="width:15%;" />
						      <col style="width:23%;" />
						      <col style="width:10%;" />      
						      <col style="width:10%;" />     
						   </colgroup>
						  <thead class="table-light">
						    <tr style="text-align: center">
						      <th scope="col">선택</th>
						      <th scope="col">제목</th>
						      <th scope="col">내용</th>
						      <th scope="col">영화개수</th>
						      <th scope="col">등록일</th>
						    </tr>
						  </thead>
						<tbody>
						<%
							if(list==null||list.isEmpty()){%>
								<tr style="text-align: center">
									<td colspan="5">등록된 글이 없습니다.</td>
								</tr>
						<% }else{
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
							for(int i=0; i<list.size();i++){
								vo=list.get(i);
						        String formattedDate = sdf.format(vo.getRegdate());
						        

						%>
							<tr style="text-align: center; line-height: 77px;">
								<td><input type="checkbox" name="check" value="<%=vo.getCollectionTitle()%>"></td>
								<td><a href="#"><%=vo.getCollectionTitle() %></a></td>
								<td style="text-align: left;"><a href="#"></a><%=vo.getContent()%></td>
								<td><%=vo.getCount() %></td>
								<td><%=formattedDate %></td>
							</tr>		
						<%} 
						}
						%>				
						</tbody>
					</table>
					<br><br>
					</div><!-- content -->
				</div>	
			</article>			
		</section> 
	</div><!-- admin_menu->aside, session 감싸는 div -->	
</div><!-- admin_menu->wrap -->


</body>
</html>