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
	<jsp:useBean id="dao" class="comment_bean.CommentDao"/>
	<h3>댓글 수정하기</h3><br><br>
	<%
		int comment_id = Integer.parseInt(request.getParameter("comment_id"));
		CommentDto c_dto = (CommentDto)dao.getCommentUpdate(comment_id);
	%>
	<form method="post" action="Comment_updateproc.jsp">
		<input type="hidden" name="post_id" value="<%=c_dto.getPost_id() %>"/>
		<input type="hidden" name="comment_id" value="<%=comment_id %>"/>
		<input type="text" name="user_nickname" value="<%=c_dto.getUser_nickname() %>" readonly/><br><br>
		<textarea name="comment_content" style="width:60%;height:20px;"><%=c_dto.getComment_content() %></textarea><br><br>
		<input type="submit" value="수정하기"/>
	</form>
	
	
</body>
</html>