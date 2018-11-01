<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!--오늘은 여기까지  -->
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
	<link rel="stylesheet" href="css/et-line.css" type="text/css" />
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
	<link rel="stylesheet" href="css/components/bs-datatable.css" type="text/css" />
	<!-- Bootstrap File Upload CSS -->
	<link rel="stylesheet" href="css/components/bs-switches.css" type="text/css" />
	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	<link rel="stylesheet" href="css/customHeader.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
<%@ include file="../topMenu.jsp" %>
	<%@ include file="../sidebar.jsp" %>
<style type="text/css">
.button-3d.boran:hover,
.button-reveal.boran:hover,
.button-border.boran:hover,
.button-border.boran.button-fill:before { background-color: #ff9800 !important; }
.button.button-3d:hover {
	background-color: #000530 !important;
}
.boran{
	border-color: #ff9800 !important
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
    font-size: 1.0em;
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
    font-size: 1.2em;
    font-weight: 700;
}
.c-info {
    padding: 5px 10px;
    font-size: 1.25em;
}
.text-muted{
	font-size: 1.2em;
}
.feature-box.fbox-light .fbox-icon i { line-height: 30px !important; }
.input-group-addon.success {
    color: rgb(255, 255, 255);
    background-color: rgb(92, 184, 92);
    border-color: rgb(76, 174, 76);
}
</style>
</head>
<body class="stretched no-transition" style="background-image: url('images/teacherback.jpeg'); background-size: 2000px; background-repeat: repeat;" >
	<div class="body-overlay"></div>
	<section id="page-title" style="padding-bottom: 20px; padding-top: 20px !important;">

			<div class="container clearfix">
				<h1>${classInfo.name}</h1>
			</div>

		</section>
		<div id="wrapper" class="clearfix">
			<section id="page-title" class="page-title-parallax page-title-dark page-title-video" style="padding : 140px 0;">
			<div class="video-wrap">
				<video poster="images/videos/explore.jpg" preload="auto" loop autoplay muted style="width: 1300px !important; ">
					<source src='images/videos/teacher.mp4' type='video/mp4' />
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
				<form action="lessonStart" method="POST" id="lesson">
				<input type="hidden" value="${classInfo.teacher_id}" name="teacher_id">
				<input type="hidden" value="${classInfo.num}" name="classNum">
				<div status="study" class="feature-box fbox-outline fbox-effect nomargin col_full location" style="padding:5px; position: static !important; background-color: #111111; border-radius: 100%; background-image: url(images/icons/iconalt.svg); background-position: center center; background-size: 100% 100%; cursor: pointer;">
							<div class="fbox-icon center" style="position: static !important; margin: 0 auto !important;">
								<a href="#" style="background-color: transparent;"><i class="icon-et-search i-alt"></i></a>
							</div>
							<div class="col_full center" style="padding-top:1px;"><h2 style="color: white !important; font-size: 24px;">講義スタート</h2></div>
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
				<div status="homeworkList" class="feature-box fbox-outline fbox-effect nomargin col_full location" style="padding:5px; position: static !important; background-color: #111111; border-radius: 100%; background-image: url(images/icons/iconalt.svg); background-position: center center; background-size: 100% 100%; cursor: pointer;">
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
		<section id="content" style="background-color: transparent;">
			<div class="container clearfix">
				<div class="panel-heading col_full divcenter" style="width: 1200px;">
					<div id="homeWork" class="entry clearfix col_full"
					style="margin-bottom: 10px; padding-bottom: 10px;">
					<div class="panel panel-default">
					
					
					</div>
					<div class="table-responsive col-md-6">
					<div class="row" style=" padding-right: 10px;">
					<div class="col-md-12" style="background-color: #f5f5f5; border-radius: 3px;">
					<div class="col-sm-4">
					<h3 style="font-weight: bold;">E-Mail招待</h3>
					</div>
					<div class="col-sm-8" style="top:11px;" >
						<div class="row form-group">
							<div class="input-group">
								<input type="text" class="form-control"> <span
								class="input-group-addon success" style="cursor: pointer;"><i
								class="icon-line-check" ></i></span>
								</div>
							</div>
						</div>
					</div>
					</div>
					<div class="row" style=" padding-right: 10px;">
            <div class="panel panel-default">
                <div class="panel-heading c-list">
                	<div class="col-xs-12 col-sm-2" style="padding-left: 0; padding-right: 0; padding-top:5px;">
                    <span class="title">申請学生</span>
                    </div>
                    <div class="col-xs-12 col-sm-3" style="padding-left: 0;">
                    <span class="title" style="padding-left: 0; padding-top:10px;">&nbsp;&nbsp;&nbsp;ID</span>
                    </div>
                    <div class="col-xs-12 col-sm-2" style="padding-left: 0;">
                    <span class="title" style="padding-left: 0; padding-top:10px;">名前</span>
                    </div>
                    <div class="col-xs-12 col-sm-2 center" style="padding-left: 15px; padding-top:5px;">
                    <span class="title center" style="padding-left: 0">承認</span>
                    </div>
                    <div class="col-xs-12 col-sm-2 center" style="padding-left: 15px; padding-top:5px;">
                    <span class="title center" style="padding-left: 0">拒絶</span>
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
                		<c:forEach items="${allList}" var="uList">
                        	<c:if test="${sList.status == 'request'}">
                        	<c:if test="${sList.user_id == uList.id}">
                        	<c:if test="${sList.user_id != loginId}">
                    <li class="list-group-item">
                        <div class="col-xs-12 col-sm-2" style="padding-left: 0; padding-right: 0;">
                            <img id="profileImg" src="imgStatus?imgName=${uList.img_name}" alt="Scott Stevens" class="img-responsive alignleft img-circle img-thumbnail notopmargin nobottommargin" />
                        </div>
                        <div class="col-xs-12 col-sm-3" style="margin-top: 20px; vertical-align: middle; padding-left: 5px; ">
                            <span class="name">${sList.user_id}</span><br/>
                        </div>
                        <div class="col-xs-12 col-sm-2" style="margin-top: 13px; vertical-align: middle; line-height: 50px; padding-left: 0;">
                            <span class="text-muted">${uList.name}</span><br/>
                            </div>
                            <div class="col-xs-12 col-sm-2" style="margin-top: 22px; vertical-align: middle; padding-left: 0;">
                            <div class="feature-box fbox-border fbox-light fbox-effect">
							<div num="${sList.num}"  status="student" class="fbox-icon center status" style="background-color: #eeeeee; margin-left:25px;  width: 32px; height: 32px;">
								<a href="#"><i class="icon-checkmark" style="font-size: 20px;"></i></a>
							</div>
						</div>
                        </div>
                        <div class="col-xs-12 col-sm-2 center" style="margin-top: 22px; vertical-align: middle; padding-left: 0;">
                        <div class="feature-box fbox-border fbox-light fbox-effect">
							<div num="${sList.num}" status="withdraw" class="fbox-icon center status" style="background-color: #eeeeee; margin-left:31px; width: 32px; height: 32px;">
								<a href="#"><i class="icon-line-cross" style="font-size: 20px;"></i></a>
							</div>
						</div>
                        </div>
                        <div class="clearfix"></div>
                    </li>
                    		</c:if>
                    		</c:if>
                            </c:if>
                    	</c:forEach>
                    	</c:forEach>
                </ul>
        </div>
	</div>
					</div>
					<div class="col-md-6">
					<div class="row" style= "padding-left: 10px;">
					<div class="col-md-12" style="background-color: #f5f5f5; border-radius: 3px;" >
					<div class="col-sm-7">
					<h3 style="font-weight: bold;">クラス変換</h3>
					</div>
						<c:if test="${classInfo.is_public eq 'y'}">
					<div class="col-sm-2" style="margin-top: 10px;">
					<input id="publicStatus" class="bt-switch" name="is_public" type="checkbox" value="y" data-on-text="<i class='icon-lock3'></i>" data-off-text="<i class='icon-unlock'></i>" data-on-color="danger" data-off-color="default">
					</div>
					<div id ="publicwordForm" class="col-sm-2" style="margin-top: 7px;">
							<button disabled="disabled" id="publicbtn"
						class="button publicbutton-3d tright nomargin" role="button" data-lightbox="inline" style="cursor: default; width: 100px; background-color: #ff9800;">公開<i class="icon-unlock" style="width: 15px"></i></button>
					</div>
						</c:if>
						<c:if test="${classInfo.is_public eq 'n'}">
						<div class="col-sm-2" style="margin-top: 10px;">
					<input id="publicStatus" class="bt-switch" name="is_public" type="checkbox" checked="checked" value="n" data-on-text="<i class='icon-lock3'></i>" data-off-text="<i class='icon-unlock'></i>" data-on-color="danger" data-off-color="default">
					</div>
					<div id ="publicwordForm" class="col-sm-2" style="margin-top: 7px;">
							<button disabled="disabled" id="publicbtn"
						class="button publicbutton-3d tright nomargin" role="button" data-lightbox="inline" style="cursor: default; border-radius:3px; border-bottom:3px solid rgba(0,0,0,0.15); width: 100px; color:#444; background-color: #F5F5F5; text-shadow:1px 1px 1px rgba(0,0,0,0.3); box-shadow: 0 0 0 rgba(0,0,0,0.2);">非公開<i class="icon-lock3" style="width: 15px"></i></button>
					</div>
						</c:if>
					</div>
					</div>
					<div class="row" style= "padding-left: 10px;">
            <div class="panel panel-default">
            	
                <div class="panel-heading c-list">
                	<div class="col-xs-12 col-sm-2" style="padding-top:5px; padding-left: 0; padding-right: 0;">
                    <span class="title">学生たち</span>
                    </div>
                    <div class="col-xs-12 col-sm-3" style="padding-left: 0; padding-top:5px;">
                    <span class="title" style="padding-left: 0; padding-top:5px;">&nbsp;&nbsp;&nbsp;ID</span>
                    </div>
                    <div class="col-xs-12 col-sm-2" style="padding-left: 0; padding-top:5px;">
                    <span class="title" style="padding-left: 0; padding-top:5px;">名前</span>
                    </div>
                    <div class="col-xs-12 col-sm-3" style="padding-left: 0; padding-top:5px;">
                    <span class="title" style="padding-left: 0; padding-top:5px;">E-Mail</span>
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
                    	<c:forEach items="${allList}" var="uList">
                        	<c:if test="${sList.user_id == uList.id}">
                        	<c:if test="${sList.status == 'student'}">
                    <li class="list-group-item">
                		
                        <div class="col-xs-12 col-sm-2" style="padding-left: 0; padding-right: 0;">
                            <img id="profileImg" src="imgStatus?imgName=${uList.img_name}" alt="Scott Stevens" class="img-responsive alignleft img-circle img-thumbnail notopmargin nobottommargin" />
                        </div>
                        <div class="col-xs-12 col-sm-3" style="margin-top: 20px; vertical-align: middle; padding-left: 5px; ">
                            <span class="name">${sList.user_id}</span><br/>
                        </div>
                        <div class="col-xs-12 col-sm-2" style="margin-top: 13px; vertical-align: middle; line-height: 50px; padding-left: 0;">
                            <span class="text-muted">${uList.name}</span><br/>
                            </div>
                            <div class="col-xs-12 col-sm-3" style="margin-top: 13px; vertical-align: middle; line-height: 50px; padding-left: 0;">
                            <span class="text-muted">${uList.email}</span><br/>
                        </div>
                        <div class="col-xs-12 col-sm-2 center" style="margin-top: 22px; vertical-align: middle; padding-left: 0;">
                        <div class="feature-box fbox-border fbox-light fbox-effect">
							<div num="${sList.num}" class="fbox-icon center retired" style="background-color: #eeeeee; margin-left: 55px; width: 32px; height: 32px;">
								<a href="#"><i class="icon-line-cross" style="font-size: 20px;"></i></a>
							</div>
						</div>
                        </div>
                        <div class="clearfix"></div>
                    </li>
                     </c:if>
                            </c:if>
                    	</c:forEach>
                    	</c:forEach>
                </ul>
        </div>
	</div>
				
						</div>
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
	<script type="text/javascript" src="js/components/bs-switches.js"></script>
	<script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
	<script>

		$(function() {
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
			
			$('.datatable')
					.dataTable(
							{
								"columns" : [ {
									"width" : "50%"
								}, {
									"width" : "25%",
									"orderable" : false
								}, {
									"width" : "25%",
									"orderable" : false
								}, ],
								scrollY : 300,
								scrollCollapse : true,
								columnDefs : [ {
									targets : 0,
									render : function(data, type, row) {
										return type === 'display'
												&& data.length > 10 ? data
												.substr(0, 10)
												+ '…' : data;
									}
								} ],
								"bSortClasses" : false
							});
			$('.status').on('click', status);
			$('#datatable4 tbody').on('click', '.retired', retired);
			$('#lessonbtn').on('click', function() {
				$()
			})
			$('.feature-box').mouseover(function() {
				$(this).find('h2').css('color', '#ffffff');
				$(this).find('a').css('color','#000530');
				$(this).css('background-color', '#000530');
			})
			$('.feature-box').mouseout(function() {
				$(this).find('h2').css('color', '#ffffff');
				$(this).find('a').css('color','white');
				$(this).css('background-color', '#111111');
			})
			$('.location').on('click', locationStatus);
			$('.retired').on('click', retired);
			$('#wrapper').animate({
				backgroundColor: "rgba(255, 255, 255, 0.5)"
			}, 1500);
			
			$(".bt-switch").bootstrapSwitch();
			var pub = '公開<i class="icon-unlock" style="width: 15px"></i>';
			var nopub = '非公開<i class="icon-lock3" style="width: 15px"></i>';
			$(".bt-switch").on('switchChange.bootstrapSwitch',
				function(event, state) {
					var publicWordForm = $("#publicbtn");
					var classNum = ${classInfo.num};
					if (state == false) {
						$.ajax({
							url: "changeClassState",
							method: "post",
							data: {"classNum" : classNum,
								"state" : 1},
							success: function(resp) {
								if(resp == 1) {
									console.log("공개 적용 완료");
								}
							}
						});
						
						$(publicWordForm).css({
							'border-radius': '3px',
							'border-bottom': '3px solid rgba(0,0,0,0.15)',
							'background-color': '#FF9800 !important',
							'color': '#fff !important',
							'text-shadow': '1px 1px 1px rgba(0,0,0,0.3)',
							'box-shadow': '0 0 0 rgba(0,0,0,0.2)'
						});
						$(publicWordForm).hover(
								$(publicWordForm).css({
									'background-color': '#ff9800 !important',
									'opacity': '0.9'
								})
						);
						$(publicWordForm).html(pub);
					} else if (state == true) {
						$.ajax({
							url: "changeClassState",
							method: "post",
							data: {"classNum" : classNum,
								"state" : 0},
							success: function(resp) {
								if(resp == 1) {
									console.log("비공개 적용 완료");
								}
							}
						});
						
						$(publicWordForm).css({
							'border-radius': '3px',
						'border-bottom': '3px solid rgba(0,0,0,0.15)',
						'background-color': '#F5F5F5 !important',
						'color': '#444 !important',
						'text-shadow': '1px 1px 1px rgba(0,0,0,0.3)',
						'box-shadow': '0 0 0 rgba(0,0,0,0.2)'
						})
						$(publicWordForm).hover(
								$(publicWordForm).css({
									'background-color': '#F5F5F5 !important',
									'opacity': '0.9'
								})
						)
						$(publicWordForm).html(nopub);
					}
				}
			);
		});
		function locationStatus(){
			var status= $(this).attr('status');
			if(status == 'normal'){
				location.href = "${pageContext.request.contextPath}/boardList?classNum=${classInfo.num}";
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
		
		function status() {
			var num = $(this).attr('num');
			var statusChange = $(this).attr('status');
			var btn = $(this);
			var result = confirm(statusChange + " : 実行しますか?");
			if(result){
			$.ajax({
						url : 'status',
						method : 'POST',
						data : 'num=' + num + '&status=' + statusChange,
						success : function(repo) {
							if(repo == 'student'){
								alert("承認しました。");
								$(btn).parent().parent().parent().remove();
							}
							if(repo == 'withdraw'){
								alert("拒否しました。");
								$(btn).parent().parent().parent().remove();
							}
						},
						error : function(repo) {
							alert("오류 : " + repo)
						}
				});
			} else {
				return false;
			}
		}
		
		function retired(){
			var num = $(this).attr('num');
			var btn = $(this);
			var result = confirm("強制脱退しますか?");
			if(result){
			$.ajax({
				url : 'retired',
				data : 'num=' + num,
				method : 'POST',
				success : function(repo){
					alert("脱退完了しました。");
					$(btn).parent().parent().parent().remove();
				} 
				,
				error : function(repo) {
					alert("오류 : " + repo)
				}
			})
			} else{
				return false;
			}
		}
		
	</script>
</body>
</html>