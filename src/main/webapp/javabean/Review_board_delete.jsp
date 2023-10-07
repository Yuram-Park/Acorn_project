<!-- JavaBean ¹æ½Ä -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	request.setCharacterEncoding("euc-kr");
%>

<jsp:setProperty property="post_id" name="dto"/>


<% 
	dao.setReviewDelete(dto);
	response.sendRedirect("Review_board_list.jsp"); 
%>

</body>
</html>