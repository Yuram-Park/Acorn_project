<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="comment.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>후기 게시판</h1>
	<hr>
	<jsp:useBean id="commentDto" class="comment.CommentDto"/>
	<jsp:useBean id="commentDao" class="comment.CommentDao"/>
	<h3>댓글 수정하기</h3><br><br>
	<%
    int comment_id = Integer.parseInt(request.getParameter("comment_id"));
    commentDto = commentDao.getCommentUpdate(comment_id);
	%>
	<form method="post" action="comment_updateproc.jsp">
		<input type="hidden" name="post_id" value="<%=commentDto.getPost_id() %>"/>
		<input type="hidden" name="comment_id" value="<%=comment_id %>"/>
		<input type="text" name="user_nickname" value="<%=commentDto.getUser_nickname() %>" readonly/><br><br>
		<textarea name="comment_content" style="width:60%;height:20px;"><%=commentDto.getComment_content() %></textarea><br><br>
		<input type="submit" value="수정하기"/>
	</form>
	
	
</body>
</html>