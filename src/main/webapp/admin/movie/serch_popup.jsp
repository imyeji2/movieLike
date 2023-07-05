<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 반응형에 필요 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 기본 js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 생성 css -->
<%
	
	String type=request.getParameter("type");
	String title="";
	
	if(type.equals("movie")){
		title="영화";
	}else if(type.equals("actor")){
		title="배우";
	}else if(type.equals("director")){
		title="감독";
	}

%>
<title><%=title%> 검색</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style type="text/css">
	.warp{
		width: 800px;
		height:650px;
		margin:0 auto;
	}
	
	.warp h5{
		margin:30px 0px 10px 10px;
	}
	
	.serch_tabel{
		margin-bottom: 30px;
	}
	
	.serch_tabel a{
		color: #212529;
		text-decoration: none;
	}
	
	.serch_tabel a:hover{
		text-decoration: underline;
	}
		
	.page_box{
		width:350px;
		margin:0 auto;
		text-align: center;
	}
</style>
</head>
<body>
<div class="warp">
	<h5><%=title %> 검색</h5>
	<div>
	<div class="input-group mb-3">
		 <input type="text" class="form-control" placeholder="<%=title%>명을 입력하세요" aria-label="serchtxt" aria-describedby="button-addon2">
		 <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
	</div>
	</div>
	<div class="serch_tabel">
		<table class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col">영화명</th>
		      <th scope="col">감독</th>
		      <th scope="col">제작사</th>
		      <th scope="col">개봉일</th>
		    </tr>
		  </thead>
		  <tbody>
		  <%
		  	
		  %>
		    <tr>
		      <td class="text-truncate" style="max-width: 150px;"><a href="#">스파이더맨: 어크로스 더 유니버스</a></td>
		      <td class="text-truncate" style="max-width: 100px;">조아킴 도스 샌토스</td>
		      <td class="text-truncate" style="max-width: 100px;">Otto</td>
		      <td class="text-truncate" style="max-width: 100px;">2023-02-03</td>
		    </tr>	    		    		    	    		    		    		    
		  </tbody>
		</table>
	</div>
	<div class="page_box">
		<nav aria-label="page">
			<ul class="pagination">
				<li class="page-item disabled">
		     		<a class="page-link">Previous</a>
		    	</li>
		    	<li class="page-item"><a class="page-link" href="#">1</a></li>
		    	<li class="page-item active" aria-current="page">
		     		<a class="page-link" href="#">2</a>
		    	</li>
		    	<li class="page-item" aria-current="page">
		     		<a class="page-link" href="#">3</a>
		    	</li>
		    	<li class="page-item" aria-current="page">
		     		<a class="page-link" href="#">4</a>
		    	</li>
		    	<li class="page-item" aria-current="page">
		     		<a class="page-link" href="#">5</a>
		    	</li>		    			    			    	
		   		<li class="page-item"><a class="page-link" href="#">3</a></li>
		   		<li class="page-item">
		      		<a class="page-link" href="#">Next</a>
		   		</li>
		  	</ul>
		</nav>
	</div>
</div>

</body>
</html>