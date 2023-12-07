import React from 'react';
import {Link} from 'react-router-dom';
import './PostSideBar.css'

interface IProps{
    board_id : number;
}
// map으로 뿌려줘보기

const PostSideBar:React.FC<IProps>= ({board_id}) => {

    return (
        <div>
            <div className="mylist">
                <h2 className="mypage">커뮤니티</h2>
                <div className="list">
                    <Link to="/post/list" state={{board_id:1}}><h4 className={"notice" + (board_id === 1 ? " active" : "")}>공지사항</h4></Link>
                    <Link to="/post/list" state={{board_id:2}}><h4 className={"review" + (board_id === 2 ? " active" : "")}>후기 게시판</h4></Link>
                    <Link to="/post/list" state={{board_id:3}}><h4 className={"ad" + (board_id === 3 ? " active" : "")}>홍보 게시판</h4></Link>
                    <Link to="/post/list" state={{board_id:4}}><h4 className={"news" + (board_id === 4 ? " active" : "")}>뉴스/칼럼</h4></Link>
                </div>
            </div>
        </div>
    )
};

export default PostSideBar;