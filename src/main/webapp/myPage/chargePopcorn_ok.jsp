<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.point.model.PointVO"%>
<%@page import="com.semi.point.model.PointService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String userid = request.getParameter("userid");
	String paymentType = request.getParameter("paymenttypeno");
	String price = request.getParameter("price");
	
	PointService service = new PointService();
	PointVO vo = new PointVO();
	
	vo.setPaymentTypeNo(Integer.parseInt(paymentType));
	vo.setPointPrice(Integer.parseInt(price));
	vo.setUserId(userid);
	
	System.out.println(paymentType);
	
	try{
	int cnt = service.insertPoint(vo);
	if(cnt > 0){
		%><script>
			alert('충전이 완료되었습니다');
			window.close();
			window.opener.location.reload();
		</script><%
	}else{
		%><script>
		alert('충전에 실패했습니다');
		window.close();
		window.opener.location.reload();
	</script><%
	}
	}catch(SQLException e){
		e.printStackTrace();
	}

%>
</body>
</html>