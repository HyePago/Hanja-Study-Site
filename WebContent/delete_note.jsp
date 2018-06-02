<%@page import="java.io.FileWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.BufferedWriter"%>
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
		
		String pronunciation = request.getParameter("pronunciation");
		String sense = request.getParameter("sense");
		
		String filePath = application.getRealPath("/WEB-INF/note/" + session.getAttribute("id") + ".txt");
		String filePath2 = application.getRealPath("/WEB-INF/note/" + session.getAttribute("id") + "1.txt");
		
		BufferedReader reader = null;
		BufferedWriter bw = null;
		PrintWriter writer = null;
		BufferedWriter bw2 = null;
		PrintWriter writer2 = null;
		
		String str = null;
		
		String[] pronunciation_info = pronunciation.split(",");
		String[] sense_info = sense.split(",");
		
		try {
			reader = new BufferedReader(new FileReader(filePath));
			bw = new BufferedWriter(new FileWriter(filePath2));
			writer = new PrintWriter(bw);
			
			while(true){
				str = reader.readLine();
				
				if(str == null) break;
				
				String[] info = str.split("\t");
				String[] note_pronunciation = info[1].split(",");
				String[] note_sense = info[2].split(",");
				
				if(pronunciation_info.length != note_pronunciation.length){
					writer.println(str);
				} else if(pronunciation_info.length == note_pronunciation.length){
					Boolean bool1 = false;
					Boolean bool2 = false;
					for(int i=0; i<pronunciation_info.length; i++){
						if(pronunciation_info[0].equals(note_pronunciation[i])) bool1 = true;
						if(sense_info[0].equals(note_sense[i])) bool2 = true;
					}
					
					if(bool1 == false && bool2 == false) {
						writer.println(str);
					}
				}
			}
			
			writer.flush();
			writer.close();
			
			reader = new BufferedReader(new FileReader(filePath2));
			bw2 = new BufferedWriter(new FileWriter(filePath));
			writer2 = new PrintWriter(bw2);
			
			while(true){
				str = reader.readLine();
				
				if(str == null) break;
				
				writer2.println(str);
			}
			
			writer2.flush();
			writer2.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		
		out.println("<script>alert('메모장에서 제거하였습니다.');location.href='NoteHanja.jsp';</script>");
	%>
</body>
</html>