<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />
	
	
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="css/animate.css" type="text/css" />
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
	<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
	<link rel="stylesheet" href="css/dark.css" type="text/css" />
	<link rel="stylesheet" href="resources/style.css" type="text/css" />
		
	<script type="text/javascript" src="resources/textEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
		
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="topMenu.jsp" %>
<%@ include file="sidebar.jsp" %>

<style>
	
	div#ddddwrapper{
		margin : 0 auto;
	}
	pre {
		height : 400px;
		overflow: auto;
		background-color: white;
	}
	span {
		display: inline-block;
		margin : 5px;
	}
	
	.bbb {
		background-color: blue !important;
	}
	#sese{
	outline: gray;
	outline-style: solid;
	box-shadow: 1px 1px 5px black;
	}
</style>

</head>

<body class="stretched">

<div id="wrapper"  class="clearfix">
<div class="body-overlay"></div>
<section id="page-title" class="page-title-mini">
	<div class="container clearfix">
		<h1>${board.title} [${board.reply_count}]</h1>
		<span>${board.title} [${board.reply_count}]</span>
	</div>
</section>
<section id="content">

	<div class="content-wrap" style="padding-top: 10px; padding-bottom: 10px;">
	<div class="container clearfix">
	<form action="boardUpdateForm" id="Form" method="POST" >
	<input type="hidden" name="num" value="${board.num}">
	<input type="hidden" name="classNum" value="${classNum}">
	
	<table class="Bordered table">
		<tr id="photo_td">
			<td rowspan="3" class="col-md-3" ><img src ="imgStatus?imgName=${userImg}" style="width: 200px; height: 200px"/></td>
			<td><strong>${board.user_id}</strong></td>
			<td rowspan="3" ></td>
		</tr>
		
		<tr>
			<th>${board.register_time}</th>
		</tr>	
		<tr>
			<th></th>
		</tr>
		
		<c:forEach items="${list}" var="fileList" varStatus="check">
			<tr>
				<td>
					<label>添付ファイル${check.index + 1}</label>
				</td>
				<td>
					<a href="downloadbf?num=${fileList.num}">${fileList.original_filename}</a>
				</td>
			</tr>
		</c:forEach>
		
		<tr>
			<td colspan="3">
				<pre id="context">${board.content}</pre>
			</td>
		</tr>
		<tr>
			<td colspan="1">
				<a href="boardList?classNum=${classNum}">≪目録に</a>
			</td>
			<td></td>
			<td align="right">	
				<input type="submit" class="btn btn-primary bbb" value="修正">
				<input type="button" value="削除" class="btn btn-primary" onclick="deleteForm()"/>
				<a class="btn btn-primary" href="boardWrite?classNum=${classNum}" role="button"><i class="icon-book3"></i>書き込み</a>
			</td>
		</tr>
	</table>
	</form>
	<span>コメント数  : </span><span id="replycount">${board.reply_count}</span> <span>照会数 : ${board.hit}</span>
	<!-- 댓글 입력 / 로그인한 사람만 댓글을 달 수 있다. -->
		<form id="replyWrite" action="replyWrite" method="POST">
		<input type="hidden" name="action" value="replyWrite" />
		<input type="hidden" name="board_num" value="${board.num}" />
		<table id="replyinput" class="reply">
			<tbody>
			<tr>
				<td>
				<label class="col-md-1">${loginId}</label>
				<textarea class="col-md-10 row-md-4" id="reply_text" name="reply_text" maxlength="400" cols="150" rows="3" placeholder="コメントを入力してください。"></textarea>
				</td>
			</tr>
			<tr>
				<td>
				<p class="col-md-9"></p><a class="btn btn-primary col-md-2" id="reply_submit" role="button"><i class="icon-ok"></i>登録</a>
				</td>
			</tr>
			</tbody>	
		</table>
		</form>

	<!-- 댓글 출력 -->
	<div id="replydisplay">
	</div><!-- end #replydisplay -->
</div> <!-- end #wrapper -->
</div>
</section>
</div>
<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts
	============================================= -->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/ellipsis.js"></script>
	<script type="text/javascript" src="js/plugins.js"></script>

	<!-- Bootstrap Data Table Plugin -->
	<script type="text/javascript" src="js/components/bs-datatable.js"></script>

	<!-- Footer Scripts
	============================================= -->
	<script type="text/javascript" src="js/functions.js"></script>
<script>
	$(function(){
		init();
		$("#reply_submit").on("click", replywrite);
	});
	
	function init(){
		var board_num = ${board.num};
		$.ajax({
			url : "replyList",
			method:"get",
			data:"board_num="+board_num,
			dataType:"json",
			success : replyList,
			error : function(){
				alert("文章を読みません。");
			}
		});
	}
	
	//댓글
	function replyList(resp){
		var data = "<table class='Bordered table'>";
		$.each(resp, function(index,reply){
			data += "<tr>";
			data += "<td class='col-md-1'>";
			if(reply.parent != 0) data+= "└ "; //답글이면 ㄴ 추가, 후에 이미지로 대체
			data += reply.user_id+"</td>"; 
			data += "<td class='col-md-3'>"+reply.content+"</td>";
			data += "<td class='col-md-2'>"+reply.register_time;
			var delBtn = "del"+reply.num;
			var updateBtn = "update"+reply.num;
			if(reply.user_id == "${loginId}"){
				data += "<i data-rno='"+reply.num+"'class='delete icon-remove'></i>";
				data += "<i class='update icon-line2-magic-wand' data-rno='"+reply.num+"' data-con='"+reply.content+"'></i>";
				}
			if(reply.parent ==0){
			data += "<i class='reReply icon-plus' data-rno='"+reply.num+"' data-prt='"+reply.parent+"'></i></td>"; //대댓글
			}
			data += "</tr>";
		}); //end $.each
		data += "</table>";
		$("#replydisplay").html(data);
		//삭제
		$(".delete").on("click",function(){
			var bnum = ${board.num};
			var rnum = $(this).attr("data-rno");
			$.ajax({ 
				url : "replyDelete",
				method :"get",
				data : "rnum="+rnum+"&bnum="+bnum,
				success : function(){
					alert("コメントを削除しました。");
					init(); // 삭제되면 리스트 새로 그리기
				}
				, error : function(){
					alert("コメントの削除に失敗しました。");
				}
			});//end ajax
		}); // end delete
		//수정
		  $(".update").on("click",function(){
			$("#reply_submit").val('コメント修正'); //버튼값 바꾸기
			$('#reply_submit').off('click');
			var con = $(this).attr('data-con');//댓글내용가져오기
			var reply = $(this).attr('data-rno'); //리플넘버가져오기
			document.getElementById("reply_text").value = con; //댓글입력창에 수정하고자하는 댓글내용표시
			$('#reply_text').focus();
			$("#reply_submit").on("click",function(){
				var replytxt = $("#reply_text").val(); //댓글입력란 텍스트 가져오기
				$.ajax({
					url : "replyUpdate",
					method : "get",
					data : "num="+reply+"&content="+replytxt,
					success : function(){
						init();
						$("#reply_submit").off('click');
						$("#reply_submit").on("click", replywrite);
						$("#reply_submit").val('コメント入力');
						$("#reply_text").val("");
					}
					,error : function(){
						alert("コメント修正に失敗しました。");
					}
				});//end ajax
			})//end 수정버튼클릭
			return false;
		});//end update	
		//답글
		$(".reReply").on("click",function(){
			//$("#reply_submit").val('답글달기'); //버튼값 바꾸기
			$('#reply_submit').off('click'); //기존 이벤트 삭제
			$('#reply_text').focus();
			var reply = $(this).attr('data-rno'); //리플넘버가져오기
			$("#reply_submit").on("click",function(){
				var replytxt = $("#reply_text").val();
				var bnum = ${board.num};
				$.ajax({
					url : "replyWrite",
					method : "post",
					data : "parent="+reply+"&content="+replytxt+"&board_num="+bnum,
					success : function(){
						init();
						$("#reply_submit").off('click');
						$("#reply_submit").on('click', replywrite);
						//$("#reply_submit").val('댓글입력');
						$("#reply_text").val("");
					}
					,error : function(){
						alert("コメントの書き込みに失敗しました。");
					}
				});//end ajax
			});
		});//end reReply		
			
	}	
	//댓글작성
	function replywrite() {
		var d = document.getElementById("reply_text").value;
		
		if(document.getElementById("reply_text").value == ""){
			alert("コメントを入力してください。");
			return false;
		}
		
		var writetext = document.getElementById("reply_text").value;
		var board_num = ${board.num};
			$.ajax({
				url:"replyWrite",
				method : "post",
				data : "content="+writetext+"&board_num="+board_num,
				success : function(){
					init();
				}
				,error: function(){
					alert("コメント作成に失敗しました。");
				}
			});//end ajax
	}
	//글삭제
	function deleteForm(){
		var del = confirm("本当に削除しますか？")
		if(del){
			location.href="deleteForm?num=${board.num}&classNum=${classNum}";
		}
		return;
	}	
</script>
</body>
</html>