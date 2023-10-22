<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dogether</title>
</head>
<body>
  <jsp:useBean id="reviewDao" class="review.ReviewDao" />
  <jsp:useBean id="reviewDto" class="review.ReviewDto" />
  
  <%
  request.setCharacterEncoding("UTF-8");
  %>
  <jsp:setProperty property="*" name="reviewDto" />
  <%
  reviewDao.updateReview(reviewDto);
  response.sendRedirect("cafe/place_cafe_detail.jsp?place_id=" + reviewDto.getPlace_id());
  %>
</body>
</html>