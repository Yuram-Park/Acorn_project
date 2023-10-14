<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Place with your dog</title>
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="index.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script defer src="https://kit.fontawesome.com/8855691a8d.js" crossorigin="anonymous"></script>
</head>

<body>
  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <a class="navbar-brand" href="index.jsp">Logo</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item dropdown-center"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">장소</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">식당</a></li>
              <li><a class="dropdown-item" href="#">병원</a></li>
              <li><a class="dropdown-item" href="place/cafe/place_cafe_list.jsp?place_category=cafe">카페</a></li>
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
              <li><a class="dropdown-item" href="post/post_list.jsp">후기게시판</a></li>
              <li><a class="dropdown-item" href="#">홍보게시판</a></li>
              <li><a class="dropdown-item" href="#">뉴스/칼럼</a></li>
            </ul></li>

          <li class="nav-item dropdown-center"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">마이페이지</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="user/view/myInfo.jsp">내정보 수정</a></li>
              <li><a class="dropdown-item" href="user/view/changePw.jsp">비밀번호 변경</a></li>
              <li><a class="dropdown-item" href="#">관심장소 모아보기</a></li>
              <li><a class="dropdown-item" href="favorite/favorite_post.html">관심글 모아보기</a></li>
              <li><a class="dropdown-item" href="#">활동내역</a></li>
            </ul></li>
        </ul>

        <div class="dropdown-center">
          <a class="nav-user dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-circle-user fa-3x"></i></a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="user/view/login.jsp">로그인</a></li>
            <li><a class="dropdown-item" href="user/proc/logoutProc.jsp">로그아웃</a></li>
            <li><a class="dropdown-item" href="user/view/signUp.jsp">회원가입</a></li>
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

  <div class="navout">
    <div id="hero-carousel" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#hero-carousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#hero-carousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#hero-carousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        <button type="button" data-bs-target="#hero-carousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
        <button type="button" data-bs-target="#hero-carousel" data-bs-slide-to="4" aria-label="Slide 5"></button>
      </div>

      <div class="carousel-inner">
        <div class="carousel-item active c-item">
          <img src="./image/Cafe1.jpg" class="d-block w-100 c-img" alt="Slide 1">
          <div class="carousel-caption top-0 mt-4">
            <p class="mt-5 fs-3 mr-5 text-uppercase">이번주의 추천 Pick Up</p>
            <h1 class="display-2 fw-bolder text-capitalize">리브릭커피</h1>
            <button class="btn px-4 py-2 fs-5 mt-5">자세히 알아보기</button>
          </div>
        </div>

        <div class="carousel-item c-item">
          <img src="./image/Cafe2.jpg" class="d-block w-100 c-img" alt="Slide 2">
          <div class="carousel-caption top-0 mt-4">
            <p class="text-uppercase fs-3 mt-5">이번주의 추천 Pick Up</p>
            <p class="display-2 fw-bolder text-capitalize">봉쥬르봉봉</p>
            <button class="btn px-4 py-2 fs-5 mt-5" data-bs-toggle="modal" data-bs-target="#booking-modal">자세히 알아보기</button>
          </div>
        </div>

        <div class="carousel-item c-item">
          <img src="./image/Cafe3.jpg" class="d-block w-100 c-img" alt="Slide 3">
          <div class="carousel-caption top-0 mt-4">
            <p class="text-uppercase fs-3 mt-5">이번주의 추천 Pick Up</p>
            <p class="display-2 fw-bolder text-capitalize">한과와락</p>
            <button class="btn px-4 py-2 fs-5 mt-5" data-bs-toggle="modal" data-bs-target="#booking-modal">자세히 알아보기</button>
          </div>
        </div>

        <div class="carousel-item c-item">
          <img src="./image/Cafe4.jpg" class="d-block w-100 c-img" alt="Slide 4">
          <div class="carousel-caption top-0 mt-4">
            <p class="text-uppercase fs-3 mt-5">이번주의 추천 Pick Up</p>
            <p class="display-2 fw-bolder text-capitalize">알베르</p>
            <button class="btn px-4 py-2 fs-5 mt-5" data-bs-toggle="modal" data-bs-target="#booking-modal">자세히 알아보기</button>
          </div>
        </div>

        <div class="carousel-item c-item">
          <img src="./image/Cafe5.jpg" class="d-block w-100 c-img" alt="Slide 5">
          <div class="carousel-caption top-0 mt-4">
            <p class="text-uppercase fs-3 mt-5">이번주의 추천 Pick Up</p>
            <p class="display-2 fw-bolder text-capitalize">마니달오 선릉본점</p>
            <button class="btn px-4 py-2 fs-5 mt-5" data-bs-toggle="modal" data-bs-target="#booking-modal">자세히 알아보기</button>
          </div>
        </div>
      </div>

      <button class="carousel-control-prev" type="button" data-bs-target="#hero-carousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#hero-carousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>

    <div class="find">
      <div class="find-settings">
        <div class="findfont">
          <h1>내 근처 애견 동반 장소 찾기</h1>
          <h5>설정 위치 기준 반경 25km 이내</h5>
        </div>
        <div class="compass">
          <div class="compasses">
            <i class="fa-regular fa-compass"></i> <br>내 위치 설정하기
          </div>
          현재 위치 :
          <div class="gps">&nbsp;서울시 강남구 역삼동</div>
        </div>
      </div>

      <br> <br> <br>
      <ul class="finded">
        <li><span class="badge rounded-pill">256</span><i class="fa-solid fa-utensils"></i>
          <div class="finded-cate">식당</div></li>
        <li><span class="badge rounded-pill">124</span><i class="fa-solid fa-hospital"></i>
          <div class="finded-cate">병원</div></li>
        <li><span class="badge rounded-pill">458</span><i class="fa-solid fa-mug-saucer"></i>
          <div class="finded-cate">카페</div></li>
        <li><span class="badge rounded-pill">67</span><i class="fa-solid fa-dog"></i>
          <div class="finded-cate">애견카페</div></li>
        <li><span class="badge rounded-pill">54</span><i class="fa-solid fa-hotel"></i>
          <div class="finded-cate">숙소</div></li>
        <li><span class="badge rounded-pill">21</span><i class="fa-solid fa-baby-carriage"></i>
          <div class="finded-cate">
            애견<br>유치원
          </div></li>
        <li><span class="badge rounded-pill">16</span><i class="fa-solid fa-bone"></i>
          <div class="finded-cate">훈련소</div></li>
        <li><span class="badge rounded-pill">59</span><i class="fa-solid fa-shop"></i>
          <div class="finded-cate">
            애견<br>용품점
          </div></li>
        <li><span class="badge rounded-pill">227</span><i class="fa-solid fa-tree"></i>
          <div class="finded-cate">
            애견운동장<br>/산책
          </div></li>
      </ul>
    </div>

    <div class="calumn">
      <div class="news">
        <h2>반려견 관련 칼럼 / 뉴스</h2>
        <br> <a href="#">자세히보기</a><br> <br>
        <div class="newsdetail">
          <a href="#" class="card mb-3" style="max-width: 600px;">
            <div class="row g-0">
              <div class="col-md-4">
                <img src="./image/News1.jpg" class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h4 class="card-title">바이든 대통령 반려견, 백악관 경호원 또 물었다</h4>
                  <p class="card-text">조 바이든 미국 대통령의 반려견 커맨더가 백악관 경호원을 또 물었습니다. 현지시간 26일 미국 정치매체 더힐에 따르면 백악관 비밀경호국은 이날 성명을 통해 전날 저녁 8시쯤 비밀경호국 소속 연방 경찰관이 커맨더에 물려 치료를 받았다고 밝혔습니다.</p>
                  <p class="card-text">
                    <small class="text-body-secondary">Last updated 2 days ago</small>
                  </p>
                </div>
              </div>
            </div>
          </a> <a href="#" class="card mb-3" style="max-width: 600px;">
            <div class="row g-0">
              <div class="col-md-4">
                <img src="./image/News2.jpg" class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h4 class="card-title">반려견도 즐거운 인제 가을꽃축제</h4>
                  <p class="card-text">(인제=연합뉴스) 지난 28일 강원 인제군 북면 용대관광지 일대에서 열린 '가을꽃축제'에서 반려견들이 꽃향기를 맡으며 축제를 즐기고 있다. 인제에서 꽃길만 걷자'를 테마로 열린 이번 축제는 다음 달 15일까지 이어진다.</p>
                  <p class="card-text">
                    <small class="text-body-secondary">Last updated 5 hours ago</small>
                  </p>
                </div>
              </div>
            </div>
          </a> <a href="#" class="card mb-3" style="max-width: 600px;">
            <div class="row g-0">
              <div class="col-md-4">
                <img src="./image/News3.jpg" class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h4 class="card-title">반려견과 떠나는 귀성길, 전용장비로 이동·음식 주의해야</h4>
                  <p class="card-text">엿새나 되는 추석 연휴 기간 반려견과 함께 귀경·귀성길에 오르는 반려인구가 늘고 있다. 장시간 집을 비우면서 반려견 혼자 집에 두기 망설여지기 때문이다.</p>
                  <p class="card-text">
                    <small class="text-body-secondary">Last updated 1 day ago</small>
                  </p>
                </div>
              </div>
            </div>
          </a> <a href="#" class="card mb-3" style="max-width: 600px;">
            <div class="row g-0">
              <div class="col-md-4">
                <img src="./image/News4.jpg" class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h4 class="card-title">추석연휴 반려견 케어 꿀팁 "끈적한 떡 주지 마세요"</h4>
                  <p class="card-text">추석 연휴 기간, 귀경·귀성길에 반려견을 동반하는 경우가 늘고 있다. 농촌진흥청은 추석 연휴를 같이 보내는 반려견을 더욱 편안하고 건강하게 돌보기 위한 양육 방법을 소개했다.</p>
                  <p class="card-text">
                    <small class="text-body-secondary">Last updated 1 hour ago</small>
                  </p>
                </div>
              </div>
            </div>
          </a> <a href="#" class="card mb-3" style="max-width: 600px;">
            <div class="row g-0">
              <div class="col-md-4">
                <img src="./image/News5.jpg" class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h4 class="card-title">반려견과 가을꽃</h4>
                  <p class="card-text">(인제=뉴스1) 이종재 기자 = 추석 명절 연휴 첫날인 28일 강원 인제군 북면 용대관광지 일대에서 열린 '가을꽃축제'에서 관광객들이 반려견들과 추억을 남기고 있다. (인제군 제공)</p>
                  <p class="card-text">
                    <small class="text-body-secondary">Last updated 20 hours ago</small>
                  </p>
                </div>
              </div>
            </div>
          </a>
        </div>
      </div>

      <div class="promotion">
        <h2>홍보 게시판</h2>
        <br> <a href="#">자세히보기</a><br> <br>
        <div class="promotiondetail">
          <a href="#" class="card mb-3" style="max-width: 600px;">
            <div class="row g-0">
              <div class="col-md-4">
                <img src="./image/Promotion1.jpg" class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h4 class="card-title">콤펫 강아지 유모차 판매합니다</h4>
                  <p class="card-text">제품명은 콤펫 미리클린라이트 강아지유모차 입니다. 색상은 네이비 컬러구요 사용휫수는 5번이고 사용감 있습니다. 자세한 상태는 사진으로 확인해주세요.</p>
                  <p class="card-text">
                    <small class="text-body-secondary">Last updated 1 hour ago</small>
                  </p>
                </div>
              </div>
            </div>
          </a> <a href="#" class="card mb-3" style="max-width: 600px;">
            <div class="row g-0">
              <div class="col-md-4">
                <img src="./image/Promotion2.jpg" class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h4 class="card-title">[새상품] 생활공작소 펫미스트/ 강아지 보습제 에센스</h4>
                  <p class="card-text">피모보습과 정전기를 방지해주는 펫 미스트 입니다^^ ✔강아지 피모& 모발 보습 효과 ✔털 엉킴 방지 ✔EVE비건인증</p>
                  <p class="card-text">
                    <small class="text-body-secondary">Last updated 2 hours ago</small>
                  </p>
                </div>
              </div>
            </div>
          </a> <a href="#" class="card mb-3" style="max-width: 600px;">
            <div class="row g-0">
              <div class="col-md-4">
                <img src="./image/Promotion3.jpg" class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h4 class="card-title">강아지 노즈워크 장난감</h4>
                  <p class="card-text">간식 넣어서 먹는거 1단계라서 잘해요~ 몇번 사용후 잘 안하게 되네요.</p>
                  <p class="card-text">
                    <small class="text-body-secondary">Last updated 2 hours ago</small>
                  </p>
                </div>
              </div>
            </div>
          </a> <a href="#" class="card mb-3" style="max-width: 600px;">
            <div class="row g-0">
              <div class="col-md-4">
                <img src="./image/Promotion4.jpg" class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h4 class="card-title">[정품/새상품] 강아지 장난감</h4>
                  <p class="card-text">제가 엘에이에서 직접 구매한 강아지 장난감 입니다. 삑삑이를 좋아하는 아이들에게 딱입니다. 노즈워크도 가능한 장난감 많아요! 여러종류 한번에 올려요!</p>
                  <p class="card-text">
                    <small class="text-body-secondary">Last updated 3 hours ago</small>
                  </p>
                </div>
              </div>
            </div>
          </a> <a href="#" class="card mb-3" style="max-width: 600px;">
            <div class="row g-0">
              <div class="col-md-4">
                <img src="./image/Promotion5.jpg" class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h4 class="card-title">[강아지유모차][가격내림] 로띠에 로블레스돔S 블랙</h4>
                  <p class="card-text">로띠에 노블래스돔S 유모차 판매합니다. 아이가 유모차 타는걸 너무 싫어라해서...ㅠㅜ 병원 다닐때만 잠깐씩(10회내외) 사용했어요.</p>
                  <p class="card-text">
                    <small class="text-body-secondary">Last updated 3 hours ago</small>
                  </p>
                </div>
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>
  </div>
</body>

<footer>
  <div class="footer-text">
    공지사항 / 보도자료 / 제휴문의 / 개인정보 처리방침 / 위치정보 이용약관 / 이용약관 <br> <br> <br> (주) Acorn CEO ddd &nbsp;&nbsp;&nbsp;사업자번호 : 000-000 <br> <br> <br> 개인정보 담당자 : aaaaaaaaaaaaaa@naver.com <br> <br> <br> 상품의 예약 이용 및 환불 등의 사항에 대한 책임은 각 판매자에게 있습니다. 또한 ㅇㅇㅇ 에 게시된 이메일 주소 수집을 거부하며, 위반시 정보 통신망법에 의해 처벌됨을 유념하시기 바랍니다. <br> <br> <br> CopyRight C 2023 LOGO All rights reserved
  </div>
</footer>

</html>
<!--
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
<h1>메인화면</h1>
<br><br>
<input type="button" value="로그인" onclick="location.href='user/view/login.jsp'">
<input type="button" value="회원가입" onclick="location.href='user/view/signUp.jsp'">
<input type="button" value="비밀번호변경" onclick="location.href='user/view/changePw.jsp'">
<input type="button" value="로그아웃" onclick="location.href='user/proc/logoutProc.jsp'"/>
<input type="button" value="로그아웃" onclick="location.href='user/proc/logoutProc.jsp'"/><br>
<input type="button" value="내 정보 조회" onclick="location.href='user/view/myInfo.jsp'"/>
<form method="post" action="place/cafe/place_cafe_list.jsp">
  <input type="hidden" name="p_category" value="cafe">
  <input type="submit" value="카페">
</form>
</body>
</html>
-->