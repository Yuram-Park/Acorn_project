<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dogether</title>
<%@ include file="/header.jsp"%>
<link rel="stylesheet" href="/Dogether/index.css">
</head>
<body>
  <!-- Global Navigation Bar -->
  <jsp:include page="/globalNavigationBar.jsp"></jsp:include>
  
  <jsp:useBean id="reviewDao" class="review.ReviewDao" />
  <jsp:useBean id="reviewDto" class="review.ReviewDto" />
  
  <h1>장소 리뷰</h1>
  <hr>
  <h3>리뷰 수정하기</h3>
  <br>
  <br>
  <%
  int review_id = Integer.parseInt(request.getParameter("review_id"));
  reviewDto = reviewDao.getReviewUpdate(review_id);
  %>
  <form method="post" action="review_updateproc.jsp">
    <input type="hidden" name="place_id" value="<%=reviewDto.getPlace_id()%>" />
    <input type="hidden" name="review_id" value="<%=review_id%>" />
    <input type="text" name="user_nickname" value="<%=reviewDto.getUser_nickname()%>" readonly />
    <br> <br>
    <input type="text" name="review_title" value="<%=reviewDto.getReview_title()%>" />
    <br> <br>
    <textarea rows="3" style="width: 50%;" name="review_content"><%=reviewDto.getReview_content()%></textarea>
    <br> <br>
    <input type="submit" value="수정하기" />
  </form>
</body>
</html>