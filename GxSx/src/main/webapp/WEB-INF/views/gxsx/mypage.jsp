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
		$(function() {
			$("#fiboard").on("click", function(){
				$.ajax({
				   url: "../Users/fiboard.json", 
				   type: "POST",
				   dataType: "json",
				   data: { fisub: $("#fisub").val()},				
				   success: function(responseData){
					 if(!responseData){
						 alert("존재하지 않는 제목");
						 return false;
					 }
					 var html= "<div class='wrap-table-shopping-cart'>";
						 html += "<table class='table-shopping-cart'><tr class='table_head'><th class='column-1'>Subject</th><th class='column-2'></th>";
						 html += "<th class='column-3'>Category</th><th class='column-4'>Date</th><th class='column-5'>Finish</th></tr>";
					 if(responseData.length != 0){
 						 for(var i=0; i<responseData.length; i++){
							html += "<tr class='table_row'><td class='column-1'><div class='how-itemcart1'>";
							html += "<img src='../images/coza/item-cart-04.jpg' alt='IMG'></div></td>";
							html += "<td class='column-2'>"+responseData[i].fisub+"</td>";
							html += "<td class='column-3'>"+responseData[i].ficname+"\</td>";
							html += "<td class='column-4'>"+responseData[i].fidate+"</td>";
							html += "<td class='column-5'>"+responseData[i].fifin+"</td></tr>";
						 }
 					 }else{
 						 html += "<tr class='table_row'><td colspan='5'><center>검색결과 없음</center></td></tr></table></div>";
 					 }
  					 html += "</table>";
					 html += "<div class='flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm'>";
					 html += "<div class='flex-w flex-m m-r-20 m-tb-5'></div>";
					 html += "<form method='post' action='fiboard.do?'>"
					 html += "<input style='float:left' class='stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5' type='text' name='fisitem' id='fisitem' placeholder='Search item'>";
					 html += "<div class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10' id='fiboard'>";
					 html += "Search</div></form></div>";
  						
  					 $("#boardcontent").html(html);
				   }
			   });
		   });
		})//start-end
		
		$(function() {
			$("#loboard").on("click", function(){
				$.ajax({
				   url: "../Users/loboard.json", 
				   type: "POST",
				   dataType: "json",
				   data: { losub: $("#losub").val()},				
				   success: function(responseData){
					 if(!responseData){
						 alert("존재하지 않는 제목");
						 return false;
					 }
					 var html= "<div class='wrap-table-shopping-cart'>";
						 html += "<table class='table-shopping-cart'><tr class='table_head'><th class='column-1'>Subject</th><th class='column-2'></th>";
						 html += "<th class='column-3'>Category</th><th class='column-4'>Date</th><th class='column-5'>Finish</th></tr>";
					 if(responseData.length != 0){
 						 for(var i=0; i<responseData.length; i++){
							html += "<tr class='table_row'><td class='column-1'><div class='how-itemcart1'>";
							html += "<img src='../images/coza/item-cart-04.jpg' alt='IMG'></div></td>";
							html += "<td class='column-2'>"+responseData[i].losub+"</td>";
							html += "<td class='column-3'>"+responseData[i].locname+"\</td>";
							html += "<td class='column-4'>"+responseData[i].lodate+"</td>";
							html += "<td class='column-5'>"+responseData[i].lofin+"</td></tr>";
						 }
 					 }else{
 						 html += "<tr class='table_row'><td colspan='5'><center>검색결과 없음</center></td></tr></table></div>";
 					 }
  					 html += "</table>";
					 html += "<div class='flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm'>";
					 html += "<div class='flex-w flex-m m-r-20 m-tb-5'></div>";
					 html += "<form method='post' action='loboard.do?'>"
					 html += "<input style='float:left' class='stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5' type='text' name='lositem' id='lositem' placeholder='Search item'>";
					 html += "<div class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10' id='loboard'>";
					 html += "Search</div></form></div>";
  						
  					 $("#boardcontent").html(html);
				   }
			   });
		   });
		})//start-end
	</script>

	<script type="text/javascript">
	
	function findfunc() {
		//alert("성공2");
		var str1 = "";
			str1 += "<div class='m-l-25 m-r--38 m-lr-0-xl' id='boardcontent'>";
			str1 += "<div class='wrap-table-shopping-cart'><table class='table-shopping-cart'>";
			str1 += "<tr class='table_head'><th class='column-1'>Subject</th><th class='column-2'></th>";
			str1 += "<th class='column-3'>Category</th><th class='column-4'>Date</th><th class='column-5'>Finish</th></tr>";
			str1 += "<c:if test='${empty find}'><tr class='table_row'><td colspan='5'><center>등록한 글 없음</center></td></tr></table></div></c:if>";
			str1 += "<c:forEach items='${find}' var='find' varStatus='status'>";
			str1 += "<tr class='table_row'><td class='column-1'><div class='how-itemcart1'>";
			str1 += "<img src='../images/coza/item-cart-04.jpg' alt='IMG'></div></td>";
			str1 += "<td class='column-2'>${find.fisub}</td><td class='column-3'>${find.ficname}</td><td class='column-4'>${find.fidate}</td>";
			str1 += "<c:if test='${find.fifin==0}'><td class='column-5'>미완료</td></c:if>";
			str1 += "<c:if test='${find.fifin==1}'><td class='column-5'>완료</td></c:if></tr></c:forEach></table></div>";

			str1 += "<div class='flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm'>";
			str1 += "<div class='flex-w flex-m m-r-20 m-tb-5'></div><form method='post' action='fiboard.do?'>";
			str1 += "<input style='float:left' class='stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5' type='text' name='fisub' id='fisub' placeholder='Search item'>";
			str1 += "<div class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10' id='fiboard'>Search</div></form></div></div>";
				
		document.getElementById("contentchange").innerHTML = str1;
			//.innerText = "str" : str 자체가 출력되도록 변환 후 덮어씌움
			// 예)str : <b> b태그 </b> ==> &lt;b&gt; b태그 &lt;/b&gt;
	}
	
	function lostfunc() {
		var str2 = "";
			str2 += "<div class='m-l-25 m-r--38 m-lr-0-xl' id='boardcontent'>";
			str2 += "<div class='wrap-table-shopping-cart'><table class='table-shopping-cart'>";
			str2 += "<tr class='table_head'><th class='column-1'>Subject</th><th class='column-2'></th>";
			str2 += "<th class='column-3'>Category</th><th class='column-4'>Date</th><th class='column-5'>Finish</th></tr>";
			str2 += "<c:if test='${empty lost}'><tr class='table_row'><td colspan='5'><center>등록한 글 없음</center></td></tr></table></div></c:if>";
			str2 += "<c:forEach items='${lost}' var='lost' varStatus='status'>";
			str2 += "<tr class='table_row'><td class='column-1'><div class='how-itemcart1'>";
			str2 += "<img src='../images/coza/item-cart-04.jpg' alt='IMG'></div></td>";
			str2 += "<td class='column-2'>${lost.losub}</td><td class='column-3'>${lost.locname}</td><td class='column-4'>${lost.lodate}</td>";
			str2 += "<c:if test='${lost.lofin==0}'><td class='column-5'>미완료</td></c:if>";
			str2 += "<c:if test='${lost.lofin==1}'><td class='column-5'>완료</td></c:if></tr></c:forEach></table></div>";
	
			str2 += "<div class='flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm'>";
			str2 += "<div class='flex-w flex-m m-r-20 m-tb-5'></div><form method='post' action='loboard.do?'>";
			str2 += "<input style='float:left' class='stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5' type='text' name='losub' id='losub' placeholder='Search item'>";
			str2 += "<div class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10' id='loboard'>Search</div></form></div></div>";

		document.getElementById("contentchange").innerHTML = str2;
	}
	
	function profilefunc() {
		var str3 = "";
			str3 += "<div class='row'><div class='m-l-25 m-r--38 m-lr-0-xl' style='margin-left:100px'</br></br>";
			str3 += "<div class='table-shopping-cart'><div class='card-header'><h3 class='mb-0'>Information Change</h3></div>";
			str3 += "<div class='card-body'><form class='form2' name='form2' id='form2' role='form2' autocomplete='off' action='editProfile.do'>";
			str3 += "<div class='form-group row'><label for='noinputId' class='col-lg-3 col-form-label form-control-label'>ID</label>";
			str3 += "<div class='col-lg-9'><input type='text' class='form-control' id='editId' name='userid' value='${user.userid}' readonly='readonly'></div></div>";
			str3 += "<div class='form-group row'><label for='noinputName' class='col-lg-3 col-form-label form-control-label'>Name</label>";
			str3 += "<div class='col-lg-9'><input type='text' class='form-control' id='editName' name='uname' value='${user.uname}' readonly='readonly'></div></div>";
			str3 += "<div class='form-group row'><label for='inputEmail' class='col-lg-3 col-form-label form-control-label'>Email</label>";
			str3 += "<div class='col-lg-9'><input class='form-control' type='text' id='editEmail' name='uemail' value='${user.uemail}' required=''></div></div>";
			str3 += "<div class='form-group row'><label for='inputPnum' class='col-lg-3 col-form-label form-control-label'>Phone Number</label>";		
			str3 += "<div class='col-lg-9'><input class='form-control' type='text' id='editPnum' name='upnum' value='${user.upnum}' required=''></div></div>";
			str3 += "<div class='form-group row'><label for='inputPwd' class='col-lg-3 col-form-label form-control-label'>Password</label>";
			str3 += "<div class='col-lg-9'><input class='form-control' type='password' id='editPwd' value='' required=''>";
			str3 += "<input type='hidden' class='form-control' id='oldPwd' name='oldPwd' value='${user.upwd}'></div></div>";
			str3 += "<div class='form-group row'><label for='inputPwd' class='col-lg-3 col-form-label form-control-label'>Password Confirm</label>";
			str3 += "<div class='col-lg-9'><input class='form-control' type='password' id='editPwdVerify' value='' required='' data-bvStrict='same:editPwd'></div></div></br>";
			str3 += "<div class='flex-w flex-m m-r-20 m-tb-5'>";
			str3 += "<div class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5' id='submit' name='submit'";
			str3 += "onclick='CheckLeave(document.form2.editId,document.form2.editPwd,document.form2.editPwdVerify,document.form2.oldPwd)'>Leave</div>";
			str3 += "<div class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5' style='opacity:0; pointer-events:none'></div>";
			str3 += "<div class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10' id='submit2' name='submit2'";
			str3 += "onclick='CheckEditProfile(document.form2.editEmail,document.form2.editPnum,document.form2.editPwd,document.form2.oldPwd,document.form2.editPwdVerify)'>";
			str3 += "Save</div>&emsp;<div class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10' id='submit3' name='submit3' onclick='EditCancel()'>";
			str3 += "Cancel</div></div></form></div></div></div></div>";
				
		document.getElementById("contentchange").innerHTML = str3;
	}
	
	function pwdfunc() {
		var str4 = "";
			str4 += "<div class='row'><div class='m-l-25 m-r--38 m-lr-0-xl' style='margin-left:100px'></br></br>";
			str4 += "<div class='table-shopping-cart'><div class='card-header'><h3 class='mb-0'>Password Change</h3></div>";
			str4 += "<div class='card-body'><form class='form' name='form' role='form' autocomplete='off'>";
			str4 += "<div class='form-group'><label for='inputPasswordOld'>Current Password</label>";
			str4 += "<input type='password' class='form-control' id='oldPwd' required=''>";
			str4 += "<input type='hidden' class='form-control' id='oldPwdVerify' value='${user.upwd}'></div>";
			str4 += "<div class='form-group'><label for='inputPasswordNew'>New Password</label>";
			str4 += "<input type='password' class='form-control' id='newPwd' required=''><span class='form-text small text-muted'>";
			str4 += "The password must be 7-16 characters, contain only characters, numbers and must <em>not</em> contain spaces.</span></div>";
			str4 += "<div class='form-group'><label for='inputPasswordNewVerify'>Verify</label>";
			str4 += "<input type='password' class='form-control' id='newPwdVerify' required=''>";
			str4 += "<span class='form-text small text-muted'>To confirm, type the new password again.</span></div>";
			str4 += "<div class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10' id='submit' name='submit'";
			str4 += "onclick='CheckPassword(document.form.oldPwd,document.form.oldPwdVerify,document.form.newPwd,document.form.newPwdVerify)'>";
			str4 += "Save</div></form></div></div></div></div>";
			
		document.getElementById("contentchange").innerHTML = str4;
	}

	function CheckPassword(oldPwd,oldPwdVerify,newPwd,newPwdVerify){ 
		var passw=  /^[A-Za-z]\w{7,14}$/;
		var oldPwd = $("#oldPwd").val();
		var oldPwdVerify = $("#oldPwdVerify").val();
		var newPwd = $("#newPwd").val();
		var newPwdVerify = $("#newPwdVerify").val();
		console.log(oldPwd,oldPwdVerify,newPwd,newPwdVerify);
		
		if(oldPwd!=newPwd && newPwd.match(passw) 
			&& newPwd==newPwdVerify && oldPwd==oldPwdVerify){
			alert('Correct')
			location.href="editPwd.do?upwd="+newPwd;
		}
		else{
			if(oldPwd==newPwd){
				alert('변경할 비번이 이전의 것과 같음')
			}
			else if(newPwd!=newPwdVerify){
				alert('변경할 비번과 비번확인 불일치')
			}
			else if(oldPwd!=oldPwdVerify){
				alert('사용중인 비번확인 불일치')
			}
			else{
				alert('변경할 비번이 규칙에 맞지않음')
			}
			return false;
		}
	}

	function CheckLeave(editId, editPwd, editPwdVerify, oldPwd){
		var editId = $("#editId").val();
		var editPwd = $("#editPwd").val();
		var editPwdVerify = $("#editPwdVerify").val();
		var oldPwd = $("#oldPwd").val();
		
		if(editPwd==oldPwd){
			var leaveConfirm = confirm("탈퇴하시겠습니까?");
				if(leaveConfirm == true){
					location.href="leaveUser.do?userid="+editId;
					alert('탈퇴완료')
				}
				else if(leaveConfirm == false){
					alert('탈퇴취소')
				}
		}
		else{
			alert('탈퇴불가(비밀번호를 확인해주세요)')
		}
	}
	
	function EditCancel(){
		location.href="mypage.do";		
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
								<a href="../finditem/list.do">Finditem</a>
							</li>

							<li class="label1" data-label1="분실물">
								<a href="../lostitem/list.do">Lostitem</a>
							</li>

							<li>
								<a href="../gxsx/contact.do">Contact</a>
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
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('../images/coza/bg-02.jpg');margin-top:-40px">
		<h2 class="ltext-105 cl0 txt-center">
			Mypage
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
								<li class="bor18">
									<span class="link dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">Myboard</span>
								    <ul class="submenu">
								      <li id="finditem">
								      		<a href="#" onclick="findfunc()" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
								      		&emsp;Finditem</a></li>
								      <li id="lostitem">
								      		<a href="#" onclick="lostfunc()" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
								      		&emsp;Lostitem</a></li>
								    </ul>
								</li>

								<li class="bor18">
									<a href="#" onclick="profilefunc()" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Profile
									</a>
								</li>
								
								<li class="bor18">
									<a href="#" onclick="pwdfunc()" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Password Change
									</a>
								</li>
							</ul>
							
						</div>
					</div>
				</div>
				
				<div class="col-md-8 col-lg-9 p-b-80" id="contentchange">
<%-- 					<jsp:include page='mylostitem.jsp'></jsp:include> --%>					
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
	
	<script>
		function CheckEditProfile(editEmail,editPnum,editPwd,oldPwd,editPwdVerify){ 
			var email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			var phone = /^01(?:0|1|7|9)-(?:\d{3}|\d{4})-\d{4}$/;
			var editEmail = $("#editEmail").val();
			var editPnum = $("#editPnum").val();
			var editPwd = $("#editPwd").val();
			var editPwdVerify = $("#editPwdVerify").val();
			var oldPwd = $("#oldPwd").val();
			
			if(editEmail!=null && editEmail.match(email) && editPnum.match(phone)  
				&& editPnum!=null && editPwd!=null && editPwdVerify!=null 
				&& editPwd==oldPwd && editPwd==editPwdVerify){
				alert('Correct')
				document.getElementById("form2").submit();
			}
			else{
				if(editEmail==null){
					alert('이메일을 입력하세요')
				}
				else if(editPnum==null){
					alert('휴대폰번호를 입력하세요')
				}
				else if(editPwd==null || editPwdVerify==null){
					alert('사용중인 비번을 입력하세요')
				}
				else if(editPwd!=editPwdVerify || editPwd!=oldPwd){
					alert('현재 비번과 비번확인 불일치')
				}
				else{
					if(editEmail.match(email)){					
						alert('변경할 휴대폰번호가 규칙에 맞지않음')
					}
					else{					
						alert('변경할 이메일이 규칙에 맞지않음')
					}
				}
				return false;
			}
		}
	</script>
	
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