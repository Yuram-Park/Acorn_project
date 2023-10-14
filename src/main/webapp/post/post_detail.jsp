<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="post.*"%>
<%@ page import="user.*"%>
<%@ page import="comment.*"%>

<jsp:useBean id="postDto" class="post.PostDto" />
<jsp:useBean id="postDao" class="post.PostDao" />
<jsp:useBean id="commentDto" class="comment.CommentDto"/>
<jsp:setProperty property="post_id" name="commentDto"/>
<jsp:useBean id="commentDao" class="comment.CommentDao"/>
<jsp:useBean id="userDao" class="user.UserDao"/>

<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Place with your dog</title>
        <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="post_detail.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8855691a8d.js" crossorigin="anonymous"></script>
    </head>
<body>

        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="../index.jsp">Logo</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown-center">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">장소</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">식당</a></li>
                                <li><a class="dropdown-item" href="#">병원</a></li>
                                <li><a class="dropdown-item" href="#">카페</a></li>
                                <li><a class="dropdown-item" href="#">애견카페</a></li>
                                <li><a class="dropdown-item" href="#">숙소</a></li>
                                <li><a class="dropdown-item" href="#">애견유치원</a></li>
                                <li><a class="dropdown-item" href="#">훈련소</a></li>
                                <li><a class="dropdown-item" href="#">애견용품점</a></li>
                                <li><a class="dropdown-item" href="#">애견운동장/산책</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown-center">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">공지사항</a></li>
                                <li><a class="dropdown-item" href="#">후기게시판</a></li>
                                <li><a class="dropdown-item" href="#">홍보게시판</a></li>
                                <li><a class="dropdown-item" href="#">뉴스/칼럼</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown-center">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">마이페이지</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">내정보 수정</a></li>
                                <li><a class="dropdown-item" href="#">비밀번호 변경</a></li>
                                <li><a class="dropdown-item" href="#">관심장소 모아보기</a></li>
                                <li><a class="dropdown-item" href="../favorite/favorite_post.html">관심글 모아보기</a></li>
                                <li><a class="dropdown-item" href="#">활동내역</a></li>
                            </ul>
                        </li>
                    </ul>

                    <div class="dropdown-center">
                        <a class="nav-user dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-circle-user fa-3x"></i></a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item">로그인</a></li>
                            <li><a class="dropdown-item">회원가입</a></li>
                            <li><a class="dropdown-item">ID/PW 찾기</a></li>
                        </ul>
                    </div> 

                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-dark" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </form>
                </div>
            </div>
        </nav>
        
        <div class="mylist" name=""> <!-- method="get"-->
            <h2 class="mypage">커뮤니티</h2>
            <div class="list">
                <h4>공지사항</h4>
                <h4 class="active">후기 게시판</h4>
                <h4>홍보 게시판</h4>
                <h4 >뉴스/칼럼</h4>
            </div>
        </div>

        <br>

        <form>
            
        </form>
        <div class="container_5">
            <div class="child_1">
                
                <h1>후기 게시판</h1>
 <%
		int post_id = Integer.parseInt(request.getParameter("post_id"));
 
 		// 조회수 업데이트
 		Cookie[] cookies = request.getCookies();
 		Cookie newCookie = postDao.checkCookie(cookies, post_id);
 		
 		if(newCookie == null || !newCookie.getName().equals("|"+post_id+"|")){
 			postDao.viewsUpdate(post_id);
 			
 			Cookie cookie = new Cookie("|"+post_id+"|", "views");
 			response.addCookie(cookie);
 		}
 		
		postDto = postDao.getPost(post_id);
%>
                
                
                    <div class="child_3">
                        <h4 id="Announcement"><%=postDto.getPost_title() %></h4>

                        <div class="child_4">
                            <div class="hits">조회수 <%= postDto.getPost_views() %></div>
                            <i class="fa-solid fa-circle-user fa-3x fa-review"></i>
                            <div class="right_content">
                            
                            <%= postDto.getUser_nickname() %> | <%= postDto.getPost_create_date() %>
                        </div>
                        </div>
                        
                        
                        <hr>
                        <div class="content_1">
                            <%= postDto.getPost_content() %><br><br><br><br>
                        </div>
                        <img src="images/dog1.png" alt="">
                        <img src="images/dog2.png" alt="">
                        <img src="images/dog3.png" alt="">
                    </div>
                    <br><br>
<!-- 수정/삭제 버튼 -->

<%
	String user_id = postDto.getUser_id();
	
	if(user_id.equals(session.getAttribute("sessionID"))) {
%>            
                    <div class="btn_top">
                        <div class="btn_cen">
                            <button type="submit" class="btn btn-primary" for="btn-check" onclick="location='post_update.jsp?post_id=<%=postDto.getPost_id() %>'">수정하기</button>
                            &nbsp;&nbsp;&nbsp;&nbsp;
    
                            <button type="submit" class="btn btn-danger" onclick="location='post_delete.jsp?post_id=<%=postDto.getPost_id() %>'">삭제하기</button>

                            &nbsp;&nbsp;&nbsp;
<%
	}
%>
                            <button type="submit" class="btn btn-secondary">
                                게시글 좋아요
                                <i class="fa-solid fa-heart" style="color: #ff000d;"></i>
                                <button type="submit" class="btn btn-secondary">목록</button>
                            </button>
                        </div>
                    </div>
<!-- 댓글 등록하기 -->	
<%
	Vector vec = (Vector)commentDao.getComment(postDto.getPost_id());
	
	String userId = (String)session.getAttribute("sessionID");

	UserDto user = (UserDto)userDao.getUser(userId);
	String now_user_nickname = user.getUser_nickname();
%> 

                    <span class="Comments_section">
                        <span class="Comments_count">
                            <div class="comment_1">
                                <h4>댓글 <%=vec.size()%>개</h4>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="submit" class="btn btn-secondary">댓글 달기</button>
                                <input type="checkbox" class="btn-check" id="btn-check" autocomplete="off">
                            </div>
                        </span>
                    </span>

                    <br><br><br>
    <form method="post" action="../comment/comment.jsp" >
			<input type="hidden" value="<%=postDto.getPost_id()%>" name="post_id"/>
			<input type="text" value="<%=now_user_nickname %>" name="user_nickname" readonly/>
			<textarea placeholder="댓글을 입력해주세요" name="comment_content" style="width:60%;height:20px;"></textarea>
			<input type="submit" value="댓글 달기"/>
	</form><br>
<!-- 댓글 보여주기 -->
<%
	for(int i=0; i<vec.size(); i++){
		CommentDto comment = (CommentDto)vec.get(i);
%>
                    <h3>><%=comment.getUser_nickname() %></h3><%=comment.getComment_create_date() %>
<%
		String comment_user_id = comment.getUser_id();
		if(comment_user_id.equals(session.getAttribute("sessionID"))) {
%>
                    <br>
                    <div class="setting">
                        <a class="dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-ellipsis-vertical fa-2xl" style="color: #050b15;"></i></a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="../comment/comment_update.jsp?comment_id=<%=comment.getComment_id() %>">수정</a></li>
                            <li><a class="dropdown-item" href="../comment/comment_delete.jsp?comment_id=<%=comment.getComment_id() %>">삭제</a></li>
                        </ul>
                    </div>
<%
		}
%>
		<%=comment.getComment_content() %>
		<hr>
<%
	}
%>  
            </div>
        </div>

    </body>
</html>