<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Lesson</title>
<link rel="stylesheet" href="css/bootstrap.css">
<!-- FancyTree Skin -->
<link rel="stylesheet" href="css/skin-lion/ui.fancytree.css" />
<style>
div#editorOption div {
	display: inline-block;
}

.editorArea {
	padding: 5px;
	border: 1px solid orange;
	border-radius: 5px;
}

ul.fancytree-container {
	border: none !important;
	outline: none !important;
}
.divwhite{
	background-color: white;
	border-color: #000530 !important;
}
.btn-change6{
    height: 30px;
    width: 60px;
    background: #666666;
    float: left;
    border:0px;
    color:#fff;
    box-shadow: 0 0 1px #ccc;
    -webkit-transition-duration: 0.2s;
    -webkit-transition-timing-function: linear;
    box-shadow:0px 0 0 #000530 inset;
    border-radius: 10%;
}
.btn-change6:hover{
    box-shadow:0 0 0 25px #000530 inset;
    -webkit-transform: scale(1);
}
</style>
<script src="js/jquery-3.2.1.min.js/"></script>
<script src="js/jquery-ui.js/"></script>
<script src="js/bootstrap.min.js"></script>
<!-- 접속한 사용자의 ip를 알기위한 외부 사이트 주소 -->
<!-- <script src="http://jsgetip.appspot.com"></script> -->
<!-- ACE web editor Library -->
<script src="js/ace/ace.js"></script>
<!-- FancyTree Library -->
<script src="js/jquery.fancytree.js/"></script>
<!-- Building for project explorer -->
<script src="js/customJS/project_explorer.js/"></script>

<script>
var sock = null;

$.ajax({
	url: "checkOpenLesson",
	method: "post",
	data: {"classNum" : '${classNum}'},
	success: function(resp) {
		if(resp == 0) {
			alert('授業がスタートしておりません。');
			location.href = "studentFormLocation?num=${classNum}";
		}
	}
});

$(document).ready(function() {
// 	console.log('${classNum}');
// 	console.log('${studentId}');
	//현재 사용자의 IP를 로딩
// 	var connIp = ip();
	//테스트 용 IP 설정 (== localhost)
	var connIp = '127.0.0.1';
	//web editor 객체 생성 (Code part)
	var editor = ace.edit("editor");
	//web editor 객체 생성 (Console part)
	var consoleView = ace.edit("console");

	//웹소켓 연결 후 소켓 객체를 sock에 저장
	sock = new WebSocket("ws://" + window.location.host	+ "/cl/ws/studentSideLesson");

	//웹소켓 생성 직 후 실행
	sock.onopen = function() {
		//학생의 id와 선생의 id를 로딩
		var id = '${student_id}';
		var classNum = '${classNum}';

		//서버에게 보낼 메세지를 객체로 만듦
		var sendMessage = {};
		sendMessage.action = "init";
		sendMessage.id = id;
		sendMessage.ip = connIp;
		sendMessage.classNum = classNum;

		//JSON 형태로 변환
		var sendMessageJSON = JSON.stringify(sendMessage);
		// 		console.log(sendMessageJSON);

		//웹소켓을 통해 서버에게 메세지 전달
		sock.send(sendMessageJSON);
		console.log('websocket connected');
	}

	//웹소켓을 통해 서버에서 메세지가 전송 되었을 때 실행
	sock.onmessage = function(evt) {
		//console.log(evt.data);
		//받은 메세지를 JSON 객체로 parsing
		var parsedData = JSON.parse(evt.data);
		//메시지의 action 부분을 추출
		var action = parsedData.action;

		//action 부분의 내용에 따라 다른 코드 실행
		//수업 참여 성공 시 실행
		if (action == 'LessonJoinSuccess') {
			//web editor의 maxline을 설정
			editor.setOptions({
				maxLines : 22,
				minLines : 22,
				autoScrollEditorIntoView : true
			});
			//web editor의 syntaxing 언어 설정(java)
			editor.getSession().setMode("ace/mode/java");
			//web editor의 테마 설정
			editor.setTheme("ace/theme/eclipse");
			//web editor를 읽기 전용으로 설정
			editor.setFontSize(15);
			editor.setReadOnly(true);
			editor.setHighlightActiveLine(false);
			editor.renderer.setShowPrintMargin(false);
			editor.setShowInvisibles(true);
			editor.setDisplayIndentGuides(true);
			editor.$blockScrolling = Infinity;
			
			saveEditorOption(editor);
			
			consoleView.setOptions({
				maxLines : 4,
				minLines : 4,
				autoScrollEditorIntoView : true
			});
			consoleView.getSession().setMode(
					"ace/mode/text");
			consoleView.setTheme("ace/theme/eclipse");
			consoleView.setFontSize(13);
			consoleView.setReadOnly(true);
			consoleView.setHighlightActiveLine(false);
			consoleView.renderer.setShowPrintMargin(false);
			consoleView.setDisplayIndentGuides(true);
			consoleView.$blockScrolling = Infinity;
		}
		//수업 참여 직후 Project Explorer 정보 로딩
		else if (action == 'initProjectExplorer') {
			//console.log(parsedData.projectExplorer);
			projectExplorerObject = parsedData.projectExplorer;
			initProjectExplorer(parsedData.projectExplorer);
		}
		//수업 참여 직후 활성화 된 Editor 정보 로딩
		else if (action == 'initActivatedEditor') {
			//console.log(parsedData);
			//활성화된 Editor의 파일 경로 표시
			$('a#fileName').html(parsedData.nowPath);
			//받은 코드를 현재 editor에 그대로 덮어쓰기
			editor.setValue(parsedData.nowCode);
			editor.clearSelection();
		}
		//선생님 Eclipse의 Editor에서 변화가 일어 났을 때 실행
		else if (action == 'changeCode') {
			//받은 코드를 현재 editor에 그대로 덮어쓰기
			editor.setValue(parsedData.code);
			editor.clearSelection();
		}
		//선생님 Eclipse의 Console에서 변화가 일어 났을 때 실행
		else if (action == 'changeConsole') {
			//받은 코드를 현재 editor에 그대로 덮어쓰기
			consoleView.setValue(parsedData.console);
			consoleView.clearSelection();
		}
		//선생님 Eclipse의 활성화 Editor가 바뀌었을 때 실행
		else if (action == 'changeActivatedEditor') {
			//활성화된 Editor의 파일 경로 표시
			$('a#fileName').html(parsedData.nowPath);
			//받은 코드를 현재 editor에 그대로 덮어쓰기
			editor.setValue(parsedData.nowCode);
			editor.clearSelection();
		}
		//파일, 패키지, 프로젝트의 변화가 생겼을 때 실행
		else if (action == 'changeProject') {
// 			console.log(parsedData.projectExplorer);
			projectExplorerObject = parsedData.projectExplorer;
			updateProjectExplorer(parsedData.projectExplorer);
		} 
		else if (action == 'studentListUpdate') {
			var studentList = parsedData.data;
			console.log(studentList);
			var listHtml;
			if(studentList.length == 0) {
				listHtml="";
			} else {
				for ( var index in studentList) {
					listHtml += '<option user-ip="' + studentList[index].ip + '">'
							+ studentList[index].id
							+ '</option>';
				}
			}
			$('div#studentList select').html(listHtml);
		} 
		else if (action == 'chatMessage') {
			var existMessage = $('#chatMessage').val();
			var message = parsedData.from + ": " + parsedData.chatMessage;
			
			if(existMessage == '') {
				existMessage = message;
			} else {
				existMessage = existMessage + '\n' + message;
			}
			
			$('#chatMessage').val(existMessage);
			$('#chatMessage').scrollTop(999999);
			
		}
		else if (action == 'disconnect') {
			alert('授業が終了しました。');
			location.href = 'studentFormLocation?num=${classNum}';
		}
	}

	//엔터키를 누르면 메시지를 보내도록 설정
	$('#message').keydown(function(key) {
		if (key.keyCode == 13) {
			$('#sendMessage').click();
		}
	});

	//보내기 버튼을 클릭했을 때
	$('#sendMessage').click(function() {
		if ($('#message').val() != "") {
			var sendMessage = {};
			sendMessage.action = 'chatMessage';
			sendMessage.chatMessage = $('#message').val();
			var sendMessageJSON = JSON.stringify(sendMessage);
			sock.send(sendMessageJSON);
			$('#message').val("");
		}
	});

	$('select#themeChange').on('change', function() {
		var selectTheme = "ace/theme/" + $(this).val();
		editor.setTheme(selectTheme);
		consoleView.setTheme(selectTheme);
		saveEditorOption(editor);
	});

	$('select#showInvisibles').on('change', function() {
		var showInvisibles = $(this).val();
		console.log(showInvisibles);
		if (showInvisibles == 'true') {
			editor.setShowInvisibles(true);
			consoleView.setShowInvisibles(true);
		} else {
			editor.setShowInvisibles(false);
			consoleView.setShowInvisibles(false);
		}
		saveEditorOption(editor);
	});

	$('select#indentGuides').on('change', function() {
		var indentGuides = $(this).val();
		console.log(indentGuides);
		if (indentGuides == 'true') {
			editor.setDisplayIndentGuides(true);
			consoleView.setDisplayIndentGuides(true);
		} else {
			editor.setDisplayIndentGuides(false);
			consoleView.setDisplayIndentGuides(false);
		}
		saveEditorOption(editor);
	});

	$('select#showGutte').on('change', function() {
		var showGutte = $(this).val();
		console.log(showGutte);
		if (showGutte == 'true') {
			editor.renderer.setShowGutter(true);
			consoleView.renderer.setShowGutter(true);
		} else {
			editor.renderer.setShowGutter(false);
			consoleView.renderer.setShowGutter(false);
		}
	});
});

function saveEditorOption(editor) {
	var editorTheme = editor.getTheme();
	codeForm.theme.value = editorTheme;
	
	var editorInvisibles = editor.getShowInvisibles();
	codeForm.invisibles.value = editorInvisibles;
	
	var editorIndentGuides = editor.getDisplayIndentGuides();
	codeForm.indentGuides.value = editorIndentGuides;
}
</script>
</head>
<%@ include file="../topMenu.jsp" %>
<%@ include file="../sidebar.jsp" %>
<script src="js/jquery.fancytree.js/"></script>
<body class="stretched side-panel-left" style="background-image: url('images/studentLessonBack.jpg'); background-size: 1300px;">
<div class="body-overlay"></div>

<!-- Page Title
============================================= -->
<section id="page-title" class="page-title-mini">
	<div class="container clearfix">
		<h1>'${classInfo.name}' Student : ${id}</h1>
		<span>'${classInfo.name}' Student : ${id}</span>
	</div>
</section>

<section id="content" style="background-color: rgba(255,255,255,0);" >
<div class="container clearfix" style="background: linear-gradient(45deg, #cccccc, #333333); border: 22px solid; border-radius:10%; margin : 10px 30px 10px 30px; padding: 20px 70px 20px 70px; background-position: center center; 
	background-size: 100% 100%;
	" >
	<div class="row" >
		<div id="leftPanel" class="col-sm-10">
			<div id="leftUpperPanel" class="row">
				<div id="treePanel" class="col-sm-3 editorArea divwhite" style="height: 460px; overflow: auto; ">
					<div id="tree"></div>
				</div>
				<div id="editorPanel" class="col-sm-9">
					<div id="fileNamePanel" class="row editorArea divwhite">
						<a id="fileName" style="color: black">FilePath</a>
					</div>
					<div id="editor" class="row editorArea divwhite" ></div>
					<div id="editorOption" class="row editorArea text-right divwhite">
						<div id="editorThemeChange" class="divwhite">
							Theme 
							<select id="themeChange">
								<option value="eclipse">Eclipse</option>
								<option value="xcode">XCode</option>
								<option value="idle_fingers">idle Fingers</option>
								<option value="monokai">Monokai</option>
								<option value="gob">Green on Black</option>
							</select>
						</div>
						&nbsp;
						<div id="editorShowInvisibles">
							Invisibles 
							<select id="showInvisibles">
								<option value="true">on</option>
								<option value="false">off</option>
							</select>
						</div>
						&nbsp;
						<div id="editorIndentGuides">
							IndentGuides 
							<select id="indentGuides">
								<option value="true">on</option>
								<option value="false">off</option>
							</select>
						</div>
						&nbsp;
						<div id="editorShowGutte">
							Gutte 
							<select id="showGutte">
								<option value="true">on</option>
								<option value="false">off</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div id="leftLowerPanel" class="row divwhite">
				<div id="console" class="editorArea divwhite"></div>
			</div>
		</div>
		<div id="rightPanel" class="col-sm-2 divwhite divwhite">
			<div id="rightFirstPanel" class="row editorArea divwhite">
				参加学生目録
				<div id="studentList">
					<select size="10" style="width: 150px; height: 200px"></select>
				</div>
			</div>
			<div id="rightSecondPanel" class="row editorArea divwhite">
				チャット
				<div id="chatDiv">
					<textarea id="chatMessage" cols="19" rows="8" readonly="readonly"></textarea>
					<input type="text" id="message" size="15" placeholder="メッセージ内容" />
					<button id="sendMessage" class="btn-change6">転送</button>
				</div>
			</div>
		</div>
	</div>
</div>
</section>

<form id="codeForm" action="sourceCode" method="POST" target="" class="divwhite nomargin">
	<input type="hidden" name="code">
	<input type="hidden" name="theme">
	<input type="hidden" name="invisibles">
	<input type="hidden" name="indentGuides">
</form>
<footer id="footer" class="dark noborder">

			<div id="copyrights">
				<div class="container center clearfix">
					Copyright HanJo 2017 | All Rights Reserved
				</div>
			</div>

		</footer>
</body>
</html>