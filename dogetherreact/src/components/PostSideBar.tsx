import {Link} from "react-router-dom";

const PostSideBar = () => {
    return (
        <div>
            <div className="mylist">
                <h2 className="mypage">커뮤니티</h2>
                <div className="list">
                    <Link to="/post/list?board_id=1"><h4 className="notice active">공지사항</h4></Link>
                    <Link to="/post/list?board_id=1"><h4 className="review">후기 게시판</h4></Link>
                    <Link to="/post/list?board_id=1"><h4 className="ad">홍보 게시판</h4></Link>
                    <Link to="/post/list?board_id=1"><h4 className="news">뉴스/칼럼</h4></Link>
                </div>
            </div>
        </div>
    )
};

export default PostSideBar;