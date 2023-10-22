package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDao {
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
    public ReviewDao() {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");
        } catch (Exception e) {
            System.out.println("ReviewDao() : " + e);
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

    public Vector<ReviewDto> getReviewList(int place_id) {
        String sql = "select * from tblreview where place_id=?";
        Vector<ReviewDto> vector = new Vector<ReviewDto>();
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, place_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ReviewDto reviewDto = new ReviewDto();
                reviewDto.setReview_id(rs.getInt("review_id"));
                reviewDto.setReview_title(rs.getString("review_title"));
                reviewDto.setReview_content(rs.getString("review_content"));
                reviewDto.setReview_regdate(rs.getDate("review_regdate"));
                reviewDto.setUser_id(rs.getString("user_id"));
                reviewDto.setUser_nickname(rs.getString("user_nickname"));
                reviewDto.setReview_starRating(rs.getFloat("review_starRating"));
                vector.add(reviewDto);
            }
        } catch (Exception e) {
            System.out.println("getReviewList() : " + e);
        } finally {
            freeConnection();
        }
        return vector;
    }

    // 리뷰 등록
    public void setReview(ReviewDto reviewDto) {
        String sql =
                "INSERT INTO tblreview (review_id, user_id, user_nickname, place_id, review_title, review_content, review_starRating) "
                        + "values(review_id_seq.nextval, ?, ?, ?, ?, ?, ?)";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, reviewDto.getUser_id());
            pstmt.setString(2, reviewDto.getUser_nickname());
            pstmt.setInt(3, reviewDto.getPlace_id());
            pstmt.setString(4, reviewDto.getReview_title());
            pstmt.setString(5, reviewDto.getReview_content());
            pstmt.setFloat(6, reviewDto.getReview_starRating());
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("setReview() : " + e);
        } finally {
            freeConnection();
        }
    }

    // 임시 리뷰수정 보여주기
    public ReviewDto getReviewUpdate(int review_id) {
        String sql =
                "SELECT user_nickname, review_title, review_content, user_id, place_id, review_starRating FROM tblreview WHERE review_id=?";
        ReviewDto reviewDto = new ReviewDto();
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, review_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                reviewDto.setUser_nickname(rs.getString("user_nickname"));
                reviewDto.setReview_title(rs.getString("review_title"));
                reviewDto.setReview_content(rs.getString("review_content"));
                reviewDto.setPlace_id((rs.getInt("place_id")));
                reviewDto.setReview_starRating(rs.getFloat("review_starRating"));
            }
        } catch (Exception e) {
            System.out.println("getReviewUpdate() : " + e);
        } finally {
            freeConnection();
        }
        return reviewDto;
    }

    // updateproc.jsp
    public void updateReview(ReviewDto reviewDto) {
        String sql = "UPDATE tblreview SET review_title=?, review_content=? WHERE review_id=?";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, reviewDto.getReview_title());
            pstmt.setString(2, reviewDto.getReview_content());
            pstmt.setInt(3, reviewDto.getReview_id());
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("updateReview() : " + e);
        } finally {
            freeConnection();
        }
    }

    // delete.jsp
    public void deleteReview(int review_id) {
        String sql = "DELETE FROM tblreview WHERE review_id=?";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, review_id);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("deleteReview() : " + e);
        } finally {
            freeConnection();
        }
    }

}
