<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Source Code</title>
<script src="js/jquery-3.2.1.min.js/"></script>
<!-- ACE web editor Library -->
<script src="js/ace/ace.js"></script>
<script>
$(function() {
	var editor = ace.edit("editor");
	//web editor의 maxline을 설정
	editor.setOptions({
		maxLines : 23,
		minLines : 23,
		autoScrollEditorIntoView : true
	});
	//web editor의 syntaxing 언어 설정(java)
	editor.getSession().setMode("ace/mode/java");
// 	console.log('${theme}');
	//web editor의 테마 설정
	editor.setTheme('${theme}');
	//web editor를 읽기 전용으로 설정
	editor.setFontSize(17);
	editor.setReadOnly(true);
	editor.setHighlightActiveLine(false);
	editor.renderer.setShowPrintMargin(false);
	editor.setShowInvisibles(${invisibles});
	editor.setDisplayIndentGuides(${indentGuides});
	editor.$blockScrolling = Infinity;
});

</script>
</head>
<body>
<!-- 코드는 EL로 주입 받음 -->
<div id="editor">${code}</div>
</body>
</html>