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
	</style>
	
	<script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script type="text/javascript">	
		$(function() {
			$("#MyQandA").on("click", function(){
				$.ajax({
				   url: "../Question/otherPageQu.json", 
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
								<c:choose>
								    <c:when test="${empty loginuser && !empty usercheck}">
								      <a href="../gxsx/tempsignupform.do">Contact</a>
								    </c:when>
								    <c:when test="${!empty loginuser && !empty usercheck}">
								      <a href="../gxsx/contact.do">Contact</a>
								    </c:when>						    
								    <c:otherwise>
								      <a href="../gxsx/login.do">Contact</a>
								    </c:otherwise>
								</c:choose>
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
							          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							          <i class="ti-bell"></i>(<b>${messageResult.size()}</b>)</a>
							           	<c:if test="${messageResult!='[]'}">
								           	<c:forEach items="${messageResult}" var="messageResult" varStatus="status" begin="0" end="4">
								           		<ul class="dropdown-menu notify-drop" style="right:350px">
								            		<div class="drop-content" data-tooltip="tooltip" data-placement="top">
									            	<li><div class="col-md-9 col-sm-9 col-xs-9 pd-l0" style="margin-left:15px;min-width:250px">
									            		<a href="../Question/questionco.do?qno=${messageResult.qno}">${messageResult.qsub}</a>
									            		<p style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 250px">${messageResult.qcon}</p>
									            		<p class="time">답변완료</p></div>
									            	</li>
									            	</div>
							          			</ul>
								            </c:forEach>
							            </c:if>
							             
							             <c:if test="${messageResult=='[]'}">
								           		<ul class="dropdown-menu notify-drop" style="right:350px;min-width:100px;max-height:30px">
								            		<div class="drop-content" data-tooltip="tooltip" data-placement="top" style="min-height:10px">
										            	<li><center><div class="col-md-9 col-sm-9 col-xs-9 pd-l0" style="margin-left:15px;">
										            		알람 없음</div></center>
										            	</li>
									            	</div>
									            </ul>
							             </c:if>
						            </li>
							    </li>
						    </c:if>
								
						<c:if test="${ !empty loginuser || !empty klogin }">
							<li class="dropdown">
					          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="ti-user"></i></a>
					          <ul class="dropdown-menu notify-drop" style="min-width:150px">
					            <div class="drop-content" data-tooltip="tooltip" data-placement="top" style="min-height:50px; overflow:hidden">							            
					            	<li><div>&nbsp;&nbsp;
											<i class="ti-bookmark-alt"></i>&nbsp;&nbsp;<a href="../Users/mypage.do">마이페이지</a>
					            		</div></li>
					            	<li><div>&nbsp;&nbsp;
					            			<i class="ti-headphone-alt"></i>&nbsp;&nbsp;<a href="../gxsx/contact.do">고객센터</a>
					            		</div></li>
					            	<li><div>&nbsp;&nbsp;
						            		<i class="ti-power-off"></i>
						            		<c:if test="${ empty loginuser && empty klogin}">
						            			&nbsp;<a href="">로그아웃</a>
						            		</c:if>
						            		<c:if test="${ !empty loginuser && empty kakaologout_url}">
												&nbsp;<a href="../gxsx/logout.do">로그아웃</a>
											</c:if>
											<c:if test="${!empty klogin && !empty kakaologout_url}">
												&nbsp;<a href="${kakaologout_url}">로그아웃</a>
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
								
								<ul id="question-paging" class="pagination" style="display:inline-flex">
								<li class="bor18" id="MyQandA">
								<tbody id="question">
									<a href="#" onclick="selectQuestionPage(1)"  class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										My Q&A
									</a>
								</tbody>	
								</li>
								</ul>
							</ul>
							<input id="currentPage" type="hidden" value="${questionPage.currentPage}">
							<input id="prevPage" type="hidden" value="${questionPage.currentPage}">
							<input id="startPage" type="hidden" value="${questionPage.startPage}">
							<input id="endPage" type="hidden" value="${questionPage.endPage}">
							<input id="rangeSize" type="hidden" value="${questionPage.rangeSize}">
							<input id="pageCount" type="hidden" value="${questionPage.pageCount}">
							
							
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
								<form id='questionco_form' name='input' method='post' action='../Question/reupdate.do' accept-charset='UTF-8'>
									<h4 class="mtext-105 cl2 txt-center p-b-30">
										1:1 문의 글 입니다
									</h4>
			
									<div class="bor8 m-b-20 how-pos4-parent">
										<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" id="txt1" name='qsub' value="${question.qsub}" readonly/>
										<input type="hidden" name="quid" id="quid" value="${loginuser.userid}" />
										<img class="how-pos4 pointer-none" src="../images/coza/icons/icon-email.png" alt="ICON">
									</div>
			
									<div class="bor8 m-b-30">
										<input class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" type="text" id="txt2" name="qcon" value="${question.qcon}" readonly/>
									</div>
									
									<div class="bor8 m-b-30">
										<input class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" type="text" id="txt3" name="qreply" value="${question.qreply}" readonly/>
									</div>
									<c:if test="${ admin}">									
										<div id="comment-input" class="container">
											<c:if test="${empty question.qreply}">
												<label for="content">관리자 댓글</label>
												<form action="reupdate.do" method="POST">
													<div class="input-group">
														<input type="hidden" id="qno" name="qno"
															value="${question.qno}" /> <input type="text"
															class="form-control" id="content" name="content"
															placeholder="내용을 입력하세요."> <span
															class="input-group-btn">
															<c:if test="${ admin }">
															<c:if test="${!empty sessionScope.loginuser}">
															<button class="btn btn-default" type="submit">등록</button>
															</c:if>
															</c:if>
														</span>
													</div>
												</form>
											</c:if>
										</div>
									</form>
								
								<c:if test="${!empty question.qreply}">
								<div id="comment_update_btn">
								<c:if test="${admin}">
      								<button class="btn btn-default" type="button" onclick="qreply('${question.qno}','${question.qreply}');">관리자 댓글 수정버튼</button>
    							</c:if>	
    							</div>
								</c:if>
								</c:if>
									
									<script>		
										function questionco_form() {
											if (confirm("관리자 댓글을 등록하시겠습니까??") == true) {
												document.getElementById(
														'questionco_form').submit();
											} else {
												return false;
											}
										}
									</script>
									
			

								</div>
			
							<div class="size-210 bor10 flex-w flex-col-m p-lr-93 p-tb-30 p-lr-15-lg w-full-md">
								<div class="flex-w w-full p-b-42">
									<span class="fs-18 cl5 txt-center size-211">
										<span class="lnr lnr-map-marker"></span>
									</span>
			
									<div class="size-212 p-t-2">
										<span class="mtext-110 cl2">
											주소
										</span>
			
										<p class="stext-115 cl6 size-213 p-t-18">
											비트캠프 3층 1강의실
										</p>
									</div>
								</div>
			
								<div class="flex-w w-full p-b-42">
									<span class="fs-18 cl5 txt-center size-211">
										<span class="lnr lnr-phone-handset"></span>
									</span>
			
									<div class="size-212 p-t-2">
										<span class="mtext-110 cl2">
											문의 전화
										</span>
			
										<p class="stext-115 cl1 size-213 p-t-18">
											앞뒤가 똑같은 1577
										</p>
									</div>
								</div>
			
								<div class="flex-w w-full">
									<span class="fs-18 cl5 txt-center size-211">
										<span class="lnr lnr-envelope"></span>
									</span>
			
									<div class="size-212 p-t-2">
										<span class="mtext-110 cl2">
											E-mali
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
								<a href="../gxsx/notice.do" class="stext-107 cl7 hov-cl1 trans-04">
									Notice
								</a>
							</li>
	
							<li class="p-b-10">
								<a href="../finditem/list.do?cp=1" class="stext-107 cl7 hov-cl1 trans-04">
									Finditem
								</a>
							</li>
	
							<li class="p-b-10">
								<a href="../lostitem/list.do?cp=1" class="stext-107 cl7 hov-cl1 trans-04">
									Lostitem
								</a>
							</li>	
						</ul> 
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						CONTACT US
					</h4>

					<p class="stext-107 cl7 size-201">
						<i class="fa fa-home"></i> 서울 마포구 백범로 23 구프라자 3층, 
						<br/>&nbsp;&nbsp;&nbsp; (지번)신수동 63-14 구프라자 3층
					</p>
					<p class="stext-107 cl7 size-201">
						<i class="fa fa-phone"></i> 02-707-1480
					</p>
					<p class="stext-107 cl7 size-201">
						<i class="fa fa-envelope"></i> javaoneteam@gmail.com
						
					</p>

					<div class="p-t-27">
						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-instagram"></i>
						</a>

						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-pinterest-p"></i>
						</a>
					</div>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						BUSINESS HOURS
					</h4>

					<p class="stext-107 cl7 size-201">
						<i class="fa fa-clock-o"></i> <span class="day">Weekdays : </span>
						<span>9am to 8pm</span>
					</p>
					<p class="stext-107 cl7 size-201">
						<i class="fa fa-clock-o"></i> <span class="day">Saturday &nbsp; : </span>
						<span>9am to 2pm</span>
					</p>
					<p class="stext-107 cl7 size-201">
						<i class="fa fa-clock-o"></i> <span class="day">Sunday &nbsp; &nbsp; : </span>
						<span>Closed</span>
					</p>
				</div>
			</div>

			<p class="stext-107 cl6 txt-center">
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | by Sansillyung <i class="fa fa-heart-o" aria-hidden="true"></i> 
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
<!-- ======question========================================================================================== -->
	<!-- 자바스크립트  -->
	<script src="../js/tempjs/question.js"></script>
	<!-- 자바스크립트  -->
	<script src="../js/tempjs/questionrepley.js"></script>
<!-- 수정버튼 안보이게하기! =================================================================== -->
	<script>
 
 
</script>	
</body>
</html>