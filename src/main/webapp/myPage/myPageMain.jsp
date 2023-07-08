<%@page import="java.text.DecimalFormat"%>
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
	Map<PayHistoryVO, String> historyList = new HashMap<>();
	Map<ReviewVO, String> reviewMap = new HashMap<>();
	Map<PickVO, MovieVO> pickMap = new HashMap<>();
	Map<String, Integer> chartMap = new HashMap<>();
	 
	try{
	 pointList = pointService.selectPointByUserid(userid);
	 historyList = payHistoryService.selectHistoryByUserid(userid);
	 reviewMap = reviewService.selectByUserId(userid);
	 pickMap = pickService.selectPickByUserId(userid);
	 chartMap = payHistoryService.chartValue(userid);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
	int mostWatchedGenreVal = 0;	//가장 많이 본 장르의 시청 수치
	String mostWatchedGenre = ""; 	//가장 많이 본 장르명
	int totalView = 0;				//여태 시청한 모든 영화 수
	String lastWatchedMovie = "";
	int usedPopcorn = 0;
	
	StringBuilder labels = new StringBuilder();
	StringBuilder values = new StringBuilder();
	if(chartMap != null && !chartMap.isEmpty()){
		for(Entry<String, Integer> elem : chartMap.entrySet()){
			labels.append("'" + elem.getKey() + "',");
			values.append(elem.getValue()+ ",");
			totalView += elem.getValue();
			if(mostWatchedGenreVal < elem.getValue()){
				mostWatchedGenreVal = elem.getValue();
				mostWatchedGenre = elem.getKey();
			}
		}
	}
	if(labels != null && !labels.isEmpty()){
	 labels.deleteCharAt(labels.length() - 1);
     values.deleteCharAt(values.length() - 1);
	}
	

	DecimalFormat df = new DecimalFormat("#,###");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<section id="myPageSection">
	<div class="myPageMain">
		<div id="myPageHeader" class="main">
			
			<div id="setting">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
				  <path
						d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z" />
				  <path
						d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z" />
				</svg>
			</div>
			<div id="profileImg"></div>
			<div class="profileLogo">
				<img src="../images/logo-white.png" style = "height: 100%; widows: 100%;">
			</div>
			<div style="height: 100%; width : 100%;">
				<img src="../images/login-bg.png" class="profileBackground">
			</div>
		</div>
		<div id="myPageBody" class="main">
			<div id="bodyBar">
				<nav id="myPageMenu">
					<a href="javascript:void(0);" onclick="showContent(0);">내정보수정</a> <a
						href="javascript:void(0);" onclick="showContent(1);">찜목록</a> <a
						href="javascript:void(0);" onclick="showContent(2);">구매이력</a> <a
						href="javascript:void(0);" onclick="showContent(3);">팝콘(충전/이력)</a>
					<a href="javascript:void(0);" onclick="showContent(4);">리뷰관리</a> <a
						href="javascript:void(0);" onclick="showContent(5);">통계</a>
					<div id="horizontal-underline"></div>
				</nav>
			</div>
			<div class="mainContent">
				<div class="content" style="display: none" id="myInfo">
					<div class="myInfocheck">
						<h1>비밀번호 확인</h1>
						<form class="was-validated">
						  <div class="mb-3">
							    <label for="validationTextarea" class="form-label">비밀번호</label>
							    <input type = "password" class="form-control" id="validationTextarea" placeholder="비밀번호를 입력하세요" required></textarea>
							    <div class="invalid-feedback">
							      	당신의 현재 비밀번호를 입력하세요
							    </div>
						  </div>
						  <button type="button" class="btn btn-success btn-lg">확인</button>
					</div>
				</div>
					<!-- 정보수정 -->
				<div class="content" style="display: none" id="jjim">
					<%
						if(pickMap != null && !pickMap.isEmpty()){
							for(Entry<PickVO, MovieVO> elem : pickMap.entrySet()){
				            	PickVO PickVo = elem.getKey();
				            	MovieVO title = elem.getValue();%>
					<div class="card"">
						<img src="../images/movie/poster/그시절, 우리가 좋아했던 소녀_포스터.jpg"
							class="card-img-top" alt="...">
						<div class="card-body">
							<h4 class="card-title" style="color: black;"><%=title.getTitle() %></h4>
							<p class="card-text" style="color: black;">시놉시스가 들어갈 자리 입니다</p>
							<a href="#" class="btn btn-primary">리뷰보러가기</a>
						</div>
					</div>
					<%}
						}%>
				</div>
						<!-- 찜목록 -->
				<div class="content" style="display: none" id="payHistory">
					
					<table style="height:100%"
						class="table table-striped table-bordered table-hover table-light thead-dark">
						<tr>
							<th class="dateCol">영화결제일</th>
							<th>결제번호</th>
							<th>금액</th>
							<th>영화제목</th>
						</tr>
						<%
						if(historyList != null && !historyList.isEmpty()){
							for(Entry<PayHistoryVO, String> elem : historyList.entrySet()){
				            	PayHistoryVO vo = elem.getKey();
								String title = elem.getValue();
								lastWatchedMovie = elem.getValue();
								%>
								
						<tr>
							<td><%=sdf.format(vo.getHisRegdate()) %></td>
							<td><%=vo.getHisNo() %></td>
							<td><%=title %></td>
							<td><%=vo.getMovieNo() %></td>
						</tr>
						<%}
						}%>
					</table>
				</div>
				<!-- 영화 구매 이력 -->
				<div class="content" style="display: none" id="popcorn">
					
					<table
						class="table table-striped table-bordered table-hover table-light">
						<tr>
							<th class="dateCol">팝콘충전일</th>
							<th>금액</th>
							<th>구분</th>
							<th>환불</th>
						</tr>
						<%
						//pageSize = 15;
						if(pointList != null && !pointList.isEmpty()){
							for(int i = 0; i < pointList.size(); i++){
							PointVO vo = pointList.get(i);
							usedPopcorn += vo.getPointPrice();%>
						<tr>
							<td><%=sdf.format(vo.getPointRegdate()) %></td>
							<td><%=vo.getPointPrice() %></td>
							<td><%=vo.getPointKind() %></td>
							<td>
								<%if(vo.getPointKind().equals("충전") ){ %>
								<button class="refund">환불</button> <%}%>
							</td>
						</tr>
						<%}
						}%>
					</table>
				</div>
				<!-- 팝콘 충전/환불 이력 -->
				<div class="content" style="display: none" id="review">
					<table
						class="table table-striped table-bordered table-hover table-light thead-dark">
						<tr>
							<th>영화이름</th>
							<th>리뷰내용(간소화)</th>
						</tr>
						<%
						if(reviewMap != null && !reviewMap.isEmpty()){
							for(Entry<ReviewVO, String> elem : reviewMap.entrySet()){
				            	ReviewVO vo = elem.getKey();
								String movieTitle = elem.getValue();%>
						<tr>
							<td><%=movieTitle %></td>
							<td><%=vo.getComments() %></td>
						</tr>
						<%}
						}%>
					</table>
				</div>
				<!-- 리뷰 목록 -->
				<div class="content" style="display: block" id="statistics">
					<div  class = "briefStatisticBlock">
						<div style="width:48%; border-right: white solid 2px;" class = "bsb">
							<h4>가장 많이 본 장르</h4>
						</div>
						<div style="width:50%;" class = "bsb"><h4><%=mostWatchedGenre %></h4></div>
						
						<div style="width:48%; border-right: white solid 2px;" class = "bsb">
							<h4>총 시청</h4>
						</div>
						<div style="width:50%;" class = "bsb"><h4><%=totalView%>편</h4></div>
						
						<div style="width:48%; border-right: white solid 2px;" class = "bsb">
							<h4>마지막 시청</h4>
						</div>
						<div style="width:50%;" class = "bsb"><h4><%=lastWatchedMovie%></h4></div>

						<div style="width:48%; border-right: white solid 2px;" class = "bsb">
							<h4>전체 튀긴 팝콘</h4>
						</div>
						<div style="width:50%;" class = "bsb"><h4><%=df.format(usedPopcorn/100)%></h4></div>
					</div>
					
					<div class="phppot-container">
						<div>
							<canvas id="pie-chart"  style="height:20vw; width:20vw;"></canvas>
						</div>
					</div>
				</div>
				<!-- 통계 -->
			</div>
		</div>
	</div>

</section>


<script
	src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1/dist/chart.umd.min.js"></script>
<script>
//통계 그래프 생성하는 자바스크립트메서드
new Chart(document.getElementById("pie-chart"), {
	type : 'pie',	//그래프 타입 : 파이차트
	data : {
		labels : [<%=labels.toString()%>],	//영화 장르(통계에 사용될 데이터의 이름들)
		datasets : [ {
			backgroundColor : [ "#51EAEA", "#FCDDB0",
					"#FF9D76", "#FB3569", "#82CD47" ],
			data : [<%=values%>]		//데이터의 수치들
		} ]
	},
	options : {
		responsive: false,
		title : {
			display : true,
			text : 'Chart JS Pie Chart Example'
		}
	}
});
</script>

<script src="myPageBarAni.js"></script>
<%@ include file="../inc/bottom.jsp"%>
