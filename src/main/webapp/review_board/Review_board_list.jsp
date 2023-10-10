<!-- JavaBean 방식 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="review_boardbean.*" %>
<%!
	int totalRecord = 0; // 총 글의 갯수
	int numPerPage = 3; // 한 페이지 당 보여질 글 갯수
	int totalPage = 0; // 총 페이지 수
	int nowPage = 0; // 현재 페이지
	int beginPerPage = 0; // 페이지별 시작 번호
	int pagePerBlock = 2; // 블럭 당 페이지 수
	int totalBlock = 0; // 총 블럭 수
	int nowBlock = 0; // 현재 블럭
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container{
		display:flex;
		flex-wrap: wrap;
	}
	.place{
		margin: 20px;
	}
	
	/* 본문 내용 일부만 가져오기 */
	.content {
		display: inline-block;
		width: 200px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
</style>
</head>
<script>
	function check(){
		if(document.search.keyWord.value == ""){
			alert("검색어를 입력하세요.");
			document.search.keyWord.focus();
			return;
		}
		document.search.submit();
	}
</script>
<body>
<jsp:useBean id="dao" class="review_boardbean.BoardDao"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<h1>후기 게시판</h1><br>
	<a href="../index.jsp">메인페이지</a>
	<form method="post" name="search" action="Review_board_list.jsp">
		<div style="float: right;">
			<select name="option" size="1">
				<option value="t" selected>제목</option>
				<option value="c">내용</option>
				<option value="tc">제목+내용</option>
				<option value="n">닉네임</option>
			</select> 
			<input type="text" name="searchWord" placeholder="검색" />
			<input type="submit" value="검색" onClick="check()"/>
		</div>
	</form>
	<br><br>
	<div class="container">
	
	<%	
		String option =request.getParameter("option");
		String searchWord = request.getParameter("searchWord");
		
		Vector vector = (Vector)dao.getReviewList(option, searchWord);
		
		totalRecord = vector.size();
		totalPage = (int)Math.ceil((double)totalRecord / numPerPage);
		
		if(request.getParameter("nowPage") != null )
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		
		if(request.getParameter("nowBlock") != null )
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
		
		beginPerPage = nowPage * numPerPage;
		totalBlock =(int) Math.ceil((double)totalPage / pagePerBlock);
		
		for (int i=beginPerPage; i<beginPerPage + numPerPage; i++) {
			if(i == totalRecord)
				break;
			BoardDto dto = (BoardDto)vector.get(i);
	
	%>
		<div class="place">
			<div class="image">
				<!-- image 있어야함 --> <!-- 그림 클릭해도 되게끔 만들기 -->
				<img src="../img/img1.jpg" width="200px" heigth="200px" /> 
			</div>
			<div class="text">
				<a href="Review_board_detail.jsp?post_id=<%=dto.getPost_id()%>"><h3><%= dto.getPost_title() %></h3></a>
				<table width="200px">
					<tr>
						<td colspan="2"><%= dto.getUser_nickname()%></td>
					</tr>
					<tr>
						<td><%=dto.getPost_create_date() %></td>
						<td><%=dto.getPost_views() %></td>
					</tr>
					<tr>
						<td colspan="2"><div class="content"><%=dto.getPost_content() %></div></td>
					</tr>
				</table>
			</div>
		</div>
	<%
		}
	%>
		
	</div><br><br>
	<input type="button" value="게시글 작성하기" onClick="location='Review_board_post.jsp'"/><br>
	<%
		if(nowBlock > 0){
	%>
			<a href="Review_board_list.jsp?nowPage=<%= pagePerBlock*(nowBlock-1)%>&nowBlock=<%=nowBlock-1%>">이전</a>
	<%
		}
	
		for(int i=0; i<pagePerBlock; i++) {
			if((nowBlock* pagePerBlock) + i == totalPage)
				break;
	%>
			<a href="Review_board_list.jsp?nowPage=<%=(nowBlock*pagePerBlock)+i%>&nowBlock=<%=nowBlock%>"><%=(nowBlock*pagePerBlock)+1 +i %></a>
	<%
		}
		
		if(nowBlock + 1 <totalBlock){
	%>
			<a href="Review_board_list.jsp?nowPage=<%=pagePerBlock*(nowBlock+1)%>&nowBlock=<%=nowBlock+1%>">다음</a>
	<%
		}
	%>
</body>
</html>