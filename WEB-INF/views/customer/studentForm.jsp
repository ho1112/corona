<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 완료  -->
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
	<!-- / -->
	
	<link rel="stylesheet" href="css/dark.css" type="text/css" />
	<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
	<link rel="stylesheet" href="css/animate.css" type="text/css" />
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
	<link rel="stylesheet" href="css/components/bs-datatable.css" type="text/css" />
	<!-- Bootstrap File Upload CSS -->
	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	<link rel="stylesheet" href="css/customHeader.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<%@ include file="../topMenu.jsp" %>
	<%@ include file="../sidebar.jsp" %>
<style type="text/css">
.button-orange { background-color: #ff9800; }
.button-3d.button-orange:hover,
.button-reveal.button-orange:hover,
.button-border.button-orange:hover,
.button-border.button-orange.button-fill:before { background-color: #000530 !important; }

.btn:hover{
	background-color : #000530 !important;
}
.feature-box .fbox-icon i,
.feature-box .fbox-icon img {
	border-radius: 50%;
	background-color: #000000 !important;
}
.feature-box.fbox-outline .fbox-icon {
    border: 1px solid #111111 !important;
    border-radius: 50%;
    padding: 3px;
}
.fbox-effect .fbox-icon i:after {
    top: -3px;
    left: -3px;
    padding: 3px;
    box-shadow: 0 0 0 2px #fff !important;
    -webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
    -webkit-transform: scale(.8);
    -moz-transition: -moz-transform 0.3s, opacity 0.3s;
    -moz-transform: scale(.8);
    -ms-transform: scale(.8);
    transition: transform 0.3s, opacity 0.3s;
    transform: scale(.8);
    opacity: 0;
    
}
#wrapper {
	background-color: rgba(255, 255, 255, 0);
}
.panel > .list-group .list-group-item:first-child {
    /*border-top: 1px solid rgb(204, 204, 204);*/
}
@media (max-width: 767px) {
    .visible-xs {
        display: inline-block !important;
    }
    .block {
        display: block !important;
        width: 100%;
        height: 1px !important;
    }
}
#back-to-bootsnipp {
    position: fixed;
    top: 10px; right: 10px;
}


.c-search > .form-control {
   border-radius: 0px;
   border-width: 0px;
   border-bottom-width: 1px;
   font-size: 1.3em;
   padding: 12px 12px;
   height: 44px;
   outline: none !important;
}
.c-search > .form-control:focus {
    outline:0px !important;
    -webkit-appearance:none;
    box-shadow: none;
}
.c-search > .input-group-btn .btn {
   border-radius: 0px;
   border-width: 0px;
   border-left-width: 1px;
   border-bottom-width: 1px;
   height: 44px;
}


.c-list {
    padding: 0px;
    min-height: 44px;
}
.title {
    display: inline-block;
    font-size: 1.5em;
    font-weight: bold;
    padding: 5px 15px;
}
ul.c-controls {
    list-style: none;
    margin: 0px;
    min-height: 44px;
}

ul.c-controls li {
    margin-top: 8px;
    float: left;
}

ul.c-controls li a {
    font-size: 1.7em;
    padding: 11px 10px 6px;   
}
ul.c-controls li a i {
    min-width: 24px;
    text-align: center;
}

ul.c-controls li a:hover {
    background-color: rgba(51, 51, 51, 0.2);
}

.c-toggle {
    font-size: 1.7em;
}

.name {
    font-size: 1.7em;
    font-weight: 700;
}

.c-info {
    padding: 5px 10px;
    font-size: 1.25em;
}
.text-muted{
	font-size: 1.2em;
}
</style>
</head>

<body class="stretched side-panel-left no-transition" style="background-image: url('images/back.jpg'); background-size: 1700px; background-repeat: repeat;">

	<div class="body-overlay"></div>
	<section id="page-title" style="padding-bottom: 20px; padding-top: 20px !important;">

			<div class="container clearfix">
				<h1>${classInfo.name}</h1>
			</div>

		</section>
		<div id="wrapper" class="clearfix" >
			<section id="page-title" class="page-title-parallax page-title-dark page-title-video" style="z-index: 10; padding : 140px;">
			<div class="video-wrap">
				<video poster="images/videos/explore.jpg" preload="auto" loop autoplay muted style="width: 1300px !important; ">
					<source src='images/videos/student.mp4' type='video/webm' />
				</video>
				<div class="video-overlay"></div>
			</div>
		</section>
		<section id="page-title" style="padding-bottom: 20px; padding-top: 20px !important;">
		</section>
		<section id="content" style="background-color: transparent;">

			<div class="content-wrap" style="padding-top: 20px; padding-bottom: 20px;">

				<div class="container clearfix">
				<div class="col-md-2" style="margin-left: 100px;">
				<form action="#">
				<div status="normal" class="feature-box fbox-outline fbox-effect nomargin col_full location" style="padding:5px; position: static !important; background-color: #111111; border-radius: 100%; background-image: url(images/icons/iconalt.svg); background-position: center center; background-size: 100% 100%; cursor: pointer;">
							<div class="fbox-icon center" style="position: static !important; margin: 0 auto !important;">
								<a href="#" style="background-color: transparent;"><i class="icon-list i-alt"></i></a>
							</div>
							<div class="col_full center" style="padding-top:1px;"><h2 style="color: white !important; font-size: 24px;">一般掲示板</h2></div>
				
				</div>
				</form>
				</div>
				<div class="col-md-2" style="margin-top: 100px;">
				<form action="#">
				<div status="drive" class="feature-box fbox-outline fbox-effect nomargin col_full location" style="padding:5px; position: static !important; background-color: #111111; border-radius: 100%; background-image: url(images/icons/iconalt.svg); background-position: center center; background-size: 100% 100%; cursor: pointer;">
							<div class="fbox-icon center" style="position: static !important; margin: 0 auto !important;">
								<a href="#" style="background-color: transparent;"><i class="icon-line-paper-clip"></i></a>
							</div>
							<div class="col_full center" style="padding-top:1px;"><h2 style="color: white !important;">資料室</h2></div>
				
				</div>
				</form>
				</div>
				
				
				<div class="col-md-2" >
				<form action="lessonJoin" method="POST" id="lesson">
				<input type="hidden" value="${id}" name="student_id">
				<input type="hidden" value="${classInfo.num}" name="classNum">
				<div status="study" class="feature-box fbox-outline fbox-effect nomargin col_full location" style="padding:5px; position: static !important; background-color: #111111; border-radius: 100%; background-image: url(images/icons/iconalt.svg); background-position: center center; background-size: 100% 100%; cursor: pointer;">
							<div class="fbox-icon center" style="position: static !important; margin: 0 auto !important;">
								<a href="#" style="background-color: transparent;"><i class="icon-et-search i-alt"></i></a>
							</div>
							<div class="col_full center" style="padding-top:1px;"><h2 style="color: white !important;">講義参加</h2></div>
				</div>
				</form>
				</div> 
				<div class="col-md-2" style="margin-top: 100px;">
				<form action="#">
				<div status="passedLesson" class="feature-box fbox-outline fbox-effect nomargin col_full location" style="padding:5px; position: static !important; background-color: #111111; border-radius: 100%; background-image: url(images/icons/iconalt.svg); background-position: center center; background-size: 100% 100%; cursor: pointer;">
							<div class="fbox-icon center" style="position: static !important; margin: 0 auto !important;">
								<a href="#" style="background-color: transparent;"><i class="icon-study"></i></a>
							</div>
							<div class="col_full center" style="padding-top:1px;"><h2 style="color: white !important; font-size: 24px;">前回の講義</h2></div>
				
				</div>
				</form>
				</div>
				<div class="col-md-2">
				<form action="#">
				<div status="homeworkList" class="feature-box fbox-outline fbox-effect nomargin col_full location" style="padding:5px; position: static !important; background-color: #111111; border-radius: 100%; background-image: url(images/icons/iconalt.svg); background-position: center center; background-size: 100% 100%; background-repeat: space; cursor: pointer;">
							<div class="fbox-icon center" style="position: static !important; margin: 0 auto !important;">
								<a href="#" style="background-color: transparent;"><i class="icon-book3 i-alt"></i></a>
							</div>
							<div class="col_full center" style="padding-top:1px;"><h2 style="color: white !important; font-size: 24px;">課題掲示板</h2></div>
				
				</div>
				</form>
				</div>
				</div>
				<div class="col_full center">
			<a href="#" data-scrollto="#content" data-offset="20" class="dark one-page-arrow"><i class="icon-angle-down infinite animated fadeInDown" style="color: black;"></i></a>
			</div>
			</div>
		</section>
		<section>
			<div class="row">
        <div class="col-xs-12 col-sm-offset-3 col-sm-8">
            <div class="panel panel-default">
                <div class="panel-heading c-list">
                	<div class="col-xs-12 col-sm-2">
                    <span class="title">Contacts</span>
                    </div>
                    <div class="col-xs-12 col-sm-3">
                    <span class="title" style="padding-left: 0">ID</span>
                    </div>
                    <div class="col-xs-12 col-sm-2">
                    <span class="title" style="padding-left: 0">名前</span>
                    </div>
                    <div class="col-xs-12 col-sm-3">
                    <span class="title" style="padding-left: 0">E-Mail</span>
                    </div>
                    <ul class="pull-right c-controls">
                        <li><a href="#" class="hide-search" data-command="toggle-search" data-toggle="tooltip" data-placement="top" title="Toggle Search"><i class="icon-ellipsis-horizontal"></i></a></li>
                    </ul>
                </div>
                
                <div class="row" style="display: none;">
                    <div class="col-xs-12">
                        <div class="input-group c-search">
                            <input type="text" class="form-control" id="contact-list-search">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><span class="icon-line-search"></span></button>
                            </span>
                        </div>
                    </div>
                </div>
                
                <ul class="list-group" id="contact-list">
                    	<c:forEach items="${userList}" var="sList">
                    <li class="list-group-item">
                		<c:forEach items="${allList}" var="uList">
                        	<c:if test="${sList.user_id == uList.id}">
                        <div class="col-xs-12 col-sm-2">
                            <img id="profileImg" src="imgStatus?imgName=${uList.img_name}" alt="Scott Stevens" class="img-responsive alignleft img-circle img-thumbnail notopmargin nobottommargin" />
                        </div>
                        <div class="col-xs-12 col-sm-3" style="margin-top: 13px; vertical-align: middle;">
                            <span class="name">${sList.user_id}</span><br/>
                        </div>
                        <div class="col-xs-12 col-sm-2" style="margin-top: 13px; vertical-align: middle; line-height: 50px;">
                            <span class="text-muted">${uList.name}</span><br/>
                            </div>
                            <div class="col-xs-12 col-sm-3" style="margin-top: 13px; vertical-align: middle; line-height: 50px;">
                            <span class="text-muted">${uList.email}</span><br/>
                        </div>
                        <div class="col-xs-12 col-sm-2 center" style="margin-top: 5px; vertical-align: middle;">
                        <c:if test="${uList.id == loginId}">
                        <div class="feature-box fbox-border fbox-light fbox-effect">
							<div num="${sList.num}" class="fbox-icon center retired" style="background-color: #eeeeee; margin-left: 40px;">
								<a href="#"><i class="icon-line-cross"></i></a>
							</div>
						</div>
                        </c:if>
                        </div>
                        <div class="clearfix"></div>
                            </c:if>
                    	</c:forEach>
                    </li>
                    	</c:forEach>
                </ul>
            </div>
        </div>
	</div>

    

		</section>
		<!-- Footer
		============================================= -->
		<footer id="footer" class="dark noborder">

			<div id="copyrights">
				<div class="container center clearfix">
					Copyright HanJo 2017 | All Rights Reserved
				</div>
			</div>

		</footer><!-- #footer end -->
		
	</div><!-- #wrapper end -->
	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts
	============================================= -->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/plugins.js"></script>
	<script type="text/javascript" src="js/components/bs-datatable.js"></script>
	<!-- Footer Scripts
	============================================= -->
	<script type="text/javascript" src="js/functions.js"></script>
    <script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
	<script>
	$(function() {
		$('.feature-box').mouseover(function() {
			$(this).find('h2').css('color', '#ffffff');
			$(this).find('a').css('color','#000530');
			$(this).css('background-color', '#000530');
		});
		$('.feature-box').mouseout(function() {
			$(this).find('h2').css('color', '#ffffff');
			$(this).find('a').css('color','white');
			$(this).css('background-color', '#111111');
		});
		$('.datatable').dataTable({
			  "columns": [
				    { "width": "50%" },
				    { "width": "25%", "orderable": false },
				    { "width": "25%", "orderable": false },
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
		$('#lessonbtn').on('click', function() {
			$('#lesson').submit();
		});
	
		$('.location').on('click', locationStatus);
		$('#wrapper').animate({
			backgroundColor: "rgba(255, 255, 255, 0.5)"
		}, 1500);
		 if (window.location == window.parent.location) {
		        $('#back-to-bootsnipp').removeClass('hide');
		    }
		    
		    
		    $('[data-toggle="tooltip"]').tooltip();
		    
		    $('#fullscreen').on('click', function(event) {
		        event.preventDefault();
		        window.parent.location = "http://bootsnipp.com/iframe/4l0k2";
		    });
		    $('a[href="#cant-do-all-the-work-for-you"]').on('click', function(event) {
		        event.preventDefault();
		        $('#cant-do-all-the-work-for-you').modal('show');
		    })
		    
		    $('[data-command="toggle-search"]').on('click', function(event) {
		        event.preventDefault();
		        $(this).toggleClass('hide-search');
		        
		        if ($(this).hasClass('hide-search')) {        
		            $('.c-search').closest('.row').slideUp(100);
		        }else{   
		            $('.c-search').closest('.row').slideDown(100);
		        }
		    })
		    
		    $('#contact-list').searchable({
		        searchField: '#contact-list-search',
		        selector: 'li',
		        childSelector: '.col-xs-12',
		        show: function( elem ) {
		            elem.slideDown(100);
		        },
		        hide: function( elem ) {
		            elem.slideUp( 100 );
		        }
		    })
		    $('.retired').on('click', retired);
	});
	
	function retired(){
		var result = confirm("本当に脱退しますか?");
		var num = $(this).attr('num');
		if(result){
			location.href = "${pageContext.request.contextPath}/retired?num=" + num;
		}
	}
	
	function locationStatus(){
		var status= $(this).attr('status');
		if(status == 'normal'){
			location.href = '${pageContext.request.contextPath}/boardList?classNum=${classInfo.num}';
		} else if(status == 'drive'){
				location.href = "${pageContext.request.contextPath}/driveList?classNum=${classInfo.num}";		
		} else if(status == 'study') {
			$('#lesson').submit();
		} else if(status == 'passedLesson') {
			location.href = '${pageContext.request.contextPath}/passedLessonList?classNum=${classInfo.num}';
		} else if(status == 'homeworkList') {
			location.href = '${pageContext.request.contextPath}/homeworkList?classNum=${classInfo.num}';
		}
	}
	</script>
</body>
</html>