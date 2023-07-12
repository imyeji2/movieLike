<%@page import="com.semi.member.model.UserVO"%>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type = "text/javascript">
$(document).ready(function() {
	<%if(request.getParameter("historyPage") != null){%>
		$('#payHistory').css('display', 'block');	
		$('.content').not('#payHistory').css('display','none');
	<%}else if(request.getParameter("reviewPage") != null){%>
		$('#review').css('display', 'block');
		$('.content').not('#review').css('display','none');
	<%}else if(request.getParameter("popcornPage") != null){%>
		$('#popcorn').css('display', 'block');
		$('.content').not('#popcorn').css('display','none');
	<%}else if(request.getParameter("jjimPage") != null){%>
		$('#jjim').css('display', 'block');
		$('.content').not('#jjim').css('display','none');
	<%}%>
	
	$('*:not(span).page-link').click(function() {
	    var targetId = $(this).data('target'); // data-target 속성의 값 가져오기
	    $('.content').not(targetId).hide(); // 선택한 div를 제외한 나머지 div 숨김 처리
	    $(targetId).show(); // 선택한 div만 보이도록 처리
	    
	    // 페이지 이동 처리 (현재 페이지 URL에 쿼리 파라미터 추가)
	    var page = $(this).data('page');
	    var url = window.location.href.split('?')[0]; // 현재 페이지 URL에서 기존 쿼리 파라미터 제거
	    window.location.href = url + '?page=' + page; // 쿼리 파라미터 추가하여 페이지 이동
	  });

		$('.refund').click(function(){
			var param = $(this).val();
			window.open('refundPage.jsp?' + param, '_blank', 'resizable=no,width=500,height=500');
		});
		
		$('#buyPopcorn').click(function(){
			var param = $('#pop').val();
			window.open('chargePopcorn.jsp?userid=' + param, '_blank', 'resizable=no,width=500,height=300');
		});
		$('#wrtBtn').click(function(){
			var param = $('#writeBtn').val();
			window.open('writeReview.jsp?' + param, '_blank', 'resizable=no,width=700,height=430');
		});
		$('#removeReview').click(function(){
			if(!confirm('정말 리뷰를 삭제합니까?')){
				return false;
			}
			var windowFeatures = "width=1,height=1,left=2800,top=2800,scrollbars=no,status=no,toolbar=no,menubar=no,location=no";
			var param = $('#removeReviewVal').val();
			window.open('deleteReview.jsp?' + param, '_blank', windowFeatures);
		});
	});

	
	
</script>
<%
  int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 0;
%>
<%
	request.setCharacterEncoding("utf-8");

	String userid = (String)session.getAttribute("userId");

	if(userid == null || userid.isEmpty()){%>
		<script>
			alert('먼저 로그인 해주십시오');
			location.href = "/semi/index.jsp";
		</script>
	<%return;}

	PointService pointService = new PointService();
	PayHistoryService payHistoryService = new PayHistoryService(); 
	ReviewService reviewService = new ReviewService();
	PickService pickService = new PickService();
	UserService userService = new UserService();
	
	List<PointVO> pointList = new ArrayList<>();
	Map<PayHistoryVO, String> historyList = new HashMap<>();
	Map<ReviewVO, String> reviewMap = new HashMap<>();
	Map<PickVO, MovieVO> pickMap = new HashMap<>();
	Map<Integer, Integer> chartMap = new HashMap<>();
	UserVO userVo = new UserVO();
	
	try{
	 pointList = pointService.selectPointByUserid(userid);
	 historyList = payHistoryService.selectHistoryByUserid(userid);
	 reviewMap = reviewService.selectByUserId(userid);
	 pickMap = pickService.selectPickByUserId(userid);
	 chartMap = payHistoryService.chartValue(userid);
	 userVo = userService.selectUserByUserId(userid);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
	int mostWatchedGenreVal = 0;	//가장 많이 본 장르의 시청 수치
	int mostWatchedGenreNo = 0; 	//가장 많이 본 장르명
	int totalView = 0;				//여태 시청한 모든 영화 수
	String lastWatchedMovie = "";
	int usedPopcorn = 0;
	
	StringBuilder labels = new StringBuilder();
	StringBuilder values = new StringBuilder();
	if(chartMap != null && !chartMap.isEmpty()){
		for(Entry<Integer, Integer> elem : chartMap.entrySet()){
			labels.append("'" + elem.getKey() + "',");
			values.append(elem.getValue()+ ",");
			totalView += elem.getValue();
			if(mostWatchedGenreVal < elem.getValue()){
				mostWatchedGenreVal = elem.getValue();
				mostWatchedGenreNo = elem.getKey();
			}
		}
	}
	if(labels != null && !labels.isEmpty()){
	 labels.deleteCharAt(labels.length() - 1);
     values.deleteCharAt(values.length() - 1);
	}
	
	String mostWatchedGenre = "";
	if(mostWatchedGenreNo == 1){
		mostWatchedGenre = "로맨스";
	}else if(mostWatchedGenreNo == 2){
		mostWatchedGenre = "액션";
	}else if(mostWatchedGenreNo == 3){
		mostWatchedGenre = "공포";
	}else if(mostWatchedGenreNo == 4){
		mostWatchedGenre = "SF";
	}else if(mostWatchedGenreNo == 5){
		mostWatchedGenre = "코미디";
	}else if(mostWatchedGenreNo == 6){
		mostWatchedGenre = "애니";
	}
	
	%>


<!-- 테이블 1: 찜목록 -->
<%
	  int jjimPageSize = 10; // 찜목록 페이지당 표시할 항목 수
	  int jjimTotalCount = pickMap.size(); // 찜목록 총 항목 수
	  int jjimTotalPage = (int) Math.ceil((double) jjimTotalCount / jjimPageSize); // 찜목록 총 페이지 수
	  int jjimPage = (request.getParameter("jjimPage") != null) ? Integer.parseInt(request.getParameter("jjimPage")) : 1; // 현재 찜목록 페이지

	  // 현재 페이지에 해당하는 데이터 추출
	  List<Entry<PickVO, MovieVO>> jjimDataList = new ArrayList<>(pickMap.entrySet());
	  int jjimStartIndex = (jjimPage - 1) * jjimPageSize;
	  int jjimEndIndex = Math.min(jjimStartIndex + jjimPageSize, jjimTotalCount);
	  List<Entry<PickVO, MovieVO>> jjimPageData = jjimDataList.subList(jjimStartIndex, jjimEndIndex);
	%>

<!-- 테이블 2: 구매이력 -->
<%
	  int historyPageSize = 10; // 구매이력 페이지당 표시할 항목 수
	  int historyTotalCount = historyList.size(); // 구매이력 총 항목 수
	  int historyTotalPage = (int) Math.ceil((double) historyTotalCount / historyPageSize); // 구매이력 총 페이지 수
	  int historyPage = (request.getParameter("historyPage") != null) ? Integer.parseInt(request.getParameter("historyPage")) : 1; // 현재 구매이력 페이지
		
	  
	  
	  
	  // 현재 페이지에 해당하는 데이터 추출
	  List<Entry<PayHistoryVO, String>> historyDataList = new ArrayList<>(historyList.entrySet());
	  int historyStartIndex = (historyPage - 1) * historyPageSize;
	  int historyEndIndex = Math.min(historyStartIndex + historyPageSize, historyTotalCount);
	  List<Entry<PayHistoryVO, String>> historyPageData = historyDataList.subList(historyStartIndex, historyEndIndex);
	%>

<!-- 테이블 3: 팝콘 충전/환불 이력 -->
<%
	  int popcornPageSize = 10; // 팝콘 충전/환불 이력 페이지당 표시할 항목 수
	  int popcornTotalCount = pointList.size(); // 팝콘 충전/환불 이력 총 항목 수
	  int popcornTotalPage = (int) Math.ceil((double) popcornTotalCount / popcornPageSize); // 팝콘 충전/환불 이력 총 페이지 수
	  int popcornPage = (request.getParameter("popcornPage") != null) ? Integer.parseInt(request.getParameter("popcornPage")) : 1; // 현재 팝콘 충전/환불 이력 페이지

	  // 현재 페이지에 해당하는 데이터 추출
	  int popcornStartIndex = (popcornPage - 1) * popcornPageSize;
	  int popcornEndIndex = Math.min(popcornStartIndex + popcornPageSize, popcornTotalCount);
	  List<PointVO> popcornPageData = pointList.subList(popcornStartIndex, popcornEndIndex);
	%>

<!-- 테이블 4: 리뷰 목록 -->
<%
	  int reviewPageSize = 10; // 리뷰 목록 페이지당 표시할 항목 수
	  int reviewTotalCount = reviewMap.size(); // 리뷰 목록 총 항목 수
	  int reviewTotalPage = (int) Math.ceil((double) reviewTotalCount / reviewPageSize); // 리뷰 목록 총 페이지 수
	  int reviewPage = (request.getParameter("reviewPage") != null) ? Integer.parseInt(request.getParameter("reviewPage")) : 1; // 현재 리뷰 목록 페이지
		
	  // 현재 페이지에 해당하는 데이터 추출
	  List<Entry<ReviewVO, String>> reviewDataList = new ArrayList<>(reviewMap.entrySet());
	  int reviewStartIndex = (reviewPage - 1) * reviewPageSize;
	  int reviewEndIndex = Math.min(reviewStartIndex + reviewPageSize, reviewTotalCount);
	  List<Entry<ReviewVO, String>> reviewPageData = reviewDataList.subList(reviewStartIndex, reviewEndIndex);
	%>
<%
		String realUser = userVo.getUserId().split("@")[0];

		/* 서다희 정보수정때 필요한 것 */
		String userId = userVo.getUserId();
		String name = userVo.getName();
		String pwd = userVo.getPwd();
		String gender = userVo.getGender();
		String birth = userVo.getBirth();
		
		
		DecimalFormat df = new DecimalFormat("#,###");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	%>





<section id="myPageSection">
	<div class="myPageMain">
		<div id="myPageHeader" class="main">
			<div style="height: 100%; width: 100%;">
				<img src="../images/login-bg.png" class="profileBackground" style="position: absolute;">
					<div class="popcornTxt">
						<h4 class = "userInfoTxt">ID : <%=realUser%>팝콘 : <%=userVo.getPoint()/100 %>개</h4>
						<button type="button" class="btn btn-success" id = "buyPopcorn">팝콘충전</button>
						<input type="hidden" value="<%=userVo.getUserId()%>" id = "pop"> 
					</div>
				</div>
			</div>
			
		</div>
		<div id="myPageBody" class="main">
			<div id="bodyBar">
				<nav id="myPageMenu">
					<a href="javascript:void(0)" onclick="showContent(0);">비밀번호 변경</a> <a
						href="javascript:void(0)" onclick="showContent(1);">찜목록</a> <a
						href="javascript:void(0)" onclick="showContent(2);">구매이력</a> <a
						href="javascript:void(0)" onclick="showContent(3);">팝콘(충전/이력)</a>
					<a href="javascript:void(0)" onclick="showContent(4);">리뷰관리</a> 
					<a href="javascript:void(0)" onclick="showContent(5);">통계</a>
					<div id="horizontal-underline"></div>
				</nav>
			</div>
			<div class="mainContent">
				<div class="content" style="display: none" id="myInfo" style="<%= (currentPage == 0) ? "display: block" : "display: none" %>">
					<%@ include file="UserEdit.jsp" %>
				</div>
				<!-- 정보수정 -->
				<div class="content" style="display: none" id="jjim" style="<%= (currentPage == 1) ? "display: block" : "display: none" %>">
					<%
						if(pickMap != null && !pickMap.isEmpty()){
							for(Entry<PickVO, MovieVO> elem : pickMap.entrySet()){
				            	PickVO PickVo = elem.getKey();
				            	MovieVO movieVo = elem.getValue();%>
								<a href="<%=request.getContextPath() %>/movie/movieDetail.jsp?no=<%=movieVo.getMovieNo() %>">
									<div class="movieItemBox"><!-- 리스트 중 1개  -->
										<div><!-- 기본box -->
											<div class="movieImg img-thumbnail">
												<img src="../images/movie/poster/<%=movieVo.getPoster()%>">
												<div class="movieItemBox_hover img-thumbnail"><!-- hover box -->
													<p class="movieItemBox_hover_tit"><%=movieVo.getTitle() %></p>
												</div><!-- hover box -->	
											</div>
										</div><!-- 기본box -->
										<p class="movieItemBox_info1 text-truncate"><%=movieVo.getTitle() %></p>
									</div><!-- 리스트 중 1개 -->
								</a>
							<%}
						}%>
					<!-- 페이징 처리 -->
					<div class="pagination" style = "justify-content: center;">
						<% if (jjimPage > 1) { %>
							<a href="?jjimPage=<%= jjimPage - 1 %>" class="page-link">이전</a>
						<% } %>
						<% for (int i = 1; i <= jjimTotalPage; i++) { %>
							<% if (jjimPage == i) { %>
								<span class="page-link current"><%= i %></span>
							<% } else { %>
								<a href="?jjimPage=<%= i %>&" class="page-link"><%= i %></a>
							<% } %>
						<% } %>
						<% if (jjimPage < jjimTotalPage) { %>
							<a href="?jjimPage=<%= jjimPage + 1 %>" class="page-link">다음</a>
						<% } %>
					</div>
				</div>
			</div>
			<!-- 찜목록 -->
			<!-- 테이블 2: 구매이력 -->
			<div class="content" style="display: none" id="payHistory" style="<%= (currentPage == 2) ? "display: block" : "display: none" %>">
				  <table class="table table-striped table-bordered table-hover table-light thead-dark">
					    <tr>
						      <th class="dateCol">영화결제일</th>
						      <th>결제번호</th>
						      <th>영화제목</th>
						      <th>리뷰관리</th>
						      
					    </tr>
						    <% for (Entry<PayHistoryVO, String> elem : historyPageData) {
						          PayHistoryVO vo = elem.getKey();
						          String title = elem.getValue();
						          lastWatchedMovie = title;%>
							    <tr>
								      <td><%= sdf.format(vo.getHisRegdate()) %></td>
								      <td><%=vo.getHisNo() %></td>
								      <td><%=title%></td>
								      <%if(!reviewService.isReview(vo.getMovieNo(), userid)){%>
								      <input type="hidden" id="writeBtn" value="userid=<%=userVo.getUserId()%>&movieNo=<%=vo.getMovieNo()%>">
								      <td> <button type="button" id="wrtBtn" class="btn btn-success">리뷰작성하기</button></td>
								      <%}else{%>
								      <input type="hidden" id="watchBtn" value="<%=vo.getMovieNo()%>">
								      <td><button type="button"  id="wtcBtn" class="btn btn-light">리뷰보러가기</button></td>
								      <%} %>
							    </tr>
						    <% } %>
					  </table>
			  	
					  <!-- 페이징 처리 -->
					  <div class="pagination" style = "justify-content: center;">
						    <% if (historyPage > 1) { %>
						      		<a href="?historyPage=<%= historyPage - 1 %>" class="page-link">이전</a>
						    <% } %>
						    <% for (int i = 1; i <= historyTotalPage; i++) { %>
						      <% if (historyPage == i) { %>
							        	<span class="page-link current"><%= i %></span>
							      <% } else { %>
							        	<a href="?historyPage=<%= i %>" class="page-link"><%= i %></a>
							      <% } %>
						    <% } %>
						    <% if (historyPage < historyTotalPage) { %>
						      		<a href="?historyPage=<%= historyPage + 1 %>" class="page-link">다음</a>
						    <% } %>
					  </div>
			</div>
			<!-- 영화 구매 이력 -->
			<div class="content" style="display: none" id="popcorn" style="<%= (currentPage == 3) ? "display: block" : "display: none" %>">

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
							<button class="refund" value="no=<%=vo.getPointno()%>&price=<%=vo.getPointPrice()%>&userid=<%=vo.getUserId()%>">
								환불
							</button> 
							<%}else if(vo.getPointKind().equals("환불")){%>
							<button class="refunded" disabled>
								환불완료
							</button>
							<%} %>
						</td>
					</tr>
					<%}
						}%>
				</table>
				 <div class="pagination" style = "justify-content: center;">
				    <% if (popcornPage > 1) { %>
				      <a href="?popcornPage=<%= popcornPage - 1 %>" class="page-link">이전</a>
				    <% } %>
				    <% for (int i = 1; i <= popcornTotalPage; i++) { %>
				      <% if (popcornPage == i) { %>
				        <span class="page-link current"><%= i %></span>
				      <% } else { %>
				        <a href="?popcornPage=<%= i %>" class="page-link"><%= i %></a>
				      <% } %>
				    <% } %>
				    <% if (popcornPage < popcornTotalPage) { %>
				      <a href="?popcornPage=<%= popcornPage + 1 %>" class="page-link">다음</a>
				    <% } %>
			  	</div>
			</div>
			<!-- 팝콘 충전/환불 이력 -->
			<div class="content" style="display: none" id="review" style="<%= (currentPage == 4) ? "display: block" : "display: none" %>">
				<table
					class="table table-striped table-bordered table-hover table-light thead-dark">
					<tr>
						<th>영화이름</th>
						<th>리뷰내용(간소화)</th>
						<th>관리</th>
					</tr>
					<%
						if(reviewMap != null && !reviewMap.isEmpty()){
							for(Entry<ReviewVO, String> elem : reviewMap.entrySet()){
				            	ReviewVO vo = elem.getKey();
								String movieTitle = elem.getValue();%>
					<tr>
						<td><%=movieTitle %></td>
						<td><%=vo.getComments() %></td>
						<input type = "hidden" id = "removeReviewVal" value="reviewNo=<%=vo.getReviewNo()%>">
						<td><button type="button" id="removeReview" class="btn btn-danger">리뷰삭제</button></td>
					</tr>
					<%}
						}%>
				</table>
				 <!-- 페이징 처리 -->
				  <div class="pagination" style = "justify-content: center;">
				    <% if (reviewPage > 1) { %>
				      <a href="?reviewPage=<%= reviewPage - 1 %>" class="page-link">이전</a>
				    <% } %>
				    <% for (int i = 1; i <= reviewTotalPage; i++) { %>
				      <% if (reviewPage == i) { %>
				        <span class="page-link current"><%= i %></span>
				      <% } else { %>
				        <a href="?reviewPage=<%= i %>" class="page-link"><%= i %></a>
				      <% } %>
				    <% } %>
				    <% if (reviewPage < reviewTotalPage) { %>
				      <a href="?reviewPage=<%= reviewPage + 1 %>" class="page-link">다음</a>
				    <% } %>
				  </div>
			</div>
			<!-- 리뷰 목록 -->
			<div class="content" style="display: block" id="statistics">
				<div class="briefStatisticBlock">
					<div
						style="width: 48%; border-right: white solid 7px; border-radius: 2px;"
						class="bsb">
						<h3>총 시청</h3>
					</div>
					<div style="width: 50%;" class="bsb">
						<h3><%=totalView%>편
						</h3>
					</div>

					<div
						style="width: 48%; border-right: white solid 7px; border-radius: 2px;"
						class="bsb">
						<h3>많이 본 장르</h3>
					</div>
					<div style="width: 50%;" class="bsb">
						<h3><%=mostWatchedGenre %></h3>
					</div>

					<div
						style="width: 48%; border-right: white solid 7px; border-radius: 2px;"
						class="bsb">
						<h3>마지막 시청</h3>
					</div>
					<div style="width: 50%;" class="bsb">
						<h3><%=lastWatchedMovie%></h3>
					</div>

					<div
						style="width: 48%; border-right: white solid 7px; border-radius: 2px;"
						class="bsb">
						<h3>보유중인 팝콘</h3>
					</div>
					<div style="width: 50%;" class="bsb">
						<h3><%=userVo.getPoint()/100%>개</h3>
					</div>

					<div
						style="width: 48%; border-right: white solid 7px; border-radius: 2px;"
						class="bsb">
						<h3>전체 튀긴 팝콘</h3>
					</div>
					<div style="width: 50%;" class="bsb">
						<% if(usedPopcorn/100 == 0){%>
							<h3>팝콘 상자가 텅...</h3>
						<%}else if(usedPopcorn/100 > 1000){%>
						<h3><%=df.format(usedPopcorn/100)%>개나 튀겼어요!</h3>
						<%}else if(usedPopcorn/100 > 2000){%>
						<h3><%=df.format(usedPopcorn/100)%>개나 튀겼어요!!</h3>
						<%}else if(usedPopcorn/100 > 3000){%>
						<h3><%=df.format(usedPopcorn/100)%>개나 튀겼어요!!</h3>
						<%}else{%>
							<h3><%=df.format(usedPopcorn/100)%>개 튀겼어요</h3>
						<%} %>
					</div>
				</div>

				<div class="phppot-container">
					<div>
						<canvas id="doughnut-chart" style="height: 20vw; width: 20vw;"></canvas>
					</div>
				</div>
				<div class="phppot-container">
					<div>
						<canvas id="bar-chart" style="height: 20vw; width: 20vw;"></canvas>
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
new Chart(document.getElementById("doughnut-chart"), {
	type : 'doughnut',	//그래프 타입 : 파이차트
	data : {
		labels : [<%=labels.toString()%>],	//영화 장르(통계에 사용될 데이터의 이름들)
		datasets : [ {
			backgroundColor : [ 
				"rgba(255, 99, 132, 0.5)",
				"rgba(54, 162, 235, 0.5)",
				"rgba(255, 206, 86, 0.5)",
				"rgba(75, 192, 192, 0.5)",
				"rgba(153, 102, 255, 0.5)",
				"rgba(255, 159, 64, 0.5)"],
			borderColor : [
				"rgba(255, 99, 132, 1)",
				"rgba(54, 162, 235, 1)",
				"rgba(255, 206, 86, 1)",
				"rgba(75, 192, 192, 1)",
				"rgba(153, 102, 255, 1)",
				"rgba(255, 159, 64, 1)"],
			data : [<%=values%>]		//데이터의 수치들
		} ]
	},
	options : {
		responsive: false,
		scale:{
			y:{
				beginzero:true
			}
		}
	}
});
new Chart(document.getElementById("bar-chart"), {
	type : 'bar',	//그래프 타입 : 파이차트
	data : {
		labels : [<%=labels.toString()%>],	//영화 장르(통계에 사용될 데이터의 이름들)
		datasets : [ {
			backgroundColor : [ 
				"rgba(255, 99, 132, 0.7)",
				"rgba(54, 162, 235, 0.7)",
				"rgba(255, 206, 86, 0.7)",
				"rgba(75, 192, 192, 0.7)",
				"rgba(153, 102, 255, 0.7)",
				"rgba(255, 159, 64, 0.7)"],
			borderColor : [
				"rgba(255, 99, 132, 1)",
				"rgba(54, 162, 235, 1)",
				"rgba(255, 206, 86, 1)",
				"rgba(75, 192, 192, 1)",
				"rgba(153, 102, 255, 1)",
				"rgba(255, 159, 64, 1)"],
			data : [<%=values%>],	//데이터의 수치들
			label :'장르별 영화 감상 비율'
		} ]
	},
	options : {
		responsive: false,
			scale:{
				y:{
					beginzero:true
				}
			}
	}
});
</script>

<script src="myPageBarAni.js"></script>
<%@ include file="../inc/bottom.jsp"%>