<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />
<!-- Stylesheets -->
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
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/plugins.js"></script>	
	
<title>Homework List</title>
<script>
$(function() {
	$('#homeworkCreateForm').on('click', function() {
		location.href = 'homeworkCreateForm?classNum=${classNum}';
	});
	
	$('#searchIcon').on('click',function(){
		$('#search').submit();
	});
	
	
});
</script>

</head>
<%@ include file="../topMenu.jsp" %>
	<%@ include file="../sidebar.jsp" %>
	
<style>
	.flip-clock-divider.minutes .flip-clock-label {
		display: none;
	}
	.flip-clock-divider.seconds .flip-clock-label{
		display: none;
	}
	#navigator{
		text-align: center;
	}
	
	.typeahead{
	width: 50%;
	}
	.btn{
    color: #fff;
    text-transform: uppercase;
    border-radius: 0;
    padding-left: 60px;
    position: relative;
    transform: translateZ(0px);
    transition: all 0.5s ease 0s;
    
    width:300px;
    height:90px;
    font-size: 50px;
}
.btn:after{
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    background: #fff;
    z-index: -1;
    transform: scaleX(0);
    transform-origin: 100% 50% 0;
    transition: all 0.5s ease-out 0s;
}
.btn:hover:after{
    transform: scaleX(1);
    transition-timing-function: cubic-bezier(0.52, 1.64, 0.37, 0.66);
}
.btn span{
    width: 40px;
    height: 100%;
    line-height: 40px;
    background: #fff;
    position: absolute;
    top: 0;
    left: 0;
    transition: all 0.3s linear 0s;
}
.btn span:after{
    content: "";
    display: block;
    width: 10px;
    height: 10px;
    background: #fff;
    margin: auto 0;
    position: absolute;
    top: 0;
    right: -6px;
    bottom: 0;
    transform: rotate(45deg);
    transition: all 0.3s linear 0s;
}

.btn.red{
    border: 1px solid #fe6d6d;
    background: #fe6d6d;
}
.btn.red:hover,
.btn.red span{
    color: #fe6d6d;
}
.btn.red:hover span,
.btn.red:hover span:after{
    background: #fe6d6d;
}
.btn:hover span{
    color: #fff;
}

	
</style>	
<body class="stretched side-panel-left">
<div class="body-overlay"></div>

<!-- Page Title
============================================= -->
<section id="page-title" class="page-title-mini" st>
	<div class="container clearfix">
		<h1>Homework List Page</h1>
		<span>Homework List Page</span>
	</div>
</section>

<!--  작업시작 -->
<!-- Content
============================================= -->
<section id="content">

		<!-- 특정 글 검색 -->
		
	
		<div class="content-wrap" style="padding-top: 0px; margin-bottom: 10px;">
		<div class="search col_full" style="margin-top:10px; margin-bottom: 25px;">
			<form id="search" action ="homeworkList" method="GET" style="margin-top:10px; margin-bottom: 25px;">
			<input type="hidden" name="classNum" value="${classNum}" />
			<div class="col_full" style="margin-top:10px; margin-bottom: 25px;">
				<div class="col-md-5 nopadding">
					<input id="searchText" name="searchword" class="typeahead sm-form-control tt-input" type="text" placeholder="Search Text" autocomplete="off" spellcheck="false" dir="auto" style="position: relative; margin:0px !important; width:545px; vertical-align: top; opacity: 0.8; color: black;">
				</div>
				<div class="col-md-1 nopadding">
				<a href="#" id = "searchIcon" class="i-rounded i-medium nomargin icon-line-search" 
				style="width: 40px !important; height: 1.06cm !important;"></a>
				</div>
			</div>	
			</form>
			</div>
		</div>
		
			<div class="col_full" style="margin-top: 10px !important;">
				<c:if test="${position eq 'teacher' }">
					<a style="display: inline-block;" class="button button-full button-purple center tright header-stick bottommargin-lg" id="homeworkCreateForm" style="margin-top:10px; margin-bottom: 25px;">
							<i class="icon-plus" style="top:4px;"></i>
					</a>
				</c:if>
			</div>
		<!-- 게시판 시작 -->
		<div id="posts" class="post-grid grid-container post-masonry post-masonry-full grid-3 clearfix">
		
		<!-- 과제 forEach -->
		<c:forEach var="taskInfo" items="${taskInfoList}" varStatus="stat">
			<div class="entry clearfix">
			<div class="clock" id="clock${stat.count}" ></div>
				<div class="entry-title">
					<h3>[${taskInfo.title}]</h3>
				</div>
				
				<c:if test="${position eq 'student' }">
					<c:if test="${taskInfo.submitted}">
					 <div class="col-sm-3">
							<a href="myhomeworkConfirm?homeworkNum=${taskInfo.num}" class="btn btn-lg red" > <span class="fa fa-home"></span>答案確認</a>
					</div>		
					</c:if>
					
					<c:if test="${!taskInfo.submitted}">
						<c:if test="${taskInfo.is_closed eq 'n'}">
						 <div class="col-sm-3">
							<a href="homeworkDetail?homeworkNum=${taskInfo.num}" class="btn btn-lg red" > <span class="fa fa-home"></span>課題作成</a>
						</div>		
						</c:if>
						
						<c:if test="${taskInfo.is_closed ne 'n'}">
							<img src="images/closed.png">
						</c:if>
					</c:if>
				</c:if><!-- end student -->
				
				<c:if test="${position eq 'teacher' }">
				 <div class="col-sm-3">
					<a href="submittedHomeworkConfirm?homeworkNum=${taskInfo.num}" class="btn btn-lg red" style="font-size: 40px; height: 75px;"><span class="fa fa-home" ></span>提出者確認</a>
				</div>		
				</c:if>
				
			</div>
		</c:forEach>
		</div><!-- #posts end -->
	<br><br><br>
	<!-- 페이징 시작 -->
	<div id="navigator">
		<ul class="pagination pagination-lg">
			<li><a href="homeworkList?currentPage= ${navi.currentPage - navi.pagePerGroup}&classNum=${classNum}">◁ ◁</a></li>
			<li><a href="homeworkList?currentPage= ${navi.currentPage-1}&searchword=${searchword}&classNum=${classNum}"> ◀ </a></li>
		<c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
			<c:if test="${navi.currentPage eq page}">
				<li class="active"><a href="#">${page}</a></li>
			</c:if>
			<c:if test="${navi.currentPage ne page}">
				<li><a href="homeworkList?currentPage=${page}&searchword=${searchword}&classNum=${classNum}">${page}</a></li>
			</c:if>
		</c:forEach>
		<li><a href="homeworkList?currentPage= ${navi.currentPage+1}&searchword=${searchword}&countPerPage=${countPerPage}&classNum=${classNum}">▶</a> </li>
		<li><a href="homeworkList?currentPage= ${navi.currentPage + navi.pagePerGroup}&classNum=${classNum}">▷ ▷</a></li>  
		</ul> 
	</div><!-- end paging -->
</section><!-- end content section -->

<link rel="stylesheet" href="css/flipclock.css">
<script src="js/flipclock.js"></script>

	<script>var now = Date.now();</script>
	<c:forEach var="taskInfo" items="${taskInfoList}" varStatus="stat">
	<script type="text/javascript">
	var end = +new Date('${taskInfo.deadline}');
	var ms =0;
	if(now<end){
	ms = (end-now)/1000;
	} else {
		ms =0;
	}
	var clock = $('#clock${stat.count}').FlipClock(ms, {
		clockFace: 'DailyCounter',
		countdown: true
	});
	</script>
	</c:forEach>


</body>
</html>