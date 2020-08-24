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
		
	<!-- -------------- -->
		<link rel="stylesheet" href="../css/styles/index2.scss">
		<link rel="stylesheet" href="../css/styles/index3.scss">
		<link rel="stylesheet" href="../css/styles/index4.scss">
		<link rel="stylesheet" href="../css/styles/index5.scss">
		
	<!-- popup -->
		<style> 
		/* 마스크 띄우기 */
		#mask {  
		    position:absolute;  
		    z-index:9000;  
		    background-color:#fff;  
		    display:none;  
		    left:0;
		    top:0;
		} 
		/* 팝업으로 뜨는 윈도우 css  */ 
		.window{
		    display: none;
		    position:relative;  
		    float:right;
		    right:2%;
		    bottom:20px;
		    margin-left: -500px;
		    width:300px;
		    height:400px;
		    background-color:#FFF;
		    z-index:10000; 
		    border-radius: 7px;
		    border: 0.5px solid #B5B5B5;
		    box-shadow: 0px 0px 7px 1px #B5B5B5;
		 }
		 
		 /*---------*/
      #loader {
        transition: all 0.3s ease-in-out;
        opacity: 1;
        visibility: visible;
        position: fixed;
        height: 100vh;
        width: 100%;
        background: #fff;
        z-index: 90000;
      }

      #loader.fadeOut {
        opacity: 0;
        visibility: hidden;
      }

      .spinner {
        width: 40px;
        height: 40px;
        position: absolute;
        top: calc(50% - 20px);
        left: calc(50% - 20px);
        background-color: #333;
        border-radius: 100%;
        -webkit-animation: sk-scaleout 1.0s infinite ease-in-out;
        animation: sk-scaleout 1.0s infinite ease-in-out;
      }

      @-webkit-keyframes sk-scaleout {
        0% { -webkit-transform: scale(0) }
        100% {
          -webkit-transform: scale(1.0);
          opacity: 0;
        }
      }

      @keyframes sk-scaleout {
        0% {
          -webkit-transform: scale(0);
          transform: scale(0);
        } 100% {
          -webkit-transform: scale(1.0);
          transform: scale(1.0);
          opacity: 0;
        }
      }
		 
		</style>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript"> 
		//<![CDATA[
		    function wrapWindowByMask(){
		 
		        //화면의 높이와 너비를 구한다.
		        var maskHeight = $(document).height();  
		        var maskWidth = $(window).width();  
		 
		        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		        $("#mask").css({"width":maskWidth,"height":maskHeight});  
		 
		        //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
		 
		        $("#mask").fadeIn(0);      
		        $("#mask").fadeTo("slow",0.0);    
		 
		        //윈도우 같은 거 띄운다.
		        $(".window").show();
		 
		    }
		 
		    $(document).ready(function(){
		        //검은 막 띄우기
		        $(".openMask").click(function(e){
		            e.preventDefault();
		            wrapWindowByMask();
		        });
		 
		        //닫기 버튼을 눌렀을 때
		        $(".window .close").click(function (e) {  
		            //링크 기본동작은 작동하지 않도록 한다.
		            e.preventDefault();  
		            $("#mask, .window").hide();  
		        });       
		 
		        //검은 막을 눌렀을 때
		        $("#mask").click(function () {  
		            $(this).hide();  
		            $(".window").hide();  
		 
		        });      
		 
		    });
		 
		//]]>
		</script>
	<!-- /popup -->
		
		<script>
			window.addEventListener('load', function load() {
				const loader = document.getElementById('loader');
				setTimeout(function() {
					loader.classList.add('fadeOut');
				}, 300);
			});
		</script>
		
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
<!-- 						<div class="col-xs-10 text-right menu-1"> -->
<!-- 							<ul> -->
<!-- 								<li class="active"><a href="domain.do">Home</a></li> -->
<!-- 								<li><a href="notice.do">Notice</a></li> -->
<!-- 								<li class="has-dropdown"><a href="finditem.do">FindItem</a> -->
<!-- 									<ul class="dropdown"> -->
<!-- 										<li><a href="#">Web Design</a></li> -->
<!-- 										<li><a href="#">eCommerce</a></li> -->
<!-- 										<li><a href="#">Branding</a></li> -->
<!-- 										<li><a href="#">API</a></li> -->
<!-- 									</ul> -->
<!-- 								</li> -->
<!-- 								<li class="has-dropdown"><a href="lostitem.do">LostItem</a> -->
<!-- 									<ul class="dropdown"> -->
<!-- 										<li><a href="#">HTML5</a></li> -->
<!-- 										<li><a href="#">CSS3</a></li> -->
<!-- 										<li><a href="#">Sass</a></li> -->
<!-- 										<li><a href="#">jQuery</a></li> -->
<!-- 									</ul> -->
<!-- 								</li> -->
<!-- 								<li><a href="contact.do">Contact</a></li> -->
<!-- 								<li class="has-dropdown"><a href="#" class="openMask">Mypage</a> -->
<!-- 									<ul class="dropdown"> -->
<!-- 										<li><a href="myboard.do">Myboard</a></li> -->
<!-- 										<li><a href="modifyform.do">Modify</a></li> -->
<!-- 									</ul> -->
<!-- 								</li> -->
<%-- 								<c:if test="${ empty loginuser && empty klogin}"> --%>
<!-- 									<li><a href="login.do">Login</a></li> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test="${ !empty loginuser}"> --%>
<!-- 									<li><a href="logout.do">Logout</a></li> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test="${!empty klogin}"> --%>
<%-- 									<li><a href="${kakaologout_url}">Logout</a></li> --%>
<%-- 								</c:if> --%>

									
<!-- 							</ul> -->
<!-- 						</div> -->

							<!-- ### $Topbar ### -->
        <div class="header navbar">
          <div class="header-container">
            <ul class="nav-left">
              <li>
                <a id='sidebar-toggle' class="sidebar-toggle" href="javascript:void(0);">
                  <i class="ti-menu"></i>
                </a>
              </li>
              <li class="search-box">
                <a class="search-toggle no-pdd-right" href="javascript:void(0);">
                  <i class="search-icon ti-search pdd-right-10"></i>
                  <i class="search-icon-close ti-close pdd-right-10"></i>
                </a>
              </li>
              <li class="search-input">
                <input class="form-control" type="text" placeholder="Search...">
              </li>
            </ul>
            <ul class="nav-right">
              <li class="notifications dropdown">
                <span class="counter bgc-red">3</span>
                <a href="" class="dropdown-toggle no-after" data-toggle="dropdown">
                  <i class="ti-bell"></i>
                </a>

                <ul class="dropdown-menu">
                  <li class="pX-20 pY-15 bdB">
                    <i class="ti-bell pR-10"></i>
                    <span class="fsz-sm fw-600 c-grey-900">Notifications</span>
                  </li>
                  <li>
                    <ul class="ovY-a pos-r scrollable lis-n p-0 m-0 fsz-sm">
                      <li>
                        <a href="" class='peers fxw-nw td-n p-20 bdB c-grey-800 cH-blue bgcH-grey-100'>
                          <div class="peer mR-15">
                            <img class="w-3r bdrs-50p" src="https://randomuser.me/api/portraits/men/1.jpg" alt="">
                          </div>
                          <div class="peer peer-greed">
                            <span>
                              <span class="fw-500">John Doe</span>
                              <span class="c-grey-600">liked your <span class="text-dark">post</span>
                              </span>
                            </span>
                            <p class="m-0">
                              <small class="fsz-xs">5 mins ago</small>
                            </p>
                          </div>
                        </a>
                      </li>
                      <li>
                        <a href="" class='peers fxw-nw td-n p-20 bdB c-grey-800 cH-blue bgcH-grey-100'>
                          <div class="peer mR-15">
                            <img class="w-3r bdrs-50p" src="https://randomuser.me/api/portraits/men/2.jpg" alt="">
                          </div>
                          <div class="peer peer-greed">
                            <span>
                              <span class="fw-500">Moo Doe</span>
                              <span class="c-grey-600">liked your <span class="text-dark">cover image</span>
                              </span>
                            </span>
                            <p class="m-0">
                              <small class="fsz-xs">7 mins ago</small>
                            </p>
                          </div>
                        </a>
                      </li>
                      <li>
                        <a href="" class='peers fxw-nw td-n p-20 bdB c-grey-800 cH-blue bgcH-grey-100'>
                          <div class="peer mR-15">
                            <img class="w-3r bdrs-50p" src="https://randomuser.me/api/portraits/men/3.jpg" alt="">
                          </div>
                          <div class="peer peer-greed">
                            <span>
                              <span class="fw-500">Lee Doe</span>
                              <span class="c-grey-600">commented on your <span class="text-dark">video</span>
                              </span>
                            </span>
                            <p class="m-0">
                              <small class="fsz-xs">10 mins ago</small>
                            </p>
                          </div>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="pX-20 pY-15 ta-c bdT">
                    <span>
                      <a href="" class="c-grey-600 cH-blue fsz-sm td-n">View All Notifications <i class="ti-angle-right fsz-xs mL-10"></i></a>
                    </span>
                  </li>
                </ul>
              </li>
              <li class="notifications dropdown">
                <span class="counter bgc-blue">3</span>
                <a href="" class="dropdown-toggle no-after" data-toggle="dropdown">
                  <i class="ti-email"></i>
                </a>

                <ul class="dropdown-menu">
                  <li class="pX-20 pY-15 bdB">
                    <i class="ti-email pR-10"></i>
                    <span class="fsz-sm fw-600 c-grey-900">Emails</span>
                  </li>
                  <li>
                    <ul class="ovY-a pos-r scrollable lis-n p-0 m-0 fsz-sm">
                      <li>
                        <a href="" class='peers fxw-nw td-n p-20 bdB c-grey-800 cH-blue bgcH-grey-100'>
                          <div class="peer mR-15">
                            <img class="w-3r bdrs-50p" src="https://randomuser.me/api/portraits/men/1.jpg" alt="">
                          </div>
                          <div class="peer peer-greed">
                            <div>
                              <div class="peers jc-sb fxw-nw mB-5">
                                <div class="peer">
                                  <p class="fw-500 mB-0">John Doe</p>
                                </div>
                                <div class="peer">
                                  <small class="fsz-xs">5 mins ago</small>
                                </div>
                              </div>
                              <span class="c-grey-600 fsz-sm">
                                Want to create your own customized data generator for your app...
                              </span>
                            </div>
                          </div>
                        </a>
                      </li>
                      <li>
                        <a href="" class='peers fxw-nw td-n p-20 bdB c-grey-800 cH-blue bgcH-grey-100'>
                          <div class="peer mR-15">
                            <img class="w-3r bdrs-50p" src="https://randomuser.me/api/portraits/men/2.jpg" alt="">
                          </div>
                          <div class="peer peer-greed">
                            <div>
                              <div class="peers jc-sb fxw-nw mB-5">
                                <div class="peer">
                                  <p class="fw-500 mB-0">Moo Doe</p>
                                </div>
                                <div class="peer">
                                  <small class="fsz-xs">15 mins ago</small>
                                </div>
                              </div>
                              <span class="c-grey-600 fsz-sm">
                                Want to create your own customized data generator for your app...
                              </span>
                            </div>
                          </div>
                        </a>
                      </li>
                      <li>
                        <a href="" class='peers fxw-nw td-n p-20 bdB c-grey-800 cH-blue bgcH-grey-100'>
                          <div class="peer mR-15">
                            <img class="w-3r bdrs-50p" src="https://randomuser.me/api/portraits/men/3.jpg" alt="">
                          </div>
                          <div class="peer peer-greed">
                            <div>
                              <div class="peers jc-sb fxw-nw mB-5">
                                <div class="peer">
                                  <p class="fw-500 mB-0">Lee Doe</p>
                                </div>
                                <div class="peer">
                                  <small class="fsz-xs">25 mins ago</small>
                                </div>
                              </div>
                              <span class="c-grey-600 fsz-sm">
                                Want to create your own customized data generator for your app...
                              </span>
                            </div>
                          </div>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="pX-20 pY-15 ta-c bdT">
                    <span>
                      <a href="email.html" class="c-grey-600 cH-blue fsz-sm td-n">View All Email <i class="fs-xs ti-angle-right mL-10"></i></a>
                    </span>
                  </li>
                </ul>
              </li>
              <li class="dropdown">
                <a href="" class="dropdown-toggle no-after peers fxw-nw ai-c lh-1" data-toggle="dropdown">
                  <div class="peer mR-10">
                    <img class="w-2r bdrs-50p" src="https://randomuser.me/api/portraits/men/10.jpg" alt="">
                  </div>
                  <div class="peer">
                    <span class="fsz-sm c-grey-900">John Doe</span>
                  </div>
                </a>
                <ul class="dropdown-menu fsz-sm">
                  <li>
                    <a href="" class="d-b td-n pY-5 bgcH-grey-100 c-grey-700">
                      <i class="ti-settings mR-10"></i>
                      <span>Setting</span>
                    </a>
                  </li>
                  <li>
                    <a href="" class="d-b td-n pY-5 bgcH-grey-100 c-grey-700">
                      <i class="ti-user mR-10"></i>
                      <span>Profile</span>
                    </a>
                  </li>
                  <li>
                    <a href="email.html" class="d-b td-n pY-5 bgcH-grey-100 c-grey-700">
                      <i class="ti-email mR-10"></i>
                      <span>Messages</span>
                    </a>
                  </li>
                  <li role="separator" class="divider"></li>
                  <li>
                    <a href="" class="d-b td-n pY-5 bgcH-grey-100 c-grey-700">
                      <i class="ti-power-off mR-10"></i>
                      <span>Logout</span>
                    </a>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
					</div>
	
				</div>
			</nav>

		<!-- popup -->
			<div id ="wrap"> 
		        <div id = "container">  
		            <div id="mask"></div>
		            <div class="window">
		                <p style="width:280px;height:380px;margin:20px;text-align:center;vertical-align:middle;">
		                	팝업 내용 입력</br>mmsad</br><hr>
		                </p>
		                <p style="text-align:center; background:#ffffff;"><a href="#" class="close">닫기X</a></p>
		            </div>
		        </div>
		    </div>
		<!-- /popup -->
			
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
	<!-- beryllium -->
		
		<script scr="../js/scripts/sidebar/index.js"></script>
	</body>
</html>
	
</body>
</html>



