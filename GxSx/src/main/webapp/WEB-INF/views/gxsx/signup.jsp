<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================타이틀아이콘-->	
		<link rel="icon" type="image/png" href="../images/icons/favicon.ico"/>
	
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="../css/util.css">
		<link rel="stylesheet" type="text/css" href="../css/main.css">
	<!--===============================================================================================-->
		<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="../css/signupmain.css">
<!--==============================================================================================-->
	</head>
	 <script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$("#signupCancel").on("click", function(){
				location.href = "/signupform.do";	    
			})		
			$("#signupSubmit").on("click", function(){
				if($("#userid").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userid").focus();
					return false;
				}
				if($("#upwd").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#upwd").focus();
					return false;
				}
				if($("#upwdagain").val()==""){
					alert("비밀번호를 다시입력해주세요.");
					$("#upwdagain").focus();
					return false;
				}
				if($("#uname").val()==""){
					alert("성명을 입력해주세요.");
					$("#uname").focus();
					return false;
				}
				if($("#uemail").val()==""){
					alert("성명을 입력해주세요.");
					$("#uemail").focus();
					return false;
				}
				if($("#upnum").val()==""){
					alert("핸드폰번호를 입력해주세요.");
					$("#upnum").focus();
					return false;
				}
			});			
		})
	</script>
	<body>		
		<div class="limiter">
			<div class="container-login100">
				<div class="wrap-login100 p-l-50 p-r-50 p-t-77 p-b-30">
				<span class="login100-form-title p-b-55"> Sign up </span>
				
			<form action="signup.do" name="input" id="form-row" method="post">
				<div class="row form-group">
					<label for="input0">ID</label>
					<input class="form-control" id="userid" name="userid" type="text" data-bvStrict="notEmpty" data-bvSwitch="ID">
					<div class="help-block error-message">Fill your ID</div>
				</div>
				
				<div class="row form-group">
					<label for="input3">Password</label>
					<input class="form-control" id="upwd" name="upwd" type="password" data-bvStrict="reg:^.{5,}">
					<span class="help-block error-message">Password must have at least 5 letters</span>
				</div>
				<div class="row form-group">
					<label for="input4">Password again</label>
					<input class="form-control" id="upwdagain" name="upwdagain" type="password" data-bvStrict="same:upwd" >
					<span class="help-block error-message" style ="color:red">Password does not match</span>
				</div>
				
				<div class="row form-group">
					<label for=-"input0">Name</label>
					<input class="form-control" id="uname" name="uname" type="text" data-bvStrict="string" data-bvSwitch="Your Name">
					<div class="help-block error-message">This must be a string</div>
				</div>
				
				<div class="row form-group">
					<label for="input1">E-mail address</label>
					<input class="form-control" id="uemail" name="uemail" type="text" data-bvStrict="email" data-bvEmpty="@" >
					<div class="help-block error-message">Fill valid e-mail address</div>
				</div>
				
				<div class="row form-group">
					<label for="input2">Phone Number</label>
					<input class="form-control" id="upnum" name="upnum" type="text" data-bvStrict="phone" data-bvSwitch="000-0000-0000">
					<div class="help-block error-message">(-)를 포함한 다음의 형태로 입력해주세요(000-0000-0000)</div>
				</div>
				
				<div class="row checkbox">
					<label for="cond">
						<input type="checkbox" name="cond" required> I agree to the <a href="#" data-toggle="modal" data-target="#Modal-1">terms and conditions</a>
						<span class="help-block error-message">You have to check this</span>
					</label>
				</div>
				
				<button type="submit" id="signupSubmit" name="signupSubmit" 
					class="btn btn-default">Submit</button>
				<button type="button" id="signupCancel" name="signupCancel" 
					class="btn btn-default">Cancel</button>
			</form>
			
			<!-- Modal -->
			<div class="modal fade" id="Modal-1" tabindex="-1" role="dialog" aria-labelledby="Modal-label-1">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="Modal-label-1">.</h4>
						</div>
						<div class="modal-body">
							..
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
				
				</div>
			</div>
		</div>

	<!--===============================================================================================-->	
		<script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
		<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
		<script src="../vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
		<script src="../js/main.js"></script>
        
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="../js/bvalidator.jquery.js"></script>
	
        <script type="text/javascript">
			$(function(){
				$('#form-row').bValidator();

// 				$('#form-direct').bValidator({
// 					onFocusHideError: 	true,
// 					domType: 			'direct',
// 					onValid: 			function(form, element) {
// 						console.log('Input with name ' + element.attr('name') + ' is valid');
// 					},
// 					onInvalid:       	function(form, element) {
// 						console.log('Input with name ' + element.attr('name') + ' is invalid');
// 					},
// 					beforeSubmit: 		function(form, event) {
// 						alert('Form is valid');
// 					},
// 					onSubmitFail:       function(form, event) {
// 						alert('Form is NOT valid');
// 					},
// 					onFocusIn: function(form, element) {
// 						console.log('Input focused in');
// 					},
// 					onFocusOut: function(form, element) {
// 						console.log('Input focused out');
// 					},
// 					onKeyUp: function(form, element) {
// 						console.log('Key pressed over input');
// 					}
// 				});
			});
		</script><script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-36251023-1']);
        _gaq.push(['_setDomainName', 'jqueryscript.net']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  		})();

		</script>
		<script src="../js/bootstrap.min.js"></script>
	</body>
</html>