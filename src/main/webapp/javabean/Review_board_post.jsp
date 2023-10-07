<!-- JavaBean 방식 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>후기 게시판</h1>
	<form name="review_board_post" method="post" action="Review_board_postproc.jsp">
	
		임시 user_id/nickname 입력값 받기<br>
		<input type="text" name="user_id" placeholder="user_id 임시"/><br>
		<input type="text" name="user_nickname" placeholder="nickname 임시"/><br><br>
	
	
		<input type="text" name="post_title" size="40" placeholder="제목을 입력해주세요"/><br><br>
		<textarea placeholder="내용을 입력해주세요" name="post_content" style="width:80%;height:200px;"></textarea><br><br>
		<input type="text" size="40" placeholder="사진 추가 (사진은 최대 20장까지 등록 가능합니다)"/>
		<input type="file" name="post_fileName"><br><br>
		<input type="reset" value="작성취소"/>
		<input type="submit" value="등록하기"/>
	</form>
</body>
</html>