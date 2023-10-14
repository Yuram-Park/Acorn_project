<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="post.*"%>
<jsp:useBean id="postDao" class="post.PostDao" />
<%!int totalRecord = 0; // 총 글의 갯수
	int numPerPage = 6; // 한 페이지 당 보여질 글 갯수
	int totalPage = 0; // 총 페이지 수
	int nowPage = 0; // 현재 페이지
	int beginPerPage = 0; // 페이지별 시작 번호
	int pagePerBlock = 5; // 블럭 당 페이지 수
	int totalBlock = 0; // 총 블럭 수
	int nowBlock = 0; // 현재 블럭%>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Place with your dog</title>
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="post_list.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/8855691a8d.js" crossorigin="anonymous"></script>
<script>
	function check(){
		if(document.search.searchWord.value == ""){
			alert("검색어를 입력하세요.");
			document.search.searchWord.focus();
			return;
		}
		document.search.submit();
	}
</script>
</head>

<body>

	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="../index.jsp">Logo</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item dropdown-center"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">장소</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">식당</a></li>
							<li><a class="dropdown-item" href="#">병원</a></li>
							<li><a class="dropdown-item" href="../place/cafe/place_cafe_list.jsp?place_category=cafe">카페</a></li>
							<li><a class="dropdown-item" href="#">애견카페</a></li>
							<li><a class="dropdown-item" href="#">숙소</a></li>
							<li><a class="dropdown-item" href="#">애견유치원</a></li>
							<li><a class="dropdown-item" href="#">훈련소</a></li>
							<li><a class="dropdown-item" href="#">애견용품점</a></li>
							<li><a class="dropdown-item" href="#">애견운동장/산책</a></li>
						</ul></li>

					<li class="nav-item dropdown-center"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">공지사항</a></li>
							<li><a class="dropdown-item" href="#">후기게시판</a></li>
							<li><a class="dropdown-item" href="#">홍보게시판</a></li>
							<li><a class="dropdown-item" href="#">뉴스/칼럼</a></li>
						</ul></li>

					<li class="nav-item dropdown-center"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">마이페이지</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="../user/view/myInfo.jsp">내정보 수정</a></li>
							<li><a class="dropdown-item" href="../user/view/changePw.jsp">비밀번호 변경</a></li>
							<li><a class="dropdown-item" href="#">관심장소 모아보기</a></li>
							<li><a class="dropdown-item" href="../favorite/favorite_post.html">관심글 모아보기</a></li>
							<li><a class="dropdown-item" href="#">활동내역</a></li>
						</ul></li>
				</ul>

				<div class="dropdown-center">
					<a class="nav-user dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"><i
						class="fa-solid fa-circle-user fa-3x"></i></a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="../user/view/login.jsp">로그인</a></li>
						<li><a class="dropdown-item" href="../user/proc/logoutProc.jsp">회원가입</a></li>
						<li><a class="dropdown-item" href="../user/view/signUp.jsp">ID/PW 찾기</a></li>
					</ul>
				</div>

				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-dark" type="submit">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</form>
			</div>
		</div>
	</nav>

	<div class="mylist">
		<h2 class="mypage">커뮤니티</h2>
		<div class="list">
			<h4>공지사항</h4>
			<h4 class="active">후기 게시판</h4>
			<h4>홍보 게시판</h4>
			<h4>뉴스/칼럼</h4>
		</div>
	</div>

	<br>

	<div class="container_4">
		<div class="child_1">
			<!-- 후기게시판 내용 시작 -->
			<h1>후기 게시판</h1>

			<!-- 검색창 -->
			<form method="post" name="search" action="post_list.jsp" id="search">
				<div class="child_2">
					<select name="option" class="form-select"
						aria-label="Default select example">
						<option value="title" selected>제목</option>
						<option value="content">내용</option>
						<option value="title+content">제목+내용</option>
						<option value="nickname">닉네임</option>
					</select> &nbsp;&nbsp;&nbsp;&nbsp; 
					<input name="searchWord" class="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
					<button type="submit" form="search" class="btn btn-outline-dark">
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

		Vector vector = (Vector) postDao.getPostList(option, searchWord);

		totalRecord = vector.size();
		totalPage = (int) Math.ceil((double) totalRecord / numPerPage);

		if (request.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));

		if (request.getParameter("nowBlock") != null)
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));

		beginPerPage = nowPage * numPerPage;
		totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

		for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
			if (i == totalRecord)
				break;
			PostDto dto = (PostDto) vector.get(i);
		%>


		

			<div class="col">
				<div class="card">
					<!-- image 있어야함 -->
					<!-- 그림 클릭해도 되게끔 만들기 -->
					<img src="image/img<%=i + 1%>.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<a href="post_detail.jsp?post_id=<%=dto.getPost_id()%>"><h5
								class="card-title"><%=dto.getPost_title()%></h5></a>
						<p class="card-text">
							<%=dto.getUser_nickname()%><br>
							<%=dto.getPost_create_date()%>|<%=dto.getPost_views()%><br>
							<%=dto.getPost_content()%><br>
						</p>
					</div>
				</div>
			</div>
		
	
		<%
		}
		%>
		</div>
	</div>
</div>

		<!-- 게시글 작성하기 버튼 -->
		<input type="button" value="게시글 작성하기"onClick="location='post_post.jsp'" /><br>


	<div class="nextBtn">
		<button type="button" class="btn btn-light">
			<i class="fa-solid fa-angles-left"></i>
		</button>
	<%
		if (nowBlock > 0) {
	%>
		<button type="button" class="btn btn-light"
			onclick="location.href='post_list.jsp?nowPage=<%=pagePerBlock * (nowBlock - 1)%>&nowBlock=<%=nowBlock - 1%>'">
			<i class="fa-solid fa-angle-left"></i>
		</button>
		&nbsp;&nbsp;&nbsp;
	<%
		}
		for (int i = 0; i < pagePerBlock; i++) {
		if ((nowBlock * pagePerBlock) + i == totalPage)
			break;
	%>
		<button type="button" class="btn btn-light"
			onclick="location.href='post_list.jsp?nowPage=<%=(nowBlock * pagePerBlock) + i%>&nowBlock=<%=nowBlock%>' "><%=(nowBlock * pagePerBlock) + 1 + i%></button>
		&nbsp;&nbsp;&nbsp;
	<%
		}
		if (nowBlock + 1 < totalBlock) {
	%>

		<button type="button" class="btn btn-light"
			onclick="location.href='post_list.jsp?nowPage=<%=pagePerBlock * (nowBlock + 1)%>&nowBlock=<%=nowBlock + 1%>'">
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

</html>