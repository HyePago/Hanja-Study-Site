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

		String count = request.getParameter("count");
		
		String hanja = null;
		String subsidiary = null;
		String total_number = null;
		String mean = null;
		String sub_info = null;
		
		String filePath = application.getRealPath("/WEB-INF/hanja/list.txt");
		
		BufferedReader br = null;
		String str = null;
		int i = -1;
		
		try {
			br = new BufferedReader(new FileReader(filePath));
			
			while(true){
				str = br.readLine();
				
				if(str == null) break;
				if(i != Integer.parseInt(count)){
					i++;
					continue;
				}
				
				String[] info = str.split("\t");
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
		} catch(Exception e){
			e.printStackTrace();
		}
	%>
	
	<table id="find_hanja_table" style="text-align: center">
		<tr>
			<th> 한자 </th>
			<td> <%= hanja %> </td>
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
			<td colspan="2"> <%= mean %> </td>
		</tr>
	</table>
</body>
</html>