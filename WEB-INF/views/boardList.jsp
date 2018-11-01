<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<title>Corona - 提示版</title>

</head>
<%@ include file="topMenu.jsp" %>
	<%@ include file="sidebar.jsp" %>
	
<style>
	.spancon {
		text-align: left;
	}
	
	#navigator{
		text-align: center;
	}

</style>	

<body class="stretched">

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">
	
	<section id="page-title" class="page-title-mini">
	<div class="container clearfix">
		<h1>Board List</h1>
		<span>Board List</span>
	</div>
</section>
		<!-- Content
		============================================= -->
		<section id="content">
				<!-- 특정 글 검색 -->
				<div class="content-wrap" style="padding-top: 0px; margin-bottom: 10px;">
				<div class="search" >
					<form id="search" action ="boardList" method="GET" >
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
					<input id="searchText" name="searchword" class="typeahead sm-form-control tt-input" type="text" placeholder="Search Text" autocomplete="off" spellcheck="false" dir="auto" style="position: relative; margin:0px !important; width:545px; vertical-align: top; opacity: 0.8; color: black;">
				</div>
				<div class="col-md-1 nopadding">
				<button type="submit" href="#" id = "searchIcon" class="i-rounded i-medium nomargin icon-line-search" 
				style="width: 40px !important; height: 1.06cm !important;"></button>
				</div>
			</div>	
					</form>
				</div>
				
			
			</div><!-- end content-wrap end -->
			
				
				<a class="button button-full button-purple center tright header-stick bottommargin-lg" href="boardWrite?classNum=${classNum}" >
						<i class="icon-plus" style="top:4px;"></i>
				</a>

				<!-- 게시판 시작
				============================================= -->
				<div id="posts" class="post-grid grid-container post-masonry post-masonry-full grid-3 clearfix">
				<c:forEach var="board" items="${boardList}" varStatus="stat">
					<div class="entry clearfix col-md-4 col-xs-4 col-sm-4 col-lg-4">
						<div class="entry-image clearfix">
							<div class="fslider" data-animation="fade-left-right" data-pagi="true" data-arrows="true"  data-pause="2000" data-lightbox="gallery">
								<div class="flexslider">
									<div class="slider-wrap">
										<c:forEach var="bfL" items="${bfList}">
											<c:forEach var="bf" items="${bfL}">
												<c:if test="${bf.bf_num == board.num}">
													<div class="slide"><a href="downloadbf?num=${bf.num}" data-lightbox="gallery-item"><img class="image_fade" src="downloadbf?num=${bf.num}" alt="Standard Post with Gallery"></a></div>																
												</c:if>
											</c:forEach>
										</c:forEach><!-- 파일리스트 가져와서 해당 글에 이미지 뿌려주기 -->
									</div>
								</div>
							</div>
						</div>
					<!-- 이미지 삽입 끝 -->	
						<div class="entry-title">
							<h2><a href="boardDetail?num=${board.num}&classNum=${classNum}">${board.title}</a></h2>
						</div>
						<div>
						<ul class="entry-meta clearfix">
							<li>${board.user_id}</li>
							<li><i class="icon-calendar3"></i>${board.register_time}</li>
							<li><a href="blog-single.html#comments"><i class="icon-comments"></i><c:if test="${board.reply_count != 0}">${board.reply_count}</c:if></a></li>
							<li>照会数 : ${board.hit}</li>
						</ul>
						</div>
						<div class="entry-user_id">
							<p class="spancon">
						      <c:choose>
						           <c:when test="${fn:length(board.content) > 14}">
						           ${fn:substring(board.content,0,13)}...
						           </c:when>
						           <c:otherwise>
						            ${board.content}
						           </c:otherwise> 
					          </c:choose>
					          </p><br>
							<a href="boardDetail?num=${board.num}&classNum=${classNum}" class="more-link">Read More</a>
						</div>
					</div>
				</c:forEach><!-- 글 작성 끝 -->
				</div><!-- #posts end -->
			
			<!-- 페이징 시작 -->
			<div id="navigator" style="margin-top: 60px;">
				<ul class="pagination pagination-lg">
					<li><a href="boardList?currentPage= ${navi.currentPage - navi.pagePerGroup}&classNum=${classNum}">◁ ◁</a></li>
					<li><a href="boardList?currentPage= ${navi.currentPage-1}&searchtype=${searchtype}&searchword=${searchword}&classNum=${classNum}"> ◀ </a></li>
				<c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
					<c:if test="${navi.currentPage eq page}">
						<li class="active"><a href="#">${page}</a></li>
					</c:if>
					<c:if test="${navi.currentPage ne page}">
						<li><a href="boardList?currentPage=${page}&searchtype=${searchtype}&searchword=${searchword}&classNum=${classNum}">${page}</a></li>
					</c:if>
				</c:forEach>
				<li><a href="boardList?currentPage= ${navi.currentPage+1}&searchtype=${searchtype}&searchword=${searchword}&countPerPage=${countPerPage}&classNum=${classNum}">▶</a> </li>
				<li><a href="boardList?currentPage= ${navi.currentPage + navi.pagePerGroup}&classNum=${classNum}">▷ ▷</a></li>  
				</ul> 
			</div><!-- end paging -->
			
		</section><!-- #content end -->


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