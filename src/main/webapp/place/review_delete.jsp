<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="review.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="reviewDao" class="review.ReviewDao"/>
<jsp:useBean id="reviewDto" class="review.ReviewDto"/>

<%
	int review_id = Integer.parseInt(request.getParameter("review_id"));
	reviewDto = (ReviewDto)reviewDao.getReviewUpdate(review_id);
	
	reviewDao.setReviewDelete(review_id);

	response.sendRedirect("cafe/place_cafe_detail.jsp?place_id="+ reviewDto.getPlace_id()); // 해당 글로 넘어가게 하기
%>
</body>
</html>