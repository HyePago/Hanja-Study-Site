<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="joinProc.jsp" method="post">
		<div class="join_div">
			<table align="center" class="join_table">
				<tbody>
					<tr>
						<th> <label for="name">이름</label></th>
						<td> <input type="text" name="name" required="required"> </td>
					</tr>
					<tr>
						<th> <label for="name">아아디</label></th>
						<td> <input type="text" name="username" required="required"> </td>
					</tr>
					<tr>
						<th> <label for="name">비밀번호</label></th>
						<td> <input type="text" name="password" required="required"> </td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="가입">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>