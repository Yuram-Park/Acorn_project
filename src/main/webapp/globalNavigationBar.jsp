<%@ page contentType="text/html; charset=UTF-8" %>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="/acorn">Dogether</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown-center"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">장소</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/acorn/place/place_list.jsp?place_category=restaurant">식당</a></li>
            <li><a class="dropdown-item" href="/acorn/place/place_list.jsp?place_category=hospital">병원</a></li>
            <li><a class="dropdown-item" href="/acorn/place/place_list.jsp?place_category=cafe">카페</a></li>
            <li><a class="dropdown-item" href="/acorn/place/place_list.jsp?place_category=dogcafe">애견카페</a></li>
            <li><a class="dropdown-item" href="/acorn/place/place_list.jsp?place_category=hotel">숙소</a></li>
            <li><a class="dropdown-item" href="/Dogether/place/place_list.jsp?place_category=school">애견유치원</a></li>
            <li><a class="dropdown-item" href="/Dogether/place/place_list.jsp?place_category=training">훈련소</a></li>
            <li><a class="dropdown-item" href="/Dogether/place/place_list.jsp?place_category=dogshop">애견용품점</a></li>
            <li><a class="dropdown-item" href="/Dogether/place/place_list.jsp?place_category=playground">애견운동장/산책</a></li>
          </ul></li>

        <li class="nav-item dropdown-center"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/acorn/post/post_list.jsp?board_id=1">공지사항</a></li>
            <li><a class="dropdown-item" href="/acorn/post/post_list.jsp?board_id=2">후기게시판</a></li>
            <li><a class="dropdown-item" href="/acorn/post/post_list.jsp?board_id=3">홍보게시판</a></li>
            <li><a class="dropdown-item" href="/acorn/post/post_list.jsp?board_id=4">뉴스/칼럼</a></li>
          </ul></li>

        <li class="nav-item dropdown-center"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">마이페이지</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/acorn/user/view/myInfo.jsp">내정보 수정</a></li>
            <li><a class="dropdown-item" href="/acorn/user/view/changePw.jsp">비밀번호 변경</a></li>
            <li><a class="dropdown-item" href="/acorn/favorite/favorite_place.jsp">관심장소 모아보기</a></li>
            <li><a class="dropdown-item" href="/acorn/favorite/favorite_post.jsp">관심글 모아보기</a></li>
            <li><a class="dropdown-item" href="#">활동내역</a></li>
          </ul></li>
      </ul>

      <div class="dropdown-center">
        <a class="nav-user dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-circle-user fa-3x"></i></a>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="/acorn/user/view/login.jsp">로그인</a></li>
          <li><a class="dropdown-item" href="/acorn/user/proc/logoutProc.jsp">로그아웃</a></li>
          <li><a class="dropdown-item" href="/acorn/user/view/signUp.jsp">회원가입</a></li>
          <li><a class="dropdown-item" href="#">ID/PW 찾기</a></li>
        </ul>
      </div>

      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-dark" type="submit">
          <i class="fa-solid fa-magnifying-glass"></i>
        </button>
      </form>
    </div>
  </div>
</nav>