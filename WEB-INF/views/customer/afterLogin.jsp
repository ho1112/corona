<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<link href="http://maps.googleapis.com/maps/api/geocode/outputFormat?parameters">
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
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
	
	<!-- Bootstrap File Upload CSS -->
	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	<link rel="stylesheet" href="css/customHeader.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<style type="text/css">
	#side-panel-button {
		z-index: 1;
		position: fixed;
		top: 110px;
		left: 30px;
	}

#vertical-nav {
	position: fixed;
	top: 0;
	left: 0;
	width: 240px;
	z-index: 99;
	background: #F9F9F9;
	border-right: 1px solid #EEE;
	height: 100%;
	overflow: auto;
	padding: 140px 0 40px;
	-webkit-transition: padding .4s ease;
	-o-transition: padding .4s ease;
	transition: padding .4s ease;
}

.sticky-header + #vertical-nav { padding-top: 100px; }

#vertical-nav nav ul {
	margin-bottom: 0;
	list-style: none;
}

#vertical-nav nav li a {
	display: block;
	padding: 10px 30px;
	color: #333;
	text-transform: uppercase;
	font-size: 13px;
	font-weight: 700;
	letter-spacing: 2px;
	font-family: 'Raleway', sans-serif;
}

#vertical-nav nav li i {
	font-size: 14px;
	width: 16px;
	text-align: center;
}

#vertical-nav nav li i:not(.icon-angle-down) {
	margin-right: 8px;
	position: relative;
	top: 1px;
}

#vertical-nav nav li a i.icon-angle-down {
	width: auto;
	margin-left: 5px;
}

#vertical-nav nav li:hover > a,
#vertical-nav nav li.current > a,
#vertical-nav nav li.active > a {
	background-color: #FFF;
	color: #1ABC9C;
}

#vertical-nav nav ul ul { display: none; }

#vertical-nav nav ul ul a {
	font-size: 12px;
	letter-spacing: 1px;
	padding-left: 45px;
	font-family: 'Lato', sans-serif;
}

#vertical-nav nav ul ul a i.icon-angle-down { font-size: 12px; }

#vertical-nav nav ul ul ul a { padding-left: 60px; }
#vertical-nav nav ul ul ul ul a { padding-left: 75px; }

@media (min-width: 992px) {

	#header { z-index: 199; }

	#page-title,
	#content,
	#footer { margin-left: 240px; }

	#page-title .container,
	#content .container,
	#footer .container {
		width: auto;
		padding: 0 60px;
	}

	#vertical-nav .container {
		width: 100%;
		padding: 0;
	}

	#page-title .breadcrumb { right: 60px !important; }

}


@media (max-width: 991px) {

	#vertical-nav {
		position: relative;
		width: 100%;
		z-index: auto;
		border: none;
		border-bottom: 1px solid #EEE;
		height: auto;
		padding: 0;
	}

	#vertical-nav .container { padding: 10px 20px; }

	#vertical-nav nav li a { padding: 10px 0; }

	#vertical-nav nav li:hover > a,
	#vertical-nav nav li.current > a,
	#vertical-nav nav li.active > a { background-color: transparent; }

	#vertical-nav nav ul ul a { padding-left: 15px; }
	#vertical-nav nav ul ul ul a { padding-left: 30px; }
	#vertical-nav nav ul ul ul ul a { padding-left: 45px; }

}

.olColor {
  color: #ccc;
  list-style-type: none;
}
 
.liFont {
  position: relative;
  font: bold italic 45px/1.5 Helvetica, Verdana, sans-serif;
  margin-bottom: 20px;
}
 
.pFont {
  font: 14px/1.5 Helvetica, sans-serif;
  padding-left: 60px;
  color: #555;
}
 
.spanFont {
  position: absolute;
  font: 0.8em Helvetica, sans-serif;
  font-style: italic;
}
</style>
	
	<!-- Document Title
	============================================= -->
	<title>Main Page</title>
	<style>
	#changeImg{
		display: none;
	}
	
	</style>
</head>
<%@ include file="../topMenu.jsp" %>
	<%@ include file="../sidebar.jsp" %>
<body class="stretched side-panel-left">
	<div class="body-overlay"></div>
	
	

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">
	
		<div id="side-panel-button" class="side-panel-trigger"><a href="#"><i class="i-rounded i-bordered icon-user"></i></a></div>
	


		<!-- Page Title
		============================================= -->
		<section id="page-title" class="page-title-mini">

			<div class="container clearfix">
				<h1>Main Page</h1>
				<span>Main Page</span>
				 <ol class="breadcrumb">
               <li><a href="#content">Skills</a></li>
               <li><a href="#manual">Manual</a></li>
               <li><a href="#location">Location</a></li>
            </ol>

			</div>

		</section><!-- #page-title end -->

		<!-- Content
		============================================= -->
		<section id="slider" class="slider-parallax swiper_wrapper full-screen clearfix">
			<div class="slider-parallax-inner">

				<div class="swiper-container swiper-parent">
					<div class="swiper-wrapper">
						<div class="swiper-slide dark" style="background-image: url('images/after1.jpg');">
							<div class="container clearfix" style="margin-left: 320px;">
								<div class="slider-caption slider-caption-center">
									<h2 data-caption-animate="fadeInUp">Welcome to Corona</h2>
									<p data-caption-animate="fadeInUp" data-caption-delay="200">Eclipseを利用したPure Javaの授業支援のサービス。<br>先生のEclipseをリアルタイムで確認して<br>学生のウェブページに転送します。</p>
								</div>
							</div>
						</div>
						
					</div>
				</div>

				<a href="#" data-scrollto="#content" data-offset="20" class="dark one-page-arrow" style="margin-left: 110px;"><i class="icon-angle-down infinite animated fadeInDown"></i></a>

			</div>
		</section>
		<section id="content">

			<div class="content-wrap"  style="padding-top: 20px;">

				<div class="container clearfix">

					<div class="row topmargin-lg bottommargin-sm">

						<div class="heading-block center" style="margin-bottom: 0px;">
							<h2>私たちが持っている機能は?</h2>
							<span class="divcenter">Coronaは先生と学生の便宜を図るために <br>画面の転送以外にもいくつかの主要な機能を提供しております。</span>
						</div>

						<div class="col-md-4 col-sm-6 bottommargin">

							<div class="feature-box fbox-right topmargin"  data-animate="fadeIn">
								<div class="fbox-icon" >
									<a href="#"><i class="icon-line-heart" style="background-color: #000530;"></i></a>
								</div>
								<h3>'私たち'だけのクラス機能</h3>
								<p>クラス生成の時、公開クラスと <br>非公開クラスを設定できます。</p>
							</div>

							<div class="feature-box fbox-right topmargin" data-animate="fadeIn" data-delay="200">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-paper" style="background-color: #ff9800;"></i></a>
								</div>
								<h3>課題の生成および課題の確認機能</h3>
								<p>課題を生成して学生たちに提出し、学生が<br>&nbsp;提出したらコードの確認ができます。</p>
							</div>

						</div>

						<div class="col-md-4 hidden-sm bottommargin center" style="margin-top: 40px; border-radius: 50%;">
							<img src="images/after3.jpg" height="250px;" alt="iphone 2" style="border-radius: 50%;">
						</div>

						<div class="col-md-4 col-sm-6 bottommargin">

							<div class="feature-box topmargin" data-animate="fadeIn">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-cloud" style="background-color: #ff9800;"></i></a>
								</div>
								<h3>講義のセーブおよび出力の機能</h3>
								<p>講義を動画ではなくてコードでセーブして前の講義を視聴する時、コードをドラッグ＆コピーができます。</p>
							</div>

							<div class="feature-box topmargin" data-animate="fadeIn" data-delay="200">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-check" style="background-color: #000530;"></i></a>
								</div>
								<h3>その他の機能</h3>
								<p>提示版および資料室の機能を通じてコミュニケーションの活用を強化しました。</p>
							</div>

						</div>

					</div>

				</div>
				<div id="manual"></div> <!-- 라벨 영역 -->
				<div class="section  topmargin nobottommargin nobottomborder" style="padding-bottom: 15px; padding-top: 15px;">
					<div class="container clearfix">
						<div class="col_half heading-block center nomargin">
							<h3>先生の使用説明書</h3>
						</div>
						<div class="col_half col_last heading-block center nomargin">
							<h3>学生の使用説明書</h3>
						</div>
					</div>
				</div>
				<div class="row clearfix parallax" style=" background-image: url(images/after6.jpg); background-size: cover; height: 300px;" data-stellar-background-ratio="0.4">
				</div>
				<div class="row clearfix" style="margin-top: 20px;">
				<div class="col-md-6 nopadding">
				 <div class="col_full" style="margin-left: 30px;">
				  <ol class="olColor">
   					 <li class="liFont"><span class="spanFont">1.</span><p class="pFont">jarファイルをダウンロードの後に、ユーザが持っている「Eclipse/plugins/」のフォルダに　<br>jarファイルを入れてください。</p></li>
    				 <li class="liFont"><span class="spanFont">2.</span><p class="pFont">クラスのページに入場して「講義スタート」のボタンを押してください。</p>
    				 <li class="liFont"><span class="spanFont">3.</span><p class="pFont">Eclipseの上段のメニューの中のClass Readyに存在するStartボタンを押して講義を<br>始めてください。</p>
    				 <li class="liFont"><span class="spanFont">4.</span><p class="pFont">講義が終わる時、上段のメニューの中のClass Readyに存在する <br>Endボタンを押して講義を終了してください。</p>
    				 </ol>
 				 </div> 
					</div>
					<div class="col-md-6 nopadding">
					<div class="col_full" style="margin-left: 30px;">
				  <ol class="olColor">
   					 <li class="liFont"><span class="spanFont">1.</span><p class="pFont">jarファイルをダウンロードの後に、ユーザが持っている「Eclipse/plugins/」のフォルダに　<br>jarファイルを入れてください。</p></li>
    				 <li class="liFont"><span class="spanFont">2.</span><p class="pFont">クラスページに入場して「講義参加」のボタンを押して講義に参加してください。</p>
    				 </ol>
 				 </div>
					</div>
					</div>
				<div class="col_full center nomargin">
						<div class="col_half">
						 <button type="button" id="teacherDownload" class="btn btn-default btn-lg button button-xlarge button-circle button-3d"><i class="fa fa-circle-o-notch fa-spin"></i>Teacher Plug-In Download!</button>
						</div>
						<div class="col_half col_last">
						 <button type="button" id="studentDownload" class="btn btn-default btn-lg button button-xlarge button-circle button-3d"><i class="fa fa-circle-o-notch fa-spin"></i>Student Plug-In Download!</button>
						</div>
					</div>	
				
			</div>
			<div id="location" ></div> <!-- 라벨 영역 -->
				<div class="section topmargin nobottommargin nobottomborder" style="padding-bottom: 15px; padding-top: 15px;">
					<div class="container clearfix">
						<div class="heading-block center nomargin">
							<h3>アクセスガイド</h3>
						</div>
					</div>
				</div>
				<div class="row clearfix parallax" style=" background-image: url(images/after8.jpg); background-size: cover; height: 800px;" data-stellar-background-ratio="0.4">
				<h2 style="background-color: white; margin-bottom: 0; margin-top: 120px;">&nbsp;</h2>
				<div id="google-map5" style="height: 400px;" class="gmap"></div>
				<div class="col_full" style="background-color: white;">
				<h4 style="margin-top: 0; margin-left: 30px;">Address</h4>
				<blockquote style="margin-left: 30px;">
							<p>COEX Convention Center Grand Ball Room 513 Yeongdong-daero, Samseong 1(il)-dong, Gangnam-gu, Seoul, Tel : 02-6002-2005</p>
							<footer>Poscode : 06164, CEO : LEE</footer>
				</blockquote>
				</div>
				</div>
				
		</section><!-- #content end -->

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
	<script type="text/javascript" src="js/jquery.vmap.js"></script>
	<script type="text/javascript" src="js/vmap/jquery.vmap.world.js"></script>
	<script type="text/javascript" src="js/vmap/jquery.vmap.usa.js"></script>
	<script type="text/javascript" src="js/vmap/jquery.vmap.europe.js"></script>
	<script type="text/javascript" src="js/vmap/jquery.vmap.germany.js"></script>
	<script type="text/javascript" src="js/vmap/jquery.vmap.sampledata.js"></script>
	<script type="text/javascript" src="https://maps.google.com/maps/api/js?key=AIzaSyDMxJ92oBkSnVNHFX3R8XhtYQPEgk1_IiI"></script>
	<script type="text/javascript" src="js/jquery.gmap.js"></script>
	<!-- Footer Scripts
	============================================= -->
	<script type="text/javascript" src="js/functions.js"></script>
	<script>
		
	
	$('#google-map5').gMap({
		 address: 'Yeongdong-daero, Samseong 1(il)-dong, Gangnam-gu, Seoul,Republic Of Korea',
		 maptype: 'ROADMAP',
		 zoom: 13,
		 markers: [
			{	
				latitude: 37.5120661,
				longitude: 127.0587000,
				html: "주소 : 513 Yeongdong-daero, Samseong 1(il)-dong, Gangnam-gu, Seoul"
			}
		 ],
		 doubleclickzoom: false,
		 controls: {
			 panControl: true,
			 zoomControl: true,
			 mapTypeControl: false,
			 scaleControl: false,
			 streetViewControl: false,
			 overviewMapControl: false
		}
	});

		function findLocation( selector, getLatitude, getLongitude ) {
			jQuery(selector).gMap('clearMarkers').gMap('addMarker', {
				latitude: getLatitude,
				longitude: getLongitude,
				content: 'You have selected this Location.',
				popup: true
			}).gMap('centerAt', {
				latitude: getLatitude,
				longitude: getLongitude,
				zoom: 12
			});
		}


		jQuery(window).load( function(){
			$('#teacherDownload').on('click', function() {
				window.open("https://drive.google.com/open?id=0Bw2ah5jN6fZ9SDJxZ3V3YWc1M2M");
			});
			$('#studentDownload').on('click', function() {
				window.open("https://drive.google.com/file/d/0Bw2ah5jN6fZ9cHI5dDZYRkdIaDA/view?usp=sharing");
			});
			var t = setTimeout( function(){
				if(navigator.geolocation) {
					navigator.geolocation.getCurrentPosition(function(position) {
						jQuery('#google-map-custom').gMap('addMarker', {
							latitude: position.coords.latitude,
							longitude: position.coords.longitude,
							content: 'You are here!',
							popup: true
						}).gMap('centerAt', {
							latitude: position.coords.latitude,
							longitude: position.coords.longitude,
							zoom: 14
						});
					}, function() {
						alert('Couldn\'t find you :(');
					});
				}
			}, 200 );

		});

		jQuery('#location-submit').click( function(e){

			var locationFinder = jQuery(this).parent().parent().find('#location-input').val();
			var locationFinderIcon = jQuery(this).parent().parent().find('.input-group-addon').find('i');

			jQuery('#location-coordinates').fadeOut();

			if( locationFinder != '' ){
				locationFinderIcon.removeClass('icon-map-marker').addClass('icon-line-loader icon-spin');

				jQuery.ajax({
					url: 'http://maps.google.com/maps/api/geocode/json?address=' + encodeURI(locationFinder),
					//force to handle it as text
					dataType: "text",
					success: function(data) {
						var json = jQuery.parseJSON(data);
						findLocation( '#google-map-custom', json.results[0].geometry.location.lat, json.results[0].geometry.location.lng );
						jQuery('#latitude-text').html('<strong>Latitude:</strong> ' + json.results[0].geometry.location.lat);
						jQuery('#longitude-text').html('<strong>Longitude:</strong> ' + json.results[0].geometry.location.lng);
						jQuery('#location-coordinates').fadeIn();
						locationFinderIcon.removeClass('icon-line-loader icon-spin').addClass('icon-map-marker');
					}
				});
			} else {
// 				alert('Please enter your Location!');
			}
			e.preventDefault();
		});
	</script>
</body>
</html>