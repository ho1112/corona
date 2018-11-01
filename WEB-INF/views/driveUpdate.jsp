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
<title>게시글 수정</title>
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
$(function() {
	$('.plus').on('click', plus);
	$('.cansle').on('click', cansle);
	$('.modify').on('click', modify);
	$('#check').on('click',check);
	$('#back').on('click',back);
})
//추가 아이콘으로 첨부파일 추가
function plus() {
	var html = '<tr><td><label>ファイル名</label></td><td>';
	html += '<input type="file" name="file1" class="upload" style="display: inline;"/>';
	html += '<img alt="修正" src="images/modify.png" class="modify" width="20" height="20" style="cursor: pointer;">';
	html += '<img class="cansle" alt="キャンセル" src="images/cansle.png" width="20" height="20" style="cursor: pointer;">';
	html += '</td></tr>';
	$('#plustable').append(html);
	$('.modify').on('click', modify);
	$('.cansle').on('click', cansle);
}
//삭제 아이콘 누를시 삭제
function cansle() {
	$(this).parent().parent().remove();
}
//수정 아이콘 누를시  input file로 덮어 씌움
function modify() {
	var html = '<td><label>ファイル名</label></td><td>';
	html += '<input type="file" name="file1" class="upload" style="display: inline;/>';
	html += '<img alt="修正" src="images/modify.png" class="modify" width="20" height="20" style="cursor: pointer;">';
	html += '<img class="cansle" alt="キャンセル" src="images/cansle.png" width="20" height="20" style="cursor: pointer;">';
	html += '</td>';
	$(this).parent().parent().html(html);
	$('.modify').on('click', modify);
	$('.cansle').on('click', cansle);
}

//게시판 글 및 첨부파일 유무 유효성 검사
function check(){
	var title = $('#title').val();
	var file1 = $('.upload');
	var original_filename = $('.original_filename');
	var content = $('#texts').val();
	if(title == ''){
		alert('名前を書いてください。');
		return;
	}
	if(file1.length == 0 && original_filename.length == 0){
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
	$('#dup').submit();
}

//돌아가기 버튼
function back() {
	history.back();
}

</script>

</head>
<body class="stretched">
<div id="wrapper" class="clearfix">
<div class="body-overlay"></div>
<section id="page-title" class="page-title-mini">
	<div class="container clearfix">
		<h1>Drive Update</h1>
		<span>Drive Update</span>
	</div>
</section>

<section id="content" style="width: 1300px;">
<div class="content-wrap"  style="padding-top: 10px; padding-bottom: 10px;">
	<div class="container clearfix">
<form id="dup" action="driveUpdate" method="POST" enctype="multipart/form-data">
<input type="hidden" name="num" value="${drive.num}">
<input type="hidden" id="user_id" name="user_id" class="user_id" value="${drive.user_id}">
<input type="hidden" name="classNum" value="${classNum}">
	<table class="Bordered table">
		<tr>
			<th class="col-md-2">タイトル</th>
			<td><input type="text" name="title" required value="${drive.title}" class="col-md-9"/></td>
		</tr>
		<tr>
			<th>作成者</th>
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
		<c:forEach items="${list}" var="driveList" varStatus="check">
				<tr>
				<td>
					<label>ファイル名</label>
				</td>
				<td>
					<a href="download?num=${driveList.num}">${driveList.original_filename}</a> 
					<input type="hidden" name="original_filename" class="original_filename" value="${driveList.original_filename}">
					<img alt="修正" src="images/modify.png" class="modify" width="20" height="20" style="cursor: pointer;">
					<img alt="削除" src="images/cansle.png" class="cansle" width="20" height="20" style="cursor: pointer;">
				</td>
			</tr>
			</c:forEach>
		
		<tbody id="plustable">
		</tbody>
		
		<tr>
			<td colspan="2"><textarea name="content" id="texts" cols="60" rows="15" class="col-md-12">${drive.content}</textarea></td>
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
</div>
</body>
</html>