package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommentDao {
    /*
     * Field
     */

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private DataSource ds;

    /*
     * Constructor
     */

    // Default Constructor
    public CommentDao() {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc_mariadb");
        } catch (Exception e) {
            System.out.println("CommentDao() : " + e);
        }
    }

    /*
     * Method
     */

    // freeConnection
    public void freeConnection() {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // comment.jsp
    public void setComment(CommentDto commentDto) {
        String sql =
                "INSERT INTO tblcomment (comment_id, user_id, user_nickname, board_id, post_id, comment_content) "
                        + "VALUES (nextval(seq_comment_id), ?, ?, ?, ?, ?)";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, commentDto.getUser_id());
            pstmt.setString(2, commentDto.getUser_nickname());
            pstmt.setInt(3, commentDto.getBoard_id()); // 추가
            pstmt.setInt(4, commentDto.getPost_id());
            pstmt.setString(5, commentDto.getComment_content());
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("setComment() : " + e);
        } finally {
            freeConnection();
        }
    }

    // 댓글 보여주기 post_detail.jsp
    public Vector<CommentDto> getCommentList(int post_id) {
        String sql =
                "SELECT comment_id, user_id, user_nickname, comment_content, comment_create_date "
                        + "from tblcomment WHERE post_id=?";
        Vector<CommentDto> vector = new Vector<CommentDto>();
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, post_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                CommentDto commentDto = new CommentDto();
                commentDto.setComment_id(rs.getInt("comment_id"));
                commentDto.setUser_id(rs.getString("user_id"));
                commentDto.setUser_nickname(rs.getString("user_nickname"));
                commentDto.setComment_content(rs.getString("comment_content"));
                commentDto.setComment_create_date(rs.getDate("comment_create_date"));
                vector.add(commentDto);
            }
        } catch (Exception e) {
            System.out.println("getCommentList() : " + e);
        } finally {
            freeConnection();
        }
        return vector;
    }

    // 임시 댓글수정 보여주기, post_id 가져오기 update.jsp, delete.jsp
    public CommentDto getCommentUpdate(int comment_id) {
        String sql =
                "SELECT user_nickname, comment_content, post_id FROM tblcomment WHERE comment_id=?";
        CommentDto commentDto = new CommentDto();
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, comment_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                commentDto.setUser_nickname(rs.getString("user_nickname"));
                commentDto.setComment_content(rs.getString("comment_content"));
                commentDto.setPost_id((rs.getInt("post_id")));
            }
        } catch (Exception e) {
            System.out.println("getCommentUpdate() : " + e);
        } finally {
            freeConnection();
        }
        return commentDto;
    }

    // updateproc.jsp
    public void updateComment(CommentDto commentDto) {
        String sql = "UPDATE tblcomment SET comment_content=? WHERE comment_id=?";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, commentDto.getComment_content());
            pstmt.setInt(2, commentDto.getComment_id());
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("updateComment() : " + e);
        } finally {
            freeConnection();
        }
    }

    // delete.jsp
    public void deleteComment(int comment_id) {
        String sql = "DELETE FROM tblcomment WHERE comment_id=?";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, comment_id);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("deleteComment() : " + e);
        } finally {
            freeConnection();
        }
    }

}
