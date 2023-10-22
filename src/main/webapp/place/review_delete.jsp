<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="review.*"%>
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
  int review_id = Integer.parseInt(request.getParameter("review_id"));
  reviewDto = reviewDao.getReviewUpdate(review_id);

  reviewDao.deleteReview(review_id);
  response.sendRedirect("cafe/place_cafe_detail.jsp?place_id=" + reviewDto.getPlace_id());
  %>
</body>
</html>