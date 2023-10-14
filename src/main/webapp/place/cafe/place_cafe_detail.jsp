<%@ page import="java.util.*"%>
<%@ page import="place.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="review.*" %>
<jsp:useBean id="placeDao" class="place.PlaceDao" />
<jsp:useBean id="placeDto" class="place.PlaceDto" />
 <jsp:useBean id="reviewDao" class="review.ReviewDao"/>
 <jsp:useBean id="reviewDto" class="review.ReviewDto"/>
 <jsp:useBean id="userDao" class="user.UserDao"/>
 <jsp:useBean id="userDto" class="user.UserDto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Place with your dog</title>
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="place_cafe_detail.css">
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
              <li><a class="dropdown-item" href="place_cafe_list.jsp?place_category=cafe">카페</a></li>
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
              <li><a class="dropdown-item" href="../../user/view/myInfo.jsp">내정보 수정</a></li>
              <li><a class="dropdown-item" href="../../user/view/changePw.jsp">비밀번호 변경</a></li>
              <li><a class="dropdown-item" href="#">관심장소 모아보기</a></li>
              <li><a class="dropdown-item" href="../../favorite/favorite_post.html">관심글 모아보기</a></li>
              <li><a class="dropdown-item" href="#">활동내역</a></li>
            </ul></li>
        </ul>

        <div class="dropdown-center">
          <a class="nav-user dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fa-solid fa-circle-user fa-3x"></i>
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="../../user/view/login.jsp">로그인</a></li>
            <li><a class="dropdown-item" href="../../user/view/signUp.jsp">회원가입</a></li>
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

  <div id="carouselExampleIndicators" class="carousel slide">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="image/Cafe1.jpg" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="image/Cafe2.jpg" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="image/Cafe3.jpg" class="d-block w-100" alt="...">
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
    </button>
  </div>
  <%
  int place_id = Integer.parseInt(request.getParameter("place_id"));
  placeDto = placeDao.readPlace(place_id);
  %>

  <div class="catetitle"><%=placeDto.getPlace_category()%></div>
  <br>
  <br>
  <br>
  <div class="placetitle"><%=placeDto.getPlace_name()%></div>
  <div class="placescore"><%=placeDto.getPlace_score()%></div>

  <button type="button" class="btn btn-outline-dark likebtn">
    <i class="fa-regular fa-heart"></i>&nbsp;&nbsp;&nbsp;관심 등록하기
  </button>


  <div class="placebar">
    <div class="detailbar active">가게 정보</div>
    <div class="reviewbar">리뷰(37)</div>
  </div>
  <div class="placeintro">사랑하는 반려견과 행복하고 즐거운 시간을 보내실 수 있는 따뜻한 공간, 어야가자애견카페에 고객님을 초대합니다. 사랑하는 반려견과 행복하고 즐거운 시간을 보내실 수 있는 따뜻한 공간, 어야가자애견카페에 고객님을 초대합니다. 사랑하는 반려견과 행복하고 즐거운 시간을 보내실 수 있는 따뜻한 공간, 어야가자애견카페에 고객님을 초대합니다.</div>
  <div class="placeinfo">
    <div class="phone text">
      <i class="fa-solid fa-phone"></i><%=placeDto.getPlace_call()%>
    </div>
    <div class="location text">
      <i class="fa-solid fa-location-dot"></i><%=placeDto.getPlace_address()%>
    </div>
    <div class="house text">
      <i class="fa-solid fa-house"></i>
      <a href="https://uhyagazapetcafe.modoo.at/"><%=placeDto.getPlace_homepage()%></a>
    </div>
    <div class="tag text">
      <i class="fa-solid fa-tag"></i>#주차장 #실내 #토요일 영업 #일요일 영업 #소형견 #중형견
    </div>
  </div>
<br><br>
  <!-- 리뷰 등록 -->
  
  <%
  	String user_id = (String)session.getAttribute("sessionID");
  	userDto = userDao.getUser(user_id);
 
  %>
	  <div>
		  <form method="post" action="../review_proc.jsp">
		  	<input type="hidden" name="place_id" value="<%=place_id %>"/>
		  	<input type="text" name="user_nickname" value="<%=userDto.getUser_nickname() %>" readonly/><br>
		  	<input type="text" name="review_starRating" placeholder="별점 입력"/><br>
		  	<input type="text" name="review_title" placeholder="댓글 제목을 입력하세요."/><br>
		  	<textarea rows="3" style="width:50%;" name="review_content" placeholder="댓글을 입력하세요."></textarea>
		  	<input type="submit" value="댓글 달기"/>
		  </form>
	  </div>
  <br><br><br><br>
  

<!-- 리뷰 리스트 -->  
<%
  	Vector vec = (Vector)reviewDao.getReviewList(place_id);
  	
  	for (int i=0; i<vec.size(); i++){
  		ReviewDto review = (ReviewDto) vec.get(i);
  %>
  	<hr>
  	<h5><%=review.getReview_title() %></h5>
  	<%=review.getReview_starRating() %>점 | <%=review.getReview_regdate() %><br>
  	<%=review.getReview_content() %>
  <%
  	
 	 if(user_id.equals(review.getUser_id())){
 %>
 	<input type="button" value="수정" onClick="location='../review_update.jsp?review_id=<%=review.getReview_id() %>'"/>
 	<input type="button" value="삭제" onClick="location='../review_delete.jsp?review_id=<%=review.getReview_id()%>'"/>
 <%
 	 }
  	
  	}
  %>

 <br><br>
 
  <img class="mapimage" src="./image/Capture.png" alt="">
  
</body>
</html>