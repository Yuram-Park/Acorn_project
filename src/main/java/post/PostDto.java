package post;

import java.sql.Date;

public class PostDto {
    private int post_id;
    private int board_id;
    private String user_id;
    private String user_nickname;
    private String post_title;
    private String post_content;
    private Date post_create_date;
    private Date post_update_date;
    private int post_views;

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public int getBoard_id() {
        return board_id;
    }

    public void setBoard_id(int board_id) {
        this.board_id = board_id;
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

    public String getPost_title() {
        return post_title;
    }

    public void setPost_title(String post_title) {
        this.post_title = post_title;
    }

    public String getPost_content() {
        return post_content;
    }

    public void setPost_content(String post_content) {
        this.post_content = post_content;
    }

    public Date getPost_create_date() {
        return post_create_date;
    }

    public void setPost_create_date(Date post_create_date) {
        this.post_create_date = post_create_date;
    }

    public Date getPost_update_date() {
        return post_update_date;
    }

    public void setPost_update_date(Date post_update_date) {
        this.post_update_date = post_update_date;
    }

    public int getPost_views() {
        return post_views;
    }

    public void setPost_views(int post_views) {
        this.post_views = post_views;
    }

}
