<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="user.UserDao" %>
<%@ page import="user.UserDto" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="userDto" class="user.UserDto" />
<jsp:useBean id="userDao" class="user.UserDao" />
<!DOCTYPE html>
<html>
<head>
<script defer>
function changePw() {
    if (!document.userInfo.user_id.value) {
      alert("아이디를 입력하세요.");
      return false;
    }
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

<%
String currentPw = request.getParameter("currentPw");
String newPw = request.getParameter("newPw");
String newPwConfirm = request.getParameter("newPwConfirm");

HttpSession usesession = request.getSession();
String id = (String)usesession.getAttribute("sessionID");

userDto = userDao.getUser(id);

// 출력 스트림을 설정
response.setContentType("text/html;charset=UTF-8");
PrintWriter useout = response.getWriter();

// 현재 비밀번호가 일치하고 새로운 비번과 확인란이 일치하면 업데이트
try {
    if (userDto != null && currentPw.equals(userDto.getUser_pw()) && !newPw.isEmpty() && newPw.equals(newPwConfirm)) {
        userDao.updatePw(id, newPw);
        out.println("<script>alert('비밀번호가 변경되었습니다.'); location.href='../../index.jsp';</script>");
    } else if (!currentPw.equals(userDto.getUser_pw())) {
        out.println("<script>alert('비밀번호가 맞지 않습니다. 다시 시도해주세요.'); history.go(-1);</script>");
    } else if (newPw.isEmpty()) {
        out.println("<script>alert('새 비밀번호를 입력해주세요. 다시 시도해주세요.'); history.go(-1);</script>");
    } else if (!newPw.equals(newPwConfirm)) {
        out.println("<script>alert('변경하려는 비밀번호와 확인란의 값이 일치하지 않습니다. 다시 시도해주세요.'); history.go(-1);</script>");
    } else {
        out.println("<script>alert('비밀번호 변경에 실패했습니다. 다시 시도해주세요.'); history.go(-1);</script>");
    }
    
} catch (Exception e) {
    out.println("<script>alert('오류가 발생했습니다. 다시 시도해주세요.'); history.go(-1);</script>");
    e.printStackTrace();
}
%>

</body>

</html> 
