<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<!-- style -->
<link href="css/myStyle.css" rel="stylesheet">
</head>
<body>
	<nav id="mainNav">
		<div id="main_navigationbar">
			<ul id="main_navbar_ul" type="square">
				<li class="navbar-itme">
					<a class="navbar-link" href="index.jsp">Main</a>
				</li>
				<% 
					if(((String)session.getAttribute("id")) == null || ((String)session.getAttribute("id")).equals("")) { %>
						<li class="navbar-itme">
							<a class="navbar-link" href="StudyHanja.jsp">한자 학습</a>
						</li>
						<li class="navbar-itme">
							<a class="navbar-link" href="signUp.jsp">단어장 학습</a>
						</li>
						<li class="navbar-itme">
							<a class="navbar-link" href="signUp.jsp">한자 퀴즈</a>
						</li>
						<li class="navbar-itme">
							<a class="navbar-link" href="signUp.jsp">한자 타자 게임</a>
						</li>
						<li class="navbar-itme">
							<a class="navbar-link" href="signUp.jsp">로그인</a>
						</li>
						<li class="navbar-itme">
							<a class="navbar-link" href="join.jsp">회원 가입</a>
						</li>
				<% } else { %>
						<li class="navbar-itme">
							<a class="navbar-link" href="StudyHanja.jsp">한자 학습</a>
						</li>
						<li class="navbar-itme">
							<a class="navbar-link" href="NoteHanja.jsp">단어장 학습</a>
						</li>
						<li class="navbar-itme">
							<a class="navbar-link" href="Quiz.jsp">한자 퀴즈</a>
						</li>
						<li class="navbar-itme">
							<a class="navbar-link" href="TypingGame.jsp">한자 타자 게임</a>
						</li>
						<li class="navbar-itme">
							<a class="navbar-link" href="logout.jsp">로그아웃</a>
						</li>
				<% } %>
			</ul>
		</div>
	</nav>
</body>
</html>