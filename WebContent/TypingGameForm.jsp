<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("euc-kr");
	
	int right_answer = 0;

	String filePath = application.getRealPath("/WEB-INF/hanja/list.txt");
	
	BufferedReader reader = null;
	Boolean bool = false;
	int i = 0;
	
	ArrayList<String> hanja = new ArrayList<String>();
	ArrayList<String> sub_info = new ArrayList<String>();
	 
	try {
		reader = new BufferedReader(new FileReader(filePath));
		
		while(true){
			String str = reader.readLine();
			
			if(str == null) break;
			if(bool == false) {
				bool = true;
				continue;
			}
			
			String[] info = str.split("\t");
			
			hanja.add(i, info[0]);
			String[] one = info[1].split(",");
			String[] two = info[2].split(",");
			
			sub_info.add(i, two[0] + " " + one[0]);
		}
	} catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>	
</head>
<body>
	<div class="study_hanja_div">
		<div class="container">
			
			<div class="TajaBack" id="tajaBackground"></div>
			<hr style="margin-top: 410px">
			<div class="TajaControl" style="margin: auto; width: 300px;">
				<input type="button" id="tajaStart" value="시작">
				<input type="text" id="tajaTyping" size="20">
			</div>
			<div>
				점수 : <output id="result_answer" value = "0"></output>
			</div>
			<div width="120px" style="background-color: red; width: 200px; border: 1px solid #bbb;" id="hp_bar">&nbsp;
			</div> 
		</div>
	</div>
	<script>
		var movTime = 500; //단어 움직임
		var makeTime = 3000; //화면에 단어가 만들어지는 시간 차이
		var endCnt = 0;
		
		var hanjaQuestion = new Array();
		var hanjaAnswer = new Array();
	
		<%
			for(int j=0; j<hanja.size(); j++){
				%>
				hanjaQuestion[<%= j %>] = "<%= hanja.get(j) %>"; 
				hanjaAnswer[<%= j %>] = "<%= sub_info.get(j) %>";
				<%
			}
		%>
		
		var onDiv = []; // 현재 화면에서 움직이는 Div
		var onHanja = [];
		
		/* hanjaQuestion 배열에서 단어 뽑아서 화면에 보이기 */
		function wordsManufacture(){
			var wordRanld = Math.round(Math.random() * (hanjaQuestion.length - 1)); // 보여줄 한자 고르기
			var wordRanX = Math.round(Math.random()*480) + 700; // 보여줄 위치(x축) 선정
			var newDiv = eval("m" + wordRanld); // m + 숫자 ?
			var wordWidth = newDiv.innerHTML.length * 15; // width
			
			newDiv.style.width = wordWidth + "px";
			newDiv.style.left = wordRanX + "px";
			newDiv.style.display = "block";
			onDiv.push(newDiv);
			onHanja.push(hanjaAnswer[wordRanld]);
			
			if(endCnt % 4 == 0) {
			      tajaStart.value="멈춤";
			} else { 
				setTimeout(wordsManufacture,makeTime);
			    tajaStart.value="시작";
			}
		}
		
		/* 뽑은 단어 움직이기 */
		function wordsMove(){
			for(var i=0; i<onDiv.length; i++){
				if(onDiv[i] == "") continue;
				var speed = Math.round(Math.random() * 20) + i;
				onDiv[i].style.top = (parseInt(onDiv[i].style.top) + speed) + "px";
				
				// 작성 못하고 바닥에 부딪쳤을 때
				if(parseInt(onDiv[i].style.top) > 300){
					onDiv[i].style.display = "none";
					onDiv[i].style.top = "-30px";
					onDiv[i] = "";
					hp_bar.style.width = parseInt(hp_bar.style.width) - 50 +"px";
					if(parseInt(hp_bar.style.width) == 0){
						// 화면 이동
						location.href="TypingGameProc.jsp?score="+parseInt(result_answer.value);
					}
				}	
			}
			if(endCnt % 4 == 0) {
		        tajaStart.value="멈춤";
			} else { 
		        setTimeout(wordsMove,movTime);
		        tajaStart.value="시작";
			}
		}
		
		/* 2개 함수 호출 */
		function tajaGoGo(){
			tajaStart.style.display="none";
			endCnt++;
			tajaTyping.focus();
			wordsManufacture();
			wordsMove();
		}
		
		/* 엔터키 입력되었을 때 */
		function wordsCheck(evt){
			var wordAnswer = tajaTyping.value;
			
			if(window.event.keyCode == 13){
				for(var i=0; i<onDiv.length; i++){
					if(onDiv[i] == "") continue;
					
					// 입력한 값이 일치하는 지 확인
					if(onHanja[i] == wordAnswer){
						onDiv[i].style.display = "none";
						onDiv[i].style.top = "-30px";
						onDiv[i] = "";
						result_answer.value = parseInt(result_answer.value) + 10;
					}
				}
				
				tajaTyping.value = "";
			}
		}
		
		/* 로딩되었을 때 */
		window.onload = function() {
			var movDiv = "";
			
			for(var i=0; i<hanjaQuestion.length; i++){
				movDiv = movDiv + "<DIV id=m" + i +
			     " style='position:absolute;left:30px;top:-30px;width:50px;height:22px;" + 
			     "background-color:#fff;z-index:1; color:#000;display:none; margin-top: 200px;" +
			     " text-align:center; padding: 3px; border:1px solid #FEDBD0;" + 
			     "font-weight:bold; box-shadow:1px 1px 3px rgba(0,0,0,0.5);'>" + 
			     hanjaQuestion[i]+"</div>";
			}
			
			tajaBackground.innerHTML = movDiv;
			tajaStart.onclick = tajaGoGo;
			tajaTyping.onkeypress=wordsCheck;
			result_answer.value = "0";
		}
	</script>
</body>
</html>










