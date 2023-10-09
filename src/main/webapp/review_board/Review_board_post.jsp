<!-- JavaBean 방식 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>후기 게시판</h1>
	<form name="review_board_post" method="post" action="Review_board_postproc.jsp">
	
		<!--  user_id/nickname 값 넘기기 -->
		<input type="hidden" name="user_id" value="<%=session.getAttribute("user_id")%>"/><br>
		<input type="hidden" name="user_nickname" value="<%=session.getAttribute("user_nickname")%>"/><br><br>
	
		<input type="text" name="post_title" size="40" placeholder="제목을 입력해주세요"/><br><br>
		<textarea placeholder="내용을 입력해주세요" name="post_content" style="width:80%;height:200px;"></textarea><br><br>
		<input type="text" size="40" placeholder="사진 추가 (사진은 최대 20장까지 등록 가능합니다)"/>
		<input type="file" name="post_fileName"><br><br>
		<input type="reset" value="작성취소"/>
		<input type="submit" value="등록하기"/>
	</form>
</body>
</html>