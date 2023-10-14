<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="comment.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="commentDao" class="comment.CommentDao"/>
<jsp:useBean id="commentDto" class="comment.CommentDto"/>

<%
	int comment_id = Integer.parseInt(request.getParameter("comment_id"));
    commentDto = (CommentDto)commentDao.getCommentUpdate(comment_id);
	
	commentDao.setCommentDelete(comment_id);

	response.sendRedirect("../post/post_detail.jsp?post_id="+ commentDto.getPost_id()); // 해당 글로 넘어가게 하기
%>
</body>
</html>