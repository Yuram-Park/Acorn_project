<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<form method="post" name="joinForm" action="Join_proc.jsp">
		아이디 : 	<input type="text" name="user_id"/><br><br>
		비밀번호 : 	<input type="text" name="user_pw"/><br><br>
		이메일 : 	<input type="text" name="user_email"/><br><br>
		이름 : 	<input type="text" name="user_name"/><br><br>
		닉네임 : 	<input type="text" name="user_nickname"/><br><br>
		성별 : 	<input type="checkbox" name="user_gender" value="M"/>남성
				<input type="checkbox" name="user_gender" value="W"/>여성<br><br>
		등급 : 	<input type="checkbox" name="user_grade" value="M"/>회원
				<input type="checkbox" name="user_grade" value="S"/>판매자
				<input type="checkbox" name="user_grade" value="G"/>관리자<br><br>
		생일 : <input type="date" name="user_birthday" max="2023-12-31" min="1900-01-01"/><br><br>
		가입형태 : <input type="checkbox" name="user_m_type" value="K"/>카카오
				<input type="checkbox" name="user_m_type" value="G"/>구글
				<input type="checkbox" name="user_m_type" value="N"/>네이버
				<input type="checkbox" name="user_m_type" value="M"/>회원<br><br>
		<input type="submit" value="회원가입"/>
	</form>
</body>
</html>