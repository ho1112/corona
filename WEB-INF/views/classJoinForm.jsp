<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!-- / -->
	
	<link rel="stylesheet" href="css/dark.css" type="text/css" />
	<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
	<link rel="stylesheet" href="css/animate.css" type="text/css" />
	<link rel="stylesheet" href="css/et-line.css" type="text/css" />
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
	
	<link rel="stylesheet" href="css/fonts.css" type="text/css" />
	
	<!-- Bootstrap Switch CSS -->
	<link rel="stylesheet" href="css/components/bs-switches.css" type="text/css" />
	
	<!-- Date & Time Picker CSS -->
	<link rel="stylesheet" href="css/components/timepicker.css" type="text/css" />
	<link rel="stylesheet" href="css/components/daterangepicker.css" type="text/css" />
	
	<!-- Radio Checkbox Plugin -->
	
	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
<title>Insert title here</title>
<style>
#editor {
    clear: left;
  margin-right: 10px;
  padding: 5px;
  float: left;
  border-width: 1px;
  border-color: #7f7f7f;
  border-style: solid;
  border-radius: 10px;
}
</style>
</head>
<body class="stretched">
<%@ include file="topMenu.jsp" %>
	<%@ include file="sidebar.jsp" %>
	<div id="wrapper" class="clearfix">
	
	<div class="body-overlay"></div>

		<section id="page-title">

			<div class="container center clearfix">
				<h1>Create Home Work</h1>
			</div>

		</section>
		<section id="content">
			<div class="content-wrap" style="padding-top: 10px;">
				<div class="container clearfix">
					<form action="#" method="post" class="nobottommargin">
						<div class="input-daterange travel-date-group bottommargin-sm">
							<div class="col_full" >
							<i class="i-rounded i-light icon-edit"></i><h2>Javaクラス名</h2>
							<div class="col-md-10"><input type="text" type="text" id="class-form-name" name="class-form-name"
										value="" class="form-control"></div>
							<div class="col-md-2"><i class="i-circled i-light i-small icon-ok"></i></div>
							</div>
							<div class="line topmargin-sm bottommargin-sm"></div>
							<div class="col_full">
									<i class="i-rounded i-light icon-calendar"></i><h2>締め切り</h2>
							</div>
							<div class="row">
								<div class="clear"></div>
								<div class="col-sm-6 bottommargin-sm">
									<div class="datetimepicker2"></div>
								</div>
							</div>
							<div class="line topmargin-sm bottommargin-sm"></div>
							<div class="col_full " >
							<i class="i-rounded i-light icon-edit"></i><h2>課題内容</h2>
							<div class="col-md-10"><textarea class="form-control" rows="5" id="comment"></textarea>
							<div class="col_last"><i class="i-circled i-light i-small icon-ok"></i></div>
							</div>
							<div class="line topmargin-sm bottommargin-sm"></div>
							</div>
							<div class="col_full">
							<i class="i-rounded i-light icon-laptop"></i><h2>エディター</h2>&nbsp<a href="#" class="button button-3d button-rounded button-green"><i class="icon-line-file"></i>クラス名にエディター追加</a>
							<a href="#" class="button button-3d button-rounded button-red"><i class="icon-line-paper"></i>メイン追加</a>
							<!-- Editor 여기다가 넣으세요. -->
							<div id="editor" class="col_full">
							
							</div>
							</div>
							<div class="line topmargin-sm bottommargin-sm"></div>
							<div class="col_full">
								<div class="center">
																	<button type="submit" class="button button-xlarge button-dark button-rounded tright">作成<i class="icon-circle-arrow-right"></i></button>
								&nbsp<button type="reset" class="button button-xlarge button-dark button-rounded tright">リセット<i class="icon-line-cross"></i></button>
								</div>
							</div>
						</div>
					</form>
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
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/plugins.js"></script>
	
		<!-- Date & Time Picker JS -->
	<script type="text/javascript" src="js/components/moment.js"></script>
	<script type="text/javascript" src="js/components/timepicker.js"></script>

	<!-- Include Date Range Picker -->
	<script type="text/javascript" src="js/components/daterangepicker.js"></script>
	
	<script type="text/javascript" src="js/components/bs-switches.js"></script>
	<script type="text/javascript" src="js/functions.js"></script>
	<script>
	
	
	$('.datetimepicker2').datetimepicker({
		inline: true,
		sideBySide: true
	});
	
	
	</script>
</body>
</html>