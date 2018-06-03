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
		
		BufferedReader reader = null;
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