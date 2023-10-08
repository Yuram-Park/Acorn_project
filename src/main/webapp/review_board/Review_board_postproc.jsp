<!-- JavaBean 방식 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dto" class="review_boardbean.BoardDto"></jsp:useBean>
<jsp:useBean id="dao" class="review_boardbean.BoardDao"></jsp:useBean>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:setProperty property="*" name="dto"/> //날짜가 지금 안들어가고있음!!

<% 
	dao.setReviewPost(dto);
	response.sendRedirect("Review_board_list.jsp"); 
%>

</body>
</html>