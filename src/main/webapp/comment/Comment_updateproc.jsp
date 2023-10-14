<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="commentDto" class="comment.CommentDto"/>
<jsp:useBean id="commentDao" class="comment.CommentDao"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:setProperty property="*" name="commentDto"/>
<% 
commentDao.setCommentUpdate(commentDto);
response.sendRedirect("../post/post_detail.jsp?post_id="+ commentDto.getPost_id()); // 해당 글로 넘어가게 하기
%>
</body>
</html>