<%@page import="com.semi.review.model.ReviewService"%>
<%@page import="com.semi.payHistory.model.PayHistoryService"%>
<%@page import="com.semi.point.model.PointService"%>
<%@page import="com.semi.pick.PickService"%>
<%@page import="com.semi.movie.model.MovieVO"%>
<%@page import="com.semi.pick.PickVO"%>
<%@page import="com.semi.review.model.ReviewDAO"%>
<%@page import="com.semi.review.model.ReviewVO"%>
<%@page import="com.semi.point.model.PointDAO"%>
<%@page import="com.semi.payHistory.model.PayHistoryDAO"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.semi.payHistory.model.PayHistoryVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.point.model.PointVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp"%>


<%
	String userid = "testId";

	PointService pointService = new PointService();
	PayHistoryService payHistoryService = new PayHistoryService(); 
	ReviewService reviewService = new ReviewService();
	PickService pickService = new PickService();
	
	List<PointVO> pointList = new ArrayList<>();
	Map<PayHistoryVO, Integer> historyList = new HashMap<>();
	Map<ReviewVO, String> reviewMap = new HashMap<>();
	Map<PickVO, MovieVO> pickMap = new HashMap<>();
	 
	try{
	 pointList = pointService.selectPointByUserid(userid);
	 historyList = payHistoryService.selectHistoryByUserid(userid);
	 reviewMap = reviewService.selectByUserId(userid);
	 pickMap = pickService.selectPickByUserId(userid);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	int totalHistoryRecord=pointList.size();
	int pageSize=0;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<section class = "myPageSection">
	<div class="myPageMain">
		<div id="myPageHeader" class="main" style="overflow: hidden">
			<div id="profileImg"></div>
		</div>
		<div id="myPageBody" class="main">
			<div id="bodyBar">
			  <nav id = "myPageMenu">
			        <a href="javascript:void(0);" onclick = "showContent(0);">내정보수정</a>
			        <a href="javascript:void(0);" onclick = "showContent(1);">찜목록</a>
			        <a href="javascript:void(0);" onclick = "showContent(2);">구매이력</a>
			        <a href="javascript:void(0);" onclick = "showContent(3);">팝콘(충전/이력)</a>
			        <a href="javascript:void(0);" onclick = "showContent(4);">리뷰관리</a>
		        <div id="horizontal-underline"></div>
		   	 </nav>
			</div>
			<div class = "mainContent">
				<div class = "content" style = "display : none" id = "myInfo">
					<!-- 정보수정 -->		
				</div>
				<div class = "content" style = "display : none" id = "jjim">
					<!-- 찜목록 -->
					<%
						if(pickMap != null && !pickMap.isEmpty()){
							for(Entry<PickVO, MovieVO> elem : pickMap.entrySet()){
				            	PickVO PickVo = elem.getKey();
								MovieVO title = elem.getValue();%>
								<div class="card"">
			  						<img src="..." class="card-img-top" alt="...">
								  		<div class="card-body">
								    		<h5 class="card-title"style = "color:black;"><%=title.getTitle() %></h5>
								    		<p class="card-text" style = "color:black;">시놉시스가 들어갈 자리 입니다</p>
								    		<a href="#" class="btn btn-primary">리뷰보러가기</a>
								 	 	</div>
								</div>
							<%}
						}%>
				</div>	
				<div class = "content" style = "display : none" id = "payHistory">
					<!-- 영화 구매 이력 -->
					<table class="table table-striped table-bordered table-hover table-light thead-dark">
						<tr>
							<th class ="dateCol">영화결제일</th><th>결제번호</th><th>금액</th><th>영화번호</th>
						</tr>
						<%
						if(historyList != null && !historyList.isEmpty()){
							for(Entry<PayHistoryVO, Integer> elem : historyList.entrySet()){
				            	PayHistoryVO vo = elem.getKey();
								int price = elem.getValue();%>
								<tr>
									<td><%=sdf.format(vo.getHisRegdate()) %></td><td><%=vo.getHisNo() %></td><td><%=price %></td><td><%=vo.getMovieNo() %></td>
								</tr>
							<%}
						}%>
					</table>
				</div>
				<div class = "content" style = "display : none" id = "popcorn">
					<!-- 팝콘 충전/환불 이력 -->
					<table class="table table-striped table-bordered table-hover table-light">
						<tr>
							<th class ="dateCol">팝콘충전일</th><th>금액</th><th>구분</th><th>환불</th>
						</tr>
						<%
						pageSize = 15;
						if(pointList != null && !pointList.isEmpty()){
							for(int i = 0; i < pageSize; i++){
							PointVO vo = pointList.get(i);%>
								<tr>
									<td><%=sdf.format(vo.getPointRegdate()) %></td>
									<td><%=vo.getPointPrice() %></td>
									<td><%=vo.getPointKind() %></td>
									<td>
										<%if(vo.getPointKind().equals("충전") ){ %>
											<button class = "refund">환불</button>
										<%}%>
									</td>
								</tr>								
							<%}
						}%>
					</table>
				</div>
				<div class = "content" style = "display : none" id = "review">
					<!-- 리뷰 목록 -->
					<table class="table table-striped table-bordered table-hover table-light thead-dark">
						<tr>
							<th>영화이름</th><th>리뷰내용(간소화)</th>
						</tr>
						<%
						if(reviewMap != null && !reviewMap.isEmpty()){
							for(Entry<ReviewVO, String> elem : reviewMap.entrySet()){
				            	ReviewVO vo = elem.getKey();
								String movieTitle = elem.getValue();%>
								<tr>
									<td><%=movieTitle %></td><td><%=vo.getComments() %></td>
								</tr>
							<%}
						}%>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="myPage.js"></script>
<%@ include file="../inc/bottom.jsp"%>
