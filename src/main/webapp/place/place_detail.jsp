<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="review.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dogether</title>
<%@ include file="/header.jsp"%>
<link rel="stylesheet" href="place_detail.css">
</head>
<body>
  <!-- Global Navigation Bar -->
  <jsp:include page="/globalNavigationBar.jsp"></jsp:include>

  <jsp:useBean id="placeDao" class="place.PlaceDao" />
  <jsp:useBean id="placeDto" class="place.PlaceDto" />
  <jsp:useBean id="reviewDao" class="review.ReviewDao" />
  <jsp:useBean id="reviewDto" class="review.ReviewDto" />
  <jsp:useBean id="userDao" class="user.UserDao" />
  <jsp:useBean id="userDto" class="user.UserDto" />
  <%
  int place_id = Integer.parseInt(request.getParameter("place_id"));
  placeDto = placeDao.readPlace(place_id);
  String place_category = placeDto.getPlace_category();
  %>

  <!-- Side Bar -->
  <div class="catewrap">
    <h2>장소 추천</h2>
    <div class="cate">
    <% if (place_category.equals("restaurant")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
      식당&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">256</span>
      </h4>
    <% if (place_category.equals("hospital")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        병원&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">124</span>
      </h4>
    <% if (place_category.equals("cafe")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        카페&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">458</span>
      </h4>
    <% if (place_category.equals("dogcafe")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        애견카페&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">67</span>
      </h4>
    <% if (place_category.equals("hotel")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        숙소&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">54</span>
      </h4>
    <% if (place_category.equals("school")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        애견유치원&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">21</span>
      </h4>
    <% if (place_category.equals("training")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        훈련소&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">16</span>
      </h4>
    <% if (place_category.equals("dogshop")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        애견용품점&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">59</span>
      </h4>
    <% if (place_category.equals("playground")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        애견운동장/산책&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">227</span>
      </h4>
    </div>
  </div>

  <!-- Image Carousel -->
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

  <!-- Place Information -->
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
      <i class="fa-solid fa-house"></i> <a href="https://uhyagazapetcafe.modoo.at/"><%=placeDto.getPlace_homepage()%></a>
    </div>
    <div class="tag text">
      <i class="fa-solid fa-tag"></i>#주차장 #실내 #토요일 영업 #일요일 영업 #소형견 #중형견
    </div>
  </div>
  <br>
  <br>

  <!-- 리뷰 등록 -->
  <%
  String session_id = (String) session.getAttribute("sessionID");
  userDto = userDao.getUser(session_id);
  %>
  <div>
    <form method="post" action="../review_proc.jsp">
      <input type="hidden" name="place_id" value="<%=place_id%>" />
      <input type="text" name="user_nickname" value="<%=userDto.getUser_nickname()%>" readonly />
      <br>
      <input type="text" name="review_starRating" placeholder="별점 입력" />
      <br>
      <input type="text" name="review_title" placeholder="리뷰 제목을 입력하세요." />
      <br>
      <textarea rows="3" style="width: 50%;" name="review_content" placeholder="리뷰 내용을 입력하세요."></textarea>
      <input type="submit" value="리뷰 달기" />
    </form>
  </div>
  <br>
  <br>
  <br>
  <br>

  <!-- 리뷰 리스트 -->
  <%
  Vector<ReviewDto> vector = reviewDao.getReviewList(place_id);
  for (int i = 0; i < vector.size(); i++) {
      ReviewDto review = (ReviewDto) vector.get(i);
  %>
  <hr>
  <h5><%=review.getReview_title()%></h5>
  <%=review.getReview_starRating()%>점 |
  <%=review.getReview_regdate()%><br>
  <%=review.getReview_content()%>
  <%
  if (session_id != null && session_id.equals(review.getUser_id())) {
  %>
  <input type="button" value="수정" onClick="location='../review_update.jsp?review_id=<%=review.getReview_id()%>'" />
  <input type="button" value="삭제" onClick="location='../review_delete.jsp?review_id=<%=review.getReview_id()%>'" />
  <%
  }
  }
  %>
  <br>
  <br>
  <img class="mapimage" src="./image/Capture.png" alt="">
</body>
</html>