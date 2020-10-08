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
		
		table.table-shopping-cart td:first-child, table.table-shopping-cart th:first-child {
			border-left:0;
			border-right:0;
		}
		
		.container2 * {
		    margin: 0;
		    padding: 0;
		    list-style: none;
		    border: 0;
		    text-decoration: none;
		    font-family: "NanumBarunGothic" , "Malgun Gothic" , sans-serif;
		    letter-spacing: -0.03em;
		}
		
		.con_title {
		    font-size: 34px;
		    color: #333;
		    margin-top: 60px;
		    width: 100%;
		    float: left;
		    margin-bottom: 30px;
		    height: 40px;
		}
		
		input {
		    -webkit-writing-mode: horizontal-tb !important;
		    text-rendering: auto;
		    color: -internal-light-dark(black, white);
		    word-spacing: normal;
		    text-transform: none;
		    text-indent: 0px;
		    text-shadow: none;
		    display: inline-block;
		    text-align: start;
		    appearance: textfield;		    
		}
		.contents_wrap {
		    width: 930px;
		    float: left;
		    height: 100%;
		    overflow: auto;
		    zoom: 1;
		}
		
		.page_numb {
		    float: left;
		    width: 100%;
		    margin-top: 30px;
		    padding-bottom: 180px;
		    text-align: center;
		}
		.news_board {
		    width: 100%;
		    float: left;
		    border-top: 1px solid #c8c8d5;
		    margin-top: 30px;
		}
		div {
		    display: block;
		    overflow: auto;
		    zoom: 1;
		}
		
		li {
		    display: list-item;
		    text-align: -webkit-match-parent;
		}
		.news_board ul li {
		    float: left;
		    width: 903px;
		    padding-left: 27px;
		    position: relative;
 		    line-height: 69px;
		    height: 68px;
		    border-bottom: 1px solid #e3e3e3;
		    font-size: 16px;
		    color: #333;
		}
		.heart_date {
		    position: absolute;
		    top: 34px;
    		right: 35px;
		}
		.heart_date dl dd {
		    float: left;
		    margin-top: 4px;
		    color: #aaa;
		    font-size: 12px;
		    font-family: "Tahoma";
		}
		.heart_date dl dt {
		    float: left;
		    margin-right: 5px;
		    margin-top: 3px;
		}
		dt {
		    display: block;
		}
		.news_board ul li a {
		    color: #333;
		    float: left;
		    line-height: 69px;
		}
		.news_board ul li div.heart_date {
		    top: 0;
		    right: 0;
		    width: 110px;
		}
		.fix_sort {
		    float: right;
		    padding: 0 10px 0 10px !important;
		    font-size: 13px;
		    color: #333;
		    height: 38px;
		    line-height: 38px;
		    border: 1px solid #e3e3e3;
		    border-right: 0;
		    margin-top: 16px;
		    min-width: 67px;
		    position: relative;
		    background: none !important;
		    text-align: center;
		}
		.sort_wrap a {
		    width: 100%;
		    float: left;
		    color: #666;
		    padding-right: 30px;
		    font-weight: normal;
		}
		.word_input input {
		    height: 38px;
		    line-height: 38px;
		    background-color: #fff;
		    border: 1px solid #e3e3e3;
		    padding: 0 29px 0 20px;
		    float: left;
		}
		.word_input {
		    float: right;
		    position: relative;
		    margin-top: 16px;
		}
		.word_input span.btn2 {
		    position: absolute;
		    right: 8px;
		    top: -5px;
		    height: 21px;
		}
		.sort_wrap {
		    float: right;
		    padding: 0 30px 0 10px;
		    font-size: 13px;
		    color: #333;
		    height: 38px;
		    line-height: 38px;
		    border: 1px solid #e3e3e3;
		    border-right: 0;
		    margin-top: 16px;
		    background: url(https://ssl.nx.com/s2/game/maplestory/renewal/common/search_down_bg.jpg) #fff right center no-repeat;
		    min-width: 67px;
		    position: relative;
		}
		
		input {
		    -webkit-writing-mode: horizontal-tb !important;
		    text-rendering: auto;
		    color: -internal-light-dark(black, white);
		    letter-spacing: normal;
		    word-spacing: normal;
		    text-transform: none;
		    text-indent: 0px;
		    text-shadow: none;
		    display: inline-block;
		    text-align: start;
		    appearance: textfield;
		    background-color: -internal-light-dark(rgb(255, 255, 255), rgb(59, 59, 59));
		    -webkit-rtl-ordering: logical;
		    cursor: text;
		    margin: 0em;
		    font: 400 13.3333px Arial;
		    padding: 1px 2px;
		    border-width: 2px;
		    border-style: inset;
		    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(195, 195, 195));
		    border-image: initial;
		}
		a{
			color: #868e96;
		}
		.cm_write {
		    float: right;
		    text-align: right;
		    width: auto;
		    margin-top: 15px;
		    margin-right: 15px;
		}
		.btn02_b {
		    min-width: 53px;
		    font-size: 16px;
		    color: #fff !important;
		    text-align: center;
		    background-color: #455d9d;
		    border-radius: 2px;
		    padding: 10px 14px 10px 14px;
		    border: 1px solid #455d9d;
		    display: inline-block;
		    line-height: 1;
		}
	</style>
	
	<script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script type="text/javascript">	

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
					<a href="domain.do" class="logo">
						<img src="../images/coza/icons/logo-01.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li class="active-menu">
								<a href="../gxsx/domain.do">Home</a>
							</li>

							<li>
								<a href="../gxsx/notice.do">Notice</a>
							</li>

							<li class="label1" data-label1="습득물">
								<a href="../finditem/list.do?cp=1">Finditem</a>
							</li>

							<li class="label1" data-label1="분실물">
								<a href="../lostitem/list.do?cp=1">Lostitem</a>
							</li>

							<li>
								<a href="../Question/list.do">Contact</a>
							</li>
						</ul>
					</div>	

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						<ul class="main-menu">					
							<c:if test="${ empty loginuser && empty klogin}">
									<li><i class="zmdi zmdi-account-circle"></i>
										<a href="../gxsx/login.do">Login</a></li>
							</c:if>
							<c:if test="${ !empty loginuser }">
								<li class="dropdown">
							        <li class="dropdown">
							          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="ti-bell"></i>(<b>${messageResult.size()}</b>)</a>
							          <ul class="dropdown-menu notify-drop" style="right:350px">
							            <div class="drop-content" data-tooltip="tooltip" data-placement="top">
							           		<c:forEach items="${messageResult}" var="messageResult" varStatus="status" begin="0" end="4">
								            	<li><div class="col-md-9 col-sm-9 col-xs-9 pd-l0" style="margin-left:15px;min-width:250px">
								            		<a href="">${messageResult.qsub}</a>
								            		<p style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 250px">${messageResult.qcon}</p>
								            		<p class="time">답변완료</p></div>
								            	</li>
							            	</c:forEach>
							             </div>
						          	</ul>
						        </li>
							</li>
						</c:if>
								
						<c:if test="${ !empty loginuser || (!empty klogin && !empty kakaologout_url) }">
							<li class="dropdown">
					          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="ti-user"></i></a>
					          <ul class="dropdown-menu notify-drop" style="min-width:150px">
					            <div class="drop-content" data-tooltip="tooltip" data-placement="top" style="min-height:50px; overflow:hidden">							            
					            	<li><div>&nbsp;&nbsp;
						            		<i class="ti-bookmark-alt"></i>&nbsp;<a href="../Users/mypage.do">Myboard</a>
					            		</div></li>
					            	<li><div>&nbsp;&nbsp;
						            		<i class="ti-headphone-alt"></i>&nbsp;<a href="../Question/list.do">Contact</a>
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
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('../images/coza/bg-02.jpg');margin-top:-40px">
		<h2 class="ltext-105 cl0 txt-center">
			Notice
		</h2>
	</section>

	<!-- Content page -->
	<section class="bg0 p-t-62 p-b-60">
		<div class="container" style="padding-left:110px">
			<!-- d -->
			<div class="contents_wrap" >
                <h1 class="con_title">공지사항
                    <div style="float:right;">
                        <span class="word_input" style="margin-top:0;">
                            <input type="text" name="search_text" value="">
                            <span class="btn2"><a href="#a" onmouseover="ch_png_on(this)" onmouseout="ch_png_off(this)"><img src="https://ssl.nx.com/s2/game/maplestory/renewal/common/board_top_search_btn_off.png" alt=""></a></span>
                        </span>
                        <span class="sort_wrap fix_sort" style="margin-top:0;">
                            <a href="#a" class="cus_sel_a">제목</a>
                        </span>
                    </div>
                </h1>
                    	<div></div><div></div>

                       <div class="news_board">
                           <!-- notice ul str -->
                           <ul>
                               <!--게시물 Loop : Str-->
                               <c:forEach items="${noticeList}" var="notice" varStatus="status">
                                   <li>
										<p>
											<a href="../gxsx/noticeCon.do?nono=${notice.nono}">
                                             <em><img src="https://ssl.nx.com/s2/game/maplestory/renewal/common/${notice.nocate}.png"></em>
                                              <span>&emsp;${notice.nosub}</span>
                                              <c:if test="${today==notice.nodate}">
                                                <img class="new" alt="" src="https://ssl.nx.com/s2/game/maplestory/renewal/common/new.png">
                                              </c:if>
											</a>
										</p>
                                       <div class="heart_date">
                                           <dl>
                                               <dt><img src="https://ssl.nx.com/s2/game/maplestory/renewal/common/sub_date_new.png" alt="시계 아이콘"></dt>
                                               <dd>${notice.nodate}</dd>
                                           </dl>
                                       </div>
                                   </li>
                                </c:forEach>
                                <c:if test="${user=='관리자'}">
                                	<span class="cm_write"><a class="btn02_b" href="../gxsx/noticeForm.do">글작성</a></span>
                                </c:if>
                           </ul>
                           
                           
                           <!-- notice ul end -->

							<div class="page_numb">
							    <span class="cm_prev">
							            <a><img src="https://ssl.nx.com/s2/game/maplestory/renewal/common/cm_prev.png" alt="이전"></a>
							    </span>
					                <a class="active">1</a>
					                <a href="/News/Notice/All?page=2">2</a>
					                <a href="/News/Notice/All?page=3">3</a>
					                <a href="/News/Notice/All?page=4">4</a>
					                <a href="/News/Notice/All?page=5">5</a>
							    <span class="cm_next">
							            <a href="/News/Notice/All?page=2"><img src="https://ssl.nx.com/s2/game/maplestory/renewal/common/cm_next.png" alt="다음"></a>
							    </span>
							</div>
                            
						</div>
				</div>
			
			<!-- d -->
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