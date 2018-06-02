<%@page import="java.io.FileReader"%>
<%@page import="java.util.ArrayList"%>
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
	
		String filePath = application.getRealPath("/WEB-INF/score_quiz/" + session.getAttribute("id") + ".txt");
	
		BufferedReader reader = null;
		
		ArrayList<Integer> result = new ArrayList<Integer>();
		
		try {
			reader = new BufferedReader(new FileReader(filePath));
			int i = 0;
			
			while(true){
				String str = reader.readLine();
				
				if(str == null) break;
				
				result.add(i, Integer.parseInt(str));
			}
		} catch(Exception e){
			e.printStackTrace();
		}
	%>
	<div class="study_hanja_div">
		<table class="study_hanja_table" style="text-align: left;">
			<tr>
				<th> 번호 </th>
				<th> 정답 개수 / 문제 개수 </th>
			</tr>
			<%
			
				for(int j=0; j<result.size(); j++){
				%>
					<tr>
						<td> <%= result.size() - j %> </td>
						<td> <%= 3 - result.get(j) %> / 3 </td>
					</tr>
				<%
				}
			%>
			<tr>	
				<td colspan="2">	
					<input type="button" onclick="location.href='Quiz.jsp'" value="뒤로 가기">
					<input type="button" onclick="location.href='index.jsp'" value="홈으로">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>