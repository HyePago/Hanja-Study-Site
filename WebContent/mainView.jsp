<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="css/myStyle.css" rel="stylesheet">
</head>
<body>
	<form action="main_search.jsp">
		<div id="find_hanja">
			<table id="find_hanja_table">
				<tr>
					<td style="text-align: left;">
						<select name="find_hanja_select" id="find_hanja_select">
							<option value="��">��</option>
							<option value="��">��</option>
						</select>
						<input type="text" name="find_hanja_text" id="find_hanja_text"> <input type="submit" value="�˻�" id="find_hanja_button">
					</td>
				</tr>
			</table>
		</div>
	</form>
	<div id="today_word">
		<table id="find_hanja_table">
			<tr>
				<th> ������ ��缺�� </th>
			</tr>
		</table>
	</div>
	<div>
		<table id="find_hanja_table">
			<tr>
				<th> ����ó�� ã�� </th>
			</tr>
			<tr>
				<td style="text-align: center;" id="find_okdan">
					<div>
						<a href="#">�μ��� ã��</a> <br>
						<a href="#">������ ã��</a> <br>
						<a href="#">�� ȹ���� ã��</a>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>