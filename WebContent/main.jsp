<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>한자 학습 사이트</title>
<link href="css/myStyle.css" rel="stylesheet">
</head>
<body id="main_body">
	<%
		request.setCharacterEncoding("UTF-8");
	
		String ContentPage = request.getParameter("CONTENTPAGE"); 
	%>
	
	<header id="main_header">
		<jsp:include page="top_menu.jsp"></jsp:include>
	</header>
	
	<section width="1200px" id="main_section">
		<jsp:include page="<%= ContentPage %>" flush="false" />
	</section>
	
</body>
</html>