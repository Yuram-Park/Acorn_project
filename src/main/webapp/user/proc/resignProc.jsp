<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDto"%>
<%@ page import="user.UserDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제 처리</title>
</head>
<body>
	<%
	//세션에서 아이디를, regign.jsp에서 입력받은 비밀번호를 가져온다.
	        String user_id= (String)session.getAttribute("sessionID"); 
	        String user_pw = request.getParameter("user_pw");
	        
	        // 가져온 결과를 가지고 회원정보를 삭제한다. - 삭제결과를 반환
	        UserDao userDao = new UserDao();
	        int check = userDao.resignUser(user_id, user_pw);
	        
	        if(check == 1){
	    session.invalidate(); // 삭제했다면 세션정보를 삭제한다.
	%>
	<br><br>
	<b>회원정보가 삭제되었습니다.</b>
	<br><br>
	

<input type="button" value="확인"
    onclick="javascript:window.location='<%= request.getContextPath() %>/index.jsp'">
	<%    
         // 비밀번호가 틀릴경우 - 삭제가 안되었을 경우
        }else{
    %>
        <script>
            alert("비밀번호가 맞지 않습니다.");
            history.go(-1);
        </script>
    <%
        } 
    %>
</body>
</html>