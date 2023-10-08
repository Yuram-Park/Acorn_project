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
<jsp:useBean id="dto" class="review_boardbean.BoardDto"/>
<jsp:useBean id="dao" class="review_boardbean.BoardDao"/>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:setProperty property="post_id" name="dto"/>


<% 
	dao.setReviewDelete(dto);
	response.sendRedirect("Review_board_list.jsp"); 
%>

</body>
</html>