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
  request.setCharacterEncoding("UTF-8");
  String user_id = (String) session.getAttribute("sessionID");
  %>
  <jsp:setProperty property="*" name="reviewDto" />
  <%
  reviewDto.setUser_id(user_id);
  reviewDao.setReview(reviewDto);
  response.sendRedirect("cafe/place_cafe_detail.jsp?place_id=" + reviewDto.getPlace_id());
  %>
</body>
</html>