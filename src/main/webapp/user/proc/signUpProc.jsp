<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="user.UserDto"%>
<%@ page import="user.UserDao"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<script>
function goLogin() {
    location.href = "../view/login.jsp";
}
</script>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
  <%
  request.setCharacterEncoding("utf-8");
  %>
  <jsp:useBean id="userDto" class="user.UserDto" />
  <jsp:useBean id="userDao" class="user.UserDao" />
 
  <%
  // <jsp:setProperty property="*" name="userDto" /> 코드를 사용하면 
  // JSP는 요청의 모든 파라미터를 자동으로 UserDto 객체에 설정 
  // 이 때 "user_birthday" 파라미터 값인 "2018-07-22"를 
  // java.util.Date 객체로 변환하는데 실패하여 오류가 발생
  
  String userId = request.getParameter("user_id");
  String userPw = request.getParameter("user_pw");
  String userEmail = request.getParameter("user_email");
  String userName = request.getParameter("user_name");
  String userNickname = request.getParameter("user_nickname");
  String userGender = request.getParameter("user_gender");

  String strDate = request.getParameter("user_birthday");
  DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
  Date date = format.parse(strDate);

  // UserDto에 직접 값을 설정합니다.
userDto.setUser_id(userId);
userDto.setUser_pw(userPw);
userDto.setUser_email(userEmail);
userDto.setUser_name(userName);
userDto.setUser_nickname(userNickname);
userDto.setUser_gender(userGender);
userDto.setUser_birthday(date);
  %>
  <%
  try {
      userDao.insertUser(userDto);
  } catch (Exception e) {
    out.println("오류 발생: " + e.getMessage());
  }
  %>
  <h1>회원가입 정보를 확인하세요.</h1>
  <h3><%=userDto.getUser_nickname()%>님 가입을 축하드립니다.
  </h3>
  <table>
    <tr>
      <td id="title">아이디</td>
      <td><%=userDto.getUser_id()%></td>
    </tr>
    <tr>
      <td id="title">비밀번호</td>
      <td><%=userDto.getUser_pw()%></td>
    </tr>
    <tr>
      <td id="title">이메일</td>
      <td><%=userDto.getUser_email()%></td>
    </tr>
    <tr>
      <td id="title">이름</td>
      <td><%=userDto.getUser_name()%></td>
    </tr>
    <tr>
      <td id="title">닉네임</td>
      <td><%=userDto.getUser_nickname()%></td>
    </tr>
    <tr>
      <td id="title">생일</td>
      <td><%=userDto.getUser_birthday()%>
      </td>
    </tr>
    <tr>
      <td id="title">성별</td>
      <td><%=userDto.getUser_gender()%></td>
    </tr>
  </table>
  <br>
  <input type="button" value="확인" onclick="goLogin()">
</body>
</html>