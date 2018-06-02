<%@page import="java.util.Random"%>
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
	
		int question_count = 3;
	
		String filePath = application.getRealPath("/WEB-INF/note/" + session.getAttribute("id") + ".txt");
		BufferedReader reader = null;
		
		int[] question = new int[question_count];
		
		int number = 0;
		
		try {
			reader = new BufferedReader(new FileReader(filePath));
			
			while(true){
				String str = reader.readLine();
				
				if(str == null) break;
				
				number++;
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		
		if(number < 5){
			out.println("<script> alert('단어장 안에 단어가 5개 이상 있어야합니다.'); location.href='Quiz.jsp' </script>");
		}
		
		// 문제 Random, 중복되지 않게
		Random random = new Random();
		
		for(int i=0; i<3; i++){
			question[i] = random.nextInt(number);
		
			for(int j=0; j<i; j++){
				if(question[i] == question[j]){
					i--;
					break;
				}
			}
		}
	%>
	
	<form action="QuizNoteAnswer.jsp">
		<div class="study_handa_div">
			<input type="hidden" name="q1" value="<%= question[0] %>">
			<input type="hidden" name="q2" value="<%= question[1] %>">
			<input type="hidden" name="q3" value="<%= question[2] %>">
			<table class="study_hanja_table">
				<%
					for(int i=0; i<question_count; i++){
						reader = new BufferedReader(new FileReader(filePath));
						int count = 0;
						
						while(true){
							String str = reader.readLine();
							
							if(str == null) break;
							
							if(count == question[i]) {
								String[] info = str.split("\t");
								%>
								<tr>	
									<td>문제 </td>
									<td><%= info[0] %></td>
								</tr>
								<tr>
									<td>정답 </td>
									<td>훈차<input type="text" name="sense">&nbsp;음차<input type="text" name="pronunciation"><hr></td>
								</tr>
								<%
								break;
							}
							count++;
						}
					}
				%>
				<tr>
					<td colspan="2">
						<input type="submit" value="정답 제출">
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>