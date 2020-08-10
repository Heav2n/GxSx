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
	<body id="page-top">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header page-scroll">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand page-scroll" href="#page-top"><img src="../images/logo.png" alt="Sanza theme logo"></a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="hidden">
							<a href="#page-top"></a>
						</li>
						<li>
							<a class="page-scroll" href="#notice">Notice</a>
						</li>
						<li>
							<a class="page-scroll" href="#lostitem">Lostitem</a>
						</li>
						<li>
							<a class="page-scroll" href="#finditem">Finditem</a>
						</li>
						<li>
							<a class="page-scroll" href="#mypage">Mypage</a>
						</li>
						<li>
							<a class="page-scroll" href="#support">Support</a>
						</li>
						<li>
							<a class="page-scroll" href="login.do">Login</a>
						</li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		
   <!-- ******************************************************************************************** -->
   <!-- ******************************************************************************************** -->
   <!-- ******************************************************************************************** -->



		<section id="portfolio" style="padding-bottom:30px; margin-top:100px">
			<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title" >
						<h21 style="float: left">FINDITEM</h21>
					</div>                    
				</div>
                <p1 style="float: right"><a href=index.do>more ></a></p1>
			</div>
                
			<div class="row row-0-gutter" style="padding-top:10px">                
				<!-- start portfolio item -->
				<c:if test="${empty lostResult}">
					<tr align="center" noshade>
						<td colspan="5">데이터가 하나도 없음</td>
					</tr>
				</c:if>
			<c:forEach items="${lostResult}" var="lostitem" varStatus="status">
				<div class="col-md-4 col-0-gutter">
					<div class="ot-portfolio-item">
						<figure class="effect-bubba">
							<img src="../images/lostitem/${lostpicResult[status.index].lopicname}" alt="img02" class="img-responsive" />
							<figcaption>
								<h2>${lostitem.losub}</h2>
								<p>${lostitem.loplace}</p>
								<a href="#" data-toggle="modal" data-target="#"+"${lostitem.losub}">View more</a>
							</figcaption>
						</figure>
					</div>
				</div>
			</c:forEach>
				<!-- end portfolio item -->				
			</div>
			</div><!-- end container -->
		</section>
		
         
<!--         <div id="kakao_id_login" style="text-align: center">  -->
<%--         <a href="${kakao_url}">  --%>
<!--         <img width="223" src="../images/logo.png" /></a>  -->
<!--         </div> -->
   <!-- ******************************************************************************************** -->
   <!-- ******************************************************************************************** -->
   <!-- ******************************************************************************************** -->
        
        <section id="portfolio" style="padding-top:20px">
			<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title" >
						<h22 style="float: left">LOSTITEM</h22>
					</div>                    
				</div>
                <p1 style="float: right"><a href=index.do>more ></a></p1>
			</div>
                
			<div class="row row-0-gutter" style="padding-top:10px">                
				<!-- start portfolio item -->
				<div class="col-md-4 col-0-gutter">
					<div class="ot-portfolio-item">
						<figure class="effect-bubba">
							<img src="images/demo/portfolio-1.jpg" alt="img02" class="img-responsive" />
							<figcaption>
								<h2>Dean & Letter</h2>
								<p>Branding, Design</p>
								<a href="#" data-toggle="modal" data-target="#Modal-1">View more</a>
							</figcaption>
						</figure>
					</div>
				</div>
				<!-- end portfolio item -->
				<!-- start portfolio item -->
				<div class="col-md-4 col-0-gutter">
					<div class="ot-portfolio-item">
						<figure class="effect-bubba">
							<img src="images/demo/portfolio-2.jpg" alt="img02" class="img-responsive" />
							<figcaption>
								<h2>Startup Framework</h2>
								<p>Branding, Web Design</p>
								<a href="#" data-toggle="modal" data-target="#Modal-2">View more</a>
							</figcaption>
						</figure>
					</div>
				</div>
				<!-- end portfolio item -->
				<!-- start portfolio item -->
				<div class="col-md-4 col-0-gutter">
					<div class="ot-portfolio-item">
						<figure class="effect-bubba">
							<img src="images/demo/portfolio-3.jpg" alt="img02" class="img-responsive" />
							<figcaption>
								<h2>Lamp & Velvet</h2>
								<p>Branding, Web Design</p>
								<a href="#" data-toggle="modal" data-target="#Modal-3">View more</a>
							</figcaption>
						</figure>
					</div>
				</div>
				<!-- end portfolio item -->
			</div>
			</div><!-- end container -->
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
							<p style="text-align:left">If you have some Questions or need Help! Please Contact Us!<br>We make Cool and Clean Design for your Business</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="section-text">
							<h4>Our Business Office</h4>
							<p>3422 Street, Barcelona 432, Spain, New Building North, 15th Floor</p>
							<p><i class="fa fa-phone"></i> +101 377 655 22125</p>
							<p><i class="fa fa-envelope"></i> mail@yourcompany.com</p>
						</div>
					</div>
					<div class="col-md-4">
						<div class="section-text">
							<h4>Business Hours</h4>
							<p><i class="fa fa-clock-o"></i> <span class="day">Weekdays:</span><span>9am to 8pm</span></p>
							<p><i class="fa fa-clock-o"></i> <span class="day">Saturday:</span><span>9am to 2pm</span></p>
							<p><i class="fa fa-clock-o"></i> <span class="day">Sunday:</span><span>Closed</span></p>
						</div>
					</div>
				</div>
			</div>
		</section>
		</footer>

		<!-- Modal for portfolio item 1 -->
		<div class="modal fade" id="Modal-1" tabindex="-1" role="dialog" aria-labelledby="Modal-label-1">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="Modal-label-1">${lostResult[0].losub}</h4>
					</div>
					<div class="modal-body">
						<img src="../images/lostitem/${lostpicResult[0].lopicname}" alt="img01" class="img-responsive" />
						<div class="modal-works"><span>${lostResult[0].lodate}</span><span>${lostResult[0].loplace}</span></div>
						<p>${lostResult[0].locon}</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal for portfolio item 2 -->
		<div class="modal fade" id="Modal-2" tabindex="-1" role="dialog" aria-labelledby="Modal-label-1">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="Modal-label-1">${lostResult[0].losub}</h4>
					</div>
					<div class="modal-body">
						<img src="../images/lostitem/${lostpicResult[0].lopicname}" alt="img01" class="img-responsive" />
						<div class="modal-works"><span>${lostResult[0].lodate}</span><span>${lostResult[0].loplace}</span></div>
						<p>${lostResult[0].locon}</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal for portfolio item 3 -->
		<div class="modal fade" id="Modal-3" tabindex="-1" role="dialog" aria-labelledby="Modal-label-3">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="Modal-label-3">Lamp & Velvet</h4>
					</div>
					<div class="modal-body">
						<img src="images/demo/portfolio-3.jpg" alt="img01" class="img-responsive" />
						<div class="modal-works"><span>Branding</span><span>Web Design</span></div>
						<p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Bootstrap core JavaScript
			================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/owl.carousel.min.js"></script>
		<script src="../js/cbpAnimatedHeader.js"></script>
		<script src="../js/jquery.appear.js"></script>
		<script src="../js/SmoothScroll.min.js"></script>
		<script src="../js/mooz.themes.scripts.js"></script>
	</body>
</html>
	
</body>
</html>