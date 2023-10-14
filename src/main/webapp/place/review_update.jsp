<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>장소 리뷰</h1>
	<hr>
	<jsp:useBean id="reviewDto" class="review.ReviewDto"/>
	<jsp:useBean id="reviewDao" class="review.ReviewDao"/>
	<h3>리뷰 수정하기</h3><br><br>
	<%
    int review_id = Integer.parseInt(request.getParameter("review_id"));
    reviewDto = reviewDao.getReviewUpdate(review_id);
	%>
	<form method="post" action="review_updateproc.jsp">
		<input type="hidden" name="place_id" value="<%=reviewDto.getPlace_id() %>"/>
		<input type="hidden" name="review_id" value="<%=review_id %>"/>
		<input type="text" name="user_nickname" value="<%=reviewDto.getUser_nickname() %>" readonly/><br><br>
		댓글 제목: <input type="text" name="review_title" value="<%=reviewDto.getReview_title() %>"/><br><br>
		댓글 내용: <textarea name="review_content" style="width:60%;height:20px;"><%=reviewDto.getReview_content() %></textarea><br><br>
		<input type="submit" value="수정하기"/>
	</form>
	
	
</body>
</html>