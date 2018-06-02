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
							<a class="navbar-link" href="StudyHanja.jsp">���� �н�</a>
						</li>
						<li class="navbar-itme">
							<a class="navbar-link" href="signUp.jsp">�ܾ��� �н�</a>
						</li>
						<li class="navbar-itme">
							<a class="navbar-link" href="signUp.jsp">���� ����</a>
						</li>
						<li class="navbar-itme">
							<a class="navbar-link" href="signUp.jsp">���� Ÿ�� ����</a>
						</li>
						<li class="navbar-itme">
							<a class="navbar-link" href="signUp.jsp">�α���</a>
						</li>
						<li class="navbar-itme">
							<a class="navbar-link" href="join.jsp">ȸ�� ����</a>
						</li>
				<% } else { %>
						<li class="navbar-itme">
							<a class="navbar-link" href="StudyHanja.jsp">���� �н�</a>
						</li>
						<li class="navbar-itme">
							<a class="navbar-link" href="NoteHanja.jsp">�ܾ��� �н�</a>
						</li>
						<li class="navbar-itme">
							<a class="navbar-link" href="Quiz.jsp">���� ����</a>
						</li>
						<li class="navbar-itme">
							<a class="navbar-link" href="TypingGame.jsp">���� Ÿ�� ����</a>
						</li>
						<li class="navbar-itme">
							<a class="navbar-link" href="logout.jsp">�α׾ƿ�</a>
						</li>
				<% } %>
			</ul>
		</div>
	</nav>
</body>
</html>