<%@page import="java.io.FileWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.BufferedWriter"%>
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
	
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		String filePath = application.getRealPath("/WEB-INF/user/user.txt");
		
		BufferedReader reader = null;
		
		try {
			reader = new BufferedReader(new FileReader(filePath));
			
			while(true){
				String str = reader.readLine();
				
				if(str == null || str.equals("")) break;
				
				String[] info = str.split("\t");
				
				if(info[1].equals(username) && info[2].equals(password)){
					session.setAttribute("id", username);
					out.println("<script>location.href='index.jsp'</script>");
					break;
				} else {
					out.println("<script>location.href='index.jsp'</script>");
				}
			}
		} catch (Exception e){
			e.printStackTrace();
		} 
	%>
</body>
</html>