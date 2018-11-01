<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html dir="ltr" lang="ko-KR">
<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="css/style.css" type="text/css" />
	<link rel="stylesheet" href="css/swiper.css" type="text/css" />
	<link rel="stylesheet" href="css/dark.css" type="text/css" />
	<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
	<link rel="stylesheet" href="css/animate.css" type="text/css" />
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />

	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	
	<!-- Document Title
	============================================= -->
	<title>Corona - 資料室</title>

</head>
<style>
.profile-down{
  float: none;
  margin: 0 auto;
  width: 50%;
  height: 50%;
  -webkit-border-radius: 50% !important;
  -moz-border-radius: 50% !important;
  border-radius: 50% !important;
  border : solid;
}

.counter{
margin : 0 auto;
float: none;
width: 20%;
}

#navigator{
	text-align: center;
}


</style>


<%@ include file="topMenu.jsp" %>
	<%@ include file="sidebar.jsp" %>

<body class="stretched">

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">
	<section id="page-title" class="page-title-mini">
	<div class="container clearfix">
		<h1>Drive List</h1>
		<span>Drive List</span>
	</div>
</section>
	
		<!-- Content
		============================================= -->
		<section id="content">
				<!-- 특정 글 검색 -->
				<div class="content-wrap" style="padding-top: 0px; margin-bottom: 10px;">
				
				<div class="search">
					<form id="search" action ="driveList" method="GET" >
					<input type = "hidden" name = "classNum" value = "${classNum}">
					<div class="col_full" style="margin-top:10px; margin-bottom: 25px;">
				<div class="col-md-2 nomargin" style="padding:0px;">
					<select name="searchtype" id="searchType" class="typeahead select-1 sm-form-control t-rotate"  dir="auto" style="width:100%; font-weight: bold; height: 1.0796cm; opacity: 0.8; border: 2px solid #DDD; border-right: 0; border-radius: 0 !important; line-height: 1.42857143;position: relative;   ">
						<option value="title" ${searchtype=='title' ? 'selected' : '' }>タイトル</option>
						<option value="user_id" ${searchtype=='user_id' ? 'selected' : '' }>作成者</option>
						<option value="content" ${searchtype=='content' ? 'selected' : '' }>内容</option>
					</select>
						</div>
				<div class="col-md-5 nopadding">
					<input id="searchText" value="${searchword}" name="searchword" class="typeahead sm-form-control tt-input" type="text" placeholder="Search Text" autocomplete="off" spellcheck="false" dir="auto" style="position: relative; margin:0px !important; width:545px; vertical-align: top; opacity: 0.8; color: black;">
				</div>
				<div class="col-md-1 nopadding">
				<button type="submit" href="#" id = "searchIcon" class="i-rounded i-medium nomargin icon-line-search" 
				style="width: 40px !important; height: 1.06cm !important;"></button>
				</div>
			</div>	
					</form>
				</div>
			</div><!-- end content-wrap end -->
			
				<a class="button button-full button-purple center tright header-stick bottommargin-lg" href="driveWrite?classNum=${classNum}">
						<i class="icon-plus" style="top:4px;"></i>
				</a>

				<!-- 게시판 시작
				============================================= -->
				<div id="posts" class="post-grid grid-container post-masonry post-masonry-full grid-3 clearfix">
				
				<!-- 글 작성 시작 -->
				<c:forEach var="drive" items="${driveList}" varStatus="stat">
					<div class="entry clearfix">
					<!-- 다운로드 수 -->
						<c:set var = "sum" value = "0" />
						<c:forEach var="dfL" items="${dfList}">
							<c:forEach var="df" items="${dfL}">
								<c:if test="${df.drive_num == drive.num}">
									<c:set var= "sum" value="${sum + df.down_count}"/>
								</c:if>
							</c:forEach>
						</c:forEach>
						<div class="counter counter-large" style="color: #e74c3c;">
							<span data-from="100" data-to="${sum}" data-refresh-interval="50" data-speed="2000"></span>				
						</div>
						
						<div class="entry-title">
							<h2><a href="driveDetail?num=${drive.num}&classNum=${classNum}">${drive.title}</a></h2>
						</div>
						<ul class="entry-meta clearfix">
							<li>${drive.user_id}</li>
							<li><i class="icon-calendar3"></i>${drive.register_time}</li>
							<li>照会数 : ${drive.hit}</li>
						</ul><br>
						<div class="entry-fileList">
							<c:forEach var="dfL" items="${dfList}">
								<c:forEach var="df" items="${dfL}">
									<c:if test="${df.drive_num == drive.num}">
										<a class="downURL" href="download?num=${df.num}">${df.original_filename}</a>																
									</c:if>
								</c:forEach>
							</c:forEach><br>
							<a href="driveDetail?num=${drive.num}&classNum=${classNum}" class="more-link">Read More</a>
						</div>
					</div>
				</c:forEach>
				
				</div><!-- #posts end -->
			
			<!-- 페이징 시작 -->
			<div id="navigator" style="margin-top: 60px;">
				<ul class="pagination pagination-lg" >
					<li><a href="driveList?currentPage= ${navi.currentPage - navi.pagePerGroup}&classNum=${classNum}">◁ ◁</a></li>
					<li><a href="driveList?currentPage= ${navi.currentPage-1}&searchtype=${searchtype}&searchword=${searchword}&classNum=${classNum}"> ◀ </a></li>
				<c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
					<c:if test="${navi.currentPage eq page}">
						<li class="active"><a href="#">${page}</a></li>
					</c:if>
					<c:if test="${navi.currentPage ne page}">
						<li><a href="driveList?currentPage=${page}&searchtype=${searchtype}&searchword=${searchword}&classNum=${classNum}">${page}</a></li>
					</c:if>
				</c:forEach>
				<li><a href="driveList?currentPage= ${navi.currentPage+1}&searchtype=${searchtype}&searchword=${searchword}&countPerPage=${countPerPage}&classNum=${classNum}">▶</a> </li>
				<li><a href="driveList?currentPage= ${navi.currentPage + navi.pagePerGroup}&classNum=${classNum}">▷ ▷</a></li>  
				</ul> 
			</div><!-- end paging -->
			
			
		</section>
		
	</div><!-- #wrapper end -->

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts
	============================================= -->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/plugins.js"></script>

	<!-- Footer Scripts
	============================================= -->
	<script type="text/javascript" src="js/functions.js"></script>

</body>
</html>