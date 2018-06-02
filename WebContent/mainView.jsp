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
							<option value="음">음</option>
							<option value="뜻">뜻</option>
						</select>
						<input type="text" name="find_hanja_text" id="find_hanja_text"> <input type="submit" value="검색" id="find_hanja_button">
					</td>
				</tr>
			</table>
		</div>
	</form>
	<div id="today_word">
		<table id="find_hanja_table">
			<tr>
				<th> 오늘의 고사성어 </th>
			</tr>
		</table>
	</div>
	<div>
		<table id="find_hanja_table">
			<tr>
				<th> 옥편처럼 찾기 </th>
			</tr>
			<tr>
				<td style="text-align: center;" id="find_okdan">
					<div>
						<a href="#">부수로 찾기</a> <br>
						<a href="#">음으로 찾기</a> <br>
						<a href="#">총 획수로 찾기</a>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>