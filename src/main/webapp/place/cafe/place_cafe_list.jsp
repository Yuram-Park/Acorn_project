<%@ page import="java.util.*"%>
<%@ page import="place.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="placeDao" class="place.PlaceDao" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Place with your dog</title>
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="place_cafe_list.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script defer src="https://kit.fontawesome.com/8855691a8d.js" crossorigin="anonymous"></script>
</head>

<body>
  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <a class="navbar-brand" href="../../index.jsp">Logo</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item dropdown-center"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">장소 추천</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">식당</a></li>
              <li><a class="dropdown-item" href="#">병원</a></li>
              <li><a class="dropdown-item" href="place_cafe_list.jsp?p_category=cafe">카페</a></li>
              <li><a class="dropdown-item" href="#">애견카페</a></li>
              <li><a class="dropdown-item" href="#">숙소</a></li>
              <li><a class="dropdown-item" href="#">애견유치원</a></li>
              <li><a class="dropdown-item" href="#">훈련소</a></li>
              <li><a class="dropdown-item" href="#">애견용품점</a></li>
              <li><a class="dropdown-item" href="#">애견운동장/산책</a></li>
            </ul></li>

          <li class="nav-item dropdown-center"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">공지사항</a></li>
              <li><a class="dropdown-item" href="../../post/post_list.jsp">후기게시판</a></li>
              <li><a class="dropdown-item" href="#">홍보게시판</a></li>
              <li><a class="dropdown-item" href="#">뉴스/칼럼</a></li>
            </ul></li>

          <li class="nav-item dropdown-center"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">마이페이지</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">내정보 수정</a></li>
              <li><a class="dropdown-item" href="#">비밀번호 변경</a></li>
              <li><a class="dropdown-item" href="#">관심장소 모아보기</a></li>
              <li><a class="dropdown-item" href="../../favorite/favorite_post.html">관심글 모아보기</a></li>
              <li><a class="dropdown-item" href="#">활동내역</a></li>
            </ul></li>
        </ul>

        <div class="dropdown-center">
          <a class="nav-user dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-circle-user fa-3x"></i></a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/Dogether/user/view/login.jsp">로그인</a></li>
            <li><a class="dropdown-item" href="/Dogether/user/proc/logoutProc.jsp">로그아웃</a></li>
            <li><a class="dropdown-item" href="/Dogether/user/view/signUp.jsp">회원가입</a></li>
            <li><a class="dropdown-item">ID/PW 찾기</a></li>
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

  <div class="catewrap">
    <h2>장소 추천</h2>
    <div class="cate">
      <h4>
        식당&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">256</span>
      </h4>
      <h4>
        병원&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">124</span>
      </h4>
      <h4 class="active">
        카페&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">458</span>
      </h4>
      <h4>
        애견카페&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">67</span>
      </h4>
      <h4>
        숙소&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">54</span>
      </h4>
      <h4>
        애견유치원&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">21</span>
      </h4>
      <h4>
        훈련소&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">16</span>
      </h4>
      <h4>
        애견용품점&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">59</span>
      </h4>
      <h4>
        애견운동장/산책&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">227</span>
      </h4>
    </div>
  </div>
  <div class="checkwrap">
    <div class="checkgps">
      현재 검색 위치 :
      <%=session.getAttribute("location")%><br>
      <div class="gpschange">검색 위치 변경</div>
    </div>
    <div class="check">
      <div class="checkbox">
        편의시설 <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"><label class="form-check-label" for="flexCheckDefault">주차장</label>
      </div>
      <div class="checkbox">
        위치 <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"><label class="form-check-label" for="flexCheckDefault">실내</label> <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"><label class="form-check-label" for="flexCheckDefault">실외</label>
      </div>
      <div class="checkbox">
        영업시간 <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"><label class="form-check-label" for="flexCheckDefault">토요일 영업</label> <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"><label class="form-check-label" for="flexCheckDefault">일요일 영업</label>
      </div>
      <div class="checkbox">
        사이즈 <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"><label class="form-check-label" for="flexCheckDefault">소형견</label> <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"><label class="form-check-label" for="flexCheckDefault">중형견</label> <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"><label class="form-check-label" for="flexCheckDefault">대형견</label>
      </div>
    </div>
  </div>

  <div class="checkresult">
    <div class="resultcheck">
      <div class="checked active">최신순</div>
      <div class="checkeded">|</div>
      <div class="checked">별점 높은순</div>
      <div class="checkeded">|</div>
      <div class="checked">별점 낮은순</div>
    </div>

    <div class="results">
      <%
      String place_category = request.getParameter("place_category");
            Vector vec = (Vector) placeDao.getPlaceList(place_category);
            int n = (vec.size() < 6) ? vec.size() : 6;
            if (n >= 1) {
                for (int i = 0; i < ((n / 2.0 < 3.0) ? Math.ceil(n / 2.0) : 3); i++) {
            for (int j = 0; j < ((n - i * 2) < 2 ? (n - i * 2) : 2); j++) {
                PlaceDto place = (PlaceDto) vec.get(j + i * 2);
      %>

      <div class="cards">
        <a href="place_cafe_detail.jsp?place_id=<%=place.getPlace_id()%>" class="card mb-3" style="max-width: 600px; margin-top: 40px;">
          <div class="row g-0">
            <div class="col-md-4">
              <img src="./image/Cafe<%=j + i * 2 + 1%>.jpg" class="img-fluid rounded-start" alt="...">
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h4 class="card-title"><%=place.getPlace_name()%><div class="score"><%=place.getPlace_score()%></div>
                </h4>
                <p class="card-text">현재 위치에서 2.5km 거리</p>
                <p class="card-text">
                  <small class="text-body-secondary"><%=place.getPlace_category()%> | <%=place.getPlace_address()%> <br> #주차장 #실내 #토요일 영업 #일요일 영업 #소형견 #중형견 <br> <%=place.getPlace_call()%></small>
                </p>
              </div>
            </div>
          </div>
        </a>
      </div>
      <%
      }
      }
      }
      %>
    </div>

    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
        </a></li>
        <li class="page-item active" aria-current="page"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">4</a></li>
        <li class="page-item"><a class="page-link" href="#">5</a></li>
        <li class="page-item"><a class="page-link" href="#">6</a></li>
        <li class="page-item"><a class="page-link" href="#">7</a></li>
        <li class="page-item"><a class="page-link" href="#">8</a></li>
        <li class="page-item"><a class="page-link" href="#">9</a></li>
        <li class="page-item"><a class="page-link" href="#">10</a></li>
        <li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
        </a></li>
      </ul>
    </nav>
  </div>
</body>
</html>