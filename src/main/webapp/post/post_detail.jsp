<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="user.*"%>
<%@ page import="comment.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dogether</title>
<%@ include file="/header.jsp"%>
<link rel="stylesheet" href="post_detail.css">
<script>
    function goUpdate(board_id, post_id) {
    	var user_id = sessionStorage.getItem("sessionID");
        if (user_id == "null") {
            alert("세션이 만료되었습니다. 로그인 페이지로 이동합니다.");
            location.href="../user/view/login.jsp";
        } else{
        	location.href="post_update.jsp?board_id="+board_id+"&post_id="+post_id;
        }
    }
    function goDelete(board_id, post_id) {
    	var user_id = sessionStorage.getItem("sessionID");
        if (user_id == "null") {
            alert("세션이 만료되었습니다. 로그인 페이지로 이동합니다.");
            location.href="../user/view/login.jsp";
        } else{
        	location.href="post_delete.jsp?board_id="+board_id+"&post_id="+post_id;
        }
    }
</script>
</head>
<body>
  <!-- Global Navigation Bar -->
  <jsp:include page="/globalNavigationBar.jsp"></jsp:include>

  <jsp:useBean id="postDao" class="post.PostDao" />
  <jsp:useBean id="postDto" class="post.PostDto" />
  <jsp:useBean id="commentDao" class="comment.CommentDao" />
  <jsp:useBean id="commentDto" class="comment.CommentDto" />
  <jsp:useBean id="userDao" class="user.UserDao" />
  <jsp:useBean id="userDto" class="user.UserDto" />
  <jsp:setProperty property="post_id" name="commentDto" />

  <!-- Side Bar -->
  <%
  	int board_id = Integer.parseInt(request.getParameter("board_id"));
  %>
  <div class="mylist">
    <h2 class="mypage">커뮤니티</h2>
    <div class="list">
      <a href="/acorn/post/post_list.jsp?board_id=1"><%if(board_id == 1) {%><h4 class="active"> <%} else {%><h4><%}%>공지사항</h4></a>
      <a href="/acorn/post/post_list.jsp?board_id=2"><%if(board_id == 2) {%><h4 class="active"> <%} else {%><h4><%}%>후기 게시판</h4></a>
      <a href="/acorn/post/post_list.jsp?board_id=3"><%if(board_id == 3) {%><h4 class="active"> <%} else {%><h4><%}%>홍보 게시판</h4></a>
      <a href="/acorn/post/post_list.jsp?board_id=4"><%if(board_id == 4) {%><h4 class="active"> <%} else {%><h4><%}%>뉴스/칼럼</h4></a>
    </div>
  </div>
  <br>

  <!-- Post Detail -->
  <form></form>
  <div class="container_5">
    <div class="child_1">
<%
	switch(board_id){
		case 1:%> <h1>공지사항</h1>
		<%break;
		case 2:%> <h1>후기 게시판</h1>
		<%break;
		case 3:%> <h1>홍보 게시판</h1>
		<%break;
		case 4:%> <h1>뉴스/칼럼</h1>
		<%break;
	}


      int post_id = Integer.parseInt(request.getParameter("post_id"));
      

      // 조회수 업데이트
      Cookie[] cookies = request.getCookies();
      Cookie newCookie = postDao.checkCookie(cookies, post_id);
      
      if(newCookie == null || !newCookie.getName().equals("|"+post_id+"|")){
          postDao.viewsUpdate(post_id);
          
          Cookie cookie = new Cookie("|"+post_id+"|", "views");
          response.addCookie(cookie);
      }
      
      // 글 내용 보여주기
      postDto = postDao.getPost(post_id);
      %>
      <div class="child_3">
        <h4 id="Announcement"><%=postDto.getPost_title()%></h4>
        <div class="child_4">
          <div class="hits">
            조회수
            <%=postDto.getPost_views()%></div>
          <i class="fa-solid fa-circle-user fa-3x fa-review"></i>
          <div class="right_content">
            <%=postDto.getUser_nickname()%>
            |
            <%=postDto.getPost_create_date()%>
          </div>
        </div>
        <hr>
        <div class="content_1">
          <%=postDto.getPost_content()%><br> <br> <br> <br>
        </div>
        <img src="image/Dog1.jpg" alt=""> <img src="image/Dog2.jpg" alt=""> <img src="image/Dog3.jpg" alt="">
      </div>
      <br> <br>

      <!-- 수정/삭제 버튼 -->
      <div class="btn_top">
        <div class="btn_cen">
      <%
      String user_id = postDto.getUser_id();
      String session_id = (String) session.getAttribute("sessionID");
      if (user_id != null && user_id.equals(session_id)) {
      %>
      
          <button type="submit" class="btn btn-primary" for="btn-check" onclick="goUpdate(<%=postDto.getBoard_id()%>, <%=postDto.getPost_id()%>)">수정하기</button>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <button type="submit" class="btn btn-danger" onclick="goDelete(<%=postDto.getBoard_id()%>,<%=postDto.getPost_id()%>)">삭제하기</button>
          &nbsp;&nbsp;&nbsp;
          <%
          }
          %>
          <button type="submit" class="btn btn-secondary">
            게시글 좋아요 <i class="fa-solid fa-heart" style="color: #ff000d;"></i>
            <button type="submit" class="btn btn-secondary" onclick="location='post_list.jsp?board_id=<%=postDto.getBoard_id()%>'">목록</button>
          </button>
        </div>
      </div>

      <!-- 댓글 등록하기 -->
      <%
      Vector<CommentDto> vector = commentDao.getCommentList(postDto.getPost_id());
      userDto = userDao.getUser(session_id);
      %>

      <span class="Comments_section"> <span class="Comments_count">
          <div class="comment_1">
            <h4>
              댓글
              <%=vector.size()%>개
            </h4>
            &nbsp;&nbsp;&nbsp;&nbsp;
            
            <input type="checkbox" class="btn-check" id="btn-check" autocomplete="off">
          </div>
      </span>
      </span> <br> <br> <br>
      <form method="post" action="../comment/comment.jsp">
        <input type="hidden" value="<%=postDto.getPost_id()%>" name="post_id" />
        <input type="hidden" value="<%=postDto.getBoard_id()%>" name="board_id" />
        <input type="text" value="<%=userDto.getUser_nickname()%>" name="user_nickname" readonly />
        <br>
        <br>
        <textarea rows="3" style="width: 50%;" name="comment_content" placeholder="댓글을 입력하세요."></textarea>
        <button type="submit" class="btn btn-secondary">댓글 달기</button>
      </form>
      <br>

      <!-- Comment List -->
      <%
      for (int i = 0; i < vector.size(); i++) {
          commentDto = vector.get(i);
      %>
      <h3><%=commentDto.getUser_nickname()%></h3>
      <%=commentDto.getComment_create_date()%>
      <%
      String comment_user_id = commentDto.getUser_id();
      if (comment_user_id != null && comment_user_id.equals(session_id)) {
      %>
      <br>
      <div class="setting">
        <a class="dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-ellipsis-vertical fa-2xl" style="color: #050b15;"></i></a>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="../comment/comment_update.jsp?board_id=<%=postDto.getBoard_id()%>&comment_id=<%=commentDto.getComment_id()%>">수정</a></li>
          <li><a class="dropdown-item" href="../comment/comment_delete.jsp?board_id=<%=postDto.getBoard_id()%>&comment_id=<%=commentDto.getComment_id()%>">삭제</a></li>
        </ul>
      </div>
      <%
      }
      %>
      <%=commentDto.getComment_content()%>
      <hr>
      <%
      }
      %>
    </div>
  </div>

</body>
</html>