<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dogether</title>
</head>
<body>
<jsp:useBean id="postDao" class="post.PostDao"></jsp:useBean>
<jsp:useBean id="postDto" class="post.PostDto"></jsp:useBean>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:setProperty property="*" name="postDto"/>
<%
postDao.updatePost(postDto);
postDto = postDao.getPost(postDto.getPost_id());
response.sendRedirect("post_detail.jsp?board_id=" + postDto.getBoard_id() + "&post_id=" + postDto.getPost_id());
%>
</body>
</html>