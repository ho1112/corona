<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<style type="text/css">
#primary-menu ul li > a {
	display: block;
	line-height: 22px;
	color: white !important;
	font-weight: bold;
	font-size: 13px;
	letter-spacing: 1px;
	text-transform: uppercase;
	font-family: 'Raleway', sans-serif;
}

#primary-menu ul li:hover > a,
#primary-menu ul li.current > a { color: #ff9800 !important; }

@font-face{
 font-family: 'NewGohtic';
 src:url('fonts/NewGothic.ttf');
 font-weight: normal;
 font-style: normal;
}
body {
	font-family: NewGohtic;
}
</style>
</head>
<body class="stretched no-transition">
<div class="body-overlay"></div>
<header id="header" class="full-header" data-sticky-class="not-dark" style="background-color: #000530">

			<div id="header-wrap" class="w3-container" style="padding-left: 0; background-color: #000530">

				<div class="container nomargin nopadding">

					<div id="primary-menu-trigger"><i class="icon-reorder"></i></div>

					<!-- Logo
					============================================= -->
					<div id="logo" style="padding-bottom: 0.11cm; padding-left: 0.52cm; padding-right: 0.52cm; background-color: #000530  /* background:url('images/logoback.jpg') no-repeat; z-index: -1; */">
						<a href="${pageContext.request.contextPath}/afterLoginLocation" class="standard-logo logoChange" style="z-index: 1" data-dark-logo="images/corona3.png"><img class="logoChange" src="images/corona3.png" alt="CodeLecture Logo"></a>
						<a href="${pageContext.request.contextPath}/afterLoginLocation" class="retina-logo logoChange" style="z-index: 1" data-dark-logo="images/corona3.png"><img class="logoChange" src="images/corona3.png" alt="CodeLecture Logo"></a>
					</div><!-- #logo end -->

					<!-- Primary Navigation
					============================================= -->
					<nav id="primary-menu" style="background-color: #000530" >
						
						<ul class="menu">
							<li><a href="${pageContext.request.contextPath}/afterLoginLocation" style="font-size: 20px !important; padding-bottom: 15px;"><div><i class="icon-home2 topmenubtn" style="font-size: 15px !important; "></i>Home</div></a></li>
							<li><a href="${pageContext.request.contextPath}/createClassLocation" style="font-size: 20px !important; padding-bottom: 15px;"><div><i class="icon-pencil2 topmenubtn" style="font-size: 15px !important;"></i>クラス生成</div></a></li>
							<li><a href="${pageContext.request.contextPath}/searchLocation" style="font-size: 20px !important; padding-bottom: 15px;"><div><i class="icon-search3 topmenubtn" style="font-size: 15px !important;"></i>クラス検索</div></a></li>
						</ul>

						<!-- Top Search
						============================================= -->
<!-- 						<div id="top-search"> -->
<!-- 							<a href="#" id="top-search-trigger"><i class="icon-search3"></i><i class="icon-line-cross"></i></a> -->
<!-- 							<form action="search.html" method="get"> -->
<!-- 								<input type="text" name="q" class="form-control" value="" placeholder="Type &amp; Hit Enter.."> -->
<!-- 							</form> -->
<!-- 						</div> #top-search end -->

					</nav><!-- #primary-menu end -->

				</div>

			</div>

		</header><!-- #header end -->
		<script type="text/javascript" src="js/jquery.js"></script>
		<script>
		$(function() {
			$('.logoChange').mouseover(function() {
				$(this).attr("data-dark-logo","images/corona3Change.png");
				$(this).attr("src", "images/corona3Change.png");
			});
			$('.logoChange').mouseout(function() {
				$(this).attr("data-dark-logo","images/corona3.png");
				$(this).attr("src", "images/corona3.png");
			})
		});
		</script>
</body>
</html>