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
  <jsp:setProperty property="*" name="postDto" />
  <%
  int board_id = postDto.getBoard_id();
  postDao.setPost(postDto, board_id);
  response.sendRedirect("post_list.jsp?board_id=" + board_id);
  %>
</body>
</html>