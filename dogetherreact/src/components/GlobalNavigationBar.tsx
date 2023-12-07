import {Link} from "react-router-dom";
import Post_list from "./Post_list";


const GlobalNavigationBar = () => {

    return (
        <nav className="navbar navbar-expand-lg bg-body-tertiary">
            <div className="container-fluid">
                <a className="navbar-brand" href="<c:url value='/'/>">Dogether</a>
                <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span className="navbar-toggler-icon"></span>
                </button>
                <div className="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                        <li className="nav-item dropdown-center"><a className="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">장소</a>
                            <ul className="dropdown-menu">
                                <li><a className="dropdown-item" href="<c:url value='/place/list'/>">식당</a></li>
                                <li><a className="dropdown-item" href="/Dogether/place/place_list.jsp?place_category=hospital&nowPage=0&nowBlock=0">병원</a></li>
                                <li><a className="dropdown-item" href="/Dogether/place/place_list.jsp?place_category=cafe&nowPage=0&nowBlock=0">카페</a></li>
                                <li><a className="dropdown-item" href="/Dogether/place/place_list.jsp?place_category=dogcafe&nowPage=0&nowBlock=0">애견카페</a></li>
                                <li><a className="dropdown-item" href="/Dogether/place/place_list.jsp?place_category=hotel&nowPage=0&nowBlock=0">숙소</a></li>
                                <li><a className="dropdown-item" href="/Dogether/place/place_list.jsp?place_category=school&nowPage=0&nowBlock=0">애견유치원</a></li>
                                <li><a className="dropdown-item" href="/Dogether/place/place_list.jsp?place_category=training&nowPage=0&nowBlock=0">훈련소</a></li>
                                <li><a className="dropdown-item" href="/Dogether/place/place_list.jsp?place_category=dogshop&nowPage=0&nowBlock=0">애견용품점</a></li>
                                <li><a className="dropdown-item" href="/Dogether/place/place_list.jsp?place_category=playground&nowPage=0&nowBlock=0">애견운동장/산책</a></li>
                            </ul></li>

                        <li className="nav-item dropdown-center"><a className="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
                            <ul className="dropdown-menu">
                                <li><Link to="/post/list?board_id=1">공지사항</Link></li>
                                <li><Link to="/post/list?board_id=2">후기게시판</Link></li>
                                <li><Link to="/post/list?board_id=3">홍보게시판</Link></li>
                                <li><Link to="/post/list?board_id=4">뉴스/칼럼</Link></li>
                            </ul></li>

                        <li className="nav-item dropdown-center"><a className="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">마이페이지</a>
                            <ul className="dropdown-menu">
                                <li><a className="dropdown-item" href="/Dogether/user/view/myInfo.jsp">내정보 수정</a></li>
                                <li><a className="dropdown-item" href="/Dogether/user/view/changePw.jsp">비밀번호 변경</a></li>
                                <li><a className="dropdown-item" href="/Dogether/favoritePlace/favorite_place.jsp">관심장소 모아보기</a></li>
                                <li><a className="dropdown-item" href="/Dogether/favoritePost/favorite_post.jsp">관심글 모아보기</a></li>
                                <li><a className="dropdown-item" href="/Dogether/myHistory/my_history.jsp">활동내역</a></li>
                            </ul></li>
                    </ul>

                    <div className="dropdown-center">
                        <a className="nav-user dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i className="fa-solid fa-circle-user fa-3x"></i></a>
                        <ul className="dropdown-menu">
                            <li><a className="dropdown-item" href="<c:url value='/user/login'/>">로그인</a></li>
                            <li><a className="dropdown-item" href="/Dogether/user/proc/logoutProc.jsp">로그아웃</a></li>
                            <li><a className="dropdown-item" href="<c:url value='/user/signUp'/>">회원가입</a></li>
                            <li><a className="dropdown-item" href="#">ID/PW 찾기</a></li>
                        </ul>
                    </div>

                    <form className="d-flex" role="search">
                        <input className="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
                            <button className="btn btn-outline-dark" type="submit">
                                <i className="fa-solid fa-magnifying-glass"></i>
                            </button>
                    </form>
                </div>
            </div>
        </nav>
    );
}

export default GlobalNavigationBar;