<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="place.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dogether</title>
<%@ include file="/header.jsp"%>
<link rel="stylesheet" href="place_list.css">
</head>
<body>
  <!-- Global Navigation Bar -->
  <jsp:include page="/globalNavigationBar.jsp"></jsp:include>

  <jsp:useBean id="placeDao" class="place.PlaceDao" />
  <jsp:useBean id="placeDto" class="place.PlaceDto" />

  <!-- Side Bar -->
  <div class="catewrap">
    <h2>장소 추천</h2>
    <div class="cate"><a href="/Dogether/place/place_list.jsp?place_category=restaurant">
    <% String place_category = request.getParameter("place_category"); %>
    <% if (place_category.equals("restaurant")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
      식당&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">256</span>
      </h4></a><a href="/Dogether/place/place_list.jsp?place_category=hospital">
    <% if (place_category.equals("hospital")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        병원&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">124</span>
      </h4></a><a href="/Dogether/place/place_list.jsp?place_category=cafe">
    <% if (place_category.equals("cafe")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        카페&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">458</span>
      </h4></a><a href="/Dogether/place/place_list.jsp?place_category=dogcafe">
    <% if (place_category.equals("dogcafe")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        애견카페&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">67</span>
      </h4></a><a href="/Dogether/place/place_list.jsp?place_category=hotel">
    <% if (place_category.equals("hotel")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        숙소&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">54</span>
      </h4></a><a href="/Dogether/place/place_list.jsp?place_category=school">
    <% if (place_category.equals("school")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        애견유치원&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">21</span>
      </h4></a><a href="/Dogether/place/place_list.jsp?place_category=training">
    <% if (place_category.equals("training")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        훈련소&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">16</span>
      </h4></a><a href="/Dogether/place/place_list.jsp?place_category=dogshop">
    <% if (place_category.equals("dogshop")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        애견용품점&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">59</span>
      </h4></a><a href="/Dogether/place/place_list.jsp?place_category=playground">
    <% if (place_category.equals("playground")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        애견운동장/산책&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">227</span>
      </h4></a>
    </div>
  </div>

  <!-- Filter -->
  <div class="checkwrap">
    <div class="checkgps">
      현재 검색 위치 :
      <%=session.getAttribute("location")%><br>
      <div class="gpschange">검색 위치 변경</div>
    </div>
    <div class="check">
      <div class="checkbox">
        편의시설
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">주차장</label>
      </div>
      <div class="checkbox">
        위치
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">실내</label>
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">실외</label>
      </div>
      <div class="checkbox">
        영업시간
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">토요일 영업</label>
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">일요일 영업</label>
      </div>
      <div class="checkbox">
        사이즈
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">소형견</label>
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">중형견</label>
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">대형견</label>
      </div>
    </div>
  </div>

  <!-- Place List -->
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
      
      Vector<PlaceDto> vector = (Vector)placeDao.getPlaceList(place_category);
      int n = (vector.size() < 6) ? vector.size() : 6;
      if (n >= 1) {
          for (int i = 0; i < ((n / 2.0 < 3.0) ? Math.ceil(n / 2.0) : 3); i++) {
              for (int j = 0; j < ((n - i * 2) < 2 ? (n - i * 2) : 2); j++) {
          placeDto = vector.get(j + i * 2);
      %>
      <div class="cards">
        <a href="place_detail.jsp?place_id=<%=placeDto.getPlace_id()%>" class="card mb-3" style="max-width: 600px; margin-top: 40px;">
          <div class="row g-0">
            <div class="col-md-4">
              <img src="./image/Cafe<%=j + i * 2 + 1%>.jpg" class="img-fluid rounded-start" alt="...">
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h4 class="card-title"><%=placeDto.getPlace_name()%><div class="score"><%=placeDto.getPlace_score()%></div>
                </h4>
                <p class="card-text">현재 위치에서 1.2km 거리</p>
                <p class="card-text">
                  <small class="text-body-secondary"><%=placeDto.getPlace_category()%> | <%=placeDto.getPlace_address()%> <br> #주차장 #실내 #토요일 영업 #일요일 영업 #소형견 #중형견 <br> <%=placeDto.getPlace_call()%></small>
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

    <!-- Paging -->
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