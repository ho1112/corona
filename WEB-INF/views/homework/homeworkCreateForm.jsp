<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<!--  -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="SemiColonWeb" />

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

<!-- Date & Time Picker CSS -->
<link rel="stylesheet" href="css/datepicker.css" type="text/css" />
<link rel="stylesheet" href="css/components/timepicker.css" type="text/css" />
<link rel="stylesheet" href="css/components/daterangepicker.css" type="text/css" />


<meta name="viewport" content="width=device-width, initial-scale=1" />

<title>Create Homework Page</title>
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
<body class="stretched">
<div id="wrapper" class="clearfix">
<div class="body-overlay"></div>
<!-- Page Title
============================================= -->
<section id="page-title" class="page-title-mini">
	<div class="container clearfix">
		<h1>Create Homework Page</h1>
		<span>Create Homework Page</span>
	</div>
</section>

<section id="content" style="background-image: url('images/homeworkback.jpg'); background-size: 1300px;">
<div class="container clearfix" style=" background-color: rgba(255,255,255, 0.3); padding-top: 20px; padding-bottom: 20px;">
	<div class="row"><!-- 큰 row 시작 -->
		<div class="col-md-3"><!-- 서쪽 컬럼 시작 -->
			<div class="row"><!-- 서쪽 1번째 줄 시작 -->
				<div class="col_full">
					<div class="row">
						<div class="col-md-12">
							<i class="i-rounded i-light icon-edit"></i>
							<h2 class="nobottommargin textChange">課題タイトル</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<input type="text" id="homeworkTitle" class="form-control">
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
							<textarea id="homeworkContent" rows="5" class="form-control"></textarea>
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
							<input type="text" id="homeworkDeadline" class="tleft sm-form-control datatimepicker" placeholder="YYYY/MM/DD HH/mm">
						</div>
					</div>
				</div>
			</div><!-- 서쪽 3번째 줄 끝 -->
		</div><!-- 서쪽 컬럼 끝 -->

		<div class="col-md-9"><!-- 동쪽 컬럼 시작 -->
			<div class="row"><!-- 에디터 줄 시작 -->
				<div class="col-md-12 divcenter">
					<div class="col_full">
						<div class="row">
							<div class="col-md-6">
								<i class="i-rounded i-light icon-laptop"></i>
								<h2 class="nobottommargin textChange">エディタ</h2>
							</div>
							<div class="col-md-6 text-right">
								<input type="button" id="homeworkSubmit" class="button button-xlarge button-white button-rounded tright" style="border-radius: 15%; color: #000000"	value="作成"> 
								<input type="button" id="editorReset" class="button button-xlarge button-white button-rounded tright" style="border-radius: 15%; color: #000000" value="リセット">
							</div>
						</div>
						<div class="row">
							<div id="editor" class="col-md-11 divcenter">import java.util.*; 

public class ${classFileName} { 
	public static void main(String[] args) throws Exception { 
		Scanner sc = new Scanner(System.in); 
		String line = sc.nextLine();
		System.out.println("XXXXXX"); 
		
	}
}</div>
						</div>
						<div class="row text-right" id="editorOption" style="margin: 10px">
							<div class="col-sm-11">
								<div id="editorThemeChange" class="textChange" style="display: inline-block ">
									Theme <select id="themeChange" style="color: black;">
										<option value="eclipse">Eclipse</option>
										<option value="xcode">XCode</option>
										<option value="idle_fingers">idle Fingers</option>
										<option value="monokai">Monokai</option>
										<option value="gob">Green on Black</option>
									</select>
								</div>
								&nbsp;
								<div id="editorShowInvisibles" class="textChange" style="display: inline-block">
									Invisibles <select id="showInvisibles" style="color: black;">
										<option value="true">on</option>
										<option value="false" selected="selected">off</option>
									</select>
								</div>
								&nbsp;
								<div id="editorIndentGuides" class="textChange" style="display: inline-block">
									IndentGuides <select id="indentGuides" style="color: black;">
										<option value="true">on</option>
										<option value="false">off</option>
									</select>
								</div>
								&nbsp;
								<div id="editorShowGutte" class="textChange" style="display: inline-block">
									Gutte <select id="showGutte" style="color: black;">
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
	<div class="line bottommargin-sm notopmargin"></div>

	
	<div class="row"><!-- 입출력 값 추가 항목 줄 시작 -->
        <div class="col_full">
            <div class="col-md-4"><!-- 입력 값 컬럼 시작 -->
                <div class="row">
                    <div class="row">
                        <div class="col-md-11">
                            <i class="i-rounded i-light icon-edit"></i>
                            <h2 class="nobottommargin textChange">入力値</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-11" id="plus_input">
                            <input type="text" placeholder="Input value No.1" class="input1 form-control" style="display: block; margin-bottom: 10px">
                        </div>
                    </div>
                </div>
            </div><!-- 입력 값 컬럼 끝 -->
            <div class="col-md-4"><!-- 출력 값 컬럼 시작 -->
                <div class="row">
                    <div class="row">
                        <div class="col-md-11">
                            <i class="i-rounded i-light icon-edit"></i>
                            <h2 class="nobottommargin textChange">出力値</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-11" id="plus_output">
                            <input type="text" placeholder="Output value No.1" class="output1 form-control" style="display: block; margin-bottom: 10px">
                        </div>
                    </div>
                </div>
            </div><!-- 출력 값 컬럼 끝 -->

            <div class="col-md-4"><!-- 입출력 값 추가 버튼 컬럼 시작 -->
                <div class="row plus">
                    <div class="col-md-10">
                        <i class="i-rounded i-light icon-line-marquee-plus"></i>
                        <h3 class="textChange">入出力追加</h3>
                    </div>
                </div>
                <div class="row calsle">
                    <div class="col-md-10">
                        <i class="i-rounded i-light icon-line-marquee-minus"></i>
                        <h3 class="textChange">入出力削除</h3>
                    </div>
                </div>
                <div class="row" data-toggle="modal" data-target="#explainHomework">
                    <div class="col-md-10">
                        <i class="i-rounded i-light icon-box"></i>
                        <h3 class="textChange">課題説明</h3>
                    </div>
                </div>
                <div class="modal fade" tabindex="-1" id="explainHomework" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-body">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h2 class="modal-title" id="myModalLabel">作成方法</h2>
                                </div>
                                <div class="modal-body" style="font-size: 20px">
                                    <p class="nobottommargin">1. 入力値と期待する出力値を入力します。</p>
                                    <p class="nobottommargin">2. 入力値と出力値は三つの生成ができます。</p>
                                    <p class="nobottommargin">3. 学生が作成した課題コードの結果と記入した出力値と比較します。</p>
                                    <p class="nobottommargin">4. 正しければ提出可能でお互いに相異なった場合は、もう一度課題コートを作成する方式です。</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--  입출력 값 추가 버튼 컬럼 끝 -->
        </div>
    </div><!-- 입출력 값 추가 항목 줄 끝 -->
	
</div>
</section>

<footer id="footer" class="dark noborder" >
	<div id="copyrights">
		<div class="container center clearfix">
			Copyright HanJo 2017 | All Rights Reserved
		</div>
	</div>
</footer><!-- #footer end -->
</div>

<div id="gotoTop" class="icon-angle-up"></div>
<script type="text/javascript" src="js/jquery.js"></script>
<!-- <script type="text/javascript" src="js/plugins.js"></script> -->

<!-- Date & Time Picker JS -->
<script type="text/javascript" src="js/components/moment.js"></script>
<script type="text/javascript" src="js/datepicker.js"></script>
<script type="text/javascript" src="js/components/timepicker.js"></script>

<!-- Include Date Range Picker -->
<script type="text/javascript" src="js/components/daterangepicker.js"></script>

<!-- <script type="text/javascript" src="js/components/bs-switches.js"></script> -->
<!-- <script type="text/javascript" src="js/functions.js"></script> -->

<!-- ACE web editor Library -->
<script src="js/ace/ace.js"></script>
<script src="js/ace/ext-language_tools.js"></script>

<script>
$(function() {
	
	$('.datatimepicker').datetimepicker({
		showClose: true,
		format: "YYYY/MM/DD HH/mm"
	});
	
	//입출력 추가 삭제를 제어하는 변수
	var count = 1;

	//입출력값 추가
	$('.plus').on('click', function() {
        if (count < 3) {
            count += 1;
            var html1 = '<input type="text" placeholder="Input value No.'+count+'" class="input'+count+' form-control" style="display: block; margin-bottom: 10px">';
            $("#plus_input").append(html1);
            var html2 = '<input type="text" placeholder="Output value No.'+count+'" class="output'+count+' form-control" style="display: block; margin-bottom: 10px">';
            $("#plus_output").append(html2);
        }
	});

	//입출력값 삭제
	$('.calsle').on('click', function() {
		if (count > 1) {
			var remove_input = $(".input" + count);
			var remove_output = $(".output" + count);

			$(remove_input).remove();
			$(remove_output).remove();

			count -= 1;
		}
	});
	
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
        if (showGutte == 'true') {
            editor.renderer.setShowGutter(true);
            consoleView.renderer.setShowGutter(true);
        } else {
            editor.renderer.setShowGutter(false);
            consoleView.renderer.setShowGutter(false);
        }
    });
    
  //웹 에디터에서 코드를 서버로 전송한다.
   $("#homeworkSubmit").on('click', function() {
		var code = editor.getValue();
		var title = $("#homeworkTitle").val();
		var explain = $("#homeworkContent").val();
		var limitTime = $("#homeworkDeadline").val();
		var classNum = ${classNum};
		var classFileName = '${classFileName}';
		
		var input_answer = [];
		var output_answer = [];
		
		if(!title) {
			alert('課題の名前を入力してください。');
			return;
		} else if(!explain) {
			alert('課題説明を入力してください。');
			return;
		} else if(!limitTime) {
			alert('締切期限を入力してください。');
			return;
		}
		
		for (var i = 1; i <= count; i++) {
			var temp = $(".input" + i).val();
			input_answer.push(temp); //입력값을 배열에 담는다.
		}

		for (var i = 1; i <= count; i++) {
			var temp = $(".output" + i).val();
			output_answer.push(temp); //출력값을 배열에 담는다.
		}
		
		
		
		$.ajax({
			method : "POST",
			url : "createHomework",
			data : "title=" + title +
					"&code=" + code +
					"&content=" + explain +
					"&deadline=" + limitTime +
					"&class_num=" + classNum +
					"&question_file=" + classFileName +
				    "&output_answer=" + output_answer +
					"&input_answer=" + input_answer,
			success : function(resp) {
				if(resp == 1) {
					alert("課題登録完了。");
					location.href = "homeworkList?classNum=${classNum}";
				} else if(resp == 0) {
					alert("課題登録失敗。");
				}
			},
			error : function() {
				alert("課題転送に失敗しました。");
			}
		});
	});
});
</script>
</body>
</html>