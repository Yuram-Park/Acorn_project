<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="reviewDto" class="review.ReviewDto"/>
<jsp:useBean id="reviewDao" class="review.ReviewDao"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:setProperty property="*" name="reviewDto"/>
<% 
reviewDao.setReviewUpdate(reviewDto);
response.sendRedirect("cafe/place_cafe_detail.jsp?place_id="+ reviewDto.getPlace_id()); // 해당 글로 넘어가게 하기
%>
</body>
</html>