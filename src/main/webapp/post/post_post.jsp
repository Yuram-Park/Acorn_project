<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dogether</title>
<%@ include file="/header.jsp"%>
<link rel="stylesheet" href="post_list.css">
</head>
<body>
  <!-- Global Navigation Bar -->
  <jsp:include page="/globalNavigationBar.jsp"></jsp:include>

  <jsp:useBean id="userDao" class="user.UserDao" />
  <jsp:useBean id="userDto" class="user.UserDto" />
  
  <%
  String user_id = (String) session.getAttribute("sessionID");
  userDto = userDao.getUser(user_id);
  String user_nickname = userDto.getUser_nickname();
  int board_id = Integer.parseInt(request.getParameter("board_id"));
  %>
  <h1>후기 게시판</h1>
  <form name="review_board_post" method="post" action="post_postproc.jsp?board_id=<%=board_id%>">
    <input type="hidden" name="user_id" value="<%=user_id%>" />
    <input type="hidden" name="user_nickname" value="<%=user_nickname%>" />
    <input type="text" name="post_title" size="40" placeholder="제목을 입력해주세요" />
    <br> <br>
    <textarea placeholder="내용을 입력해주세요" name="post_content" style="width: 80%; height: 200px;"></textarea>
    <br> <br>
    <input type="text" size="40" placeholder="사진 추가 (사진은 최대 20장까지 등록 가능합니다)" />
    <input type="file" name="post_fileName">
    <br> <br>
    <input type="reset" value="작성취소" />
    <input type="submit" value="등록하기" />
  </form>
</body>
</html>