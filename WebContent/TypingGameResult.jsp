<%@page import="java.io.FileWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/myStyle.css" rel="stylesheet">
</head>
<body id="main_body">
	<%
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
		
		try {
			reader = new BufferedReader(new FileReader(filePath));
			
			while(true){
				String str = reader.readLine();
				
				if(str == null || str.equals("")) break;

				String[] info = str.split("\t");
				
				if(info[0].equals((String)session.getAttribute("id"))) {
					if(Integer.parseInt(info[1]) >= score) {
						bool = true; // 원래 있던 아이디의 것이 쓰인다는 의미
						join_number = 0;
					}
				}
			}
			
			reader = new BufferedReader(new FileReader(filePath));
			
			bw2 = new BufferedWriter(new FileWriter(filePath2));
			writer2 = new PrintWriter(bw2);
			
			if(bool == false){
				while(true){
					String str = reader.readLine();
					
					if(str == null) {
						if(join_number == -1){
							writer2.printf("%s\t%s", session.getAttribute("id"), score);
							writer2.println("");
						}
						break;
					}
					
					String[] info = str.split("\t");
					
					if(bool == false && (info[0].equals((String)session.getAttribute("id")))){
						// 덮어써야하니까 무시
					} else {
						if(Integer.parseInt(info[1]) < score && join_number == -1){
							writer2.printf("%s\t%s", session.getAttribute("id"), score);
							writer2.println("");
							join_number = 0;
						}
						
						writer2.println(str);
					}
					
					
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
			}
		} catch(Exception e){
			e.printStackTrace();
		}
	%>
	<header id="main_header">
		<jsp:include page="top_menu.jsp"></jsp:include>
	</header>
	<section width="1200px" id="main_section">
		<form action="QuizChoose.jsp">
			<div class="sutdy_hanja_div">
				<table class="study_hanja_table" style="text-align: left;">
					<tr>
						<th> 등수 </th>
						<th> 아이디 </th>
						<th> 점수 </th>
					</tr>
					
					<%
						try {
							reader = new BufferedReader(new FileReader(filePath));
							int rank = 1;
							
							while(true){
								String str = reader.readLine();
								
								if(str == null || str.equals("")) break;
								
								String[] info = str.split("\t");
								%>
								<tr>
									<td><%= rank %></td>
									<td><%= info[0] %> </td>
									<td> <%= info[1] %> </td>
								</tr>
								<%
								rank ++;
							}
						} catch (Exception e){
							e.printStackTrace();
						} 
					%>
					<tr>
						<td colspan="3">
							<input type="button" onclick="location.href='TypingGame.jsp'" value="뒤로가기">
						</td>
 					</tr>
				</table>
			</div>
		</form>
	</section>
</body>
</html>