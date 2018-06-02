<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	
		int line = 0;
	
		BufferedReader reader = null;
		String filePath = application.getRealPath("/WEB-INF/score_quiz/" + session.getAttribute("id") + ".txt");
		double false_percent = 0;
		int result;
		
		try {
			reader = new BufferedReader(new FileReader(filePath));
			
			while(true){
				String str = reader.readLine();
				
				if(str == null) break;
				
				false_percent += Integer.parseInt(str);
				line ++;
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		
		false_percent = false_percent / (line * 3) * 100;
		false_percent = Double.parseDouble(String.format("%.2f", false_percent));
	%>
	<form action="QuizChoose.jsp">
		<div class="sutdy_hanja_div">
			<table class="study_hanja_table">
				<tr>
					<td>단어 선택</td>
					<td>
						<input type="radio" name="quiz_select" value="all" checked="checked" >전체 &nbsp;
						<input type="radio" name="quiz_select" value="note">단어장
					</td>
				</tr>
				<tr>
					<td>오답률</td>
					<td> <%= false_percent %>% </td>
				</tr>
				<tr>	
					<td colspan="2">
						<input type="submit" value="게임 시작">
						<input type="button" value="최근에 틀렸던 단어 다시 보기" onclick="location.href='WrongWord.jsp'">
						<input type="button" value="내 기록 보기" onclick="location.href='ViewRecord.jsp'">
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>