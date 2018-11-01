<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>

<head>

<script type="text/javascript" src="js/jquery.js"></script>

<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="css/animate.css" type="text/css" />
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
	<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
	
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="topMenu.jsp" %>
<%@ include file="sidebar.jsp" %>
<style>
	div#wrapper{
		width : 800px;
		margin : 0 auto;
	}
	pre {
		width : 600px;
		height : 200px;
		overflow: auto;
		background-color: white;
	}
	table.reply {
		width : 800px;
	}
	span {
		display: inline-block;
		margin : 5px;
	}
</style>


<script>
	$(function() {
		$("#update").on('click',update);
	});

	function update() {
		var num = $('#num').val();
		location.href = "${pageContext.request.contextPath}/driveUpdateForm?num="+num+"&classNum=${classNum}";
	}
	
	//글삭제
	function deleteForm(){
		var del = confirm("本当に削除しますか?")
		if(del){
			location.href="driveDelete?num=${drive.num}&classNum=${classNum}";
		}
		return;
	}
	
	
</script>
</head>

<body class="stretched">

<div id="wrapper" class="clearfix">

<div class="body-overlay"></div>
<section id="page-title" class="page-title-mini">
	<div class="container clearfix">
		<h1>${drive.title}</h1>
		<span>${drive.title}</span>
	</div>
</section>
<section id="content">

	<div class="content-wrap" style="padding-top: 10px; padding-bottom: 10px;">
	<div class="container clearfix">

	<form action="driveUpdateForm" id="Form" method="GET" >
	<input type="hidden" id="num" name="num" value="${drive.num}">
	<input type="hidden" id="classNum" name="classNum" value="${classNum}">
	<table class="Bordered table">
		<tr id="photo_td">
			<td rowspan="3" class="col-md-3"><img src ="imgStatus?imgName=${userImg}" style="width: 200px; height: 200px"/></td>
			<td class="col-md-5">${drive.user_id}</td>
			<td rowspan="3" class="col-md-4"></td>
		</tr>
		
		<tr>
			<th>${drive.register_time}</th>
		</tr>	
		<tr>
			<th></th>
		</tr>
		
		<c:forEach items="${list}" var="driveList" varStatus="check">
				<tr>
				<td>
					<label>${check.index + 1}</label>
				</td>
				<td>
					<a href="download?num=${driveList.num}">${driveList.original_filename}</a>
				</td>
			</tr>
		</c:forEach>
		
		<tr>	
			<td colspan="3">
				<pre class="col-md-12">${drive.content}</pre>
			</td>
		</tr>
		<tr>
			<td colspan="1">
				<a href="driveList?classNum=${classNum}" >目録に</a>
			</td>
			<td></td>
			<td align="right">	
				<input type="button" id="update" class="btn btn-primary" value="修正">
				<input type="button" value="削除" class="btn btn-primary" onclick="deleteForm()"/>
				<a class="btn btn-primary" href="driveWrite?classNum=${classNum}" role="button"><i class="icon-book3"></i>書き込み</a>
			</td>
		</tr>
	</table>
	</form>

</div> <!-- end #wrapper -->
</div>
</section>
</div>

</body>
</html>