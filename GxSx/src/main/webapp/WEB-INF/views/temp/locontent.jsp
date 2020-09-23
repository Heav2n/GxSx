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
	
	<script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	
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

<style type="text/css">
	.dragDropDiv {
		width: 650px;
		height: 300px;
		text-align: center;
		padding: 10px 0px 10px 10px;
		border: 2px solid black;
	}
	#tabFileName{
		width: 470px;
		text-align: left;
	}
	
	#tabFileSize{
		width: 70px;
	}
	
	#tabFileDel{
		width: 50px;
	}
	table , tr , td{
		border: 1px solid black;
		border-collapse: collapse;
	}
</style>
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
								<li><a href="domain.do">Home</a></li> <!-- 메인메뉴 목록 시작 -->
								<li><a href="notice.do">Notice</a></li>
								<li><a href="#">FindItem</a></li>
								<li class="active"><a href="#">LostItem</a></li>
								
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
	                        <h21 style="font-size: 34px;color:white; font-weight:900">LOSTITEM</h21>	               
	                    </div>
	                </div>
	            </div>
	        </div>
   		 </section>  
	<!-- ///////////////////////////////////// 메뉴 아래 사진 종료 ///////////////////////////////////// -->
	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->

<center>
	<font color='gray' size='4' face='휴먼편지체'>
	<hr width='600' size='2' color='gray' noshade>
	<h3>분실물!</h3>
	<font color='gray' size='4' face='휴먼편지체'>
	<a href='write.do'>글쓰기</a>
	</font>
	<hr width='600' size='2' color='gray' noshade>
	</font>
	
	<table border='2' width='600' align='center' noshade>
	<tr>
	<td width='20%' align='center'>글번호</td>
	<td>${locontent.lono}</td>
	</tr>
	<tr>
	<td width='20%' align='center'>작성자</td>
	<td>${locontent.louid}</td>
	</tr>
	<tr>
	<td align='center'>등록날짜</td>
	<td>${locontent.lodate}</td>
	</tr>
	<tr>
	<td align='center'>종류</td>
	<td>${locontent.locname}</td>
	</tr>
	<tr>
	<td align='center'>제목</td>
	<td>${locontent.losub}</td>
	</tr>
	<tr>
	<td align='center'>내용</td>
	<td>${locontent.locon}</td>
	</tr>
	<tr>
	<td align='center'>지역</td>
	<td>${area}</td>
	</tr>
	<tr>
	<td align='center'>위치</td>
	<td>${locontent.loplace}</td>
	</tr>
	<tr>
	<td align='center'>사례</td>
	<td>${locontent.logift}</td>
	</tr>
	<tr>
	<td align='center'>완료여부</td>
	<td>${locontent.lofin}</td>
	</tr>
	<tr>
	<td align='center'>사진</td>
	<td><img src="../images/Lostimgs/${locontent.lopicname}" alt="" style='weight:100px;height:100px'></td>
	</tr>
	</table>
	
	
	<hr width='600' size='2' color='gray' noshade>
	<font color='gray' size='4' face='휴먼편지체'>
	<a href='updatef.do?lono=${locontent.lono}'>수정</a>
	 &nbsp;&nbsp;| 
	<a href='del.do?lono=${locontent.lono}'>삭제</a>
	 &nbsp;&nbsp;| 
	<a href='list.do'>목록</a>
	</font>
	<hr width='600' size='2' color='gray' noshade>
	
	
			<!--  댓글등록  -->
	<div id="comment-input" class="container">
		<label for="content">댓글</label>
		<div class="input-group">
			<input type="hidden" id="lono" name="lono" value="${locontent.lono}"/>
			<input type="text" class="form-control" id="comments" name="comments" placeholder="댓글을 입력해주세요">
			<span class="input-group-btn">
				<button class="btn btn-default" type="button" onclick="commentInsert('${locontent.lono}');">등록</button>		
		</form>
	
	<!-- 댓글 리스트 -->
	<div id="comment-table" style="margin-top : 20px">	
	<table border='2' width='600' align='center' noshade>
	<c:forEach var="locomment" items="${locontent}" varStatus="status">
	<tr id="locomment_${locontent.comno}">
		<td align='center'>댓글${locontent.userid}</td>
		<td>${locontent.contents}</td> 
		<td>
		<!-- 댓글수정 -->
		<form action="../LostComment/update" method="POST" id="form${locomment.comno}">
			<div class="input-group">
<%-- 			<input type="hidden" id="contents" name="contents" value="${ficomment.contents}" /> --%>
				<input type="hidden" name="comno" value="${locomment.comno}"/>
				<input type="hidden" name="lono" value="${locomment.lono}"/>
				<c:if test="${empty locomment.contents}">
				 <input type="text" class="form-control" id="content" name="content"	
				class="input-group-btn">
 				</c:if>
				<%-- ${ficomment.comno}, ${ficomment.contents} 
<%-- 			<button class="btn btn-default" type="button" onclick="commentUpdate('${ficomment.comno}', '${ficomment.contents}');">수정</button> --%>
				<button id="btn${locomment.comno}" class="btn btn-default" type="button" onclick="update_form_id(this.value)" value="${locomment.comno}">수정</button>
				<div id="ficom_input_${locomment.comno}">
			</div>	
		</from>
		</div>	
		
		<div id="delcomment-table" style="margin-top : 20px">	
	  	<form action="../LostComment/delete" method="POST" id="formdel${locomment.comno}">
		  <div id="delcomment-input" class="container"> 
		  <div class="input-group"> 
			<input type="hidden" name="lono" value="${locomment.lono}"/> 
			<input type="hidden" name="comno" value="${locomment.comno}"/> 
			<span class="input-group-btn"> 
			<button id="btndel${locomment.comno}" class="btn btn-default" type="button" onclick="commentDelete('${locomment.comno}');" value="${locomment.comno}">삭제</button>		
			<div id="locomdel_input_${locomment.comno}"></div> 
			</span>
		</form>
		</div>
		</td>
	</tr>
	</c:forEach>
	</table>
	
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
		
	<!-- lostcontent -->
		<script src="../js/tempjs/LoComments.js"></script>
	
	<!-- 메뉴에서 누르면 바로밑에 뜨는 애들 -->
		<script type="text/javascript">
 		    $(function () {
 		  $('[data-tooltip="tooltip"]').tooltip()
 			});
		</script>
		

	
</body>