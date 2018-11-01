<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>

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
	<link rel="stylesheet" href="css/et-line.css" type="text/css" />
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
	
	<link rel="stylesheet" href="css/fonts.css" type="text/css" />
	<!-- Select-Boxes CSS -->
	<link rel="stylesheet" href="css/components/select-boxes.css" type="text/css" />
	<!-- Bootstrap Data Table Plugin -->
	<link rel="stylesheet" href="css/components/bs-datatable.css" type="text/css" />
	
	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
<title>Insert title here</title>
<%@ include file="../topMenu.jsp" %>
<%@ include file="../sidebar.jsp"%>
<style type="text/css">
th {
background-color: white;
}
.button-orange { background-color: #ff9800; }
.button-3d.button-orange:hover,
.button-reveal.button-orange:hover,
.button-border.button-orange:hover,
.button-border.button-orange.button-fill:before { background-color: #ff9800 !important; }
.dataTables_paginate {
 color: orange;
}
.color th{
	background-color: #000530;
	color: white;
}
#wrapper {
	background-color: rgba(255, 255, 255, 0);
}
</style>
</head>

<body class="stretched" style="background-image: url('images/searchback.jpg'); background-size: 1600px; background-repeat: no-repeat;">

	<div id="wrapper" class="clearfix">
	
		<div class="body-overlay"></div>
		<section id="page-title" style="padding-bottom: 20px; padding-top: 20px !important;">

			<div class="container clearfix">
				<h1>Class Search</h1>
			</div>

		</section>
		<section id="page-title" class="page-title-parallax page-title-dark page-title-video">
			<div class="video-wrap" style="z-index: 0">
				<video poster="images/videos/explore.jpg" preload="auto" loop autoplay muted>
					<source src='images/videos/search.mp4' type='video/mp4' />
				</video>
				<div class="video-overlay"></div>
			</div>
			
			
				<div class="container clearfix" style="z-index: 1">
					<div class="emphasis-title center">
						<div class="topmargin">
							<span class="t-rotate t700 font-body col_full" style="font-size: 60px; color: #222">&nbsp;</span>
						<div class="col-md-2 nomargin" style="padding:0px;">
							<select id="searchType" class="typeahead select-1 sm-form-control t-rotate"  dir="auto" style="width:100%; font-weight: bold; height: 1.0796cm; opacity: 0.8; border: 2px solid #DDD; border-right: 0; border-radius: 0 !important; line-height: 1.42857143;position: relative;   ">
										<option value="name">ClassName</option>
										<option value="teacher_id">Teacher ID</option>
							</select> 
						</div>
						
						<div class="col-md-9 nopadding">
							<input id="searchText" class="typeahead sm-form-control tt-input" type="text" placeholder="Search Text" autocomplete="off" spellcheck="false" dir="auto" style="position: relative; vertical-align: top; opacity: 0.8; color: black; ">
							</div>
							<div class="col-md-1 nopadding">
							<a href="#" id = "searchIcon" class="i-rounded i-medium nomargin icon-line-search" 
							style="width: 40px !important; height: 1.06cm !important;"></a>
							</div>
						</div>	
				</div>
			</div>
			
		
		</section >
		<section id="page-title" style="padding-bottom: 20px; padding-top: 20px !important;">
		</section>
		<section>
			<div class="container clearfix" style="margin-right: 50px;">
				<div class="panel-heading">
					<div id="homeWork" class="entry clearfix"
					style="margin-bottom: 10px; padding-bottom: 10px;">
					<div class="table-responsive">
					<table id="datatable3"
						class="table table-striped table-bordered datatable"
						cellspacing="0" width="100%">
						<thead>
							<tr class="color">
								<th>Num</th>
								<th>ClassName</th>
								<th>Teacher_ID</th>
								<th>UserCount</th>
								<th>Button</th>
							</tr>
						</thead>
						<tfoot>
							<tr class="color">
								<th>Num</th>
								<th>ClassName</th>
								<th>Teacher_ID</th>
								<th>UserCount</th>
								<th>Button</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach items="${map.list}" var="searchList" varStatus="in">
							<c:if test="${0 == in.index % 2}">
							<tr>
								<th style="background-color: rgba(255,152,0, 1) !important;">${searchList.num}</th>
								<th style="background-color: rgba(255,152,0, 1) !important;">${searchList.name}</th>
								<th style="background-color: rgba(255,152,0, 1) !important;">${searchList.teacher_id}</th>
								<c:forEach items="${map.countList}" var="countList">
									<c:if test="${searchList.num eq countList.num}">
										<th style="background-color: rgba(255,152,0, 1) !important;">${countList.usernum}</th>		
									</c:if>
								</c:forEach>
								<th class="center"style="background-color: rgba(255,152,0, 1) !important;">
								<button num="${searchList.num}" class="button button-rounded button-reveal button-small button-border button-gray tright nomargin request"><i class="icon-angle-right" style="width: 20px "></i>加入申請</button>
								</th>
							</tr>
							</c:if>
							<c:if test="${1 == in.index % 2}">
							<tr>
								<th>${searchList.num}</th>
								<th>${searchList.name}</th>
								<th>${searchList.teacher_id}</th>
								<c:forEach items="${map.countList}" var="countList">
									<c:if test="${searchList.num eq countList.num}">
										<th>${countList.usernum}</th>		
									</c:if>
								</c:forEach>
								<th class="center">
								<button num="${searchList.num}" class="button button-rounded button-reveal button-small button-border button-orange tright nomargin request"><i class="icon-angle-right" style="width: 20px"></i>加入申請</button>
								</th>
							</tr>
							</c:if>
							</c:forEach>
						</tbody>
					</table>
					</div>
					</div>
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

	<div id="gotoTop" class="icon-angle-up"></div>
	<!-- External JavaScripts
	============================================= -->
	<script type="text/javascript" src="js/plugins.js"></script>
	
	<!-- Select-Boxes Plugin -->
	<script type="text/javascript" src="js/components/select-boxes.js"></script>

	<!-- Select-Splitter Plugin -->
	<script type="text/javascript" src="js/components/selectsplitter.js"></script>
	<!-- Bootstrap Data Table Plugin -->
	<script type="text/javascript" src="js/components/bs-datatable.js"></script>
	<!-- Footer Scripts
	============================================= -->
	<script type="text/javascript" src="js/functions.js"></script>
	<script type="text/javascript" src="resources/jquery.videoBG.js"></script>
	<script>
	$(function() {
		$('.datatable').dataTable({
			  "columns": [
				    { "width": "10%" },
				    { "width": "40%" },
				    { "width": "30%" },
				    { "width": "10%" },
				    { "width": "10%", "orderable": false },
				  ], scrollY: 300,
				  scrollCollapse: true,
				  columnDefs: [ {
				        targets: 0,
				        render: function ( data, type, row ) {
				        return type === 'display' && data.length > 10 ?
				            data.substr( 0, 10 ) +'…' :
				            data;
				    }
				    } ]
				, "bSortClasses" : false
		});
		
		
		$("#searchText").keyup(function(e){
			
			if(e.keyCode == 13){
				search();
			} 
		});
		$("#searchIcon").click(search);
		$('#datatable3 tbody').on('click', '.request', request);
		$('#wrapper').animate({
			backgroundColor: "rgba(255, 255, 255, 0.9)"
		}, 1500);
	});
	
	function search() {
		var searchWord = $('#searchText').val()
		var searchType = $("#searchType option:selected").val();
		location.href = "${pageContext.request.contextPath}/search?searchWord=" + searchWord + "&searchType=" + searchType;
	}
	function request() {
		var classNum = $(this).attr('num');
		var btn = $(this);
		$.ajax({
			url : "request"
			, method : "POST"
			, data : "classNum=" + classNum
			, success : function(repo) {
				if(repo == 1){
					alert("申し込み完了しました.");
					$(btn).parent().html('<button disabled="disabled" num="${searchList.num}" class="button button-rounded button-reveal button-small button-border button-red tright nomargin request"><i class="icon-lock3" style="width: 20px"></i>申請完了</button>');
				}
				if(repo == 0){
					alert("もう申し込みしております。");
					$(btn).parent().html('<button disabled="disabled" num="${searchList.num}" class="button button-rounded button-reveal button-small button-border button-red tright nomargin request"><i class="icon-lock3" style="width: 20px"></i>申請完了</button>');
				}
			}
			,error : function(repo) {
				alert("오류 =" + repo);
			}
		})
		$(this).attr("disabled", false);
	}
	
	
	
	</script>
</body>
</html>