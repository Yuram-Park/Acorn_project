package user_bean;

import java.sql.Date;

public class UserDto {
	private String user_id;
	private String user_pw;
	private String user_email;
	private String user_name;
	private String user_nickname;
	private char user_gender;
	private Date user_regdate;
	private String user_grade;
	private Date user_birthday;
	private char user_m_type;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public char getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(char user_gender) {
		this.user_gender = user_gender;
	}
	public Date getUser_regdate() {
		return user_regdate;
	}
	public void setUser_regdate(Date user_regdate) {
		this.user_regdate = user_regdate;
	}
	public String getUser_grade() {
		return user_grade;
	}
	public void setUser_grade(String user_grade) {
		this.user_grade = user_grade;
	}
	public Date getUser_birthday() {
		return user_birthday;
	}
	public void setUser_birthday(Date user_birthday) {
		this.user_birthday = user_birthday;
	}
	public char getUser_m_type() {
		return user_m_type;
	}
	public void setUser_m_type(char user_m_type) {
		this.user_m_type = user_m_type;
	}
	
}
