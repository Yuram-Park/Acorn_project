package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import comment.CommentDto;
import place.PlaceDto;

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
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc_mariadb");
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

    public Vector getReviewList(int place_id) {
        String sql = "select * from tblreview where place_id='" + place_id + "'";
        Vector vector = new Vector();
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ReviewDto review = new ReviewDto();
                review.setReview_id(rs.getInt("review_id"));
                review.setReview_title(rs.getString("review_title"));
                review.setReview_content(rs.getString("review_content"));
                review.setReview_regdate(rs.getDate("review_regdate"));
                review.setUser_id(rs.getString("user_id"));
                review.setUser_nickname(rs.getString("user_nickname"));
                review.setReview_starRating(rs.getInt("review_starRating"));
                vector.add(review);
            }
        } catch (Exception e) {
            System.out.println("getReviewList() : " + e);
        } finally {
            freeConnection();
        }
        return vector;
    }
    
    // 리뷰 등록
    public void setReview(ReviewDto dto) {
    	String sql = "INSERT INTO tblreview (review_id, user_id, user_nickname, place_id, review_title, review_content, review_starrating) "
    			+ "values(review_id_seq.nextval, ?, ?, ?, ?, ?, ?)";
    	try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getUser_nickname());
			pstmt.setInt(3, dto.getPlace_id());
			pstmt.setString(4, dto.getReview_title());
			pstmt.setString(5, dto.getReview_content());
			pstmt.setInt(6, dto.getReview_starRating());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("setReview : " + e);
		} finally {
            freeConnection();
        }
    }
    
    
 // 임시 리뷰수정 보여주기
    public ReviewDto getReviewUpdate(int review_id) {
        String sql =
                "SELECT user_nickname, review_title, review_content, user_id, place_id, review_starrating FROM tblreview WHERE review_id=?";
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
            	reviewDto.setReview_starRating(rs.getInt("review_starRating"));
            }
        } catch (Exception e) {
            System.out.println("getReviewUpdate() : " + e);
        } finally {
            freeConnection();
        }
        return reviewDto;
    }
    
    // review_updateproc.jsp
    public void setReviewUpdate(ReviewDto reviewDto) {
        String sql = "UPDATE tblreview SET review_content=? WHERE review_id=?";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, reviewDto.getReview_content());
            pstmt.setInt(2, reviewDto.getReview_id());
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("setReviewUpdate() : " + e);
        } finally {
            freeConnection();
        }
    }

    
    // review_delete.jsp
    public void setReviewDelete(int review_id) {
        String sql = "DELETE FROM tblreview WHERE review_id=?";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, review_id);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("setReviewDelete() : " + e);
        } finally {
            freeConnection();
        }
    }
}
