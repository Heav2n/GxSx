<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="description" content="">
		<meta name="author" content="">
		
	<!-- beryllium -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
		<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
		<meta name="author" content="FreeHTML5.co" />
		
		<link href="https://fonts.googleapis.com/css?family=Merriweather:300,400|Montserrat:400,700" rel="stylesheet">
	
		<!-- Animate.css -->
		<link rel="stylesheet" href="../css/beryllium/animate.css">
		<!-- Icomoon Icon Fonts-->
		<link rel="stylesheet" href="../css/beryllium/icomoon.css">
		<!-- Themify Icons-->
		<link rel="stylesheet" href="../css/beryllium/themify-icons.css">
		<!-- Bootstrap  -->
		<link rel="stylesheet" href="../css/beryllium/bootstrap.css">
	
		<!-- Owl Carousel  -->
		<link rel="stylesheet" href="../css/beryllium/owl.carousel.min.css">
		<link rel="stylesheet" href="../css/beryllium/owl.theme.default.min.css">
	
		<!-- Theme style  -->
		<link rel="stylesheet" href="../css/beryllium/style.css">
	
		<!-- Modernizr JS -->
		<script src="../js/beryllium/modernizr-2.6.2.min.js"></script>
	<!-- /beryllium -->
	
	<!-- church -->
		<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Libre+Baskerville:400,400i,700" rel="stylesheet"
		>
		
		<!-- Animate.css -->
		<link rel="stylesheet" href="../css/church/animate.css">
		<!-- Icomoon Icon Fonts-->
		<link rel="stylesheet" href="../css/church/icomoon.css">
		<!-- Bootstrap  -->
		<link rel="stylesheet" href="../css/church/bootstrap.css">
	
		<!-- Magnific Popup -->
		<link rel="stylesheet" href="../css/church/magnific-popup.css">
	
		<!-- Flexslider  -->
		<link rel="stylesheet" href="../css/church/flexslider.css">
	
		<!-- Owl Carousel  -->
		<link rel="stylesheet" href="../css/church/owl.carousel.min.css">
		<link rel="stylesheet" href="../css/church/owl.theme.default.min.css">
	
		<!-- Theme style  -->
		<link rel="stylesheet" href="../css/church/style.css">
	
		<!-- Modernizr JS -->
		<script src="../js/church/modernizr-2.6.2.min.js"></script>
	<!-- /church -->
	
		<link rel="icon" href="favicon.ico">
		<title>Sanza - Onepage Multipurpose Bootstrap HTML by MOOZThemes.com</title>
		<!-- Bootstrap core CSS -->
		<link href="../css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<!-- Custom styles for this template -->
		<link href="../css/owl.carousel.css" rel="stylesheet">
		<link href="../css/owl.theme.default.min.css"  rel="stylesheet">
		<link href="../css/style.css" rel="stylesheet">
	</head>
	
	<body>
	<!--  berryllium 맨위 메뉴-->
		<div class="gtco-loader"></div>
		<div id="page">
	
			<nav class="gtco-nav" role="navigation">
				<div class="gtco-container">
	
					<div class="row">
						<div class="col-sm-2 col-xs-12">
							<div id="gtco-logo">
								<a href="domain.do">Beryllium
							</div>
						</div>
						<div class="col-xs-10 text-right menu-1">
							<ul>
								<li class="active"><a href="domain.do">Home</a></li>
								<li><a href="notice.do">Notice</a></li>
								<li class="has-dropdown"><a href="finditem.do">FindItem</a>
									<ul class="dropdown">
										<li><a href="#">Web Design</a></li>
										<li><a href="#">eCommerce</a></li>
										<li><a href="#">Branding</a></li>
										<li><a href="#">API</a></li>
									</ul></li>
								<li class="has-dropdown"><a href="lostitem.do">LostItem</a>
									<ul class="dropdown">
										<li><a href="#">HTML5</a></li>
										<li><a href="#">CSS3</a></li>
										<li><a href="#">Sass</a></li>
										<li><a href="#">jQuery</a></li>
									</ul></li>
								<li><a href="contact.do">Contact</a></li>
								<c:if test="${ empty Users}">
									<li><a href="login.do">Login</a></li>
								</c:if>
								<c:if test="${ !empty Users}">
									<li><a href="logout.do">Logout</a></li>
								</c:if>
							</ul>
						</div>
					</div>
	
				</div>
			</nav>
			
		<!-- /berryllium -->	
		
		<!-- berryllium 메뉴 바로 밑  사진 -->
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
		<!-- /berryllium -->
		
		<!-- 습득물******************************************************************************************** -->
		<!-- ******************************************************************************************** -->
		<section id="portfolio"
			style="padding-bottom: 30px; margin-top: 10px">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="section-title">
							<h21 style="float: left">FINDITEM</h21>
						</div>
					</div>
					<p1 style="float: right">
					<a href=index.do>more ></a></p1>
				</div>
				
				<!-- church -->
				<div class="row">
				<c:if test="${empty lostResult}">
						<tr align="center" noshade>
							<td colspan="5">데이터가 하나도 없음</td>
						</tr>
				</c:if>
				<c:forEach items="${lostResult}" var="lostitem" varStatus="status">
					<div class="col-md-4 animate-box">
						<div class="services">
							<a href="#" class="img-holder"><img class="img-responsive" src="../images/lostitem/${lostpicResult[status.index].lopicname}" alt="분실물" ></a>
								<div class="events-entry">
									<span class="date">${lostitem.lodate}</span>
									<h3>
										<a href="#">${lostitem.losub}</a>
									</h3>
									<p>${lostitem.loplace}</p>
								</div>
							</div>
					</div>
				</c:forEach>
				<div class="col-md-4 animate-box">
					<div class="services">
						<a href="#" class="img-holder"><img class="img-responsive" src="../images/img-3.jpg" alt="Free HTML5 Website Template by freehtml5.co"></a>
						<div class="desc">
							<h3><a href="#">Biblical Counseling</a></h3>
							<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
							<a href="#">Read More <i class="icon-arrow-right3"></i></a>
						</div>
					</div>
				</div>
				<div class="col-md-4 animate-box">
					<div class="services">
						<a href="#" class="img-holder"><img class="img-responsive" src="../images/img-2.jpg" alt="Free HTML5 Website Template by freehtml5.co"></a>
						<div class="desc">
							<h3><a href="#">Helping Children</a></h3>
							<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
							<a href="#">Read More <i class="icon-arrow-right3"></i></a>
						</div>
					</div>
				</div>
			</div>
			<!-- /church -->
			
				</div>
			</div>
			<!-- end container -->
		</section>


		<!--         <div id="kakao_id_login" style="text-align: center">  -->
		<%--         <a href="${kakao_url}">  --%>
		<!--         <img width="223" src="../images/logo.png" /></a>  -->
		<!--         </div> -->

		<!-- 분실물******************************************************************************************** -->
		<!-- ******************************************************************************************** -->

		<section id="portfolio" style="padding-top: 20px">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="section-title">
							<h22 style="float: left">LOSTITEM</h22>
						</div>
					</div>
					<p1 style="float: right">
					<a href=index.do>more ></a></p1>
				</div>

				<div class="row row-0-gutter" style="padding-top: 10px">
					<!-- start portfolio item -->
					<div class="col-md-4 col-0-gutter">
						<div class="ot-portfolio-item">
							<figure class="effect-bubba">
								<img src="images/demo/portfolio-1.jpg" alt="img02"
									class="img-responsive" />
								<figcaption>
									<h2>Dean & Letter</h2>
									<p>Branding, Design</p>
									<a href="#" data-toggle="modal" data-target="#Modal-1">View
										more</a>
								</figcaption>
							</figure>
						</div>
					</div>
					<!-- end portfolio item -->
					<!-- start portfolio item -->
					<div class="col-md-4 col-0-gutter">
						<div class="ot-portfolio-item">
							<figure class="effect-bubba">
								<img src="images/demo/portfolio-2.jpg" alt="img02"
									class="img-responsive" />
								<figcaption>
									<h2>Startup Framework</h2>
									<p>Branding, Web Design</p>
									<a href="#" data-toggle="modal" data-target="#Modal-2">View
										more</a>
								</figcaption>
							</figure>
						</div>
					</div>
					<!-- end portfolio item -->
					<!-- start portfolio item -->
					<div class="col-md-4 col-0-gutter">
						<div class="ot-portfolio-item">
							<figure class="effect-bubba">
								<img src="images/demo/portfolio-3.jpg" alt="img02"
									class="img-responsive" />
								<figcaption>
									<h2>Lamp & Velvet</h2>
									<p>Branding, Web Design</p>
									<a href="#" data-toggle="modal" data-target="#Modal-3">View
										more</a>
								</figcaption>
							</figure>
						</div>
					</div>
					<!-- end portfolio item -->
				</div>
			</div>
			<!-- end container -->
		</section>

		<!--<section class="dark-bg short-section stats-bar">
			<div class="container text-center">
				<div class="row">
					<div class="col-md-3 mb-sm-30">
						<div class="counter-item">
							<h2 class="stat-number" data-n="9">0</h2>
							<h6>awards</h6>
						</div>
					</div>
					<div class="col-md-3 mb-sm-30">
						<div class="counter-item">
							<h2 class="stat-number" data-n="167">0</h2>
							<h6>Clients</h6>
						</div>
					</div>
					<div class="col-md-3 mb-sm-30">
						<div class="counter-item">
							<h2 class="stat-number" data-n="6">0</h2>
							<h6>Team</h6>
						</div>
					</div>
					<div class="col-md-3 mb-sm-30">
						<div class="counter-item">
							<h2 class="stat-number" data-n="34">0</h2>
							<h6>Project</h6>
						</div>
					</div>
				</div>
			</div>
		</section>	ī�����ϴ°�~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->


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
		
		<div class="gototop js-top">
			<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
		</div>

		<!-- Bootstrap core JavaScript
			================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script
			src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/owl.carousel.min.js"></script>
		<script src="../js/cbpAnimatedHeader.js"></script>
		<script src="../js/jquery.appear.js"></script>
		<script src="../js/SmoothScroll.min.js"></script>
		<script src="../js/mooz.themes.scripts.js"></script>

	<!-- beryllium -->
		<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
		</div>
		<!-- jQuery -->
		<script src="../js/beryllium/jquery.min.js"></script>
		<!-- jQuery Easing -->
		<script src="../js/beryllium/jquery.easing.1.3.js"></script>
		<!-- Bootstrap -->
		<script src="../js/beryllium/bootstrap.min.js"></script>
		<!-- Waypoints -->
		<script src="../js/beryllium/jquery.waypoints.min.js"></script>
		<!-- Carousel -->
		<script src="../js/beryllium/owl.carousel.min.js"></script>
		<!-- Main -->
		<script src="../js/beryllium/main.js"></script>
	<!-- beryllium --></body>
</html>
	
</body>
</html>



