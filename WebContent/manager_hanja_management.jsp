<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileInputStream"%>
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
	<table id="find_hanja_table" style="text-align: center">
		<tr>
			<th>한자</th>
			<th>음과 뜻</th>
			<th>부수</th>
			<th>총 횟수</th>
			<th>삭제</th>
		</tr>
	<%
		request.setCharacterEncoding("euc-kr");	
	
		String filePath = application.getRealPath("/WEB-INF/hanja/list.txt");
	
		FileInputStream fileInputStream = null;
		InputStreamReader inputStreamReader = null;
		BufferedReader reader = null;
		
		Boolean sw = false;
		int count = 0;
		
		try {
			fileInputStream = new FileInputStream(filePath);
			inputStreamReader = new InputStreamReader(fileInputStream, "UTF-8");
			reader = new BufferedReader(inputStreamReader);
			
			while(true){
				String str = reader.readLine();
				
				if(str == null) break;
				if(sw == false) {
					sw = true;
					continue;
				}
				
				String[] info = str.split("\t");
				String[] pronunciation_info = info[1].split(",");
				String[] sense_info = info[2].split(",");
				
				String[] sub_info = new String[pronunciation_info.length];
				
				for(int i=0; i<sub_info.length; i++){
					sub_info[i] =  sense_info[i] + " " + pronunciation_info[i];
				}
				%>
				<tr>
					<td onclick="location.href='manager_hanjaView.jsp?count=<%=count%>'"><%= info[0] %></td>
					<td onclick="location.href='manager_hanjaView.jsp?count=<%=count%>'">
					<%
						for(int i=0; i<sub_info.length; i++){
					%>	
						<%= sub_info[i] %><br>
					<% } %>
					</td>
					<td onclick="location.href='manager_hanjaView.jsp?count=<%=count%>'"><%= info[3] %></td>
					<td onclick="location.href='manager_hanjaView.jsp?count=<%=count%>'"><%= info[4] %></td>
					<td><input type="button" value="삭제" onclick="location.href='delete_hanja.jsp?count=<%= count %>'"> </td>
				</tr>
				<%
				count++;
			}
		} catch(Exception e){
			e.printStackTrace();
		}
	%>	

		<tr>
			<td style="text-align: right;" colspan="5">
				<hr><input type="button" value="추가" onclick="location.href='add_hanja.jsp'">
			</td>
		</tr>
	</table>
	
	<script>
	
		function delete_move(current){
			var site = document.getElementById(this);
		}
	
	</script>
</body>
</html>