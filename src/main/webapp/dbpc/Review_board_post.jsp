<!--DBCP ��� -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>�ı� �Խ���</h1>
	<form name="review_board_post" method="post" action="Review_board_postproc.jsp">
	
		<!-- �ӽ� post_id,user_id �Է°� �ޱ� -->
		<input type="text" name="post_id" value="post_id �ӽ�"/><br><br>
		<input type="text" name="user_id" value="user_id �ӽ�"/><br><br>
	
	
		<input type="text" name="title" size="40" value="������ �Է����ּ���"/><br><br>
		<textarea placeholder="������ �Է����ּ���" name="content" style="width:80%;height:200px;"></textarea><br><br>
		<input type="text" size="40" value="���� �߰� (������ �ִ� 20����� ��� �����մϴ�)"/><br><br>
		<input type="reset" value="�ۼ����"/>
		<input type="submit" value="����ϱ�"/>
	</form>
</body>
</html>