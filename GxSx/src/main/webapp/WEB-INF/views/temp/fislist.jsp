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
		
		<!-- organi -->
		<link rel="stylesheet" href="../css/organi/elegant-icons.css">
		<!-- /organi -->
		
	<style>
		table, th, td {
		   border: 1px solid black;
		   border-collapse: collapse;
		}
		th, td {
		   padding: 5px;
		}
		a { text-decoration:none }
	</style>
	
	<script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script type="text/javascript">	
		$(function() {
			$("#btnsearch").on("click", function(){
				$.ajax({
				   url: "../finditem/search02.json", 
				   type: "POST",
				   dataType: "json",
				   data: { fisub: $("#fisub").val()},				
				   success: function(responseData){
				 //var jsObj = JSON.parse(responseData);
				 	
                   if(!responseData){
						  alert("존재하지 않는 name 임");
						  return false;
					  }
					  var html= "";
					  html += "<div class=\"row\">";
					  if(responseData.length != 0){
 						  for(var i=0; i<responseData.length; i++){
 							  html += "<div class=\"col-md-3 animate-box\">";
 							 	 html += "<div class=\"news\">";
 							 		 html += "<a href=\"#\" class=\"img-holder\"><img class=\"img-responsive\"";
 							 		 html += "src=\"../images/Findimgs/"+responseData[i].fipicname+"\" alt=\"image!!\"></a>";
 							 		 html += "<div class=\"desc\">";
 							  			html += "<span class=\"date\">"+responseData[i].fidate+"</span>";
 							  			html += "<h3><a href=\"#\">"+responseData[i].fisub+"</a></h3>";
 							  			html += "<p>"+responseData[i].ficon+"</p>";
 							  html += "</div></div></div>";
						  }
 					  }else{
 						  html += "<center>데이터가 하나도 없음</center>";
 					  }
  					  html += "</div>";
  						
  					  $("#fh5co-news").html(html);
				   }
			   });
		   });
		})//start-end
	</script>
</head>

<body>

	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->
	<!-- ////////////////////////////////////// 맨 위 메뉴 시작 ////////////////////////////////////// -->
		<div class="gtco-loader"></div>
		<div id="page"> <!-- 전체를 감싸는 div -->
	
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
								<li><a href="#">LostItem</a></li>
								
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
	<!-- ///////////////////////////////////// 메뉴 아래 사진 시작 ///////////////////////////////////// -->

		<section class="breadcrumb-section" style="background-image:url(../images/breadcrumb.jpg);background-size: cover">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12 text-center">
	                    <div class="breadcrumb__text">
	                        <h21 style="font-size: 34px;color:white; font-weight:900">FINDITEM</h21>	               
	                    </div>
	                </div>
	            </div>
	        </div>
   		 </section>  
	<!-- ///////////////////////////////////// 메뉴 아래 사진 시작 ///////////////////////////////////// -->
	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->
	 
	 <!-- ******************************************************************************************** -->
		<section id="portfolio"
			style="padding-bottom: 30px; margin-top: 10px">
			
		<!-- 본문 화살표 -->
			<a href="#" style="position:relative;left:130px;top:600px"><i class="icon-arrow-up"></i></a>
			<a href="#" style="position:relative;left:1350px;top:600px"><i class="icon-arrow-up"></i></a>
			
			<div class="container" style="margin-top: 100px">
			
        <!-- 카테고리분류 -->          
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-6 col-md-3">
                                <div class="featured__controls" style="margin-bottom:10px">
				                        <ul>
				                            <li class="active" data-filter="*">All</li>
				                            <li data-filter=".oranges">Oranges</li>
				                            <li data-filter=".fresh-meat">Fresh Meat</li>
				                            <li data-filter=".vegetables">Vegetables</li>
				                            <li data-filter=".fastfood">Fastfood</li>
				                        </ul>                                               
				                 </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
	                            <div class="filter__option">
	                                  &nbsp
	                            </div>
                            </div>
                            <div class="col-lg-2 col-md-3" >
                                <div class="filter__option" >
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                        
		<!-- 아이템 -->
		<div class="row">
			<div id="fh5co-news" class="fh5co-light-grey" style="padding-bottom:20px">
				<div class="row">
					<c:if test="${empty findResult}">
						<center>데이터가 하나도 없음</center>
					</c:if>
					<c:forEach items="${findResult.list}" var="finditem">
						<div class="col-md-3 animate-box">
							<div class="news">
								<a href="#" class="img-holder"><img class="img-responsive" src="../images/Findimgs/${finditem.fipicname}" alt="image!!"></a>
								<div class="desc">
									<span class="date">${finditem.fidate}</span>
									<h3><a href="#">${finditem.fisub}</a></h3>
									<p>${finditem.ficon}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- end container -->
	</section>

	<hr width='600' size='2' color='gray' noshade>
	<font color='gray' size='3'>
	    (총페이지수 : ${findResult.totalPageCount})
	    &nbsp;&nbsp;&nbsp;
	    <c:forEach begin="1" end="${findResult.totalPageCount}" var="i">
	        <a href="list.do?cp=${i}">
	   			<c:choose>
	   			    <c:when test="${i==findResult.page}">
	                	<strong>${i}</strong>
	                </c:when>
	                <c:otherwise>
	                    ${i}
	                </c:otherwise>
				</c:choose>
	    	</a>&nbsp;
	    </c:forEach>
	    ( TOTAL : ${findResult.totalCount} )
	    
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	       page size : 
	    <select id="psId" name="ps" onchange="f(this)">
	    	<c:choose>
	    		<c:when test="${findResult.pageSize == 3}">
	    		   <option value="3" selected>3</option>
			       <option value="5">5</option>
			       <option value="10">10</option>
	    		</c:when>
	    		<c:when test="${findResult.pageSize == 5}">
	    		   <option value="3">3</option>
			       <option value="5" selected>5</option>
			       <option value="10">10</option>
	    		</c:when>
	    		<c:when test="${findResult.pageSize == 10}">
	    		   <option value="3">3</option>
			       <option value="5">5</option>
			       <option value="10" selected>10</option>
	    		</c:when>
	    	</c:choose>
	    </select>
	    
	    <script language="javascript">
	       function f(select){
	           //var el = document.getElementById("psId");
	           var ps = select.value;
	           //alert("ps : " + ps);
	           location.href="fisearch.do?ps="+ps;
	       }
	    </script>
	    
	</font>

	<hr width='600' size='2' color='gray' noshade>
	
	    <form method="post" action="search02.do?">
		      <div id="f-element">
		        <input id="fisub" type="text" name="fisub" placeholder="search test" autocomplete="off">
		     
		      <button id="btnsearch" type="button" class="shadow">검색</button>
		       </div>
		</form>
	    
</center>

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
		
	<!-- organi -->
		<script src="../js/organi/main.js"></script>
	
	<!-- 메뉴에서 누르면 바로밑에 뜨는 애들 -->
		<script type="text/javascript">
 		    $(function () {
 		  $('[data-tooltip="tooltip"]').tooltip()
 			});
		</script>
		
	</body>
</html>