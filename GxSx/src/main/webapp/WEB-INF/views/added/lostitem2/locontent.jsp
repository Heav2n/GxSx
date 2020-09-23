<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
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
<meta charset="utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
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
<meta charset="utf-8">
</head>
<body>
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
	<td><img src="../resources/Lostimgs/${locontent.lopicname}" alt="" style='weight:100px;height:100px'></td>
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
	<script src="../js/LoComments.js"></script>
	
</center>
</body>