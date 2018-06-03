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
			<%
				request.setCharacterEncoding("euc-kr");
			
				String filePath = application.getRealPath("/WEB-INF/hanja/list.txt");

				BufferedReader reader = null;
				
				try {
					reader = new BufferedReader(new FileReader(filePath));
					int i = 0;
					Boolean bool = false;
					
					while(true){
						String str = reader.readLine();
						
						if(str == null) break;
						if(bool == false){
							bool = true;
							continue;
						}
						if(i%4 == 0 && i != 0){
							%>
							</tr>
							<%
						}
						if(i%4 == 0){
							%>
							<tr>
							<%
						} 
						
						String[] info = str.split("\t");
						String[] pronunciation_info = info[1].split(",");
						String[] sense_info = info[2].split(",");
						
						String sub_info = sense_info[0] + " " + pronunciation_info[0];
								
						%>
						<td height="150dp">
							<div class="hanja_view" onclick="location.href='StudyHanjaView.jsp?choose=<%= i %>'">
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
		</table>
	</div>
</body>
</html>