<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Teacher Lesson</title>
<link rel="stylesheet" href="css/bootstrap.css">
<!-- FancyTree Skin -->
<link rel="stylesheet" href="css/skin-lion/ui.fancytree.css" />
<style>
div#editorOption div {
	display: inline-block;
}


.editorArea {
	padding: 5px;
	border: 1px solid black;
	border-radius: 5px;
}

ul.fancytree-container {
	border: none !important;
	outline: none !important;
}
/* 각 상자 배경 */
.divwhite{
	background-color: white;
	border-color: #000530 !important;
}
/* 버튼 */
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
/* 버튼 hover */
.btn-change6:hover{
    box-shadow:0 0 0 25px #000530 inset;
    -webkit-transform: scale(1);
}
/* 글씨 색깔 */
.textChange{
	color : #000000;
}
div#readyDiv {
	display: table; 
	width: auto; 
	height: 440px;
}
	
h1#nonConnMsg {
	display:table-cell; 
	vertical-align:middle;
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
var existLesson = -100;
var title;
var id = '${teacher_id}';
var classNum = '${classNum}';
var connIp;

var editor;
var consoleView;

$.ajax({
	url: "checkExistLesson",
	method: "post",
	async: false,
	data: {"id" : '${teacher_id}'},
	success: function(resp) {
		existLesson = resp;
		console.log('existLesson : ' + existLesson);
	}
});

$(document).ready(function() {
	
	//현재 사용자의 IP를 로딩
// 	var connIp = ip();
	//테스트 용 IP 설정 (== localhost)
	connIp = '127.0.0.1';
	
	//web editor 객체 생성 (Code part)
	editor = ace.edit("editor");
	//web editor 객체 생성 (Console part)
	consoleView = ace.edit("console");
	
	var startResult = -100;
	
	if(existLesson == 0) {
		$('a#start').on('click', function() {
			//강의 제목 입력
			title = $('input#title').val();
			//선생님 id 입력
	// 		var id = $('input#id').val();
// 			var id = '${teacher_id}';
			//강의 번호 입력
	// 		var classNum = $('input#classNum').val();
// 			var classNum = '${classNum}';
			
			if(title.trim() == "") {
				alert('講義名前を入力してください。');
				return;
			}
			
			//서버에 보낼 메세지를 객체로 만듦
			var teacherInfo = {};
			teacherInfo.classNum = classNum;
			teacherInfo.title = title;
			teacherInfo.id = id;
			teacherInfo.ip = connIp;
			
			if(startResult == -100){
				//서버에 강의 시작 명령 전달(Server Socket생성 및 대기, 선생님의 기본 정보 등록)
				$.ajax({
					url : "startLesson"
					, async: false
					, method : "post"
					, data : teacherInfo
					, success : function(resp) {
						startResult = resp;
					}
				});
				
				lessonStart(startResult, existLesson);
			}
		});
	} else if(existLesson == 1) {
		lessonStart(1, existLesson);
	}
	
	$('a#cancel').on('click', function() {
		var cancelResult = -100;
		
		//서버에 강의 시작 명령 전달(Server Socket생성 및 대기, 선생님의 기본 정보 등록)
		$.ajax({
			url : "cancelLesson"
			, async: false
			, method : "post"
			, success : function(resp) {
				cancelResult = resp;
// 				console.log(cancelResult);
			}
		});
		
		if(cancelResult == 1) {
			$('div#connInfo').append('<br>講義をキャンセルしました。');
			location.href = 'teacherFormLocation?num=${classNum}';
		}
	});
	
	//엔터키를 누르면 메시지를 보내도록 설정
	$("#message").keydown(function (key) {
		if (key.keyCode == 13) {
			$("#sendMessage").click();
		}
	});
    
	//보내기 버튼을 클릭했을 때
	$("#sendMessage").click(function() {
		if( $("#message").val() != "") { 
			var sendMessage = {};
			sendMessage.action = "chatMessage";
			sendMessage.chatMessage = $("#message").val();
			var sendMessageJSON = JSON.stringify(sendMessage);
			sock.send(sendMessageJSON);
			$("#message").val("");
		}
	});
	
	//학생 eclipse 접속 종료
	$('button#stopStudentView').on('click', function() {
		var sendMessage = {};
		sendMessage.action = "closeStudentEclipse";
		var sendMessageJSON = JSON.stringify(sendMessage);
		sock.send(sendMessageJSON);
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
	
	window.onbeforeunload = function() {
		$('button#stopStudentView').trigger('click');
	}
});

function lessonStart(startResult, existLesson) {
	
	console.log('startResult : ' + startResult);
	console.log('existLesson : ' + existLesson);
	
	//서버에 명령 전달이 성공하면 실행
	if(startResult == 1) {
		//웹소켓 연결 후 수켓 객체를 sock에 저장
		sock = new WebSocket("ws://" + window.location.host +"/cl/ws/teacherSideLesson");
		
		//웹소켓 생성 직후 실행
		sock.onopen = function() {
			if(existLesson == 0) {
				//서버에 보낼 메세지를 객체로 만듦
				var sendMessage = {};
				sendMessage.action = "init";
				sendMessage.title = title;
				sendMessage.id = id;
				sendMessage.ip = connIp;
				
				//JSON 형태로 변환
				var sendMessageJSON = JSON.stringify(sendMessage);
//					console.log(sendMessageJSON);
				
				//웹소켓을 통해 서버에서 메세지 전달
				sock.send(sendMessageJSON);
				console.log('websocket connected');
				
				//사용자에게 다음 행동 지시(알림)
				$('div#connInfo').empty();
				$('div#connInfo').append('<br>Eclipseを実行して講義を始めてください。');
			} else if(existLesson == 1) {
				var sendMessage = {};
				sendMessage.action = "join";
				sendMessage.id = id;
				
				//JSON 형태로 변환
				var sendMessageJSON = JSON.stringify(sendMessage);
//					console.log(sendMessageJSON);
				
				//웹소켓을 통해 서버에서 메세지 전달
				sock.send(sendMessageJSON);
			}
		}
		
		//웹소켓을 통해 서버에서 메세지가 전송 되었을 때 실행
		sock.onmessage = function(evt) {
//				console.log(evt.data);

			//받은 메세지를 JSON 객체로 parsing
			var parsedData = JSON.parse(evt.data);
			//메시지의 action 부분을 추출
			var action = parsedData.action;
			
			//action 부분의 내용에 따라 다른 코드 실행
			//서버에 웹소켓 등록 완료 후 실행
			if(action == 'initSuccess') {
				$('div#connInfo').append('<br>ウェブソケットにIP登録を完了しました。');
			} 
			//선생님 Eclipse와 연결 완료 및 클래스 Thread 실행 후 실행
			else if(action == 'eclipseConnSuccess') {
				$('div#startDiv').css('display', 'none');
				$('div#lessonDiv').css('display', 'block');
//					$('div#connInfo').append('<br>eclipse와 연결 완료하였습니다. 강의를 시작합니다.');
			}
			//학생이 강의에 참가하면 실행
			else if(action == 'studentListUpdate') {
				var studentList = parsedData.data;
					console.log(studentList);
				//select tag에 접속 한 학생의 아이디 등록
				var listHtml;
				if(studentList.length == 0) {
					listHtml="";
				} else {
					for(var index in studentList) {
						listHtml += '<option user-ip="' + studentList[index].ip + '">' + studentList[index].id + '</option>';
					}
				}
				$('div#studentList select').html(listHtml);
				
				//student 버튼을 누르면 학생의 eclipse에 접속
				$('button#startStudentView').on('click', function() {
					$('button#stopStudentView').trigger('click');
					var sendMessage = {};
					sendMessage.action = "viewStudentEclipse";
					var selectedUserIp = $('div#studentList select option:selected').attr("user-ip");
					sendMessage.ip = selectedUserIp;
					var sendMessageJSON = JSON.stringify(sendMessage);
					console.log(sendMessageJSON);
					sock.send(sendMessageJSON);
				});
			} 
			//action 부분의 내용에 따라 다른 코드 실행
			//학생 eclipse 접속 성공 시 실행
			else if(action == 'connStudentEclipseSuccess') {
				$('div#leftPanel').css('display', 'block');
				$('div#leftReadyPanel').css('display', 'none');
				
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
			//학생 eclipse 접속 직후 Project Explorer 정보 로딩
			else if(action == 'initProjectExplorer') {
// 				console.log(parsedData.projectExplorer);
				projectExplorerObject = parsedData.projectExplorer;
				initProjectExplorer(parsedData.projectExplorer);
			} 
			//학생 eclipse 접속 직후 활성화 된 Editor 정보 로딩
			else if(action == 'initActivatedEditor') {
				//활성화된 Editor의 파일 경로 표시
				$('a#fileName').html(parsedData.nowPath);
				//받은 코드를 현재 editor에 그대로 덮어쓰기
				editor.setValue(parsedData.nowCode);
				editor.clearSelection();
			} 
			//학생 Eclipse의 Editor에서 변화가 일어 났을 때 실행
			else if(action == 'changeCode') {
				//받은 코드를 현재 editor에 그대로 덮어쓰기
				editor.setValue(parsedData.code);
				editor.clearSelection();
			} 
			//학생 Eclipse의 Console에서 변화가 일어 났을 때 실행
			else if(action == 'changeConsole') {
				//받은 코드를 현재 editor에 그대로 덮어쓰기
				consoleView.setValue(parsedData.console);
				consoleView.clearSelection();
			} 
			//학생 Eclipse의 활성화 Editor가 바뀌었을 때 실행
			else if(action == 'changeActivatedEditor') {
				//활성화된 Editor의 파일 경로 표시
				$('a#fileName').html(parsedData.nowPath);
				//받은 코드를 현재 editor에 그대로 덮어쓰기
				editor.setValue(parsedData.nowCode);
				editor.clearSelection();
			} 
			//파일, 패키지, 프로젝트의 변화가 생겼을 때 실행
			else if(action == 'changeProject') {
// 				console.log(parsedData.projectExplorer);
				projectExplorerObject = parsedData.projectExplorer;
				updateProjectExplorer(parsedData.projectExplorer);
			}
			else if(action == 'chatMessage') {
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
			else if (action == 'disconnStudentEclipse') {
				$('div#leftPanel').css('display', 'none');
				$('div#leftReadyPanel').css('display', 'block');
			}
			else if (action == 'disconnect') {
				$('button#stopStudentView').trigger('click');
				var savedFileName = parsedData.savedFileName;
				var lessonTitle = parsedData.lessonTitle;
				$.ajax({
					url : "saveLesson"
					, async: false
					, method : "post"
					, data : {
						"class_num" : '${classNum}',
						"title" : lessonTitle,
						"saved_code" : savedFileName + ".zip", 
						"saved_audio" : savedFileName + ".mp3", 
					}
					, success : function(resp) {
						console.log(resp);
						saveResult = resp;
					}
				});
//					console.log(savedFileName);
				alert('授業が終了しました。');
				location.href = 'teacherFormLocation?num=${classNum}';
			}
		}
	} else if(startResult == 0) {
		$('div#connInfo').append('<br>サーバーソケットが使用中です。やり直して接続してください。');
	}
}

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
<body class="stretched side-panel-left">
<div class="body-overlay"></div>
		
<!-- Page Title
============================================= -->
<section id="page-title" class="page-title-mini">
	<div class="container clearfix">
		<h1>'${classInfo.name}' Teacher : ${classInfo.teacher_id}</h1>
		<span>'${classInfo.name}' Teacher : ${classInfo.teacher_id}</span>
	</div>
</section>


<div id="startDiv">
	<section id="content" >
		<div class="container clearfix divcenter" style="width:1200px; height:700px; background-image: url(images/teacherLessonBack.jpg); background-size: 1200px;">
			<div  style="left: 380px; top: 5px; width:500px; height: 800px; position: absolute; background-image: url(images/tablet.png); background-size: 430px; background-repeat: no-repeat;">
			</div>
			<div id="lessonStartForm" class="divcenter  bottommargin-sm" style="width: 300px; height: 300px; text-align: center; background-color: rgba(255,255,255,0.5); border-radius:5%; padding-top: 30px; margin-top: 150px;">
				<h3 class="textChange">講義タイトル</h3>
				<input type="text" name="title" id="title" class="bottommargin-sm form-control center" style="margin-left: 10px; margin-right: 10px; width: 280px; background-color: rgba(255,255,255,0.5);" ><br>
				<a href="#" id="start"
						class="button button-3d button-xlarge button-rounded button-reveal button-white button-light tright" style="background-color: rgba(255,255,255,0.5);">
							<i class="icon-line-play textChange" style="width: 30px"></i>講義スタート
				</a>
				<br>
				<a href="#" id="cancel"
						class="button button-3d button-xlarge button-rounded button-reveal button-white button-light tright" style="background-color: rgba(255,255,255,0.5);">
							<i class="icon-switch textChange" style="width: 30px"></i>講義キャンセル
				</a>
			</div>
			<div id="connInfo" style="text-align: center; background-color: background-color: rgba(255,255,255,0.5); color: white;"></div>
		</div>
	</section>
</div>

<div id="lessonDiv" style="background-image: url('images/teacherLessonBack.gif'); display: none;">
<section id="content" style="background-color: rgba(255,255,255,0);">
<div id="bor" class="container clearfix" style="background: linear-gradient(45deg, #cccccc, #333333); border: 22px solid; border-radius:10%; margin : 10px 30px 10px 30px; padding: 20px 70px 20px 70px; background-position: center center; background-size: 100% 100%;" >
	<div class="row" >
		<div id="leftPanel" class="col-sm-10" style="display: none">
			<div id="leftUpperPanel" class="row">
				<div id="treePanel" class="col-sm-3 editorArea divwhite" style="height: 460px; overflow: auto; ">
					<div id="tree"></div>
				</div>
				<div id="editorPanel" class="col-sm-9">
					<div id="editorDiv" class="row">
						<div id="fileNamePanel" class="row editorArea divwhite nomargin">
							<a id="fileName" style="color: black">FilePath</a>
						</div>
						<div id="editor" class="row editorArea divwhite nomargin" ></div>
						<div id="editorOption" class="row editorArea text-right divwhite nomargin">
							<div id="editorThemeChange" class="divwhite textChange">
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
							<div id="editorShowInvisibles" class="textChange">
								Invisibles 
								<select id="showInvisibles">
									<option value="true">on</option>
									<option value="false">off</option>
								</select>
							</div>
							&nbsp;
							<div id="editorIndentGuides" class="textChange">
								IndentGuides 
								<select id="indentGuides">
									<option value="true">on</option>
									<option value="false">off</option>
								</select>
							</div>
							&nbsp;
							<div id="editorShowGutte" class="textChange">
								Gutte 
								<select id="showGutte">
									<option value="true">on</option>
									<option value="false">off</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="leftLowerPanel" class="row divwhite">
				<div id="console" class="editorArea divwhite"></div>
			</div>
		</div>
		<div id="leftReadyPanel" class="col-sm-10">
			<div id="readyDiv" class="divcenter" >
				<h1 id="nonConnMsg">During the lecture</h1>
			</div>
		</div>
		<div id="rightPanel" class="col-sm-2 divwhite divwhite">
			<div id="rightFirstPanel" class="row editorArea divwhite textChange">
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
			<div id="rightThirdPanel" class="row editorArea">
				<div id="connStudentEclipse">
					<button id="startStudentView" class="btn-change6">出力</button>
					<button style="margin-left: 35px;" id="stopStudentView" class="btn-change6">削除</button>
				</div>
			</div>
		</div>
	</div>
</div>
</section>
</div>

<form id="codeForm" action="sourceCode" method="POST" target="" class="nomargin">
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
</footer><!-- #footer end -->
</body>
</html>