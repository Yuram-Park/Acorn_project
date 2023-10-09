package comment_bean;

import java.sql.Date;

public class CommentDto {
	private int comments_id;
	private String user_id;
	private String user_nickname;
	private int post_id;
	private String comments_content;
	private Date comments_create_date;
	
	public int getComments_id() {
		return comments_id;
	}
	public void setComments_id(int comments_id) {
		this.comments_id = comments_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getComments_content() {
		return comments_content;
	}
	public void setComments_content(String comments_content) {
		this.comments_content = comments_content;
	}
	public Date getComments_create_date() {
		return comments_create_date;
	}
	public void setComments_create_date(Date comments_create_date) {
		this.comments_create_date = comments_create_date;
	}
	
	
}
