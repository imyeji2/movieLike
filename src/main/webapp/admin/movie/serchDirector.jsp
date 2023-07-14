<%@page import="com.semi.common.PagingVO"%>
<%@page import="com.semi.director.model.DirectorService"%>
<%@page import="com.semi.director.model.DirectorVO"%>
<%@page import="com.semi.actor.model.ActorService"%>
<%@page import="com.semi.actor.model.ActorVO"%>
<%@page import="com.semi.movie.model.MovieVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.movie.model.MovieService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 반응형에 필요 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 기본 js -->
<script type="text/javascript" src="../../js/jquery-3.7.0.min.js"></script>
<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 생성 css -->
<%
	String serch = request.getParameter("serch");

	List<DirectorVO> list = null;
	DirectorVO vo = new DirectorVO();
	DirectorService service = new DirectorService();
	
	if(serch==null||serch.isEmpty()){
		serch="";	
		try{
			list = service.selectDirectorAll();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}else{
		try{
			list = service.serchDirector(serch);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	//페이징 처리
	
	int currentPage = 1; //현재 페이지
	
	if(request.getParameter("currentPage")!=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	
	//현재 페이지랑 무관한 변수
	
	int totalRecord = list.size(); //총 레코드 개수
	int pageSize = 5; //한페이지에 보여주는 레코드 수
	int blockSize = 5; // 한 블럭에 보여줄 페이지 수

	PagingVO pageVo = new PagingVO(currentPage, totalRecord, pageSize, blockSize);

%>

<title>감독 검색</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script>

$(function(){
	
	$('#serchBtn').click(function(){
		location.href="serchDirector.jsp?serch=<%=serch%>";
	});
	
	$('#add').click(function(){
		var chkCount = $('input[name=chk]:checked').length; 
		if(chkCount>0){
			alert("선택을 해제해 주세요");
		}else{
			var popup = window.open('addDirectorPopUp.jsp', 'add', 'width=600px,height=350px,scrollbars=yes');
		}
	});
	
	$('#checkAll').click(function(){
		if($(this).is(':checked')){
			 $("input[name=chk]").prop("checked", true);
		}else{
			$("input[name=chk]").prop("checked", false);
		}
	})
	
	
	$('#eidt').click(function(){
		var chkCount = $('input[name=chk]:checked').length; 
		var chk = $('input[name=chk]:checked').attr('id');
		if(chkCount>1){
			alert("수정할 항목을 하나만 선택해 주세요");
		}else if(chkCount<=0){
			alert("수정할 항목을 선택해주세요");
		}else{
			var popup = window.open('addDirectorPopUp.jsp?no='+chk, 'edit', 'width=600px,height=350px,scrollbars=yes');
			
		}
	});
	
	$('#del').click(function(){
		var chkCount = $('input[name=chk]:checked').length; 
		var chk = $('input[name=chk]:checked').attr('id');
		if(chkCount<=0){
			alert("수정할 항목을 선택해주세요");
		}else{
			if(confirm("정말 삭제하시겠습니까?")){
				$('form').submit(); 
			}
			    
			
		}
	});
	
	
});

function sendWrite(no, name, img) {
	  var htmlContent = 
	    '<div class="movieWrite_box_in">' +
	      '<div class="movieWrite_box_in_left">' +
	        '<img src="../../images/movie/director/' + img + '" style="width: 60px;">' +
	        '<input type="hidden" name="directorNo" value="' + no + '">' +
	      '</div>' +
	      '<div class="movieWrite_box_in_right" style="line-height: 65px;">' + name + '</div>' +
	      '<div class="movieWrite_box_in_right" style="width:10%;line-height: 85px; text-align:center;"><a href="#">삭제</a></div> '+
	    '</div>';

	  $(opener.document).find('#directorBox').append(htmlContent);
	  self.close();
	}

</script>

<style type="text/css">
	.warp{
		width: 750px;
		height:750px;
		margin:0 auto;
		padding:25px 25px 25px 25px;
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
		width:200px
		margin:0 auto;
		text-align: center;
	}
	
	.popup_footer{
		overflow:hidden;;
	}
	.del_btn_box{
		float: right;
		margin-bottom: 20px;
		
	}
	
	.popup_btn{		
		widht:30px;
		height:38px;
		line-height:11px;
		margin-right: 5px;

	}
	
	.serch_left_box{
		width:480px;
		float: left;
		margin-top:1px;
	
	}
	
	tbody tr{
		height:60px;
		padding:5px 0px 5px 0px;
		line-height: 60px
	}
	
	td img{
		width:50px;
		heigh:50px;
	}
	
	td input[type=checkbox]{
		vertical-align:middle;
	}

	th input[type=checkbox]{
		vertical-align:middle;
	}	
	
</style>
</head>
<body>

<div class="warp">
	<h5>감독 검색</h5>
	<div class="serch_left_box">
	<form name="serchFrm" method="get" action="serchDirector.jsp">
		<div class="input-group mb-3">
			 <input type="text" class="form-control" placeholder="감독을 입력하세요"
			  aria-label="serchtxt" aria-describedby="button-addon2"  name="serch">
			 <button class="btn btn-outline-secondary" type="button" id="serchBtn">검색</button>
		</div>	
	</form>
	</div>	
	<div class="del_btn_box">
		<input type="button" class="popup_btn btn btn-primary" id="add" value="추가">
		<input type="button" class="popup_btn btn btn-primary" id="eidt" value="수정">
		<input type="button" class="popup_btn btn btn-primary" id="del" value="삭제">
	</div>
	<div class="serch_tabel">
		<form name="delFrm" method="post" action="driectorDelete.jsp">
			<table class="table table-hover" style="text-align:center;">
			  <thead>
			    <tr>
				  <th scope="col">
				  	<input class="form-check-input" type="checkbox" id="checkAll">
				  </th>
				  <th scope="col">프로필</th>	
			      <th scope="col">감독이름</th>
			     </tr>
			  </thead>
			  <tbody>
				<%
					if(list==null||list.isEmpty()){
				%>
				<tr>
				  <td colspan="3">검색된 결과가 없습니다.</td>
			    </tr>					
				<%	
				
					}else{
						int num = pageVo.getNum();
					  	int curPos = pageVo.getCurPos();
					  	
						for(int i=0; i<pageVo.getPageSize();i++){
							if(num<1) break;
							vo = list.get(curPos++);
							num--;
				%>
				<tr>
				  <td class="text-truncate">
				  	<input class="form-check-input" type="checkbox"  name="chk" value="<%=vo.getDirectorNo()%>" id="<%=vo.getDirectorNo()%>">
				  </td>				
				  <td class="text-truncate" style="max-width: 100px;">
				  	<img src="../../images/movie/director/<%=vo.getDirectorImg()%>" style="width:50px">
				  </td>
			      <td class="text-truncate" style="max-width: 150px;">
					<a href="#" onclick="sendWrite(<%=vo.getDirectorNo()%>, '<%=vo.getDirectorName()%>', '<%=vo.getDirectorImg()%>');">
					  <%=vo.getDirectorName()%>
					</a>
			      </td>
			    </tr>		    	
				<%
				
						}
					}
				%>
	    		    	    		    		    		    
			  </tbody>
			</table>	
		</form>
	</div>
	<div class="popup_footer">
	<div class="page_box">
		<nav aria-label="page">
			<ul class="pagination">
				<%if(pageVo.getFirstPage()>1){%>
						<li class="page-item"><a class="page-link" href="serchDirector.jsp?currentPage=<%=pageVo.getFirstPage()-1%>&serch=<%=serch%>">Previous</a></li>	
					<%} %>
				
					<% for(int i = pageVo.getFirstPage(); i <= pageVo.getLastPage(); i++){
						if(i>pageVo.getTotalPage()) break;
						if(i == currentPage){ %>
							<li class="page-item active" aria-current="page"><a class="page-link" href="serchDirector.jsp?currentPage=<%=i%>&serch=<%=serch%>"><%=i %></a></li>
					<%	}else{ %>
							<li class="page-item"><a class="page-link" href="serchDirector.jsp?currentPage=<%=i%>&serch=<%=serch%>"><%=i %></a></li>
					<%	}//if %>
					<%}//for %>
				
					<!-- 다음 블럭으로 이동 -->
					<%if(pageVo.getLastPage()< pageVo.getTotalPage()){%>
						<li class="page-item"><a class="page-link" 
						href="sserchDirector.jsp?currentPage=<%=pageVo.getLastPage()+1%>&serch=<%=serch%>">Next</a></li>
					<%} %>
			</ul>
		</nav>
	</div>				
	</div><!-- popup_footer, page번호 버튼 -->
</div>

</body>
</html>