<!-- JavaBean 방식 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	request.setCharacterEncoding("euc-kr");
%>

<jsp:setProperty property="*" name="dto"/>

<% 
	dao.setReviewUpdate(dto);
	response.sendRedirect("Review_board_list.jsp"); // 해당 글로 넘어가게 하기
%>

</body>
</html>