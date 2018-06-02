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
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	
		int q1 = Integer.parseInt(request.getParameter("q1"));
		int q2 = Integer.parseInt(request.getParameter("q2"));
		int q3 = Integer.parseInt(request.getParameter("q3"));
		
		String[] sense = request.getParameterValues("sense");
		String[] pronunciation = request.getParameterValues("pronunciation");
		
		Boolean[] answer = new Boolean[]{false, false, false};
		String[] result = new String[3];
		
		String[] info = null;
		String[] pronunciation_info = null;
		String[] sense_info = null;
		
		String[] hanja = new String[3];
		String[] sub_info = new String[3];
		
		Boolean result1 = false;
		Boolean result2 = false;
		
		String filePath = application.getRealPath("/WEB-INF/note/" + session.getAttribute("id") + ".txt");
		String filePath2 = application.getRealPath("/WEB-INF/false_word/" + session.getAttribute("id") + ".txt");
		
		BufferedReader reader = null;
		BufferedWriter bw = null;
		PrintWriter writer = null;
		
		int falseCount = 0;

		try {
			reader = new BufferedReader(new FileReader(filePath));
			
			bw = new BufferedWriter(new FileWriter(filePath2));
			writer = new PrintWriter(bw);
			
			int count = 0;
			String str = null;
			
			while(true) {
				str = reader.readLine();
				
				if(str == null) break;
			
				if(count == q1){
					info = str.split("\t");
					pronunciation_info = info[1].split(",");
					sense_info = info[2].split(",");
					hanja[0] = info[0];
					sub_info[0] = "";
					
					for(int j=0; j<pronunciation_info.length; j++){
						result1 = false;
						result2 = false;
						
						sub_info[0] += sense_info[j] + " " + pronunciation_info[j];
						
						if(j != pronunciation_info.length -1){
							sub_info[0] += ", ";
						}
						
						if(pronunciation[0].equals(pronunciation_info[j])) result1 = true;
						if(sense[0].equals(sense_info[j])) result2 = true;
						
						if(result1 == true && result2 == true) break;
					}

					if(result1 == true && result2 == true) {
						answer[0] = true;
					} else {
						writer.println(str);
					}
				} else if(count == q2){
					info = str.split("\t");
					pronunciation_info = info[1].split(",");
					sense_info = info[2].split(",");
					hanja[1] = info[0];
					sub_info[1] = "";
					
					for(int j=0; j<pronunciation_info.length; j++){
						result1 = false;
						result2 = false;
						
						sub_info[1] += sense_info[j] + " " + pronunciation_info[j];
						
						if(j != pronunciation_info.length -1){
							sub_info[1] += ", ";
						}
						
						if(pronunciation[1].equals(pronunciation_info[j])) result1 = true;
						if(sense[1].equals(sense_info[j])) result2 = true;
						
						if(result1 == true && result2 == true) break;
					}

					if(result1 == true && result2 == true) {
						answer[1] = true;
					} else {
						writer.println(str);
					}
				} else if(count == q3){
					info = str.split("\t");
					pronunciation_info = info[1].split(",");
					sense_info = info[2].split(",");
					hanja[2] = info[0];
					sub_info[2] = "";
					
					for(int j=0; j<pronunciation_info.length; j++){
						result1 = false;
						result2 = false;
						
						sub_info[2] += sense_info[j] + " " + pronunciation_info[j];
						
						if(j != pronunciation_info.length -1){
							sub_info[2] += ", ";
						}
						
						if(pronunciation[2].equals(pronunciation_info[j])) result1 = true;
						if(sense[2].equals(sense_info[j])) result2 = true;
						
						if(result1 == true && result2 == true) break;
					}

					if(result1 == true && result2 == true) {
						answer[2] = true;
					} else {
						writer.println(str);
					}
				}
				count ++;
			}
			
			writer.flush();
			writer.close();
			
		} catch(Exception e){
			e.printStackTrace();
		}
		

		for(int i=0; i<3; i++){
			if(answer[i] == true){
				result[i] = "정답";
			} else {
				result[i] = "오답";
				falseCount++;
			}
		}
		
		BufferedWriter bw2 = null;
		PrintWriter writer2 = null;
		filePath = application.getRealPath("/WEB-INF/score_quiz/" + session.getAttribute("id") + ".txt");
		
		try{
			bw2 = new BufferedWriter(new FileWriter(filePath, true));
			writer2 = new PrintWriter(bw2, true);
			
			writer2.println(falseCount);
			
			writer2.flush();
			writer2.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	%>
	<div class="study_hanja_div">
		<table class="study_hanja_table" style="text-align: left;">
			<tr>
				<th> 번호 </th>
				<th> 한자 </th>
				<th> 정답 </th>
				<th> 입력한 답 </th>
				<th> 정답 여부 </th>
			</tr>
			<tr>
				<td> ① </td> 
				<td> <%= hanja[0] %> </td>
				<td> <%= sub_info[0] %> </td>
				<td> <%= sense[0] + " " + pronunciation[0] %> </td>
				<td> <%= result[0] %> </td>
			</tr>
			<tr>
				<td> ② </td> 
				<td> <%= hanja[1] %> </td>
				<td> <%= sub_info[1] %> </td>
				<td> <%= sense[1] + " " + pronunciation[1] %> </td>
				<td> <%= result[1] %> </td>
			</tr>
			<tr>
				<td> ③ </td> 
				<td> <%= hanja[2] %> </td>
				<td> <%= sub_info[2] %> </td>
				<td> <%= sense[2] + " " + pronunciation[2] %></td>
				<td> <%= result[2] %> </td>
			</tr>
			<tr>
				<td colspan="5"> <hr> </td>
			</tr>
			<tr style="text-align: center;">
				<td colspan="3"> <input type="button" onclick="location.href='index.jsp'" value="홈으로"> </td>
				<td colspan="2"> <input type="button" onclick="location.href='Quiz.jsp'" value="뒤로가기"> </td>
			</tr>
		</table>
	</div>
</body>
</html>