<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="comment_bean.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>후기 게시판</h1>
	<hr>
	<jsp:useBean id="dto" class="comment_bean.CommentDto"/>
	<jsp:setProperty property="comments_id" name="dto"/>
	<jsp:useBean id="dao" class="comment_bean.CommentDao"/>
	<h3>댓글 수정하기</h3><br><br>
	<%
		CommentDto dto = (CommentDto)dao.getComments(dto);
	%>
	<input type="text" name="user_nickname" value="<% %>"
	
</body>
</html>