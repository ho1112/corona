<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	
	<script type="text/javascript" src="resources/textEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div#wrapper{
		width : 800px;
		margin : 0 auto;
		
	}
	div#wrapper>h2 {
		text-align : center;
	}
	
	div#wrapper table {
		margin:0 auto;
	}
	
	#content {
		width : 780px;
	}
	
</style>
<%@ include file="topMenu.jsp" %>
<%@ include file="sidebar.jsp" %>


</head>
<script type="text/javascript">
window.onload = function(){	
	$('.plus').on('click',plus);
	$('.cansle').on('click', cansle);
	
	function plus() {
		var html = '<tr><th>ファイル名</th><td>';
		html += '<input type="file" id="input-2"  name="file1" class="upload file" data-show-preview="false" style="display:inline; cursor: pointer; margin-right:20px;" />';
		html += '<img class="cansle" alt="キャンセル" src="images/cansle.png" width="20" height="20" style="cursor: pointer;">';
		html += '</td></tr>';
		$('#plustable').append(html);
		$('.cansle').on('click', cansle);
	}
	
	function cansle() {
		$(this).parent().parent().remove();
	}
	
	
	 var oEditors = [];

	 nhn.husky.EZCreator.createInIFrame({
	
	 oAppRef: oEditors,

	 elPlaceHolder: "texts", //textarea에서 지정한 id와 일치해야 합니다.

	 sSkinURI: "resources/textEditor/SmartEditor2Skin.html",
	 
	 htParams : {
         // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
         bUseToolbar : true,             
         // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
         bUseVerticalResizer : true,     
         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
         bUseModeChanger : true,         
         fOnBeforeUnload : function(){
              
         }
     }, 
     fOnAppLoad : function(){
         //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
         oEditors.getById["texts"].exec("PASTE_HTML", [""]);
     },
	 
	 fCreator: "createSEditor2"
	 });
	 
	//저장버튼 클릭시 form 전송
     $("#save").click(function(){
    	 if($(".upload").val() != null){
	    	var fileValue = $(".upload").val().split("\\");
	    	var fileName = fileValue[fileValue.length-1]; // 파일명
	    	 
	    	var fileKind = fileName.split(".")[1];
			if(!(fileKind == 'png' || 'jpg' || 'gif')){
			alert('イメージファイル式だけアップロードしてください。');
	    	return false;
			}
    	 }
    	 
    	 if($("#title").val() == "") {
    		 alert('名前を入力してください。');
    		 $("#title").focus();
    		 return false;
    	 }
    	 
         oEditors.getById["texts"].exec("UPDATE_CONTENTS_FIELD", []);
         $("#frm").submit();
     });   
	 
}
</script>
<body class="stretched">
<div id="wrapper" class="clearfix">
<div class="body-overlay"></div>
<section id="page-title" class="page-title-mini">
	<div class="container clearfix">
		<h1>Board Write</h1>
		<span>Board Write</span>
	</div>
</section>
<section id="content" style="width: 1300px;">

	<div class="content-wrap"  style="padding-top: 10px; padding-bottom: 10px;">
	<div class="container clearfix">
<form action="boardWrite" method="POST" id="frm" enctype="multipart/form-data">
<input type="hidden" name="classNum" value="${classNum}">
	<table class="Bordered table">
	<tr>
		<th style="width: 100px;">タイトル</th>
		<td><input type="text" id="title" name="title" required class="col-md-12"/></td>
	</tr>
	<tr>
		<th style="width: 200px;">作成者</th>
		<td>${loginId}</td>
	</tr>
	
	<tr>
		<td>
			<label>ファイル追加</label>
		</td>
		<td>
			<img class="plus" alt="추가" src="images/plus.png" width="20" height="20" style="cursor: pointer;">
			
		</td>
	</tr>
	<tbody id="plustable">
	</tbody>
	<tr style="margin-left: 100px !important;">
		<td colspan="2"  style="margin-left: 100px !important;"><textarea name="content" id="texts" rows="22"  style="margin-left: 100px !important; width:100%; height:412px; min-width:610px;"></textarea></td>
	</tr>
	
	<tr>
		<td colspan="2" align="right">
			<a href="boardList?classNum=${classNum}" class="btn btn-primary">キャンセル</a>
			<input type="button" id="save" class="btn btn-primary" value='登録する'>
		</td>
	</tr>
	</table>
	
</form>
</div>
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
</body>


</html>