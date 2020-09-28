<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="keywords" content="sansillyung, gxsx, bitcamp">
		<meta name="description" content="sansillyung - GxSx">
		<meta name="author" content="sansillyung">
		
		<title>GxSx</title>
		
	<link rel="stylesheet" href="../css/beryllium/style.css">
	<link rel="stylesheet" href="../css/beryllium/themify-icons.css">
	<link rel="stylesheet" href="../css/topmenu.css">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../images/coza/icons/favicon.png"/>
	<link rel="stylesheet" type="text/css" href="../vendor/coza/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../fonts/coza/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="../fonts/coza/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="../fonts/coza/linearicons-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="../vendor/coza/animate/animate.css">	
	<link rel="stylesheet" type="text/css" href="../vendor/coza/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="../vendor/coza/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="../vendor/coza/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="../vendor/coza/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="../vendor/coza/slick/slick.css">
	<link rel="stylesheet" type="text/css" href="../vendor/coza/MagnificPopup/magnific-popup.css">
	<link rel="stylesheet" type="text/css" href="../vendor/coza/perfect-scrollbar/perfect-scrollbar.css">
	<link rel="stylesheet" type="text/css" href="../css/coza/util.css">
	<link rel="stylesheet" type="text/css" href="../css/coza/main.css">
	
	<style>
		#tophr {
		  width:68%;
		  margin-left:300px;
		  opacity:10%;
		  height: 1px;
		  background: #bbb;
		  background-image: -webkit-linear-gradient(left, #eee, #777, #eee);
		  background-image: -moz-linear-gradient(left, #eee, #777, #eee);
		  background-image: -ms-linear-gradient(left, #eee, #777, #eee);
		  background-image: -o-linear-gradient(left, #eee, #777, #eee);
		}
	</style>
	
	<script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script type="text/javascript">	
// 		$(function() {
// 			$("#클릭할꺼").on("click", function(){
// 				$.ajax({
// 				   url: "../Users/경로.json", 
// 				   type: "POST",
// 				   dataType: "json",
// 				   data: { 변수이름: $("#변수받을거").val()},				
// 				   success: function(responseData){
// 					 if(!responseData){
// 						 alert("데이터없음");
// 						 return false;
// 					 }
// 					 var html= "";
// 					 if(responseData.length != 0){
//  						 for(var i=0; i<responseData.length; i++){
// 							html += "";
// 						 }
//  					 }else{
//  						 html += "";
//  					 }
//   					 html += "";					
  						
//   					 $("#상기내용이 추가될div").html(html);
// 				   }
// 			   });
// 		   });
// 		})//start-end

		$(function() {
			$("#MyQandA").on("click", function(){
				$.ajax({
				   url: "../Question/*경로이름.json", 
				   type: "POST",
				   dataType: "json",
				   data: { userid: $("#userid").val()},				
				   success: function(responseData){
					 if(!responseData){
						 alert("존재하지 않는 제목");
						 return false;
					 }
					 var html= "<div class='wrap-table-shopping-cart'>";
						 html += "<table class='table-shopping-cart'><tr class='table_head'><th class='column-1'>Subject</th>";
						 html += "<th class='column-4'>Date</th><th class='column-5'>Finish</th></tr>";
					 if(responseData.length != 0){
 						 for(var i=0; i<responseData.length; i++){
							html += "<tr class='table_row'>";
							html += "<td class='column-2'>"+responseData[i].qsub+"</td>";
							html += "<td class='column-4'>"+responseData[i].qdate+"</td>";
							if(responseData[i].qreply != 0){
								html += "<td class='column-5'>답변완료</td></tr>";
							}
							else{
								html += "<td class='column-5'>답변미완료</td></tr>";
							}
						 }
 					 }else{
 						 html += "<tr class='table_row'><td colspan='5'><center>작성된 글 없음</center></td></tr></table></div>";
 					 }
  					 html += "</table></div>";
  						
  					 $("#contentchange").html(html);
				   }
			   });
		   });
		})//start-end
		
		function tempfunc() {
			var html = "";
			 html= "<div class='wrap-table-shopping-cart'>";
			 html += "<table class='table-shopping-cart'><tr class='table_head'><th class='column-1'>Subject</th>";
			 html += "<th class='column-4'>Date</th><th class='column-5'>Finish</th></tr>";
			 html += "<tr class='table_row'>";
			 html += "<td class='column-2'>제목</td>";
			 html += "<td class='column-4'>날짜</td>";
			 html += "<td class='column-5'>미완료</td></tr>";
			 html += "</table></div>";
			document.getElementById("contentchange").innerHTML = html;
		}

	
	function 함수이름() {
		//alert("성공2");
		var str1 = "";
				
		document.getElementById("상기내용이 추가될div").innerHTML = str1;
			//.innerText = "str" : str 자체가 출력되도록 변환 후 덮어씌움
			// 예)str : <b> b태그 </b> ==> &lt;b&gt; b태그 &lt;/b&gt;
	}

</script>

</head>

<body class="animsition">
	
	<!-- Header -->	
	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->
	<!-- ////////////////////////////////////// 맨 위 메뉴 시작 ////////////////////////////////////// -->
	<header class="header-v4">
		<!-- Header desktop -->
		<div class="container-menu-desktop">

			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="../gxsx/domain.do" class="logo">
						<img src="../images/coza/icons/logo-01.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li>
								<a href="../gxsx/domain.do">Home</a>
							</li>

							<li>
								<a href="../gxsx/notice.do">Notice</a>
							</li>

							<li class="label1" data-label1="습득물">
								<a href="../finditem/list.do">Finditem</a>
							</li>

							<li class="label1" data-label1="분실물">
								<a href="../lostitem/list.do">Lostitem</a>
							</li>

							<li>
								<a href="../gxsx/contact.do" class="active-menu">Contact</a>
							</li>
						</ul>
					</div>	

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
<!-- 						<a href="#" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0"> -->
<!-- 							<i class="zmdi zmdi-favorite-outline"></i> -->
<!-- 						</a> -->
						<ul class="main-menu">					
							<c:if test="${ empty loginuser && empty klogin}">
									<li><i class="zmdi zmdi-account-circle"></i>
										<a href="../gxsx/login.do">Login</a></li>
							</c:if>
							<c:if test="${ !empty loginuser }">
								<li class="dropdown">
							        <li class="dropdown">
							          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="ti-bell"></i>(<b>2</b>)</a>
							          <ul class="dropdown-menu notify-drop" style="right:350px">
							            <div class="drop-content" data-tooltip="tooltip" data-placement="top" >
							           		
							            	<li>
							            		<div class="col-md-9 col-sm-9 col-xs-9 pd-l0" style="margin-left:15px">
								            		<a href="">Ahmet</a> yorumladı. <a href="">Çicek bahçeleri...</a>
								            		<p>Lorem ipsum sit dolor amet consilium.</p>
								            		<p class="time">1 Saat önce</p>
							            		</div>
							            	</li>
							            	<li>
							            		<div class="col-md-9 col-sm-9 col-xs-9 pd-l0" style="margin-left:15px">
								            		<a href="">Ahmet</a> yorumladı. <a href="">Çicek bahçeleri...</a>
								            		<p>Lorem ipsum sit dolor amet consilium.</p>
								            		<p class="time">1 Saat önce</p>
							            		</div>
							            	</li>
							            	<li>
							            		<div class="col-md-9 col-sm-9 col-xs-9 pd-l0" style="margin-left:15px">
								            		<a href="">Ahmet</a> yorumladı. <a href="">Çicek bahçeleri...</a>
								            		<p>Lorem ipsum sit dolor amet consilium.</p>
								            		<p class="time">1 Saat önce</p>
							            		</div>
							            	</li>
							            	<li>
							            		<div class="col-md-9 col-sm-9 col-xs-9 pd-l0" style="margin-left:15px">
								            		<a href="">Ahmet</a> yorumladı. <a href="">Çicek bahçeleri...</a>
								            		<p>Lorem ipsum sit dolor amet consilium.</p>
								            		<p class="time">1 Saat önce</p>
							            		</div>
							            	</li>
							             </div>
						          	</ul>
						        </li>
							</li>
						</c:if>
								
						<c:if test="${ !empty loginuser || (!empty klogin && !empty kakaologout_url) }">
							<li class="dropdown">
					          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="ti-user"></i></a>
					          <ul class="dropdown-menu notify-drop" style="min-width:150px">
					            <div class="drop-content" data-tooltip="tooltip" data-placement="top" style="min-height:100px;overflow:hidden;font-family: Poppins-Medium">							            
					            	<li><div>&nbsp;&nbsp;
						            		<i class="ti-bookmark-alt"></i>&nbsp;<a href="../gxsx/mypage.do">Myboard</a>
					            		</div></li>
					            	<li><div>&nbsp;&nbsp;
						            		<i class="ti-id-badge"></i>&nbsp;<a href="">Modify</a>
					            		</div></li>
					            	<li><div>&nbsp;&nbsp;
						            		<i class="ti-headphone-alt"></i>&nbsp;<a href="../gxsx/contact.do">Contact</a>
					            		</div></li>
					            	<li><div>&nbsp;&nbsp;
						            		<i class="ti-power-off"></i>
						            		<c:if test="${ empty loginuser && empty klogin}">
						            			&nbsp;<a href="">Logout</a>
						            		</c:if>
						            		<c:if test="${ !empty loginuser && empty kakaologout_url}">
												&nbsp;<a href="../gxsx/logout.do">Logout</a>
											</c:if>
											<c:if test="${!empty klogin && !empty kakaologout_url}">
												&nbsp;<a href="${kakaologout_url}">Logout</a>
											</c:if>
					            		</div></li>
					             </div>
						      </ul>
							</li>
						</c:if>	
						</ul>			
					</div>
				</nav>
			</div>	
		</div>
	</header>
	<!-- ////////////////////////////////////// 맨 위 메뉴 종료 ////////////////////////////////////// -->
	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->

	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->
	<!-- /////////////////////////////////////// 컨텐츠 시작  /////////////////////////////////////// -->
	
	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('../images/coza/bg-01.jpg');margin-top:-40px">
		<h2 class="ltext-105 cl0 txt-center">
			Contact
		</h2>
	</section>	


	<!-- Content page -->
	<section class="bg0 p-t-62 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">

						<div class="p-t-55">
							<h4 class="mtext-112 cl2 p-b-33">
								Categories
							</h4>

							<ul id="accordion" class="accordion">
								<li class="bor18" id="QandA">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Q&A
									</a>
								</li>
								
								<li class="bor18" id="MyQandA">
									<a href="#" onclick="tempfunc()"  class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										My Q&A
									</a>
								</li>
							</ul>
							
						</div>
					</div>
				</div>
				
				
				<div class="col-md-8 col-lg-9 p-b-80" id="contentchange"> <!-- 본문 들어갈 div -->
					<!-- 경빈 -->

				<!-- Content page -->
				<section class="bg0 p-t-104 p-b-116">
					<div class="container">
						<div class="flex-w flex-tr">
							<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
								<form>
									<h4 class="mtext-105 cl2 txt-center p-b-30">
										Send Us A Message
									</h4>
			
									<div class="bor8 m-b-20 how-pos4-parent">
										<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="email" placeholder="Your Email Address">
										<input type="hidden" name="userid" id="userid" value="${loginuser.userid}" />
										<img class="how-pos4 pointer-none" src="../images/coza/icons/icon-email.png" alt="ICON">
									</div>
			
									<div class="bor8 m-b-30">
										<textarea class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" name="msg" placeholder="How Can We Help?"></textarea>
									</div>
			
									<button class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
										Submit
									</button>
								</form>
							</div>
			
							<div class="size-210 bor10 flex-w flex-col-m p-lr-93 p-tb-30 p-lr-15-lg w-full-md">
								<div class="flex-w w-full p-b-42">
									<span class="fs-18 cl5 txt-center size-211">
										<span class="lnr lnr-map-marker"></span>
									</span>
			
									<div class="size-212 p-t-2">
										<span class="mtext-110 cl2">
											Address
										</span>
			
										<p class="stext-115 cl6 size-213 p-t-18">
											Coza Store Center 8th floor, 379 Hudson St, New York, NY 10018 US
										</p>
									</div>
								</div>
			
								<div class="flex-w w-full p-b-42">
									<span class="fs-18 cl5 txt-center size-211">
										<span class="lnr lnr-phone-handset"></span>
									</span>
			
									<div class="size-212 p-t-2">
										<span class="mtext-110 cl2">
											Lets Talk
										</span>
			
										<p class="stext-115 cl1 size-213 p-t-18">
											+1 800 1236879
										</p>
									</div>
								</div>
			
								<div class="flex-w w-full">
									<span class="fs-18 cl5 txt-center size-211">
										<span class="lnr lnr-envelope"></span>
									</span>
			
									<div class="size-212 p-t-2">
										<span class="mtext-110 cl2">
											Sale Support
										</span>
			
										<p class="stext-115 cl1 size-213 p-t-18">
											contact@example.com
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>	
				
				
					<!-- Map -->
					<div class="map">
						<div class="size-303" id="google_map" data-map-x="37.552329" data-map-y="126.937562" data-pin="../images/coza/icons/pin.png" data-scrollwhell="0" data-draggable="1" data-zoom="11"></div>
					</div>

				</div>
				
			</div>
		</div>
	</section>

	<!-- /////////////////////////////////////// 컨텐츠 종료  /////////////////////////////////////// -->
	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->

	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->
	<!-- ////////////////////////////////////// footer 시작 ////////////////////////////////////// -->

	<footer class="bg3 p-t-75 p-b-32">
		<div class="container">
			<div class="row">
			
				<div class="col-sm-6 col-lg-3 p-b-50">
						<h4 class="stext-301 cl0 p-b-30" style="font-size:100px">
							GxSx
						</h4>
				</div>
				
				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						CATEGORIES
					</h4>					
						<ul>
							<li class="p-b-10">
								<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
									Finditem
								</a></li>
							<li class="p-b-10">
								<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
									Lostitem
								</a></li>
							<li class="p-b-10">
								<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
									Shoes
								</a></li>
							<li class="p-b-10">
								<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
									Watches
								</a></li>
						</ul> 
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						CONTACT US
					</h4>

					<p class="stext-107 cl7 size-201">
						<i class="fa fa-home"></i> 3422 Street, Barcelona 432, Spain, 
						<br/>&nbsp;&nbsp;&nbsp; New Building North, 15th Floor</p>
					<p class="stext-107 cl7 size-201">
						<i class="fa fa-phone"></i> +101 377 655 22125</p>
					<p class="stext-107 cl7 size-201">
						<i class="fa fa-envelope"></i> mail@yourcompany.com</p>

					<div class="p-t-27">
						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-facebook"></i></a>
						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-instagram"></i></a>
						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-pinterest-p"></i></a>
					</div>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						BUSINESS HOURS
					</h4>

					<p class="stext-107 cl7 size-201">
						<i class="fa fa-clock-o"></i> <span class="day">Weekdays : </span>
						<span>9am to 8pm</span></p>
					<p class="stext-107 cl7 size-201">
						<i class="fa fa-clock-o"></i> <span class="day">Saturday &nbsp; : </span>
						<span>9am to 2pm</span></p>
					<p class="stext-107 cl7 size-201">
						<i class="fa fa-clock-o"></i> <span class="day">Sunday &nbsp; &nbsp; : </span>
						<span>Closed</span></p>
				</div>
			</div>

				<p class="stext-107 cl6 txt-center">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

				</p>
			</div>
		</div>
	</footer>
	
	<!-- ////////////////////////////////////// footer 종료 ////////////////////////////////////// -->	
	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!-- Modal1 -->
	<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
		<div class="overlay-modal1 js-hide-modal1"></div>

		<div class="container">
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal1">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>

				<div class="row">
					<div class="col-md-6 col-lg-7 p-b-30">
						<div class="p-l-25 p-r-30 p-lr-0-lg">
							<div class="wrap-slick3 flex-sb flex-w">
								<div class="wrap-slick3-dots"></div>
								<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

								<div class="slick3 gallery-lb">
									<div class="item-slick3" data-thumb="images/product-detail-01.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="../images/coza/product-detail-01.jpg" alt="IMG-PRODUCT">

											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/product-detail-01.jpg">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3" data-thumb="images/product-detail-02.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="../images/coza/product-detail-02.jpg" alt="IMG-PRODUCT">

											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/product-detail-02.jpg">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3" data-thumb="images/product-detail-03.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="../images/coza/product-detail-03.jpg" alt="IMG-PRODUCT">

											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/product-detail-03.jpg">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-6 col-lg-5 p-b-30">
						<div class="p-r-50 p-t-5 p-lr-0-lg">
							<h4 class="mtext-105 cl2 js-name-detail p-b-14">
								Lightweight Jacket
							</h4>

							<span class="mtext-106 cl2">
								$58.79
							</span>

							<p class="stext-102 cl3 p-t-23">
								Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.
							</p>
							
							<!--  -->
							<div class="p-t-33">
								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">
										Size
									</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="time">
												<option>Choose an option</option>
												<option>Size S</option>
												<option>Size M</option>
												<option>Size L</option>
												<option>Size XL</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">
										Color
									</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="time">
												<option>Choose an option</option>
												<option>Red</option>
												<option>Blue</option>
												<option>White</option>
												<option>Grey</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="flex-w flex-r-m p-b-10">
									<div class="size-204 flex-w flex-m respon6-next">
										<div class="wrap-num-product flex-w m-r-20 m-tb-10">
											<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>

											<input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product" value="1">

											<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
										</div>

										<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
											Add to cart
										</button>
									</div>
								</div>	
							</div>

							<!--  -->
							<div class="flex-w flex-m p-l-100 p-t-40 respon7">
								<div class="flex-m bor9 p-r-10 m-r-11">
									<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
										<i class="zmdi zmdi-favorite"></i>
									</a>
								</div>

								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
									<i class="fa fa-facebook"></i>
								</a>

								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
									<i class="fa fa-twitter"></i>
								</a>

								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
									<i class="fa fa-google-plus"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<!--===============================================================================================-->	
	<script src="../vendor/coza/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/coza/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/coza/bootstrap/js/popper.js"></script>
	<script src="../vendor/coza/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/coza/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="../vendor/coza/daterangepicker/moment.min.js"></script>
	<script src="../vendor/coza/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/coza/slick/slick.min.js"></script>
	<script src="../js/coza/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/coza/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="../vendor/coza/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="../vendor/coza/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/coza/sweetalert/sweetalert.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/coza/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="../js/coza/main.js"></script>
	<script>
	$(function() {
		var Accordion = function(el, multiple) {
			this.el = el || {};
			this.multiple = multiple || false;

			// Variables privadas
			var links = this.el.find('.link');
			// Evento
			links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
		}

		Accordion.prototype.dropdown = function(e) {
			var $el = e.data.el;
				$this = $(this),
				$next = $this.next();

			$next.slideToggle();
			$this.parent().toggleClass('open');

			if (!e.data.multiple) {
				$el.find('.submenu').not($next).slideUp().parent().removeClass('open');
			};
		}	

		var accordion = new Accordion($('#accordion'), false);
	});
	</script>

</body>
</html>