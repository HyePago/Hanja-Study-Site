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
	
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		String filePath = application.getRealPath("/WEB-INF/user/user.txt");
		
		BufferedWriter bw = null;
		PrintWriter writer = null;
		BufferedReader reader = null;
		Boolean overlap = false;
		
		BufferedWriter bw2 = null;
		PrintWriter writer2 = null;
		BufferedWriter bw3 = null;
		PrintWriter writer3 = null;
		BufferedWriter bw4 = null;
		PrintWriter writer4 = null;
		
		try {
			reader = new BufferedReader(new FileReader(filePath));
			
			while(true){
				String str = reader.readLine();
				
				if(str == null || str.equals("")) break;
				
				String[] info = str.split("\t");
				
				if(info[1].equals(username)){
					overlap = true;
					break;
				}
			}
			
			if(overlap == true){
				out.println("<script>alert('이미 존재하는 아이디입니다.');</script>");
				out.println("<script>history.back();</script>");
				
				return;
			}
			
			bw = new BufferedWriter(new FileWriter(filePath, true));
			writer = new PrintWriter(bw, true);
			
			writer.printf("%s\t%s\t%s", name, username, password);
			writer.println("");
			writer.flush();
			writer.close();
			
			filePath = application.getRealPath("/WEB-INF/note/"+username+".txt");
			bw2 = new BufferedWriter(new FileWriter(filePath));
			writer2 = new PrintWriter(bw2);
			
			writer2.flush();
			writer2.close();	
			
			filePath = application.getRealPath("/WEB-INF/false_word/"+username+".txt");
			bw3 = new BufferedWriter(new FileWriter(filePath));
			writer3 = new PrintWriter(bw3);
			
			writer3.flush();
			writer3.close();
			
			filePath = application.getRealPath("/WEB-INF/score_quiz/"+username+".txt");
			bw4 = new BufferedWriter(new FileWriter(filePath));
			writer4 = new PrintWriter(bw4);
			
			writer4.flush();
			writer4.close();
		} catch (Exception e){
			e.printStackTrace();
		} 
	%>

	<jsp:forward page="signUp.jsp"></jsp:forward>
</body>
</html>