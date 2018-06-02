<%@page import="java.io.FileWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.BufferedWriter"%>
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
	
		String hanja = request.getParameter("hanja");
		String[] pronunciation = request.getParameterValues("pronunciation");
		String[] sense = request.getParameterValues("sense");
		String subsidiary = request.getParameter("subsidiary");
		String total_number = request.getParameter("total_number");
		String mean = request.getParameter("mean");
		mean = mean.replace("\r\n", ",");
		
		String filePath = application.getRealPath("/WEB-INF/hanja/list.txt");
		
		BufferedWriter bw = null;
		PrintWriter writer = null;
		
		try {
			bw = new BufferedWriter(new FileWriter(filePath, true));
			writer = new PrintWriter(bw, true);
			
			String pronunciation_string = "";
			String sense_string = "";
			
			for(int i=0; i<pronunciation.length; i++){
				pronunciation_string += pronunciation[i];
				if(i != pronunciation.length -1){
					pronunciation_string += ",";
				}
			}
			for(int i=0; i<sense.length; i++){
				sense_string += sense[i];
				if(i != sense.length -1){
					sense_string += ",";
				}
			}
			
			writer.printf("%s\t%s\t%s\t%s\t%s\t%s", hanja, pronunciation_string, sense_string, subsidiary, total_number, mean);
			writer.println();
			
			writer.flush();
			writer.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		
		out.println("<script>location.href='manager.jsp'</script>");
	%>
</body>
</html>