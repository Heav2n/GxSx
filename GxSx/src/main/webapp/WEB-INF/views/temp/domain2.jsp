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
	
		<link href="https://fonts.googleapis.com/css?family=Merriweather:300,400|Montserrat:400,700" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Libre+Baskerville:400,400i,700" rel="stylesheet">

		<link rel="icon" href="favicon.ico">
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="../css/admi/index.scss">
		<link rel="stylesheet" href="../css/index.css">
		<link rel="stylesheet" href="../css/topmenu.css">
		
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="../js/beryllium/modernizr-2.6.2.min.js"></script>
		<script src="../js/church/modernizr-2.6.2.min.js"></script>
		
		<!-- 다시 -->
		<link rel="icon" type="image/png" href="../images/coza/icons/favicon.png"/>	
<!-- 		<link rel="stylesheet" type="text/css" href="../vendor/coza/bootstrap/css/bootstrap.min.css">	 -->
		<link rel="stylesheet" type="text/css" href="../fonts/coza/font-awesome-4.7.0/css/font-awesome.min.css">	
		<link rel="stylesheet" type="text/css" href="../fonts/coza/iconic/css/material-design-iconic-font.min.css">	
		<link rel="stylesheet" type="text/css" href="../fonts/coza/linearicons-v1.0.0/icon-font.min.css">	
<!-- 		<link rel="stylesheet" type="text/css" href="../vendor/coza/animate/animate.css">		 -->
<!-- 		<link rel="stylesheet" type="text/css" href="../vendor/coza/css-hamburgers/hamburgers.min.css">	 -->
<!-- 		<link rel="stylesheet" type="text/css" href="../vendor/coza/animsition/css/animsition.min.css">	 -->
<!-- 		<link rel="stylesheet" type="text/css" href="../vendor/coza/select2/select2.min.css">		 -->
<!-- 		<link rel="stylesheet" type="text/css" href="../vendor/coza/daterangepicker/daterangepicker.css">	 -->
<!-- 		<link rel="stylesheet" type="text/css" href="../vendor/coza/slick/slick.css">	 -->
<!-- 		<link rel="stylesheet" type="text/css" href="../vendor/coza/MagnificPopup/magnific-popup.css">	 -->
<!-- 		<link rel="stylesheet" type="text/css" href="../vendor/coza/perfect-scrollbar/perfect-scrollbar.css">	 -->
		<link rel="stylesheet" type="text/css" href="../css/coza/util.css">
		<link rel="stylesheet" type="text/css" href="../css/coza/main.css">
		<!-- /다시 -->
</head>
	
<body>

<!-- 								<li class="has-dropdown"><a href="#" class="openMask">Mypage</a> -->
<!-- 									<ul class="dropdown"> -->
<!-- 										<li><a href="myboard.do">Myboard</a></li> -->
<!-- 										<li><a href="modifyform.do">Modify</a></li> -->
<!-- 									</ul> -->
<!-- 								</li> -->

<%-- 								<c:if test="${ !empty loginuser && empty kakaologout_url}"> --%>
<!-- 									<li><a href="logout.do">Logout</a></li> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test="${!empty klogin && !empty kakaologout_url}"> --%>
<%-- 									<li><a href="${kakaologout_url}">Logout</a></li> --%>
<%-- 								</c:if> --%>

	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->
	<!-- ////////////////////////////////////// 맨 위 메뉴 시작 ////////////////////////////////////// -->
		<div class="gtco-loader"></div>
		<div class="animsition"> <!-- 전체를 감싸는 div -->
	
			<nav class="gtco-nav" role="navigation">
				<div class="gtco-container">
					<div class="row">
						<div class="col-sm-2 col-xs-12">
							<div id="gtco-logo">
								<a href="domain.do"><img src = "../images/axe.png"> <!-- 메인메뉴 로고 -->
							</div>
						</div>
						<div class="col-xs-10 text-right menu-1" style="margin-top:70px">
							<ul>
								<li class="active"><a href="domain.do">Home</a></li> <!-- 메인메뉴 목록 시작 -->
								<li><a href="notice.do">Notice</a></li>
								<li><a href="#">FindItem</a></li>
								<li><a href="../lostitem/list.do">LostItem</a></li>
								
								<c:if test="${ !empty loginuser }">
									<li class="dropdown">
								        <li class="dropdown">
								          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="ti-bell"></i>(<b>2</b>)</a>
								          <ul class="dropdown-menu notify-drop" style="right:350px">
								            <div class="drop-content" data-tooltip="tooltip" data-placement="top" >
								           		<li>
								           			</br>
								           		</li>
								            	<li>
								            		<div class="col-md-9 col-sm-9 col-xs-9 pd-l0" style="margin-left:15px"><a href="">Ahmet</a> yorumladı. <a href="">Çicek bahçeleri...</a>
								            		<p>Lorem ipsum sit dolor amet consilium.</p>
								            		<p class="time">1 Saat önce</p>
								            		</div>
								            	</li>
								            	<hr>
								            	<li>
								            		<div class="col-md-9 col-sm-9 col-xs-9 pd-l0" style="margin-left:15px"><a href="">Ahmet</a> yorumladı. <a href="">Çicek bahçeleri...</a>
								            		<p>Lorem ipsum sit dolor amet consilium.</p>
								            		<p class="time">1 Saat önce</p>
								            		</div>
								            	</li>
								            	<hr>
								            	<li>
								            		<div class="col-md-9 col-sm-9 col-xs-9 pd-l0" style="margin-left:15px"><a href="">Ahmet</a> yorumladı. <a href="">Çicek bahçeleri...</a>
								            		<p>Lorem ipsum sit dolor amet consilium.</p>
								            		<p class="time">1 Saat önce</p>
								            		</div>
								            	</li>
								            	<hr>
								            	<li>
								            		<div class="col-md-9 col-sm-9 col-xs-9 pd-l0" style="margin-left:15px"><a href="">Ahmet</a> yorumladı. <a href="">Çicek bahçeleri...</a>
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
							            <div class="drop-content" data-tooltip="tooltip" data-placement="top" style="min-height:235px;overflow:hidden">
							           		<li></br></li>								            
							            	<li><div>&nbsp;&nbsp;
								            		<i class="ti-bookmark-alt"></i><a href="">Myboard</a>
							            		</div></li><hr>
							            	<li><div>&nbsp;&nbsp;
								            		<i class="ti-id-badge"></i><a href="">Modify</a>
							            		</div></li><hr>
							            	<li><div>&nbsp;&nbsp;
								            		<i class="ti-headphone-alt"></i><a href="">Contact</a>
							            		</div></li><hr>
							            	<li><div>&nbsp;&nbsp;
								            		<i class="ti-power-off"></i>
								            		<c:if test="${ empty loginuser && empty klogin}">
								            			<a href="">Logout</a>
								            		</c:if>
								            		<c:if test="${ !empty loginuser && empty kakaologout_url}">
														<a href="logout.do">Logout</a>
													</c:if>
													<c:if test="${!empty klogin && !empty kakaologout_url}">
														<a href="${kakaologout_url}">Logout</a>
													</c:if>
							            		</div></li>
							             </div>
								      </ul>
									</li>
								</c:if>
							
								<c:if test="${ empty loginuser && empty klogin}">
									<li><a href="login.do">Login</a></li>
								</c:if>
								
							</ul>
						</div>
					</div>
				</div>
			</nav>
	<!-- ////////////////////////////////////// 맨 위 메뉴 종료 ////////////////////////////////////// -->
	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->
	
	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->	
	<!-- ///////////////////////////////////// 메뉴 바로 밑  사진 ///////////////////////////////////// -->
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12">
					<div class="owl-carousel owl-carousel-fullwidth">
						<div class="item">
							<a href="#">
								<img src="../images/slider_1.jpg" alt="Free Website Template by FreeHTML5.co">
								<div class="slider-copy">
									<h2>Architecture #1</h2>
								</div>
							</a>
						</div>
						<div class="item">
							<a href="#">
								<img src="../images/slider_2.jpg" alt="Free Website Template by FreeHTML5.co">
								<div class="slider-copy">
									<h2>Architecture #1</h2>
								</div>
							</a>
						</div>
						<div class="item">
							<a href="#">
								<img src="../images/slider_3.jpg" alt="Free Website Template by FreeHTML5.co">
								<div class="slider-copy">
									<h2>Architecture #1</h2>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- //////////////////////////////////// 메뉴 바로 밑  사진 종료 //////////////////////////////////// -->
	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->
	
	
	<!-- 다시 -->
	<section class="sec-blog bg0 p-t-60 p-b-90">
		<div class="container">
			<div class="p-b-66">
				<h3 class="ltext-105 cl5 txt-center respon1">Our Blogs</h3>
			</div>
		
			<div class="row">			
				<c:if test="${empty lostResult}">
					<tr align="center" noshade>
						<td colspan="5">데이터가 하나도 없음</td>
					</tr>
				</c:if>
				<c:forEach items="${lostResult}" var="lostitem" varStatus="status">
					<div class="col-sm-6 col-md-4 p-b-40">
						<div class="blog-item">
							<div class="hov-img0">
								<a href="blog-detail.html">
									<img class="img-responsive" src="../images/lostitem/${lostpicResult[status.index].lopicname}" alt="분실물" >
								</a>
							</div>
							<div class="p-t-15">
								<div class="stext-107 flex-w p-b-14">
									<span class="m-r-3">
										<span class="cl5">${lostitem.lodate}</span>
										<span class="cl4">${lostitem.loplace}</span>
									</span>
								</div>
	
								<h4 class="p-b-12">
									<a href="blog-detail.html" class="mtext-101 cl2 hov-cl1 trans-04">
										<c:if test="${empty loginuser && empty usercheck}"> <!-- 로그인 안되어있을때 로그인창으로-->
											<a href="login.do" class="img-holder">${lostitem.losub}</a>
										</c:if>
										<c:if test="${!empty loginuser && empty usercheck}"> <!-- 로그인 되어있을때 상세페이지 이동 가능-->
											<a href="#" class="img-holder">${lostitem.losub}</a>
										</c:if>
										<c:if test="${empty loginuser && !empty usercheck}"> <!-- 카카오로 로그인했는데 개인정보 등록 전일때 추가페이지 이동-->
											<a href="tempsignupform.do" class="img-holder">${lostitem.losub}</a>
										</c:if>
									</a>
								</h4>
	
								<p class="stext-108 cl6">
									<c:if test="${empty loginuser && empty usercheck}"> <!-- 로그인 안되어있을때 로그인창으로-->
										<a href="login.do">${lostitem.locon}</a>
									</c:if>
									<c:if test="${!empty loginuser && empty usercheck}"> <!-- 로그인 되어있을때 상세페이지 이동 가능-->
										<a href="#">${lostitem.locon}</a>
									</c:if>
									<c:if test="${empty loginuser && !empty usercheck}"> <!-- 카카오로 로그인했는데 개인정보 등록 전일때 추가페이지 이동-->
										<a href="tempsignupform.do">${lostitem.locon}</a>
									</c:if>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- /다시 -->
	
<!-- 	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->
<!-- 	<!-- /////////////////////////////////////// 습득물 시작 /////////////////////////////////////// -->
<!-- 		<section id="portfolio" style="padding-bottom: 30px; margin-top: 10px"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-lg-12 text-center"> -->
<!-- 						<div class="section-title"> -->
<!-- 							<h21 style="float: left">FINDITEM</h21> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<p1 style="float: right"> -->
<!-- 					<a href=index.do>more ></a></p1> -->
<!-- 				</div> -->
				
<!-- 				church -->
<!-- 				<div class="row"> -->
<%-- 					<c:if test="${empty lostResult}"> --%>
<!-- 							<tr align="center" noshade> -->
<!-- 								<td colspan="5">데이터가 하나도 없음</td> -->
<!-- 							</tr> -->
<%-- 					</c:if> --%>
					
<%-- 					<c:forEach items="${lostResult}" var="lostitem" varStatus="status"> --%>
<!-- 						<div class="col-md-4 animate-box"> -->
<!-- 							<div class="services"> -->
<!-- 								<a href="#" class="img-holder"> -->
<%-- 								<c:if test="${empty loginuser && empty usercheck}"> <!-- 로그인 안되어있을때 로그인창으로--> --%>
<%-- 									<a href="login.do" class="img-holder">${lostitem.losub}</a> --%>
<%-- 								</c:if> --%>
<%-- 								<c:if test="${!empty loginuser && empty usercheck}"> <!-- 로그인 되어있을때 상세페이지 이동 가능--> --%>
<%-- 									<a href="#" class="img-holder">${lostitem.losub}</a> --%>
<%-- 								</c:if> --%>
<%-- 								<c:if test="${empty loginuser && !empty usercheck}"> <!-- 카카오로 로그인했는데 개인정보 등록 전일때 추가페이지 이동--> --%>
<%-- 									<a href="tempsignupform.do" class="img-holder">${lostitem.losub}</a> --%>
<%-- 								</c:if> --%>
<%-- 								<img class="img-responsive" src="../images/lostitem/${lostpicResult[status.index].lopicname}" alt="분실물" > --%>
<!-- 								</a> -->
								
<!-- 									<div class="events-entry"> -->
<%-- 										<span class="date">${lostitem.lodate}</span> --%>
<!-- 										<h3> -->
<%-- 											<c:if test="${empty loginuser && empty usercheck}"> <!-- 로그인 안되어있을때 로그인창으로--> --%>
<%-- 												<a href="login.do">${lostitem.losub}</a> --%>
<%-- 											</c:if> --%>
<%-- 											<c:if test="${!empty loginuser && empty usercheck}"> <!-- 로그인 되어있을때 상세페이지 이동 가능--> --%>
<%-- 												<a href="#">${lostitem.losub}</a> --%>
<%-- 											</c:if> --%>
<%-- 											<c:if test="${empty loginuser && !empty usercheck}"> <!-- 카카오로 로그인했는데 개인정보 등록 전일때 추가페이지 이동--> --%>
<%-- 												<a href="tempsignupform.do">${lostitem.losub}</a> --%>
<%-- 											</c:if> --%>
<!-- 										</h3> -->
<%-- 										<p>${lostitem.loplace}</p> --%>
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 						</div> -->
<%-- 					</c:forEach> --%>
					
<!-- 					<div class="col-md-4 animate-box"> -->
<!-- 						<div class="services"> -->
<!-- 							<a href="#" class="img-holder"><img class="img-responsive" src="../images/img-3.jpg" alt="Free HTML5 Website Template by freehtml5.co"></a> -->
<!-- 							<div class="desc"> -->
<!-- 								<h3><a href="#">Biblical Counseling</a></h3> -->
<!-- 								<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p> -->
<!-- 								<a href="#">Read More <i class="icon-arrow-right3"></i></a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-4 animate-box"> -->
<!-- 						<div class="services"> -->
<!-- 							<a href="#" class="img-holder"><img class="img-responsive" src="../images/img-2.jpg" alt="Free HTML5 Website Template by freehtml5.co"></a> -->
<!-- 							<div class="desc"> -->
<!-- 								<h3><a href="#">Helping Children</a></h3> -->
<!-- 								<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p> -->
<!-- 								<a href="#">Read More <i class="icon-arrow-right3"></i></a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</section> -->
<!-- 	<!-- /////////////////////////////////////// 습득물 종료 /////////////////////////////////////// -->	
<!-- 	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->

<!-- 	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->
<!-- 	<!-- /////////////////////////////////////// 분실물 시작 /////////////////////////////////////// -->
<!-- 		<section id="portfolio" style="padding-top: 20px"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-lg-12 text-center"> -->
<!-- 						<div class="section-title"> -->
<!-- 							<h22 style="float: left">LOSTITEM</h22> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<p1 style="float: right"> -->
<!-- 					<a href=index.do>more ></a></p1> -->
<!-- 				</div> -->
				
<!-- 				church -->
<!-- 				<div class="row"> -->
<%-- 					<c:if test="${empty lostResult}"> --%>
<!-- 							<tr align="center" noshade> -->
<!-- 								<td colspan="5">데이터가 하나도 없음</td> -->
<!-- 							</tr> -->
<%-- 					</c:if> --%>
					
<%-- 					<c:forEach items="${lostResult}" var="lostitem" varStatus="status"> --%>
<!-- 						<div class="col-md-4 animate-box"> -->
<!-- 							<div class="services"> -->
<!-- 								<a href="#" class="img-holder"> -->
<%-- 								<c:if test="${empty loginuser && empty usercheck}"> <!-- 로그인 안되어있을때 로그인창으로--> --%>
<%-- 									<a href="login.do" class="img-holder">${lostitem.losub}</a> --%>
<%-- 								</c:if> --%>
<%-- 								<c:if test="${!empty loginuser && empty usercheck}"> <!-- 로그인 되어있을때 상세페이지 이동 가능--> --%>
<%-- 									<a href="#" class="img-holder">${lostitem.losub}</a> --%>
<%-- 								</c:if> --%>
<%-- 								<c:if test="${empty loginuser && !empty usercheck}"> <!-- 카카오로 로그인했는데 개인정보 등록 전일때 추가페이지 이동--> --%>
<%-- 									<a href="tempsignupform.do" class="img-holder">${lostitem.losub}</a> --%>
<%-- 								</c:if> --%>
<%-- 								<img class="img-responsive" src="../images/lostitem/${lostpicResult[status.index].lopicname}" alt="분실물" > --%>
<!-- 								</a> -->
								
<!-- 									<div class="events-entry"> -->
<%-- 										<span class="date">${lostitem.lodate}</span> --%>
<!-- 										<h3> -->
<%-- 											<c:if test="${empty loginuser && empty usercheck}"> <!-- 로그인 안되어있을때 로그인창으로--> --%>
<%-- 												<a href="login.do">${lostitem.losub}</a> --%>
<%-- 											</c:if> --%>
<%-- 											<c:if test="${!empty loginuser && empty usercheck}"> <!-- 로그인 되어있을때 상세페이지 이동 가능--> --%>
<%-- 												<a href="#">${lostitem.losub}</a> --%>
<%-- 											</c:if> --%>
<%-- 											<c:if test="${empty loginuser && !empty usercheck}"> <!-- 카카오로 로그인했는데 개인정보 등록 전일때 추가페이지 이동--> --%>
<%-- 												<a href="tempsignupform.do">${lostitem.losub}</a> --%>
<%-- 											</c:if> --%>
<!-- 										</h3> -->
<%-- 										<p>${lostitem.loplace}</p> --%>
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 						</div> -->
<%-- 					</c:forEach> --%>
					
<!-- 					<div class="col-md-4 animate-box"> -->
<!-- 						<div class="services"> -->
<!-- 							<a href="#" class="img-holder"><img class="img-responsive" src="../images/img-3.jpg" alt="Free HTML5 Website Template by freehtml5.co"></a> -->
<!-- 							<div class="desc"> -->
<!-- 								<h3><a href="#">Biblical Counseling</a></h3> -->
<!-- 								<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p> -->
<!-- 								<a href="#">Read More <i class="icon-arrow-right3"></i></a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-4 animate-box"> -->
<!-- 						<div class="services"> -->
<!-- 							<a href="#" class="img-holder"><img class="img-responsive" src="../images/img-2.jpg" alt="Free HTML5 Website Template by freehtml5.co"></a> -->
<!-- 							<div class="desc"> -->
<!-- 								<h3><a href="#">Helping Children</a></h3> -->
<!-- 								<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p> -->
<!-- 								<a href="#">Read More <i class="icon-arrow-right3"></i></a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</section> -->
<!-- 	<!-- /////////////////////////////////////// 분실물 종료 /////////////////////////////////////// -->	
<!-- 	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->

	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->
	<!-- ////////////////////////////////////// footer 시작 ////////////////////////////////////// -->

		<footer>
			<section id="contact" class="dark-bg" style="padding: 20px">
				<div class="container">
					<div class="row">
						<div class="col-lg-12 text-center">
							<div class="section-title">
								<h2>Contact Us</h2>
								<p style="text-align: left">
									If you have some Questions or need Help! Please Contact Us!<br>We
									make Cool and Clean Design for your Business
								</p>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="section-text">
								<h4>Our Business Office</h4>
								<p>3422 Street, Barcelona 432, Spain, New Building North,
									15th Floor</p>
								<p>
									<i class="fa fa-phone"></i> +101 377 655 22125
								</p>
								<p>
									<i class="fa fa-envelope"></i> mail@yourcompany.com
								</p>
							</div>
						</div>
						<div class="col-md-4">
							<div class="section-text">
								<h4>Business Hours</h4>
								<p>
									<i class="fa fa-clock-o"></i> <span class="day">Weekdays:</span><span>9am
										to 8pm</span>
								</p>
								<p>
									<i class="fa fa-clock-o"></i> <span class="day">Saturday:</span><span>9am
										to 2pm</span>
								</p>
								<p>
									<i class="fa fa-clock-o"></i> <span class="day">Sunday:</span><span>Closed</span>
								</p>
							</div>
						</div>
					</div>
				</div>
			</section>
		</footer>
	<!-- ////////////////////////////////////// footer 종료 ////////////////////////////////////// -->	
	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->
		
		<!-- 스크롤이 맨위로 가는 4~5시방향 화살표 기능 -->
		<div class="gototop js-top"> 
			<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
		</div>
		
		<!-- Bootstrap core JavaScript -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/owl.carousel.min.js"></script>
		<script src="../js/cbpAnimatedHeader.js"></script>
		<script src="../js/jquery.appear.js"></script>
		<script src="../js/SmoothScroll.min.js"></script>
		<script src="../js/mooz.themes.scripts.js"></script>

	<!-- beryllium -->
		<script src="../js/beryllium/jquery.min.js"></script>
		<script src="../js/beryllium/jquery.easing.1.3.js"></script>
		<script src="../js/beryllium/bootstrap.min.js"></script>
		<script src="../js/beryllium/jquery.waypoints.min.js"></script>
		<script src="../js/beryllium/owl.carousel.min.js"></script>
		<script src="../js/beryllium/main.js"></script>
	
	<!-- 메뉴에서 누르면 바로밑에 뜨는 애들 -->
		<script type="text/javascript">
 		    $(function () {
 		  $('[data-tooltip="tooltip"]').tooltip()
 			});
		</script>
		
	</body>
</html>