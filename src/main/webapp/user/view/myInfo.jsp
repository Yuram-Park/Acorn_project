<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="user.UserDao"%>
<%@ page import="user.UserDto"%>
<jsp:useBean id="userDto" class="user.UserDto" />
<jsp:useBean id="userDao" class="user.UserDao" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 조회</title>
</head> 
<body>
  <%
  request.setCharacterEncoding("UTF-8");
  String id = (String) session.getAttribute("sessionID");
  if (id == null) {
      response.sendRedirect("login.jsp");
  } else {
      try {
          userDto = userDao.getUser(id);
          if (userDto != null) {
  %>
  <h2>내 정보 조회</h2>
  <table border="1">
    <tr>
      <td>닉네임</td>
      <td><%=userDto.getUser_nickname()%></td>
    </tr>
    <tr>
      <td>이메일</td>
      <td><%=userDto.getUser_email()%></td>
    </tr>
    <tr>
      <td>아이디</td>
      <td><%=userDto.getUser_id()%></td>
    </tr>
    <tr>
      <td>이름</td>
      <td><%=userDto.getUser_name()%></td>
    </tr>
    <tr>
      <td>생년월일</td>
      <td>개발중</td>
    </tr>
    <tr>
      <td>성별</td>
      <td><%=userDto.getUser_gender()%></td>
    </tr>
    <tr>
      <td>회원 종류</td>
      <td><%=userDto.getUser_grade()%></td>
    </tr>
  </table>
  <%
  }
  } catch (Exception e) {
  e.printStackTrace();
  }
  }
  %>
  <hr>

  <input type="button" value="뒤로가기" onclick="location.href='../../index.jsp'">
  <input type="button" value="회원탈퇴" onclick="location.href='resign.jsp'"/>
</body>
</html>