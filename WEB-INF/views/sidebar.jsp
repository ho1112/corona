<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>

<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="resources/style.css" type="text/css" />
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<!-- One Page Module Specific Stylesheet -->
	<link rel="stylesheet" href="css/onepage.css" type="text/css" />
	<!-- / -->
	
	<link rel="stylesheet" href="css/dark.css" type="text/css" />
	<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
	<link rel="stylesheet" href="css/animate.css" type="text/css" />
	<link rel="stylesheet" href="css/et-line.css" type="text/css" />
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
	
	<link rel="stylesheet" href="css/fonts.css" type="text/css" />
	<!-- Bootstrap File Upload CSS -->
	<link rel="stylesheet" href="css/components/bs-filestyle.css" type="text/css" />
	
	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
<style type="text/css">
	#searchIcon:hover {
	background-color: #999999;
	color: #FFF;
	text-shadow: 1px 1px 1px rgba(0,0,0,0.3);
	box-shadow: 0 0 0 rgba(0,0,0,0.2);
	
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
	background-color: #ff9800;
	color: #fff;
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
	#changeImg{
		display: none;
	}
	
	#profileImg{
	  width: 80px;
    height: 80px;
    border-radius: 150px; /* 레이어 반크기만큼 반경을 잡기*/    
    display: table-cell;
    vertical-align: middle;
    color: #ffffff;
    font-weight: bold;
    text-align: center;
	}
	.profile {
  margin: 20px 0;
}

/* Profile sidebar */
.profile-sidebar {
  padding: 20px 0 10px 0;
  background: #fff;
}

.profile-userpic img {
  float: none;
  margin: 0 auto;
  width: 50%;
  height: 50%;
  -webkit-border-radius: 50% !important;
  -moz-border-radius: 50% !important;
  border-radius: 50% !important;
}

.profile-usertitle {
  text-align: center;
  margin-top: 20px;
}

.profile-usertitle-name {
  color: #5a7391;
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 7px;
}

.profile-usertitle-job {
  color: #5b9bd1;
  font-size: 12px;
  font-weight: 600;
  margin-bottom: 15px;
}

.profile-userbuttons {
  text-align: center;
  margin-top: 10px;
}

.profile-userbuttons .btn {
  text-transform: uppercase;
  font-size: 11px;
  font-weight: 600;
  padding: 6px 15px;
  margin-right: 5px;
}

.profile-userbuttons .btn:last-child {
  margin-right: 0px;
}
    
.profile-usermenu {
  margin-top: 30px;
}

.profile-usermenu ul li {
  border-bottom: 1px solid #f0f4f7;
}

.profile-usermenu ul li:last-child {
  border-bottom: none;
}

.profile-usermenu ul li a {
  color: #93a3b5;
  font-size: 14px;
  font-weight: 400;
}

.profile-usermenu ul li a i {
  margin-right: 8px;
  font-size: 14px;
}

.profile-usermenu ul li a:hover {
  background-color: #fafcfd;
  color: #5b9bd1;
}

.profile-usermenu ul li.active {
  border-bottom: none;
}

.profile-usermenu ul li.active a {
  color: #5b9bd1;
  background-color: #f6f9fb;
  border-left: 2px solid #5b9bd1;
  margin-left: -2px;
}

/* Profile Content */
.profile-content {
  padding: 20px;
  background: #fff;
  min-height: 460px;
}
/* .btn { */
/* 	background-color: #ff9800 !important; */
/* 	opacity: 0.9; */
/* } */
.btn.button:hover{
	background-color: #000530 !important;
	color: #FFF;
}
@keyframes fadeIn {
	0% {
		opacity : 0;
	}

	100% {
		opacity : 0.9;
	}
}
</style>
<body class="stretched no-transition">
<div class="body-overlay"></div>
<div id="vertical-nav" class="w3-container" style="padding-top: 70px;">
		
				<div class="modal1 mfp-hide" id="modal-register-form">
						<div class="block divcenter" style="padding: 30px; background-color: #FFF; max-width: 500px; max-height : 800px">
							<h3>My page</h3>

							<form id="register-form" name="register-form"
								class="nobottommargin" action="update" method="post">
									<input id="count" type="hidden" value="0" name="count" enctype='multipart/form-data'>
									<div class="col-md-12 nopadding">
									<label for="register-form-name">ID:</label>
									</div>
									<div class="col-md-12 nopadding">
									<input
										type="text" id="register-form-name" name="id"
										value="${loginId}" class="form-control" readonly="readonly"/>
									</div>
								
								<div class="col_full">
									<label for="register-form-password">Change Password:</label> <input
										type="password" id="register-form-password"
										name="password" value="" class="form-control" />
								</div>

								<div class="col_full">
									<label for="register-form-repassword">Re-enter
										Password:</label> <input type="password" id="register-form-repassword"
										name="repassword" value="" class="form-control" />
								</div>
								
								<div class="col_full">
									<label for="register-form-email">Change Email Address:</label> <input
										type="text" id="register-form-email"
										name="email" value="${email}" class="form-control" readonly="readonly"/>
								</div>

								<div class="col_full">
									<label for="register-form-username">Username:</label>
									<input type="text" id="register-form-username"
										name="name" value="${name}" class="form-control" readonly="readonly" />
								</div>
								<div class="col_full" >
									<div class="col_half" id="originalImg">
									<label for="register-form-img">Img:</label>
									<c:if test="${userImg != null}">
									<a href="imgStatus?imgName=${userImg}">${userImg}</a>
									</c:if>
									<c:if test="${not empty mimetype}">
									<img src ="imgStatus?imgName=${userImg}" style="width: 50px; height: 50px"/>
									</c:if>
									</div>
									<div class="col_half col_last divcenter" id="originalImgBtn">
									<a id="imgbtn" href="#" num="${searchList.num}" class="button button-rounded button-reveal center button-border tright nomargin" style="vertical-align: bottom; filter: alpha(opacity=80);"><i class="icon-angle-right" style="width: 20px"></i>イメージ変化</a>
									</div>
									<div id="changeImg" class="col_full">
									<label for="register-form-img">Choose a Img:</label><input id="input-2" name="upload" type="file" class="file" data-show-preview="false">
									</div>
									<!-- <label for="register-form-img">Change a Img:</label>
									<input id="input-2" name="upload" type="file" class="file" data-show-preview="false" > -->
								</div>

								<div class="col_full nobottommargin">
								<a href="#" disabled="disabled" id="no" class="button button-rounded button-reveal button-border button-red tright nomargin"><i class="icon-lock3" style="width: 20px"></i>修正未記入</a>
								<a href="#" style="display: none;" id="register" class="button button-rounded button-reveal button-border button-orange tright nomargin"><i class="icon-angle-right" style="width: 20px"></i>情報修正</a>
								<a href="#" id="idDelete"  class="button button-rounded button-reveal button-border button-red tright nomargin"><i class="icon-remove-sign" style="width: 20px"></i>脱退</a>
								</div>

							</form>
						</div>
					</div>
			<div id="userPick" class="thumbnail" style="height: 220px; padding: 0;">
				<div class="caption" style="height: 200px;">
				<!-- <div class="col-md-7" style="padding-left: 0;" >
					<img id="profileImg" src="imgStatus" class="alignleft img-circle img-thumbnail notopmargin nobottommargin" alt="Avatar" style="max-width: 84px;">
					</div> -->
					<div class="profile-userpic">
					<img id="profileImg" src="imgStatus?imgName=${userImg}" class="img-responsive alignleft img-circle img-thumbnail notopmargin nobottommargin" alt="Avatar" style="max-width: 84px;">
				</div>
				<div class="profile-usertitle nomargin">
					<div class="profile-usertitle-name">
						${name}
					</div>
					<div class="profile-usertitle-job" style="margin-bottom: 5px;">
						${email}
					</div>
				</div>
					<div class="col_full center" style="margin-bottom: 0; margin-top: 0;">
					<a href="#modal-register-form" id="myPagebtn"
						class="btn button button-3d button-reveal button-mini button-rounded tright" role="button" data-lightbox="inline" style=" padding-left: 25px; padding-right: 25px; background-color: #ff9800 !important; opacity: 0.9; width: 100px !important; text-align: center;">My Page<i class="icon-angle-right" style="width: 15px !important"></i></a>
					</div>
					<div class="col_full center" style="margin-bottom: 0; margin-top: 0;">
					 <a href="${pageContext.request.contextPath}/logout"
						class="btn button button-3d button-reveal button-mini button-rounded tright" style="padding-left: 25px; padding-right: 25px; background-color: #ff9800 !important; opacity: 0.9; width: 100px !important; text-align: center;">LogOut<i class="icon-angle-right" style="width: 15px !important"></i></a>
					</div>
				</div>
			</div>
			<nav>
					
					<ul>
						<li><a href="#"><i class="icon-briefcase"></i>Teacher Page</a>
							<ul>
									<c:if test="${empty myTeacherList}">
									<li><a>ご参加のクラスがございません。</a></li>
									</c:if>
								<c:forEach items="${myTeacherList}" var="teacherList">
									<li><a href="${pageContext.request.contextPath}/teacherFormLocation?num=${teacherList.num}"><i class="icon-magic"></i>${teacherList.name}</a></li>
								</c:forEach>
							</ul>
						</li>
						<li><a href="#"><i class="icon-study"></i>Student Page</a>
							<ul>
								<c:if test="${empty myStudentList}">
									<li><a>ご参加のクラスがございません。</a></li>
								</c:if>
								<c:forEach items="${myStudentList}" var="studentList">
									<li><a href="${pageContext.request.contextPath}/studentFormLocation?num=${studentList.num}"><i class="icon-pencil2"></i>${studentList.name}</a></li>
								</c:forEach>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
	
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/plugins.js"></script>
	
	<!-- Bootstrap File Upload Plugin -->
	<script type="text/javascript" src="js/components/bs-filestyle.js"></script>

	<!-- Footer Scripts
	============================================= -->
	<script type="text/javascript" src="js/functions.js"></script>
	<script type="text/javascript" src="resources/jquery.videoBG.js"></script>
	<!-- Footer Scripts
	============================================= -->
	<script>
	$(function() {
		$( '#vertical-nav nav ul li:has(ul)' ).addClass('sub-menu');
		$( '#vertical-nav nav ul li:has(ul) > a' ).append( ' <i class="icon-angle-down"></i>' );

		$( '#vertical-nav nav ul li:has(ul) > a' ).click( function(e){
			var element = $(this);
			$( '#vertical-nav nav ul li' ).not(element.parents()).removeClass('active');
			element.parent().children('ul').slideToggle( function(){
				$(this).find('ul').hide();
				$(this).find('li.active').removeClass('active');
			});
			$( '#vertical-nav nav ul li > ul' ).not(element.parent().children('ul')).not(element.parents('ul')).slideUp();
			element.parent('li:has(ul)').toggleClass('active');
			e.preventDefault();
		});
		
		
			$("#register-form").keydown(function(evt) {
				if (evt.keyCode == 13){
					return false;
				}
			});
			$("#register-form").keyup(function(evt) {
				if(		$.trim($("#register-form-password").val()) != ""
						&& $.trim($("#register-form-repassword").val())!= "" 
						&& $.trim($("#register-form-password").val()) == $.trim($("#register-form-repassword").val())
					){
					$("#register").css('display','inline-block');
					$("#no").css('display','none');
				} else{
					$("#register").css('display','none');
					$("#no").css('display','inline-block');
				} 
			});
			
		$('#imgbtn').on('click',changeImg);
		$('#register').on('click', check);
		$('#idDelete').on('click', idDelete);
	});
	
	
	function changeImg() {
		$('#changeImg').css('display', 'inline');
		$('#register-form').attr('enctype','multipart/form-data');
		$('#originalImg').css('display', 'none');
		$('#originalImgBtn').css('display', 'none');
		$('#count').val('1');
	};
	function check() {
		
		//비밀번호를 입력하지 않았다면
		if ($.trim($("#register-form-password").val()) == "") {
			alert("暗証番号を入力してください。");

			$("#register-form-password").val("").focus();

			return false;
		}

		//비밀번호 길이 유효성 검사
		if (($.trim($("#register-form-password").val()).length < 6)
				|| ($.trim($("#register-form-password").val()).length > 21)) {
			alert("暗証番号は6~20まででございます。");

			return false;
		}
		if (($.trim($("#register-form-password").val())) != ($.trim($(
				"#register-form-repassword").val()))) {
			alert("暗証番号の確認と合っておりません。");

			return false;
		}
		alert('会員修正が完了しました。');
		$('#register-form').submit();
	}
	function idDelete() {
		if (($.trim($("#register-form-password").val()).length < 6)
				|| ($.trim($("#register-form-password").val()).length > 21)) {
			alert("暗証番号は6~20まででございます。");

			return false;
		}
		if (($.trim($("#register-form-password").val())) != ($.trim($(
				"#register-form-repassword").val()))) {
			alert("暗証番号の確認と合っておりません。");

			return false;
		}
		
		var password = $("#register-form-password").val();
		
		$.ajax({
			url : 'unregisterCheck'
			, method : 'get'
			, data : 'password=' + password
			, success: function(repo) {
				if(repo == 1){
					var result = confirm("本当に脱退しますか?");
					if(result == true){
						var password = $("#register-form-password").val();
						location.href = "${pageContext.request.contextPath}/unregister?password=";
					}
					else{
						return false;
					}
				} else {
					alert("暗証番号が違いません。");
					return false;
				}
			}
		});
	}
	</script>
</body>