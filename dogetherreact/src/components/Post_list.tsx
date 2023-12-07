import {useLocation} from 'react-router-dom';
import PostSideBar from './PostSideBar';

const Post_list = () => {
    let location = useLocation();
    const title = ["공지사항", "후기게시판", "홍보게시판", "뉴스/칼럼"]
    let board_id:number = location.state.board_id;
    return (
        <div>
            <PostSideBar board_id={board_id}/>
            <h1>{title[board_id-1]}</h1>
        </div>
    );
}

export default Post_list;