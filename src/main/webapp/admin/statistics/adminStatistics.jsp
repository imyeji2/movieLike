<%@page import="java.text.DecimalFormat"%>
<%@page import="com.semi.point.model.PointService"%>
<%@page import="com.semi.payHistory.model.PayHistoryService"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.semi.movie.model.MovieService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>
<style type = "text/css">
#noticeList{
	font-size:27px;
	font-weight:bold;
	.container, .container-lg, .container-md, .container-sm, .container-xl, .container-xxl {
    max-width: 85%;
}
.row{
}
	.text-center {
    padding: 0% 1% 1% 1%;
    text-align: center!important;
}
	.row {
    --bs-gutter-x: 1.5rem;
    --bs-gutter-y: 0;
    display: flex;
    flex-wrap: wrap;
    margin-top: calc(-1 * var(--bs-gutter-y));
    margin-right: calc(-.5 * var(--bs-gutter-x));
    margin-left: calc(-.5 * var(--bs-gutter-x));
    margin-bottom: 0.6em;
	}
	.phppot-container{
		      display: inline-table;
		    width: 46%;
		    margin: 3% 6% 0% 0%;
		    padding: 2% 4% 3% 3%;
		    border: 1px solid white;
		    border-radius: 1rem;
		    box-shadow: 0 0 16px rgba(0, 0, 0, 0.8);
		}
	   #upperBox-categoryBox{
	   		margin:1% 1% 1% 1%;
	   		
	   }
	   .col-2 {
	     flex: 0 0 auto;
	    width: 6.666667%;
	}
	#titleCol {
	        width: 93%
	}
	.row{
		margin:bottom 2%;
	}
	#totalIncome-left{
	
	}
	#totalIncome-right{
	
	}
	#Income-left{
	
	}
	#Income-right{
	
	}
}
</style>
<%
	MovieService movieService = new MovieService();
	PayHistoryService payService = new PayHistoryService();
	PointService pointService = new PointService();
		
	Map<String, Integer> GenreMap = new HashMap();
	Map<String, Integer> TitleMap = new HashMap();
	
	GenreMap = movieService.getRankByCategory();
	TitleMap = payService.getRankByTitle();
	
	String[][] categoryVal = new String[6][2];
	String[][] titleVal = new String[10][2];
	int i = 0;
	StringBuilder labels = new StringBuilder();
	StringBuilder values = new StringBuilder();

	StringBuilder labels2 = new StringBuilder();
	StringBuilder values2 = new StringBuilder();
	
	if(GenreMap != null && !GenreMap.isEmpty()){
		for(Entry<String, Integer> elem : GenreMap.entrySet()){
			categoryVal[i][0] = elem.getKey();
			categoryVal[i][1] = Integer.toString(elem.getValue());
			labels.append("'" + elem.getKey() + "',");
			values.append(elem.getValue()+ ",");
			i++;
		}
	}
	
	if(labels != null && !labels.isEmpty()){
		 labels.deleteCharAt(labels.length() - 1);
	     values.deleteCharAt(values.length() - 1);
		}
	
	i=0;
	if(TitleMap != null && !TitleMap.isEmpty()){
		for(Entry<String, Integer> elem : TitleMap.entrySet()){
			titleVal[i][0] = elem.getKey();
			titleVal[i][1] = Integer.toString(elem.getValue());
			labels2.append("'" + elem.getKey() + "',");
			values2.append(elem.getValue()+ ",");
			i++;
		}
	}
	System.out.println(values2.length());
	if(labels2 != null && !labels2.isEmpty()){
		 labels2.deleteCharAt(labels2.length() - 1);
	     values2.deleteCharAt(values2.length() - 1);
		}
	
	
	DecimalFormat df = new DecimalFormat("#,###");
	
	int totalPopcorn = pointService.totalPrice();
	int totalMovieIncome = payService.totalMovieIncome();

%>
		<section id="noticeList">
		<div class="container text-center" style="border:grey solid 1px;">
			<div class="container text-center" style="margin-top:2%; padding-top:1%;">
				  <div class="row">
					    <div class="col">
					     	<div class="input-group input-group-lg">
								  <span class="input-group-text" id="inputGroup-sizing-lg">누적충전금액</span>
								  <input type="text" class="form-control" value = "<%=df.format(totalPopcorn) %>원"aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
							</div>
					    </div>
					    <div class="col">
					     	<div class="input-group input-group-lg">
								  <span class="input-group-text" id="inputGroup-sizing-lg">누적판매금액</span>
								  <input type="text" class="form-control" value = "<%=df.format(totalMovieIncome) %>원"aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
							</div>
					    </div>
					    <div class="col">
					     	<div class="input-group input-group-lg">
								  <span class="input-group-text" id="inputGroup-sizing-lg">총매출액</span>
								  <input type="text" class="form-control" value = "<%=df.format(totalPopcorn+totalMovieIncome) %>원" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
							</div>
					    </div>
				  </div>
			</div>
		
			
			 <div class="row" id = "upperBox-categoryBox" style="margin-left:5%">
				 <div class="row" style="margin-bottom:1%;">
				 		<h1>장르별 매출 순위</h1>
				 </div>
			    <div class="col-8"  style="padding-top:2%;">
			    	<div class="row">
			    		<div class="col-2"><%=categoryVal[0][1]%></div><div class="col-4" id = "titleCol"><%=categoryVal[0][0]%></div>
			    	</div>
			    	<hr>
					<div class="row">
			    		<div class="col-2"><%=categoryVal[1][1]%></div><div class="col-4" id = "titleCol"><%=categoryVal[1][0]%></div>
					</div>
			    	<hr>
					<div class="row">
			    		<div class="col-2"><%=categoryVal[2][1]%></div><div class="col-4" id = "titleCol"><%=categoryVal[2][0]%></div>
			    	</div>
			    	<hr>
			    	<div class="row">
			    		<div class="col-2"><%=categoryVal[3][1]%></div><div class="col-4" id = "titleCol"><%=categoryVal[3][0]%></div>
			    	</div>
			    	<hr>
			    	<div class="row">
			    		<div class="col-2"><%=categoryVal[4][1]%></div><div class="col-4" id = "titleCol"><%=categoryVal[4][0]%></div>
			    	</div>
			    	<hr>
			    	<div class="row">
			    		<div class="col-2"><%=categoryVal[5][1]%></div><div class="col-4" id = "titleCol"><%=categoryVal[5][0]%></div>
		    		</div>
			    	<hr>
			    </div>
			    <div class="col-4"  id = "upperBox-graphBox">
			    <div class="phppot-container">
					<div>
						<canvas id="bar-chart" style="height: 17vw; width: 17vw;"></canvas>
					</div>
				</div>
			    </div>
			  </div>
	<!-- -------------------------------------------------------------------------------------------------- -->
			   <div class="row" id = "upperBox-categoryBox" style="margin-left:5%; margin-top:2%;">
			    <div class="row" >
				 		<h1>영화별 매출 순위</h1>
				 </div>
			    <div class="col-8">
			    	<div class="row">
			    		<div class="col-2"><%=titleVal[0][1]%></div><div class="col-4" id = "titleCol"><%=titleVal[0][0]%></div>
			    	</div>
			    	<hr>
					<div class="row">
			    		<div class="col-2"><%=titleVal[1][1]%></div><div class="col-4" id = "titleCol"><%=titleVal[1][0]%></div>
					</div>
			    	<hr>
					<div class="row">
			    		<div class="col-2"><%=titleVal[2][1]%></div><div class="col-4" id = "titleCol"><%=titleVal[2][0]%></div>
			    	</div>
			    	<hr>
			    	<div class="row">
			    		<div class="col-2"><%=titleVal[3][1]%></div><div class="col-4" id = "titleCol"><%=titleVal[3][0]%></div>
			    	</div>
			    	<hr>
			    	<div class="row">
			    		<div class="col-2"><%=titleVal[4][1]%></div><div class="col-4" id = "titleCol"><%=titleVal[4][0]%></div>
			    	</div>
			    	<hr>
			    	<div class="row">
			    		<div class="col-2"><%=titleVal[5][1]%></div><div class="col-4" id = "titleCol"><%=titleVal[5][0]%></div>
			    	</div>
			    	<hr>
			    	<div class="row">
			    		<div class="col-2"><%=titleVal[6][1]%></div><div class="col-4" id = "titleCol"><%=titleVal[6][0]%></div>
			    	</div>
			    	<hr>
			    	<div class="row">
			    		<div class="col-2"><%=titleVal[7][1]%></div><div class="col-4" id = "titleCol"><%=titleVal[7][0]%></div>
			    	</div>
			    	<hr>
			    	<div class="row">
			    		<div class="col-2"><%=titleVal[8][1]%></div><div class="col-4" id = "titleCol"><%=titleVal[8][0]%></div>
			    	</div>
			    	<hr>
			    	<div class="row">
			    		<div class="col-2"><%=titleVal[9][1]%></div><div class="col-4" id = "titleCol"><%=titleVal[9][0]%></div>
			    	</div>
			    	<hr>
			    </div>
			    <div class="col-4"  id = "upperBox-graphBox" >
			    <div class="phppot-container"style="margin-top:20%;;">
					<div>
						<canvas id="bar-chart2" style="height: 17vw; width: 17vw;"></canvas>
					</div>
				</div>
			    </div>
			  </div>
			</div>


		</section> 
	</div><!-- admin_menu->aside, session 감싸는 div -->	
</div><!-- admin_menu->wrap -->

<script src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1/dist/chart.umd.min.js"></script>
<script>
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
new Chart(document.getElementById("bar-chart2"), {
	type : 'pie',	//그래프 타입 : 파이차트
	data : {
		labels : [<%=labels2.toString()%>],	//영화 장르(통계에 사용될 데이터의 이름들)
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
			data : [<%=values2%>],	//데이터의 수치들
			label :'영화 판매 순위 TOP 10'
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
</body>
</html>