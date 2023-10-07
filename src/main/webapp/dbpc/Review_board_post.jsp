<!--DBCP 방식 -->

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
	
		<!-- 임시 post_id,user_id 입력값 받기 -->
		<input type="text" name="post_id" value="post_id 임시"/><br><br>
		<input type="text" name="user_id" value="user_id 임시"/><br><br>
	
	
		<input type="text" name="title" size="40" value="제목을 입력해주세요"/><br><br>
		<textarea placeholder="내용을 입력해주세요" name="content" style="width:80%;height:200px;"></textarea><br><br>
		<input type="text" size="40" value="사진 추가 (사진은 최대 20장까지 등록 가능합니다)"/><br><br>
		<input type="reset" value="작성취소"/>
		<input type="submit" value="등록하기"/>
	</form>
</body>
</html>