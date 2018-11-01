<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>

<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="SemiColonWeb" />
<!--  -->
<!-- Stylesheets
	============================================= -->
<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="resources/style.css" type="text/css" />

<!-- One Page Module Specific Stylesheet -->
<link rel="stylesheet" href="css/onepage.css" type="text/css" />

<link rel="stylesheet" href="css/dark.css" type="text/css" />
<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
<link rel="stylesheet" href="css/animate.css" type="text/css" />
<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />

<link rel="stylesheet" href="css/fonts.css" type="text/css" />

<meta name="viewport" content="width=device-width, initial-scale=1" />

<title>Submitted Task Confirm Page</title>
<style>
#editor {
	clear: left;
	margin-right: 10px;
	padding: 5px;
	float: left;
	border-width: 1px;
	border-color: #7f7f7f;
	border-style: solid;
	border-radius: 10px;
}
.i-rounded.i-light{
	border-radius: 50% !important;
	background-color: #000530 !important;
	color: #ffffff !important;
}
.i-rounded.i-light:hover{
	background-color: #dddddd !important;
	color: #000000 !important;
}
.textChange{
	color : #000000;
}
.button.button-xlarge.button-white:hover {
	background-color: #000530;
	color: #fff !important;
	text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
}
</style>
</head>

<%@ include file="../topMenu.jsp" %>
<%@ include file="../sidebar.jsp" %>
<body class="stretched" >
<div id="wrapper" class="clearfix" >
<div class="body-overlay"></div>
<!-- Page Title
============================================= -->
<section id="page-title" class="page-title-mini">
	<div class="container clearfix">
		<h1>Submitted Task Confirm Page (Teacher)</h1>
		<span>Submitted Task Confirm Page (Teacher)</span>
	</div>
</section>
<section id="content"  style="background-image: url('images/homeworkcheckback.jpg'); background-size: 1300px;">
	<div class="container clearfix"  style="margin-top: 20px;">
		<div class="row bottommargin"><!-- 큰 row 시작 -->
			<div class="col-md-3"><!-- 서쪽 컬럼 시작 -->
				<div class="row" style="margin-top: 20px;"><!-- 서쪽 1번째 줄 시작 -->
					<div class="col_full">
						<div class="row">
							<div class="col-md-12">
								<i class="i-rounded i-light icon-edit"></i>
								<h2 class="nobottommargin textChange">課題タイトル</h2>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<input type="text" id="homeworkTitle" class="form-control" readonly="readonly">
							</div>
						</div>
					</div>
				</div><!-- 서쪽 1번째 줄 끝 -->
				<div class="line bottommargin-sm notopmargin"></div>

				<div class="row"><!-- 서쪽 2번째 줄 시작 -->
					<div class="col_full">
						<div class="row">
							<div class="col-md-12">
								<i class="i-rounded i-light icon-edit"></i>
								<h2 class="nobottommargin textChange">課題内容</h2>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<textarea id="homeworkContent" rows="5" class="form-control" readonly="readonly">${task.content}</textarea>
							</div>
						</div>
					</div>
				</div><!-- 서쪽 2번째 줄 끝 -->
				<div class="line bottommargin-sm notopmargin"></div>

				<div class="row"><!-- 서쪽 3번째 줄 시작 -->
					<div class="col_full">
						<div class="row">
							<div class="col-sm-12">
								<i class="i-rounded i-light icon-calendar"></i>
								<h2 class="nobottommargin textChange">締め切り</h2>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="clear"></div>
								<input type="text" id="homeworkDeadline" class="tleft sm-form-control" readonly>
							</div>
						</div>
					</div>
				</div><!-- 서쪽 3번째 줄 끝 -->
			</div><!-- 서쪽 컬럼 끝 -->

			<div class="col-md-9"><!-- 동쪽 컬럼 시작 -->
				<div class="row"><!-- 에디터 줄 시작 -->
					<div class="col-md-12 divcenter">
						<div class="col_full nobottommargin">
							<div class="row">
								<div class="col-md-3">
									<i class="i-rounded i-light icon-laptop"></i>
									<h2 class="nobottommargin textChange">エディタ</h2>
								</div>
								<div class="col-md-5 tright" id="submitTime">
								</div>
								<div class="col-md-4">
								<h4 class="textChange">提出学生 <select id="submittedStudent">
									</select></h4>
								</div>
							</div>
							<div class="row">
								<div id="editor" class="col-md-11 divcenter"></div>
							</div>
							<div class="row text-right" id="editorOption"
								style="margin: 10px">
								<div class="col-sm-11">
									<div id="editorThemeChange" class="textChange" style="display: inline-block">
										Theme <select id="themeChange">
											<option value="eclipse">Eclipse</option>
											<option value="xcode">XCode</option>
											<option value="idle_fingers">idle Fingers</option>
											<option value="monokai">Monokai</option>
											<option value="gob">Green on Black</option>
										</select>
									</div>
									&nbsp;
									<div id="editorShowInvisibles" class="textChange" style="display: inline-block">
										Invisibles <select id="showInvisibles">
											<option value="true">on</option>
											<option value="false" selected="selected">off</option>
										</select>
									</div>
									&nbsp;
									<div id="editorIndentGuides" class="textChange" style="display: inline-block">
										IndentGuides <select id="indentGuides">
											<option value="true">on</option>
											<option value="false">off</option>
										</select>
									</div>
									&nbsp;
									<div id="editorShowGutte" class="textChange" style="display: inline-block">
										Gutte <select id="showGutte">
											<option value="true">on</option>
											<option value="false">off</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div><!-- 에디터 줄 끝 -->
			</div><!-- 동쪽 컬럼 끝 -->
		</div><!-- 큰 row 끝 -->
	</div>
</section>

<footer id="footer" class="dark noborder">
	<div id="copyrights">
		<div class="container center clearfix">
			Copyright HanJo 2017 | All Rights Reserved
		</div>
	</div>
</footer><!-- #footer end -->
</div>

<div id="gotoTop" class="icon-angle-up"></div>
<script type="text/javascript" src="js/jquery.js"></script>
<!-- <script type="text/javascript" src="js/plugins.js"></script>  -->

<!-- <script type="text/javascript" src="js/functions.js"></script> -->

<!-- ACE web editor Library -->
<script src="js/ace/ace.js"></script>
<script src="js/ace/ext-language_tools.js"></script>

<script>
$(function() {
	
	$('input#homeworkTitle').val('${task.title}');
	$('input#homeworkDeadline').val('${task.deadline}');
	
	var langTools = ace.require("ace/ext/language_tools");
	var editor = ace.edit("editor");
    
	//web editor의 maxline을 설정
	editor.setOptions({
		maxLines : 21,
		minLines : 21,
		autoScrollEditorIntoView : true,
        enableBasicAutocompletion: true,
		enableSnippets: true,
		enableLiveAutocompletion: false
	});
	//web editor의 syntaxing 언어 설정(java)
	editor.getSession().setMode("ace/mode/java");
	//web editor의 테마 설정
	editor.setTheme("ace/theme/eclipse");
	editor.setReadOnly(true);
	editor.setFontSize(20);
	editor.setHighlightActiveLine(false);
	editor.renderer.setShowPrintMargin(false);
	editor.setShowInvisibles(false);
	editor.setDisplayIndentGuides(true);
	editor.$blockScrolling = Infinity;
	
    var initEditor = editor.getValue();
    
    $('input#editorReset').on('click', function() {
        editor.setValue(initEditor); 
        editor.clearSelection();
    });
    
    $('select#themeChange').on('change', function() {
        var selectTheme = "ace/theme/" + $(this).val();
        editor.setTheme(selectTheme);
        consoleView.setTheme(selectTheme);
    });

    $('select#showInvisibles').on('change', function() {
        var showInvisibles = $(this).val();
//         console.log(showInvisibles);
        if (showInvisibles == 'true') {
            editor.setShowInvisibles(true);
            consoleView.setShowInvisibles(true);
        } else {
            editor.setShowInvisibles(false);
            consoleView.setShowInvisibles(false);
        }
    });

    $('select#indentGuides').on('change', function() {
        var indentGuides = $(this).val();
//         console.log(indentGuides);
        if (indentGuides == 'true') {
            editor.setDisplayIndentGuides(true);
            consoleView.setDisplayIndentGuides(true);
        } else {
            editor.setDisplayIndentGuides(false);
            consoleView.setDisplayIndentGuides(false);
        }
    });

    $('select#showGutte').on('change', function() {
        var showGutte = $(this).val();
//         console.log(showGutte);
        if (showGutte == 'true') {
            editor.renderer.setShowGutter(true);
            consoleView.renderer.setShowGutter(true);
        } else {
            editor.renderer.setShowGutter(false);
            consoleView.renderer.setShowGutter(false);
        }
    });
    
    var homeworkNum = ${task.num};
    
    $.ajax({
    	url: "loadSubmittedList",
    	method: "post",
    	data: {"homeworkNum" : homeworkNum},
    	success: function(resp) {
    		console.log(resp);
    		var submitList = resp;
    		
    		for(var i in submitList) {
    			var addHtml = '<option value="' +i +'">' + submitList[i].name + '</option>';
    			$('select#submittedStudent').append(addHtml);
    		}
    		
    		
    		$('div#submitTime').html("<h4>提出時間 : " + submitList[0].submit_time + "</h4>");
    		editor.setValue(submitList[0].submit_code);
    		editor.clearSelection();
    		
    		$('select#submittedStudent').on('change', function() {
    			var studentIndex = $(this).val();
    			editor.setValue(submitList[studentIndex].submit_code);
    			editor.clearSelection();
    			$('div#submitTime').html("<h4>提出時間 : " + submitList[studentIndex].submit_time + "</h4>");
    		});
		}
    });
});
</script>
</body>
</html>