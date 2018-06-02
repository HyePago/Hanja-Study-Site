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

	
		String choose = request.getParameter("choose");
		String filePath = application.getRealPath("/WEB-INF/hanja/list.txt");
		String filePath2 = application.getRealPath("/WEB-INF/note/" + session.getAttribute("id") + ".txt");
		
		BufferedReader reader = null;
		BufferedWriter bw = null;
		PrintWriter writer = null;
		
		int i = -1;
		
		try {
			reader = new BufferedReader(new FileReader(filePath));
			bw = new BufferedWriter(new FileWriter(filePath2, true));
			writer = new PrintWriter(bw, true);
			
			while(true){
				String str = reader.readLine();
				
				if(str == null) break;
				if(i != Integer.parseInt(choose)){
					i++;
					continue;
				}
				
				writer.println(str);
				writer.flush();
				writer.close();
				
				break;
			}
		} catch(Exception e){
			e.printStackTrace();
		}
	%>
	
	<script>
		location.href="StudyHanjaView.jsp?choose=<%=choose%>";
	</script>
</body>
</html>