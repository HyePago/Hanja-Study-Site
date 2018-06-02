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
		request.setCharacterEncoding("UTF-8");
		
		int pronunciation_count = 1;
	%>

	<form action="add_hanjaProc.jsp" method="post">
		<div id="find_hanja_table">
			<label for="hanja">한자</label> <input type="text" name="hanja" required="required"><hr>
			<label for="sense">훈차</label> <input type="text" name="sense" required="required">
			<label for="pronunciation">음차</label> <input type="text" name="pronunciation" required="required"><br>
			<div id="add_place"></div>
			<input type="button" value="음과 뜻 추가" onclick="add_hanja_sense()"> <br>
			<hr>
			<label for="subsidiary">부수</label> <input type="text" name="subsidiary" required="required"><hr>
			<label for="total_number">총횟수</label> <input type="text" name="total_number" required="required"><hr>
			<label for="mean">단어 뜻 풀이</label> <textarea rows="10" cols="30" name="mean"></textarea><hr>
			<input type="submit" value="저장"> <input type="button" onclick="location.href='manager.jsp'" value="취소">
		</div> 
	</form>

	<div id="add_sample" style="display: none;">
		<label for="pronunciation">음차</label> <input type="text" name="pronunciation" required="required">
		<label for="sense">훈차</label> <input type="text" name="sense" required="required">
		<input type="button" value="삭제" onclick="remove_hanja_sense(this)">
		<br>
	</div>

	<script>
		function add_hanja_sense() {
			var div = document.createElement('div');
			div.innerHTML = document.getElementById('add_sample').innerHTML;
			document.getElementById('add_place').appendChild(div);
		}
		function remove_hanja_sense(obj) {
			document.getElementById('add_place').removeChild(obj.parentNode);
		}
	</script>
</body>
</html>