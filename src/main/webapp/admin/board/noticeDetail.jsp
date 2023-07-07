<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_menu.jsp" %>

<body>


	<section id="noticeDetail">
			<article id="detail_content">
				<h2>공지/FAQ</h2>
				
				<div class="top_btn">
					<button type="button" class="btn btn-primary">+ 등록하기</button>
				</div>
				
				<div class="notice_box">
					<div class="top_box">
						<div class="top_text">
							<span class="span_notice"><a href="#"></a>공지사항</span> | 
							<span class="span_notice"><a href="#"></a>FAQ</span>
						</div>			
					</div> 

					
					<div class="content_box">
						<table class="table table-bordered">
							<div class="firstDiv">
								<span class="sp1">제목</span> <span>공지</span>
							</div>
							<div>
								<span class="sp1">작성자 ID</span> <span>admin01</span>
							</div>
							<div>
								<span class="sp1">등록일</span> <span>2023-07-07</span>
							</div>
							<div>
								<span class="sp1">조회수</span> <span>0</span>
							</div>
							<div class="lastDiv">			
								<p class="content">공지합니다</p>
							</div>
						</table>
					</div>
				</div>
			</article>
			
	</section> 
   </div><!-- admin_menu->aside, session 감싸는 div -->   
</div><!-- admin_menu->wrap -->
</body>
</html>