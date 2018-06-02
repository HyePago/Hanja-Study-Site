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
	<%
		request.setCharacterEncoding("euc-kr");
			
		ArrayList<String> hanja = new ArrayList<String>();
		ArrayList<String> sub_info = new ArrayList<String>();
		ArrayList<Integer> choose = new ArrayList<Integer>();
	
		String find_hanja_text = request.getParameter("find_hanja_text");
		
		String filePath = application.getRealPath("/WEB-INF/hanja/list.txt");
		BufferedReader reader = null;
		
		Boolean bool = false;
		int i = 0;
		int ch = 0;
		
		try {
			reader = new BufferedReader(new FileReader(filePath));
			
			while(true){
				String str = reader.readLine();
				
				if(str == null) break;
				if(bool == false){
					bool = true;
					continue;
				}
				
				String[] info = str.split("\t");
				String[] pronunciation = info[1].split(",");
				String[] sense = info[2].split(",");
				
				for(int j=0; j<pronunciation.length; j++){
					if(pronunciation[j].equals(find_hanja_text)){
						hanja.add(i, info[0]);
						sub_info.add(i, sense[j] + " " + pronunciation[j]);
						choose.add(i, ch);
						i++;
						break;
					}
				}
				ch++;
			}
		} catch(Exception e){
			e.printStackTrace();
		}
	%>
	
	<div class="study_hanja_div">
		<table class="study_hanja_table">
			<%
				for(int k=0; k< hanja.size(); k++){
					if(k%4 == 0){
						%>
						<tr>
						<%
					} else if(k%5 == 4){
						%>
						</tr>
						<%
					}
					%>
						<td height="150dp">
							<div class="hanja_view" onclick="location.href='StudyHanjaView.jsp?choose=<%= choose.get(k) %>'">
								<h1><%= hanja.get(k) %></h1>
								<%= sub_info.get(k) %>
							</div>
						</td>
					<%
				}
			%>
		</table>
			<form action="main_search.jsp">
		<div id="find_hanja">
			<table id="find_hanja_table">
				<tr>
					<td style="text-align: left;">
						<select name="find_hanja_select" id="find_hanja_select">
							<option value="음">음</option>
							<option value="뜻">뜻</option>
						</select>
						<input type="text" name="find_hanja_text" id="find_hanja_text"> <input type="submit" value="검색" id="find_hanja_button">
					</td>
				</tr>
			</table>
		</div>
	</form>
	</div>

</body>
</html>