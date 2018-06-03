<%@page import="java.io.FileWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="QuizChoose.jsp">
		<div class="sutdy_hanja_div">
			<table class="study_hanja_table">
				<tr>
					<th> 등수 </th>
					<th> 아이디 </th>
					<th> 점수 </th>
				</tr>
	
	
	<%
		request.setCharacterEncoding("euc-kr");
		
		String filePath = application.getRealPath("/WEB-INF/typing/list.txt");
		String filePath2 = application.getRealPath("/WEB-INF/typing/list2.txt");
		
		int score = Integer.parseInt(request.getParameter("score"));
		
		BufferedReader reader = null;
		BufferedWriter bw = null;
		PrintWriter writer = null;
		BufferedWriter bw2 = null;
		PrintWriter writer2 = null;
		
		int join_number = -1; 
		Boolean bool = false;
		Boolean bool2 = false;
		
		try {
			reader = new BufferedReader(new FileReader(filePath));
			bw2 = new BufferedWriter(new FileWriter(filePath2));
			writer2 = new PrintWriter(bw2);
			
			while(true){
				String str = reader.readLine();
				
				if(str == null || str.equals("")) break;
				
				String[] info = str.split("\t");
				
				if(info[0].equals((String)session.getAttribute("id"))){
					if(Integer.parseInt(info[1]) >= score ){
						bool = true;
						join_number = 0;
					} else {
						bool2 = true;
					}
				}
			}
			
			reader = new BufferedReader(new FileReader(filePath));
			int rank = 1;
			
			while(true){
				String str = reader.readLine();
				
				if(str == null || str.equals("")) break;

				String[] info = str.split("\t");

				if((Integer.parseInt(info[1]) < score) && (bool == false)){
					writer2.printf("%s\t%s", (String)session.getAttribute("id"), score);
					writer2.println("");
					bool = true;
					join_number = 0;
					
					%>
					<tr>
						<td> <%= rank %> </td>
						<td> <%= (String)session.getAttribute("id") %> </td>
						<td> <%= score %> </td>
					</tr>
					<%
					rank++;
				}
				
				if(bool2 == true && info[0].equals((String)session.getAttribute("id"))){
					
				}
				else {
					writer2.println(str);
					%>
					
					<tr>
						<td> <%= rank %> </td>
						<td> <%= info[0] %> </td>
						<td> <%= info[1] %> </td>
					</tr>
					<%
					rank++;
				}
			}
			if(join_number == -1){
				writer2.printf("%s\t%s", session.getAttribute("id"), score);
				writer2.println("");
				
			}
			
			writer2.flush();
			writer2.close();
			
			bw = new BufferedWriter(new FileWriter(filePath));
			writer = new PrintWriter(bw);
			
			reader = new BufferedReader(new FileReader(filePath2));
			while(true){
				String str = reader.readLine();
				
				if(str == null || str.equals("")) break;
				writer.println(str);
			}
			
			writer.flush();
			writer.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	%>
			</table>
		</div>
	</form>
</body>
</html>










