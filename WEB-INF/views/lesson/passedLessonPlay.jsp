<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Passed Lesson Play</title>
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1" />
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
.backWhite{
	background-color: white;
}
.topPanel {
	display: table; 
	width: auto; 
	height: 50px;
}
	
.topPanelPart {
	display:table-cell; 
	vertical-align:middle;
}
</style>
<script src="js/jquery-3.2.1.min.js/"></script>
<script src="js/jquery-ui.js/"></script>
<script src="js/bootstrap.min.js"></script>
<!-- ACE web editor Library -->
<script src="js/ace/ace.js"></script>
<!-- Building for project explorer -->
<script src="js/customJS/project_explorer.js/"></script>

<script>
var first = true;
$(function() {
	
	var unzipTextResult = -100;
	
	$.ajax({
		url : "unzipText",
		method : "post",
		data : {saved_code : "${savedLessonInfo.saved_code}"},
		async : false,
		success : function(resp) {
			unzipTextResult = resp;
		}
	});
	
	if(unzipTextResult == 1) {
		
		var myAudio = document.getElementById('myAudio');
// 		console.log(myAudio);
		var req = new XMLHttpRequest();
		req.open('GET', 'audioPlay?saved_audio=${savedLessonInfo.saved_audio}', true);
		req.responseType = 'blob';
		req.onload = function() {
			console.log('onload');
			if (this.status === 200) {
				console.log('status 200');
				var audioBlob = this.response;
				console.log(audioBlob);
				var aud = URL.createObjectURL(audioBlob);
				
				myAudio.src = aud;
			}
		}
		req.onerror = function() {}
		req.send();
		
		$('button#speedUp').on('click', function() {
			if(myAudio.playbackRate >= 3) {
				return;
			}
			myAudio.playbackRate = myAudio.playbackRate + 0.5;
			$('pre#nowSpeed').text(myAudio.playbackRate + " 倍速");
			console.log(myAudio.playbackRate);
		});
		
		$('button#speedDown').on('click', function() {
			if(myAudio.playbackRate <= 0.5) {
				return;
			}
			myAudio.playbackRate = myAudio.playbackRate-0.5;
			$('pre#nowSpeed').text(myAudio.playbackRate + " 倍速");
			console.log(myAudio.playbackRate);
		});
		
		window.onbeforeunload = function() {
			$.ajax({
				url : "deleteText",
				method : "post",
				data : {saved_code : "${savedLessonInfo.saved_code}"}
			});
		}
		
		//web editor 객체 생성 (Code part)
		var editor = ace.edit("editor");
		//web editor의 maxline을 설정
		editor.setOptions({
			maxLines : 25,
			minLines : 25,
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
		
		var consoleView = ace.edit("console");
		consoleView.setOptions({
			maxLines : 3,
			minLines : 3,
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
		
		var oVideo = document.getElementById("myAudio");
		// 자막 리스트들을 가지고 옴
		var oTrackList = oVideo.textTracks;
		// 자막 리스트들 중 첫번째 자막 선택
		var oTextTrack = oTrackList[0];
		// 자막 텍스트가 바뀔때 마다 트리거 발생
		oTextTrack.oncuechange = function(e) {
			var cue = this.activeCues[0];
			//display에 뿌려줌
			if(cue) {
				var aa = JSON.parse(cue.text);
				console.log(aa);
	// 			console.log(editor);
				$('a#fileName').html(aa.nowPath);
				editor.setValue(aa.nowCode);
				editor.clearSelection();
				if(aa.changedConsole) {
					consoleView.setValue(aa.changedConsole);
					consoleView.moveCursorTo(0, 0); 
				} else {
					consoleView.setValue("");
				}
				
				if(first) {
					projectExplorerObject = aa.projectExplorer;
					initProjectExplorer(aa.projectExplorer);
					first = false;
				} else {
					projectExplorerObject = aa.projectExplorer;
					updateProjectExplorer(aa.projectExplorer);
				}
				
				$("#chatMessage").val("");
				if(aa.chatMessage) {
					var chatMessages = aa.chatMessage;
					console.log(chatMessages);
					var message = '';
					for(var i in chatMessages) {
						message += chatMessages[i].from + ": " + chatMessages[i].chatMessage + '\n';
					}
					$('#chatMessage').val(message);
			        $("#chatMessage").scrollTop(99999999);
				}
			}
		}
		
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
		
	}
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

<!-- FancyTree Library -->
<script src="js/jquery.fancytree.js/"></script>

<body class="stretched side-panel-left">
<div class="body-overlay"></div>

<!-- Page Title
============================================= -->
<section id="page-title" class="page-title-mini">
	<div class="container clearfix">
		<h1>Passed Lesson</h1>
		<span>Passed Lesson</span>
	</div>
</section>

<section id="content" style="background-image: url('images/passedlessonback.jpg'); background-size: 1300px;">
<div class="container clearfix">
	<div class="row" style="margin-top: 30px;">
		<div id="rightSecondPanel" class="editorArea topPanel col-sm-12" style="background-image: url('images/audioback.jpg'); background-size: 1300px;">
			<!-- 오디오  -->
			<audio id="myAudio" class="topPanelPart" controls="controls" controlsList="nodownload noremote" preload="auto" style="display: inline-block;">
				<!-- 자막 -->
				<track id="entrack" src="captionPlay?saved_code=${savedLessonInfo.saved_code}" kind="metadata" default></track>
			</audio>
			&nbsp;
			<pre id="nowSpeed" class="nomargin topPanelPart" style="display: inline-block; text-align:center; width: 100px;">1 倍速</pre>
			&nbsp;
			<button type="button" id="speedUp" class="topPanelPart">+0.5</button>
			<button type="button" id="speedDown" class="topPanelPart">-0.5</button>
		</div>
	</div>
	<div class="row" style="margin-bottom: 30px;">
		<div id="leftPanel" class="col-sm-10">
			<div id="leftUpperPanel" class="row">
				<div id="treePanel" class="col-sm-3 editorArea backWhite" style="height: 510px; overflow: auto;">
					<div id="tree"></div>
				</div>
				<div id="editorPanel" class="col-sm-9">
					<div id="fileNamePanel" class="row editorArea backWhite">
						<a id="fileName" style="color: black">FilePath</a>
					</div>
					<div id="editor" class="row editorArea"></div>
					<div id="editorOption" class="row editorArea text-right backWhite">
						<div id="editorThemeChange">
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
			<div id="leftLowerPanel" class="row">
				<div id="console" class="editorArea"></div>
			</div>
		</div>
		<div id="rightPanel" class="col-sm-2">
			<div id="rightFirstPanel" class="row editorArea backWhite">
				チャット
				<div id="chatDiv">
					<textarea id="chatMessage" cols="20" rows="22"></textarea>
				</div>
			</div>
		</div>
	</div>
</div>
</section>

<form id="codeForm" action="sourceCode" method="POST" target="" style="margin: 0px;">
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