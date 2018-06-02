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
	<div class="study_hanja_div">
		<table class="study_hanja_table">
			<tr>
				<%
					request.setCharacterEncoding("euc-kr");
				
					String filePath = application.getRealPath("/WEB-INF/false_word/" + session.getAttribute("id") + ".txt");
				
					BufferedReader reader = null;
					
					try {
						reader = new BufferedReader(new FileReader(filePath));
						int i = 0;
						
						while(true){
							String str = reader.readLine();
							
							if(str == null) break;
							
							String[] info = str.split("\t");
							String[] pronunciation_info = info[1].split(",");
							String[] sense_info = info[2].split(",");
							
							String sub_info = sense_info[0] + " " + pronunciation_info[0];
									
							%>
							<td height="150dp">
								<div class="hanja_view" onclick="location.href='NodeHanjaView.jsp?pronunciation=<%= pronunciation_info[0] %>&sense=<%= sense_info[0] %>'">
									<h1><%= info[0] %></h1>
									<%= sub_info %>
								</div>
							</td>
							<%
							i++;
						}
					} catch(Exception e){
						e.printStackTrace();
					}
				%>
			</tr>
			<tr>
				<td> <input type="button" onclick="location.href='Quiz.jsp'" value="뒤로가기"> </td>
			</tr>
		</table>
	</div>
</body>
</html>