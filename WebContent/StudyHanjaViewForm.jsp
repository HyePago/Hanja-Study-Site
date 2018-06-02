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
			
				String hanja = null;
				String subsidiary = null;
				String total_number = null;
				String mean = null;
				String sub_info = null;
				String[] info = null;
			
				String choose = request.getParameter("choose");
			
				String filePath = application.getRealPath("/WEB-INF/hanja/list.txt");

				BufferedReader reader = null;
				int i = 0;
				
				Boolean note = false;
				
				try {
					reader = new BufferedReader(new FileReader(filePath));
					Boolean bool = false;
					
					while(true){
						String str = reader.readLine();
						
						if(str == null) break;
						if(bool == false){
							bool = true;
							continue;
						}
						
					
						if(i == Integer.parseInt(choose)){
							info = str.split("\t");
							hanja = info[0];
							String[] pronunciation_info = info[1].split(",");
							String[] sense_info = info[2].split(",");
							subsidiary = info[3];
							total_number = info[4];
							String[] mean_info = info[5].split(",");
							
							sub_info = "";
							for(int j=0; j<pronunciation_info.length; j++){
								sub_info += sense_info[j] + " " + pronunciation_info[j]+"<br>";
							}
							mean = "";
							for(int j=0; j<mean_info.length; j++) {
								mean += mean_info[j] + "<br>";
							}
							
							break;
						}
						
						i++;
					}	
				} catch(Exception e){
					e.printStackTrace();
				}
				
				if(session.getAttribute("id") != null){
					try {
						filePath = application.getRealPath("/WEB-INF/note/" + session.getAttribute("id") + ".txt");
						reader = new BufferedReader(new FileReader(filePath));
						
						while(true){
							String str = reader.readLine();
							
							if(str == null) break;
							
							String[] info1 = str.split("\t");
							
							if(info1[0].equals(hanja)){
								note = true;
								break;
							}
						}
					} catch(Exception e){
						e.printStackTrace();
					}
				}
			%>
			
			<tr>
				<th> 한자 </th>
				<td>
					<div class="hanja_view"">
						<h1><%= hanja %></h1>
					</div> 
				</td>
			</tr>
			<tr>
				<th> 음과 뜻 </th>
				<td> <%= sub_info %> </td>
			</tr>
			<tr>
				<th> 부수 </th>
				<td> <%= subsidiary %> </td>
			</tr>
			<tr>	
				<th> 총획수 </th>
				<td> <%= total_number %> </td>
			</tr>
			<tr>
				<th colspan="2"> 단어 뜻 풀이 </th>
			</tr>
			<tr>
				<td colspan="2" align="center" style="text-align: center;"> <%= mean %> </td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="뒤로 가기" onclick="history.go(-1)">
					<% if(session.getAttribute("id") != null) { 
						if(note == true) { %>
							<input type="button" value="단어장에서 지우기" onclick="location.href='delete_note.jsp?pronunciation=<%= info[1] %>&sense=<%= info[2] %>'">							
					<% 	} else { %>
							<input type="button" value="단어장에 넣기" onclick="location.href='add_note.jsp?choose=<%= choose %>'">
					<%  }
					}%>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>