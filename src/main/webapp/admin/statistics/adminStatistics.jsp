<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.semi.movie.model.MovieService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>
<style type = "text/css">
.phppot-container{
	  display: inline-table;
	   width: 46%;
	   padding : 2% 2% 3% 3%;
	   border: 1px solid white;
	   border-radius: 1rem;
	   box-shadow: 0 0 16px rgba(0, 0, 0, 0.8);
   }
   #upperBox-categoryBox{
   		margin:1% 1% 1% 1%;
   }
</style>
<%
	MovieService movieService = new MovieService();
	Map<String, Integer> map = new HashMap();
	map = movieService.getRankByCategory();
	
	String[][] categoryVal = new String[6][2];
	int i = 0;
	StringBuilder labels = new StringBuilder();
	StringBuilder values = new StringBuilder();
	
	if(map != null && !map.isEmpty()){
		for(Entry<String, Integer> elem : map.entrySet()){
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


%>
		<section id="noticeList">
			<div class="container text-center">
			 <div class="row" id = "upperBox-categoryBox">
			    <div class="col-8" >
			    	<div class="row">
			    		<div class="col-4"><%=categoryVal[0][0]%></div><div class="col-4"><%=categoryVal[0][1]%></div>
			    	</div>
					<div class="row">
			    		<div class="col-4"><%=categoryVal[1][0]%></div><div class="col-4"><%=categoryVal[1][1]%></div>
					</div>
					<div class="row">
			    		<div class="col-4"><%=categoryVal[2][0]%></div><div class="col-4"><%=categoryVal[2][1]%></div>
			    	</div>
			    	<div class="row">
			    		<div class="col-4"><%=categoryVal[3][0]%></div><div class="col-4"><%=categoryVal[3][1]%></div>
			    	</div>
			    	<div class="row">
			    		<div class="col-4"><%=categoryVal[4][0]%></div><div class="col-4"><%=categoryVal[4][1]%></div>
			    	</div>
			    	<div class="row">
			    		<div class="col-4"><%=categoryVal[5][0]%></div><div class="col-4"><%=categoryVal[5][1]%></div>
		    		</div>
			    </div>
			    <div class="col-4"  id = "upperBox-graphBox">
			    <div class="phppot-container">
					<div>
						<canvas id="bar-chart" style="height: 20vw; width: 20vw;"></canvas>
					</div>
				</div>
			    </div>
			  </div>
	<!-- -------------------------------------------------------------------------------------------------- -->
			   <div class="row" id = "upperBox-categoryBox">
			    <div class="col-8">
			    	<div class="row">
			    		<div class="col-2">판매순위1</div><div class="col-2">1위</div><div class="col-2">판매순위6</div><div class="col-2">6위</div>
			    	</div>
					<div class="row">
			    		<div class="col-2">판매순위2</div><div class="col-2">2위</div><div class="col-2">판매순위7</div><div class="col-2">7위</div>
					</div>
					<div class="row">
			    		<div class="col-2">판매순위3</div><div class="col-2">3위</div><div class="col-2">판매순위8</div><div class="col-2">8위</div>
			    	</div>
			    	<div class="row">
			    		<div class="col-2">판매순위4</div><div class="col-2">4위</div><div class="col-2">판매순위9</div><div class="col-2">9위</div>
			    	</div>
			    	<div class="row">
			    		<div class="col-2">판매순위5</div><div class="col-2">5위</div><div class="col-2">판매순위10</div><div class="col-2">10위</div>
			    	</div>
			    	
			    </div>
			    <div class="col-4"  id = "upperBox-graphBox">
			    <div class="phppot-container">
					<div>
						<canvas id="pie-chart" style="height: 20vw; width: 20vw;"></canvas>
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
new Chart(document.getElementById("pie-chart"), {
	type : 'pie',	//그래프 타입 : 파이차트
	data : {
		labels : [],	//영화 장르(통계에 사용될 데이터의 이름들)
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
			data : [],	//데이터의 수치들
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
</body>
</html>