<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dogether</title>
<%@ include file="/header.jsp"%>
<link rel="stylesheet" href="/Dogether/index.css">
</head>
<body>
  <!-- Global Navigation Bar -->
  <jsp:include page="/globalNavigationBar.jsp"></jsp:include>
  
  <jsp:useBean id="postDao" class="post.PostDao" />
  <jsp:useBean id="postDto" class="post.PostDto" />
  <jsp:setProperty property="post_id" name="postDto" />

  <h1>후기 게시판</h1>
  <hr>
  <h3>게시글 수정하기</h3>
  <br>
  <br>
  <%
  postDto = postDao.getPost(postDto.getPost_id());
  %>
  <form name="post_update" method="post" action="post_updateproc.jsp">
    <input type="hidden" name="post_id" value="<%=postDto.getPost_id()%>" />
    <input type="hidden" name="user_nickname" value="<%=postDto.getUser_nickname()%>" />
    <input type="text" name="post_title" size="40" value="<%=postDto.getPost_title()%>" />
    <br>
    <br>
    <textarea name="post_content" style="width: 80%; height: 200px;"><%=postDto.getPost_content()%></textarea>
    <br>
    <br>
    <input type="text" size="40" value="사진 추가 (사진은 최대 20장까지 등록 가능합니다)" />
    <br>
    <br>
    <input type="reset" value="작성취소" />
    <input type="submit" value="수정하기" />
  </form>
</body>
</html>