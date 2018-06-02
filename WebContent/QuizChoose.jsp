<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	
		String quiz_select = request.getParameter("quiz_select");
		
		out.print(quiz_select + "<br>");
		
		if(quiz_select.equals("all")){
		%>
			<jsp:forward page="main.jsp">
				<jsp:param value="QuizProcAll.jsp" name="CONTENTPAGE"/>
			</jsp:forward>
		<%
		} else {
		%>
			<jsp:forward page="main.jsp">
				<jsp:param value="QuizProcNote.jsp" name="CONTENTPAGE"/>
			</jsp:forward>
		<%
		}
	%>
</body>
</html>