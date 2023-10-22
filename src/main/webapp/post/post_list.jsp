<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="post.*"%>
<%!int totalRecord = 0; // 총 글의 갯수
	int numPerPage = 6; // 한 페이지 당 보여질 글 갯수
	int totalPage = 0; // 총 페이지 수
	int nowPage = 0; // 현재 페이지
	int beginPerPage = 0; // 페이지별 시작 번호
	int pagePerBlock = 5; // 블럭 당 페이지 수
	int totalBlock = 0; // 총 블럭 수
	int nowBlock = 0; // 현재 블럭%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dogether</title>
<%@ include file="/header.jsp"%>
<link rel="stylesheet" href="post_list.css">
<script>
    function check(board_id) {
        if (document.search.searchWord.value == "") {
            alert("검색어를 입력하세요.");
            document.search.searchWord.focus();
            location.href="post_list.jsp?board_id="+board_id; // 왜 널이지ㅠㅠㅠ
        }
        document.search.submit();
    }
</script>
</head>

<body>
  <!-- Global Navigation Bar -->
  <jsp:include page="/globalNavigationBar.jsp"></jsp:include>

  <jsp:useBean id="postDao" class="post.PostDao" />
  <jsp:useBean id="postDto" class="post.PostDto" />

  <%
  request.setCharacterEncoding("UTF-8");
  %>

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

  <!-- Post List -->
  <div class="container_4">
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
%>
      <!-- 검색창 -->
      <form method="post" name="search" action="post_list.jsp" id="search">
        <div class="child_2">
          <select name="option" class="form-select" aria-label="Default select example">
            <option value="title" selected>제목</option>
            <option value="content">내용</option>
            <option value="title+content">제목+내용</option>
            <option value="nickname">닉네임</option>
          </select>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <input name="searchWord" class="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
          <button type="submit" form="search" class="btn btn-outline-dark" onclick="check(<%=board_id%>)">
            <i class="fa-solid fa-magnifying-glass"></i>
          </button>
        </div>
      </form>
      <br> <br> <br>

      <!-- 게시판 글 리스트 -->
      <div class="row row-cols1 row-cols-md-3 g-4">
        <%
        String option = request.getParameter("option");
        String searchWord = request.getParameter("searchWord");

        Vector<PostDto> vector = postDao.getPostList(option, searchWord, board_id);

        totalRecord = vector.size();
        totalPage = (int) Math.ceil((double) totalRecord / numPerPage);

        if (request.getParameter("nowPage") != null) {
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }
        if (request.getParameter("nowBlock") != null) {
            nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
        }
        beginPerPage = nowPage * numPerPage;
        totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

        for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
            if (i == totalRecord)
                break;
            postDto = vector.get(i);
        %>
        <div class="col">
          <div class="card">
            <a href="post_detail.jsp?board_id=<%=board_id%>&post_id=<%=postDto.getPost_id()%>" style="text-decoration:none;color:black;">
            	<img src="image/img<%=i + 1%>.jpg" class="card-img-top" alt="..."/>
	              <div class="card-body">
	                <h5 class="card-title"><%=postDto.getPost_title()%></h5>
	                <p class="card-text">
	                  <%=postDto.getUser_nickname()%><br>
	                  <%=postDto.getPost_create_date()%>
	                  | 조회수
	                  <%=postDto.getPost_views()%><br>
	                  <%=postDto.getPost_content()%><br>
	                </p>
	              </div> 
             </a>
          </div>
        </div>
        <%
        }
        %>
      </div>
    </div>
  </div>

  <!-- 게시글 작성하기 버튼 -->
  <button type="submit" class="btn btn-primary" for="btn-check" onclick="location='post_post.jsp?board_id=<%=board_id%>'">게시글 작성하기</button>
  <br>

  <!-- Paging -->
  <div class="nextBtn">
    <button type="button" class="btn btn-light">
      <i class="fa-solid fa-angles-left"></i>
    </button>
    <%
    if (nowBlock > 0) {
    %>
    <button type="button" class="btn btn-light" onclick="location.href='post_list.jsp?nowPage=<%=pagePerBlock * (nowBlock - 1)%>&nowBlock=<%=nowBlock - 1%>'">
      <i class="fa-solid fa-angle-left"></i>
    </button>
    &nbsp;&nbsp;&nbsp;
    <%
    }
    for (int i = 0; i < pagePerBlock; i++) {
    if ((nowBlock * pagePerBlock) + i == totalPage)
        break;
    %>
    <button type="button" class="btn btn-light" onclick="location.href='post_list.jsp?nowPage=<%=(nowBlock * pagePerBlock) + i%>&nowBlock=<%=nowBlock%>' "><%=(nowBlock * pagePerBlock) + 1 + i%></button>
    &nbsp;&nbsp;&nbsp;
    <%
    }
    if (nowBlock + 1 < totalBlock) {
    %>
    <button type="button" class="btn btn-light" onclick="location.href='post_list.jsp?nowPage=<%=pagePerBlock * (nowBlock + 1)%>&nowBlock=<%=nowBlock + 1%>'">
      <i class="fa-solid fa-angle-right"></i>
    </button>
    <%
    }
    %>
    <button type="button" class="btn btn-light">
      <i class="fa-solid fa-angles-right"></i>
    </button>
  </div>
</body>
