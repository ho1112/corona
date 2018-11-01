<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="js/jquery.js"></script>
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="topMenu.jsp" %>
<%@ include file="sidebar.jsp" %>
<style>
	div#wrapper{
		width : 800px;
		margin : 0 auto;
		
	}
	div#wrapper>h2 {
		text-align : center;
	}
	th {
		width: 100px;
	}
	td {
		width:600px;
	}
	div#wrapper table {
		margin:0 auto;
	}

</style>

<script>
	$(function(){
		$('#check').on('click',check);
		$('.plus').on('click',plus);

	});
	
	function plus() {
		var html = '<tr><th style="width: 100px;">ファイル名</th><td>';
		html += '<input type="file" name="file1" class="upload" style="display: inline; margin-right:20px; cursor:pointer;"/>';
		html += '<img class="cansle" alt="キャンセル" src="images/cansle.png" width="20" height="20" style="cursor: pointer;">';
		html += '</td></tr>';
		$('#plustable').append(html);
		$('.cansle').on('click', cansle);
	}
	function cansle() {
		$(this).parent().parent().remove();
	}
	
	function check(){
		var title = $('#title').val();
		var file1 = $('.upload');
		
		var content = $('#textss').val();
		if(title == ''){
			alert('名前を書いてください。');
			return;
		}
		if(file1.length == 0){
			alert('添付ファイルがないです。確認してください。');
			return;	
		}
		for (var i = 0; i < file1.length; i++) {
			var check = $(file1[i]).val();
			if(check == null){
				alert('添付ファイルがないです。確認してください。');
				return;	
			}
			if(check == ''){
				alert('添付ファイルがないです。確認してください。');
				return;	
			}
		}
		if(content == ''){
			alert('内容を書いてください。');
			return;
		}
		$('#upload').submit();
	}
	
</script>

</head>
<body class="stretched">
<div id="wrapper" class="clearfix">
<div class="body-overlay"></div>
<section id="page-title" class="page-title-mini">
	<div class="container clearfix">
		<h1>Drive Write</h1>
		<span>Drive Write</span>
	</div>
</section>
<section id="content" style="width: 1300px;">
<div class="content-wrap"  style="padding-top: 10px;  padding-bottom: 10px;">
	<div class="container clearfix">
<form id="upload" action="upload" method="POST" enctype="multipart/form-data">
<input type="hidden" name="classNum" value="${classNum}">
	<table class="Bordered table">
		<tr>
			<th style="width: 100px;">タイトル</th>
			<td><input type="text" name="title" required class="col-md-12"/></td>
		</tr>
		<tr>
			<th style="width: 100px;">作成者</th>
			<td>${loginId}</td>
		</tr>
		<tr>
			<th style="width: 100px;">
				ファイル追加
			</th>
			<td>
				<img class="plus" alt="追加" src="images/plus.png" width="20" height="20" style="cursor: pointer;">
			</td>
		</tr>
		
		<tbody id="plustable">
		</tbody>
		
		<tr>
			<td colspan="2"><textarea name="content" style="margin: 0px;" id="textss" cols="60" rows="15" class="col-md-12"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<a href="driveList?classNum=${classNum}" class="btn btn-primary">キャンセル</a>
				<input type="button" class="btn btn-primary" id="check" value='登録する'>
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