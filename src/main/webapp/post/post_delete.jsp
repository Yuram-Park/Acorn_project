<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dogether</title>
</head>
<body>
  <jsp:useBean id="postDto" class="post.PostDto" />
  <jsp:useBean id="postDao" class="post.PostDao" />

  <%
  request.setCharacterEncoding("UTF-8");
  %>
  <jsp:setProperty property="post_id" name="postDto" />
  <%
  postDto = postDao.getPost(postDto.getPost_id());
  int board_id = postDto.getBoard_id();
  
  postDao.deletePost(postDto);
  response.sendRedirect("post_list.jsp?board_id=" + board_id);
  %>
</body>
</html>