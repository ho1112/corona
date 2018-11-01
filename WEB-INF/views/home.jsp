<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
	
	<canvas id="c" style="position: absolute; z-index: 0"></canvas>
	<link rel="stylesheet" type="text/css" href="css/binary.css" media="screen" />
	<script type="text/javascript" src="js/binary.js"></script>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
	<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700|Roboto:300,400,500,700" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="resources/style.css" type="text/css" />

	<!-- One Page Module Specific Stylesheet -->
	<link rel="stylesheet" href="css/onepage.css" type="text/css" />
	<!-- / -->
	
	<link rel="stylesheet" href="css/dark.css" type="text/css" />
	<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
	<link rel="stylesheet" href="css/et-line.css" type="text/css" />
	<link rel="stylesheet" href="css/animate.css" type="text/css" />
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />

	<link rel="stylesheet" href="css/fonts.css" type="text/css" />
	<!-- Bootstrap File Upload CSS -->
	<link rel="stylesheet" href="css/components/bs-filestyle.css" type="text/css" />
	
	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	
	<meta name="viewport" content="width=device-width, initial-scale=1" />


	<!-- Document Title
	============================================= -->
	<title>Corona</title>
	<style type="text/css">
	.button {
	color: #FFF;
	}
	.text-stroke {
    color: #fff;
    text-shadow:
    -1px -1px 0 #ff9800,
    1px -1px 0 #ff9800,
    -1px 1px 0 #ff9800,
    1px 1px 0 #ff9800;  
}
	</style>
	
</head>

<body class="stretched">
	<div class="body-overlay"></div>
	<!--  -->
	<div id="side-panel" class="dark">
		<div id="side-panel-trigger-close" class="side-panel-trigger"><a href="#"><i class="icon-line-cross"></i></a></div>
		<div class="side-panel-wrap">
			<div class="widget clearfix" id="panal">
			</div>
		</div>
	</div>
	
	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">

		<!-- Header
		============================================= -->
		<header id="header" class="full-header static-sticky" data-sticky-offset="0">
		
			<div id="header-wrap">
				<div class="container clearfix">
					
					<!-- Logo
					============================================= -->
					<div id="logo">
						<p class="logo" style="padding-top: 15px">Corona</p>
					</div><!-- #logo end -->

					<!-- Primary Navigation
					============================================= -->
					<nav id="primary-menu" class="">
						<ul class="one-page-menu" data-easing="easeInOutExpo" data-speed="1250" data-offset="65">
							<li><a href="#" id="about" class="side-panel-trigger">About</a></li>
							<li><a href="#" id="worker" class="side-panel-trigger">Worker</a></li>
							
						</ul>
					</nav><!-- #primary-menu end -->
					
					<div id="primary-menu-trigger"><i class="icon-reorder"></i></div>
				</div>
			</div>
		</header>
		<!-- Slider
		============================================= -->
		<section id="slider" class="page-title-parallax page-title-dark page-title-video">
		
			<div class="section dark nomargin noborder ohidden content-wrap" style="padding: 120px 0;">
				<div class="video-wrap" style="z-index: 0">
				<video poster="images/videos/explore.jpg" preload="auto" loop autoplay muted>
					<source src='images/videos/corona2.webm' type='video/mp4' />
				</video>
				<div class="video-overlay"></div>
			</div>
				<div class="container center clearfix"style="width: 1023px; height: 310px;">
					<div class="emphasis-title">
						<span class="before-heading opm-medium t300 uppercase font-primary" style="color: #ff9800; font-weight: bold !important;">We are</span>
						<h1>
							<span class="text-rotater nocolor" data-separator="|" data-rotate="fadeInLeft" data-speed="6000">
								<span class="t-rotate t700 font-body opm-medium-word text-stroke">Corona|Eclipse|JAVA</span>
							</span>
						</h1>
					</div>
					<div class="tright center">
						<a href="#modal-register-form" class="button button-border button-light button-circle t400" data-lightbox="inline">JOIN</a>
						<a href="#modal-login-form" class="button button-border button-light button-circle t400" data-lightbox="inline">LOGIN</a>

					</div>
					<div class="modal1 mfp-hide" id="modal-register-form">
						<div class="block divcenter" style="padding: 30px; background-color: #FFF; max-width: 500px; max-height : 800px">
							<h3>Register for an Account</h3>

							<form id="register-form" name="register-form"
								class="nobottommargin" action="register" method="post" enctype="multipart/form-data">

									<div class="col-md-12 nopadding">
									<label for="register-form-name">ID:</label>
									</div>
									<div class="col-md-9 nopadding">
									<input
										type="text" id="register-form-name" name="id"
										value="" class="form-control" />
									</div>
									<div class="col-md-3"> 
									<input type="button" id="idCheck" class="button button-3d nomargin button-black button-small button-circle t400" value="CHECK">
									<input type="button" style="display: none" id="idcancel" class="button button-3d nomargin button-black button-small button-circle t400" value="CANCEL">
								</div>
								
								<div class="col_full">
									<label for="register-form-password">Choose Password:</label> <input
										type="password" id="register-form-password"
										name="password" value="" class="form-control" />
								</div>

								<div class="col_full">
									<label for="register-form-repassword">Re-enter
										Password:</label> <input type="password" id="register-form-repassword"
										name="repassword" value="" class="form-control" />
								</div>
								
								<div class="col-md-12 nopadding">
									<label for="register-form-email">Email Address:</label> 
								</div>
								<div class="col-md-9 nopadding">
								<input type="text" id="register-form-email" name="email" value="" class="form-control" />
								</div>
								<div class="col-md-3"> 
									<input type="button" id="emailCheck" class="button button-3d nomargin button-black button-small button-circle t400" value="CHECK">
									<input type="button" style="display: none" id="emailcancel" class="button button-3d nomargin button-black button-small button-circle t400" value="CANCEL">
								</div>

								<div class="col_full">
									<label for="register-form-username">Choose a Username:</label>
									<input type="text" id="register-form-username"
										name="name" value="" class="form-control" />
								</div>
								<div class="col_full">
									<label for="register-form-img">Choose a Img:</label>
									<input id="input-2" name="upload" type="file" class="file" data-show-preview="false" >
								</div>

								<div class="col_full nobottommargin">
								<button type="button" disabled="disabled" id="no" class="button button-rounded button-reveal button-border button-red tright nomargin request"><i class="icon-lock3" style="width: 20px"></i>未記入</button>
								<button type="button" style="display: none;" id="register" class="button button-rounded button-reveal button-border button-blue tright nomargin request"><i class="icon-angle-right" style="width: 20px"></i>加入申請</button>
								</div>

							</form>
						</div>
					</div>

					<!-- login -->
					<div class="modal1 mfp-hide" id="modal-login-form">
						<div class="block divcenter col-padding" style="background-color: #FFF; max-width: 400px;">
							<h4 class="uppercase ls1">Login to your Account</h4>
							<form id="login" action="login" class="nobottommargin clearfix" style="max-width: 300px;" method="POST">
								<div class="col_full">
									<label for="" class="capitalize t600">ID:</label>
									<input type="text" id="template-op-form-id" name="id" value="" class="sm-form-control" />
								</div>
								<div class="col_full">
									<label for="" class="capitalize t600">Password:</label>
									<input type="password" id="template-op-form-password" name="password" value="" class="sm-form-control" />
								</div>
								<div class="col_full nobottommargin">
									<div class="row">
										<div class="col-xs-6">
											<input type="button" id="loginbtn" class="button button-rounded button-reveal button-light  button-small button-black nomargin" value="login">
										</div>
										<div class="col-xs-6">
<!-- 											<p class="nobottommargin tright"><small class="t300"><em><a href="#">Forgot Password?</a></em></small></p> -->
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					
										
				</div>
			</div>
		</section><!-- #slider end -->

		<!-- Footer
		============================================= -->
		<footer id="footer" class="dark noborder" style="padding-top: 55px;">

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
	
	<!-- Bootstrap File Upload Plugin -->
	<script type="text/javascript" src="js/components/bs-filestyle.js"></script>
	<!-- Footer Scripts
	============================================= -->
	<script type="text/javascript" src="js/functions.js"></script>
	<script>
	$(function(){
		$(function() {
			$("#register-form").keydown(function(evt) {
				if (evt.keyCode == 13)
					return false;
			});
			$("#register-form").keyup(function(evt) {
				if($("#register-form-name").attr('readonly') == 'readonly' 
						&& $("#register-form-email").attr('readonly') == 'readonly'
						&& $.trim($("#register-form-password").val()) != ""
						&& $.trim($("#register-form-repassword").val())!= "" 
						&& $.trim($("#register-form-username").val()) != ""
						&& $.trim($("#register-form-password").val()) == $.trim($("#register-form-repassword").val())){
					$("#register").css('display','inline');
					$("#no").css('display','none');
				} else{
					$("#register").css('display','none');
					$("#no").css('display','inline');
				} 
			});
		});
		$('#login').keydown(function(evt){
			if(evt.keyCode == 13){
				$('#loginbtn').trigger('click');
			}
		});
	/* about 내용 */
	var about = '<div id="content">about</div>';
	
	/* worker 내용 */
	var worker = '<div id="content">worker</div>';
	
			$('#about').on('click', function() {
				$('#content').remove();
				$('#panal').append(about);
			});
			$('#worker').on('click', function() {
				$('#content').remove();
				$('#panal').append(worker);
			});
			
			$('#loginbtn').on('click', function() {
				var id = $("#template-op-form-id").val();
				var password= $("#template-op-form-password").val();
				
				$.ajax({
					url : "login"
					, method : "POST"
					, data : "id=" + id + "&password=" + password
					, success : function(repo) {
						if(repo == 0){
							alert("会員IDと暗証番号を確認してください。");
						}
						if(repo == 1){
							alert("ログイン成功しました。");
							location.href = "${pageContext.request.contextPath}/afterLoginLocation";
						}
					}
					, error : function(repo) {
						alert("오류: " + repo);
					}
				});
			});
			
			
			$("#register").on('click',check);             
			$("#idCheck").on('click',function() {      	
				if($.trim($("#register-form-name").val())=="") {
					   alert("IDを入力して下さい。");
					   
					   $("#register-form-name").val("").focus();
					   $("")
					   return false;
					} 
				if (($.trim($("#register-form-name").val()).length < 6)
						|| ($.trim($("#register-form-name").val()).length > 21)) {
					alert("IDは6~20文字です。");
					return false;
				}
				if (($.trim($("#register-form-name").val()).charAt(0) < 'a')
						|| ($.trim($("#register-form-name").val()).charAt(0) > 'z')) {
					alert("IDの最初の文字は英語の小文字ではなければなりません。");
					return false;
				}
				var check_id = $("#register-form-name").val();
				$.ajax({
					method:"POST",
					url:"idcheck",
					data:"check_id="+check_id,
					success:function(data){
						if(data == 'Y'){
							if(confirm("使用できるIDです。使用しますか？ "))
							 {
								$("#register-form-name").attr('readonly',true);
								$("#idCheck").css('display','none');
								$("#idcancel").css('display','inline');
								if($("#register-form-name").attr('readonly') == 'readonly' 
									&& $("#register-form-email").attr('readonly') == 'readonly'
									&& $.trim($("#register-form-password").val()) != ""
									&& $.trim($("#register-form-repassword").val())!= "" 
									&& $.trim($("#register-form-username").val()) != ""
									&& $.trim($("#register-form-password").val()) == $.trim($("#register-form-repassword").val())){
								$("#register").css('display','inline');
								$("#no").css('display','none');
							} else{
								$("#register").css('display','none');
								$("#no").css('display','inline');
							} 
							 }
							 else
							 {	
								 $("#register-form-name").val("").focus();
								 return false;
							 }
						} else {
							alert("もう存在するIDです。");
							 $("#register-form-name").val("").focus();
							 return false;
						}
					},
					error:function(){
						alert("IDの中腹検査に問題が発生しました。もう一度、確認してください。");
					}
					
				});
			});
			
			$("#idcancel").on('click', function() {
				$("#register-form-name").attr('readonly',false);
				$("#idCheck").css('display','inline');
				$("#idcancel").css('display','none');
				$("#register-form-name").val("").focus();
			})
			
			$("#emailCheck").on('click',function() {      	
				if ($.trim($("#register-form-email").val()) == "") {
					alert("E-Mailを入力して下さい。");

					$("#register-form-email").val("").focus();
					return false;
				}
				if (($.trim($("#register-form-email").val()).match(/[@]/g) == null)) {
					alert("正しいE-Mailを入力してください。");

					return false;
				}
				
				var check_email = $("#register-form-email").val();
				$.ajax({
					method:"POST",
					url:"emailcheck",
					data:"check_email="+check_email,
					success:function(data){
						if(data == 'Y'){
							if(confirm("使用できるE-Mailです。使用しますか？"))
							 {
								$("#register-form-email").attr('readonly',true);
								$("#emailCheck").css('display','none');
								$("#emailcancel").css('display','inline');
								if($("#register-form-name").attr('readonly') == 'readonly' 
									&& $("#register-form-email").attr('readonly') == 'readonly'
									&& $.trim($("#register-form-password").val()) != ""
									&& $.trim($("#register-form-repassword").val())!= "" 
									&& $.trim($("#register-form-username").val()) != ""
									&& $.trim($("#register-form-password").val()) == $.trim($("#register-form-repassword").val())){
								$("#register").css('display','inline');
								$("#no").css('display','none');
							} else{
								$("#register").css('display','none');
								$("#no").css('display','inline');
							} 
							 }
							 else
							 {	
								 $("#register-form-email").val("").focus();
								 return false;
							 }
						} else {
							alert("もう存在するE-Mailです。");
							 $("#register-form-email").val("").focus();
							 return false;
						}
					},
					error:function(){
						alert("E-Mailの中腹検査に問題が発生しました。もう一度、確認してください。");
					}
					
				});
			});
			$("#emailcancel").on('click', function() {
				$("#register-form-email").attr('readonly',false);
				$("#emailCheck").css('display','inline');
				$("#emailcancel").css('display','none');
				$("#register-form-email").val("").focus();
			})
		});
	//유효성 검사
	function check() {
			if($.trim($("#register-form-name").val())=="") {
			   alert("IDを入力してください。");
			   
			   $("#register-form-name").val("").focus();
			   $("")
			   return false;
			} 
			if (($.trim($("#register-form-name").val()).length < 6)
				|| ($.trim($("#register-form-name").val()).length > 21)) {
			alert("IDは6~20文字です。");
			return false;
			}
			if (($.trim($("#register-form-name").val()).charAt(0) < 'a')
				|| ($.trim($("#register-form-name").val()).charAt(0) > 'z')) {
			alert("IDの最初の文字は英語の小文字ではなければなりません。");
			return false;
			}
		

			//아이디를 입력하지 않았다면
			//비밀번호를 입력하지 않았다면
			if ($.trim($("#register-form-password").val()) == "") {
				alert("暗証番号を入力してください。");

				$("#register-form-password").val("").focus();

				return false;

			}

			//비밀번호 길이 유효성 검사
			if (($.trim($("#register-form-password").val()).length < 6)
					|| ($.trim($("#register-form-password").val()).length > 21)) {
				alert("暗証番号は6~20字です。");

				return false;
			}
			if (($.trim($("#register-form-password").val())) != ($.trim($(
					"#register-form-repassword").val()))) {
				alert("暗証番号の確認と合っておりません。");

				return false;
			}

			//이메일을 입력하지 않았다면
			if ($.trim($("#register-form-email").val()) == "") {
				alert("E-Mailを入力して下さい。");

				$("#register-form-email").val("").focus();

				return false;

			}

			//이메일 유효성 검사 (@이 들어가 있는지 검사)
			if (($.trim($("#register-form-email").val()).match(/[@]/g) == null)) {
				alert("正しいE-Mailを入力してください。");

				return false;
			}
			
			//이름을 입력하지 않았다면
			if ($.trim($("#register-form-username").val()) == "") {
				alert("名前を入力してください。");

				$("#register-form-username").val("").focus();

				return false;
			}
			
			$('#register-form').submit();
		}
	
	var c = document.getElementById("c");
	var ctx = c.getContext("2d");

	//making the canvas full screen
	c.height = window.innerHeight;
	c.width = window.innerWidth;

	//binary characters - taken from the unicode charset
	var binary = "01";
	//converting the string into an array of single characters
	binary = binary.split("");

	var font_size = 10;
	var columns = c.width/font_size; 
	var drops = [];
	
	//x below is the x coordinate
	//1 = y co-ordinate of the drop(same for every drop initially)
	for(var x = 0; x < columns; x++)
		drops[x] = 1; 

	//drawing the characters
	function draw()
	{
		//Black BG for the canvas
		//translucent BG to show trail
		ctx.fillStyle = "rgba(0, 0, 0, 0.05)";
		ctx.fillRect(0, 0, c.width, c.height);
		
		ctx.fillStyle = "#0F0"; //green text
		ctx.font = font_size + "px arial";
		//looping over drops
		for(var i = 0; i < drops.length; i++)
		{
			//a random character to print
			var text = binary[Math.floor(Math.random()*binary.length)];
			//x = i*font_size, y = value of drops[i]*font_size
			ctx.fillText(text, i*font_size, drops[i]*font_size);

			//sending the drop back to the top randomly after it has crossed the screen
			//adding a randomness to the reset to make the drops scattered on the Y axis
			if(drops[i]*font_size > c.height && Math.random() > 0.975)
				drops[i] = 0;
			
			//incrementing Y coordinate
			drops[i]++;
		}
	}

	setInterval(draw, 33);

	</script>

</body>
</html>
