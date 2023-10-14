<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
    <h2>비밀번호 변경</h2>
    <form action="../proc/changePwProc.jsp" method="post">
        현재 비밀번호를 입력해 주세요: <input type="password" name="currentPw"><br>
        변경하려는 비밀번호를 입력해 주세요: <input type="password" name="newPw"><br>
        변경하려는 비밀번호를 다시 한 번 입력해 주세요: <input type="password" name="newPwConfirm"><br>
        <input type="submit" value="변경">
    </form>

    <hr>
    <input type="button" value="취소" onclick="location.href='../../index.jsp'">
</body>
</html>