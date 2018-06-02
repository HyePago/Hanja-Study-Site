<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("euc-kr");

	String find_hanja_select = request.getParameter("find_hanja_select");
	String page_value = null;
	
	page_value = "senseSearch.jsp";
	
	if(find_hanja_select.equals("음")){
		page_value = "pronunciationSearch.jsp";
	} else {
		page_value = "senseSearch.jsp";
	}	
%>
	<jsp:forward page="main.jsp">
		<jsp:param value="<%= page_value %>" name="CONTENTPAGE"/>
	</jsp:forward>
    