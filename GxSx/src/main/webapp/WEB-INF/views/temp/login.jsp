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
		<link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="../fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css">
	<!--===============================================================================================-->	
		<link rel="stylesheet" type="text/css" href="../vendor/css-hamburgers/hamburgers.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="../css/util.css">
		<link rel="stylesheet" type="text/css" href="../css/main.css">
	<!--===============================================================================================-->
	</head>
	<body>
		
		<div class="limiter">
			<div class="container-login100">
				<div class="wrap-login100 p-l-50 p-r-50 p-t-77 p-b-30">
					<form class="login100-form validate-form" action="logincheck.do" method="post">
						<span class="login100-form-title p-b-55">
							Login
						</span>
						<div class="wrap-input100 validate-input m-b-16" data-validate = "Valid id is required">
							<input class="input100" type="text" name="userid" placeholder="Enter your ID">
							<span class="focus-input100"></span>
							<span class="symbol-input100">
								<span class="lnr lnr-envelope"></span>
							</span>
						</div>
	
						<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
							<input class="input100" type="password" name="upwd" placeholder="Password">
							<span class="focus-input100"></span>
							<span class="symbol-input100">
								<span class="lnr lnr-lock"></span>
							</span>
						</div>
	
<!-- 						<div class="contact100-form-checkbox m-l-4"> -->
<!-- 							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me"> -->
<!-- 							<label class="label-checkbox100" for="ckb1"> -->
<!-- 								Remember me -->
<!-- 							</label> -->
<!-- 						</div> -->
						
						<div class="container-login100-form-btn p-t-25">
							<button type="submit" class="login100-form-btn">
								Login
							</button>
						</div>
	
						<div class="text-center w-full p-t-42 p-b-22">
							<span class="txt1">
								Or login with
							</span>
						</div>
						
						<p id="kakao_id_login" style="margin-left:20px">
							<a href="${kakao_url}">
								<img src="../images/kakao_login_medium_wide.png">
							</a>
						</p>
	
						<a href="loolo.do" class="btn-google m-b-10">
							<img src="images/kakao_login_medium_wide.png">
							Google
						</a>					
						
						<div class="text-center w-full p-t-115">
							<span class="txt1">
								Not a member?
							</span>
	
							<a class="txt1 bo1 hov1" href="signupform.do">
								Sign up now							
							</a>
						</div>
					</form>
				</div>
			</div>
		</div>
		
	<!--===============================================================================================-->	
		<script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
		<script src="../vendor/bootstrap/js/popper.js"></script>
		<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
		<script src="../vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
		<script src="../js/main.js"></script>
	
	</body>
</html>