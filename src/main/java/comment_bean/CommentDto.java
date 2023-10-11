package comment_bean;

import java.sql.Date;

public class CommentDto {
	private int comment_id;
	private String user_id;
	private String user_nickname;
	private int post_id;
	private String comment_content;
	private Date comment_create_date;
	
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
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
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Date getComment_create_date() {
		return comment_create_date;
	}
	public void setComment_create_date(Date comment_create_date) {
		this.comment_create_date = comment_create_date;
	}
	
	
	
	
}