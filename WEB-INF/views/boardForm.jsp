<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="resources/style.css" type="text/css" />
	<link rel="stylesheet" href="css/dark.css" type="text/css" />
	<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
	<link rel="stylesheet" href="css/animate.css" type="text/css" />
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
	
	<!-- Bootstrap Data Table Plugin -->
	<link rel="stylesheet" href="css/components/bs-datatable.css" type="text/css" />

	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
<title>Insert title here</title>

<style>
	table{
		 white-space: nowrap;
	}
	
	
</style>

</head>
<%@ include file="topMenu.jsp" %>
	<%@ include file="sidebar.jsp" %>
<body class="stretched">
	<input id="tableSet" type="hidden" value="${status}">
	<div id="wrapper" class="clearfix">
		<div class="body-overlay"></div>

		<section id="page-title">

			<div class="container center clearfix">
				<h1>Board</h1>
			</div>

		</section>
		<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">
					<!-- 일반 게시판 -->
					<div id="normal" class="entry clearfix">
						<div class="center">
							<h2>一般提示版</h2>
						</div>
						<div class="search">
						<!-- 특정 글 검색 -->
							<form id="search" action ="boardLocation" method="GET" >
							<input type = "hidden" name = "action" value = "boardList">
							<select name="searchtype">
								<option value="title" ${searchtype=='title' ? 'selected' : '' }>名前</option>
								<option value="user_id" ${searchtype=='user_id' ? 'selected' : '' }>作成者</option>
								<option value="content" ${searchtype=='content' ? 'selected' : '' }>内容</option>
							</select>
							<input type="text" name="searchword" value="${searchword}" /> 
							<input class="btn" type="submit" value="검색" />
							</form>
						</div>
						
						<div class="table-responsive">
							<table id="datatable1"
								class="table table-bordered datatable"
								cellspacing="0" width="100%"><!-- datatable클래스가 검색바-페이징 -->
								<thead>
									<tr>
										<th>Num</th>
										<th>Title</th>
										<th>ID</th>
										<th>Date</th>
										<th>Hit</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Num</th>
										<th>Title</th>
										<th>ID</th>
										<th>Date</th>
										<th>Hit</th>
									</tr>
								</tfoot>
								<tbody>
								<c:forEach var="board" items="${boardList}" varStatus="stat">
									<tr>
										<td>${stat.count}</td>
										<td class="title">
											<a href="boardDetail?num=${board.num}&status=${status}">
											${board.title}<c:if test="${board.reply_count != 0}"> [${board.reply_count}]</c:if></a>
										</td>
										<td>${board.user_id}</td>
										<td>${board.register_time}</td>
										<td>${board.hit}</td>
									</tr>	
								</c:forEach>	
								</tbody>
							</table>
						<div class="tright">
							<a href="boardWrite" class="button button-3d button-rounded button-blue"><i
								class="icon-book3"></i>書き込み</a>
						</div>
						</div>
						<!-- Paging 출력 부분 -->
						<div id="navigator">
						<a href="boardLocation?currentPage= ${navi.currentPage - navi.pagePerGroup}">◁ ◁</a>
						<a href="boardLocation?currentPage= ${navi.currentPage-1}&searchtype=${searchtype}&searchword=${searchword}"> ◀ </a>
						&nbsp;&nbsp;
						<c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
							<c:if test="${navi.currentPage eq page}">
								<span style="color:blue; font-weight:bolder; font-size:1.5em;">${page}</span>
							</c:if>
							<c:if test="${navi.currentPage ne page}">
							<a href="boardLocation?currentPage=${page}&searchtype=${searchtype}&searchword=${searchword}">${page}</a>
							</c:if>
						</c:forEach>  
						&nbsp;&nbsp;
						<a href="boardLocation?currentPage= ${navi.currentPage+1}&searchtype=${searchtype}&searchword=${searchword}&countPerPage=${countPerPage}">▶</a> 
						  
						<a href="boardLocation?currentPage= ${navi.currentPage + navi.pagePerGroup}">▷ ▷</a> 
						</div>
						<hr/>
						
						
					</div>

					<!-- 자료실  -->
					<div id="drive" class="entry clearfix"
						style="margin-bottom: 10px; padding-bottom: 10px;">
						<div class="center">
							<h2>資料室</h2>
						</div>
						<table id="datatable2"
							class="table table-striped table-bordered datatable"
							cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>Num</th>
									<th>Title</th>
									<th>ID</th>
									<th>Date</th>
									<th>Hit</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Num</th>
									<th>Title</th>
									<th>ID</th>
									<th>Date</th>
									<th>Hit</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="drive" items="${driveList}" varStatus="stat">
									<tr>
										<td>${stat.count}</td>
										<td class="title">
											<a href="driveDetail?num=${drive.num}&status=${status}">
											${drive.title}</a>
										</td>
										<td>${drive.user_id}</td>
										<td>${drive.register_time}</td>
										<td>${drive.hit}</td>
									</tr>	
								</c:forEach>
							</tbody>
						</table>
						<div class="tright">
						<a href="driveWrite" class="button button-3d button-rounded button-blue"><i
							class="icon-book3"></i>書き込み</a>
					</div>
					</div>
					

				<!-- 과제 게시판 -->
				<div id="homeWork" class="entry clearfix"
					style="margin-bottom: 10px; padding-bottom: 10px;">
					<div class="center">
						<h2>Home Work</h2>
					</div>
					<table id="datatable3"
						class="table table-striped table-bordered datatable"
						cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>Num</th>
								<th>Title</th>
								<th>Final Date</th>
								<th>File</th>
								<th>ddd</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Num</th>
								<th>Title</th>
								<th>Final Date</th>
								<th>File</th>
									<th>ddd</th>
							</tr>
						</tfoot>
						<tbody>
							<tr>
								<td>B</td>
								<td>System Architect</td>
								<td>Edinburgh</td>
								<td>61</td>
								<td>dd</td>
							</tr>
							<tr>
								<td>A</td>
								<td>System Architect</td>
								<td>Edinburgh</td>
								<td>61</td>
								<td>dd</td>
							</tr>
						</tbody>
					</table>
					<div class="tright">
					<a href="#" class="button button-3d button-rounded button-blue"><i
						class="icon-book3"></i>書き込み</a>
					</div>
				</div>
				
			
			</div>
				</div>
		</section>

	</div>



	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts
	============================================= -->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/ellipsis.js"></script>
	<script type="text/javascript" src="js/plugins.js"></script>

	<!-- Bootstrap Data Table Plugin -->
	<script type="text/javascript" src="js/components/bs-datatable.js"></script>

	<!-- Footer Scripts
	============================================= -->
	<script type="text/javascript" src="js/functions.js"></script>
	<script>
	
	$(function() {
		
		var status = $('#tableSet').val();
		$('#normal').css('display', 'none');
		$('#drive').css('display', 'none');
		$('#homeWork').css('display', 'none');
		if(status == "normal"){
			$('#normal').css('display', 'inline');
		}
		if(status == "drive"){
			$('#drive').css('display', 'inline');
		}
		if(status == "homeWork"){
			$('#homeWork').css('display', 'inline');
		}
		$('.datatable').dataTable({
			  "columns": [
				    { "width": "10%" },
				    { "width": "50%" },
				    { "width": "20%" },
				    { "width": "10%" },
				    { "width": "10%"}
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
		});
	});
		
	</script>
</body>
</html>