<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="user.UserDao" %>
<jsp:useBean id="userDao" class="user.UserDao" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
    <%
    // 인코딩 처리
    request.setCharacterEncoding("UTF-8");

    // 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
    String user_id = request.getParameter("user_id");
    String user_pw = request.getParameter("user_pw");
    
    // DB에서 아이디, 비밀번호 확인
    int check = userDao.loginCheck(user_id, user_pw);
    session = request.getSession();
    // URL 및 로그인관련 전달 메시지
    String msg = "";
    if(check == 1) { // 로그인 성공
        // 세션에 현재 아이디 세팅
        session.setAttribute("sessionID", user_id);
        msg = "../../index.jsp";
    }
    else if(check == 0) { // 비밀번호가 틀릴 경우
        msg = "../view/login.jsp?msg=0";
    }
    else { // 아이디가 틀릴 경우
        msg = "../view/login.jsp?msg=-1";
    }
    
    // sendRedirect(String URL) : 해당 URL로 이동
    // URL 뒤에 get방식으로 데이터 전달
    response.sendRedirect(msg);
%>
</body>
</html>