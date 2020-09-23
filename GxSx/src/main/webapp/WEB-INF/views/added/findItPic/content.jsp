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
<body>
<center>
	<font color='gray' size='4' face='휴먼편지체'>
	<hr width='600' size='2' color='gray' noshade>
	<h3> Contents </h3>
	<font color='gray' size='4' face='휴먼편지체'>
	<a href='write2.do'>글쓰기</a>
	</font>
	<hr width='600' size='2' color='gray' noshade>
	</font>
	
	<table border='2' width='600' align='center' noshade>
	<tr>
		<td width='20%' align='center'>글 번호</td>
		<td>${content.fino}</td>
	</tr>
	<tr>
		<td width='20%' align='center'>작성자</td>
		<td>${content.fiuid}</td>
	</tr>
	<tr>
		<td align='center'>등록날짜</td>
		<td>${content.fidate}</td>
	</tr>
	<tr>
		<td align='center'>종류</td>
		<td>${content.ficname}</td>
	</tr>
	<tr>
		<td align='center'>제목</td>
		<td>${content.fisub}</td>
	</tr>
	<tr>
		<td align='center'>내용</td>
		<td>${content.ficon}</td>
	</tr>
	<tr>
		<td align='center'>지역</td>
		<td>${area}</td>
	</tr>
	<tr>
		<td align='center'>위치</td>
		<td>${content.fiplace}</td>
	</tr>
	<tr>
		<td align='center'>완료여부</td>
		<td>${content.fifin}</td>
	</tr>
	<tr>
		<td align='center'>사진</td>
		<td><img src="../resources/Findimgs/${content.fipicname}" height=200></td>
	</tr>
	</table>
	
	<hr width='600' size='2' color='gray' noshade>
	<font color='gray' size='4' face='휴먼편지체'>
	<a href='update.do?fino=${content.fino}'>수정</a>
	 &nbsp;&nbsp;| 
	<a href='del.do?fino=${content.fino}'>삭제</a>
	 &nbsp;&nbsp;| 
	<a href='list.do'>목록</a>
	</font>
	<hr width='600' size='2' color='gray' noshade>
	
			<!--  댓글등록  -->
	<div id="comment-input" class="container">
		<label for="content">댓글</label>
		<div class="input-group">
			<input type="hidden" id="fino" name="fino" value="${content.fino}"/>
			<input type="text" class="form-control" id="comments" name="comments" placeholder="댓글을 입력해주세요">
			<span class="input-group-btn">
				<button class="btn btn-default" type="button" onclick="commentInsert('${content.fino}');">등록</button>		
		</form>
	
	
	
			</span>
		</div>
	</div>
	<div id="comment-list">
	</div>
	
	<!-- 댓글 리스트 -->
	<div id="comment-table" style="margin-top : 20px">	
	<table border='2' width='600' align='center' noshade>
	<c:forEach var="ficomment" items="${ficomment}" varStatus="status">
	<tr id="ficomment_${ficomment.comno}">
		<td align='center'>댓글${ficomment.userid}</td>
		<td>${ficomment.contents}</td> 
		<td>
		<!-- 댓글수정 -->
		<form action="../FindComment/update" method="POST" id="form${ficomment.comno}">
			<div class="input-group">
<%-- 			<input type="hidden" id="contents" name="contents" value="${ficomment.contents}" /> --%>
				<input type="hidden" name="comno" value="${ficomment.comno}"/>
				<input type="hidden" name="fino" value="${ficomment.fino}"/>
				<c:if test="${empty ficomment.contents}">
				 <input type="text" class="form-control" id="content" name="content"	
				class="input-group-btn">
 				</c:if>
				<%-- ${ficomment.comno}, ${ficomment.contents} 
<%-- 			<button class="btn btn-default" type="button" onclick="commentUpdate('${ficomment.comno}', '${ficomment.contents}');">수정</button> --%>
				<button id="btn${ficomment.comno}" class="btn btn-default" type="button" onclick="update_form_id(this.value)" value="${ficomment.comno}">수정</button>
				<div id="ficom_input_${ficomment.comno}">
			</div>	
		</from>
		</div>	
		
		<div id="delcomment-table" style="margin-top : 20px">	
	  	<form action="../FindComment/delete" method="POST" id="formdel${ficomment.comno}">
		  <div id="delcomment-input" class="container"> 
		  <div class="input-group"> 
			<input type="hidden" name="fino" value="${ficomment.fino}"/> 
			<input type="hidden" name="comno" value="${ficomment.comno}"/> 
			<span class="input-group-btn"> 
			<button id="btndel${ficomment.comno}" class="btn btn-default" type="button" onclick="commentDelete('${ficomment.comno}');" value="${ficomment.comno}">삭제</button>		
			<div id="ficomdel_input_${ficomment.comno}"></div> 
			</span>
		</form>
		</div>
		</td>
	</tr>
	</c:forEach>
	</table>
	
	
<!-- 	<table id="test" border='2' width='600' align='center' noshade> -->
<%-- 		<c:if test="${ficomment eq null}"> --%>
<!-- 			댓글없음 -->
<%-- 		</c:if> --%>
<!-- 	</table> -->
	
	

	
<!-- 	<form name="FindComment" method="post"> -->
<%--   <input type="hidden" id="fino" name="fino" value="${ficomment.fino}" /> --%>
<%--   <input type="hidden" id="comno" name="comno" value="${ficomment.comno}">  --%>
<%--   <input type="hidden" id="contents" name="contents" value="${ficomment.contents}">  --%>
  
<%-- 	<c:if test="${requestScope.commentList != null}"> --%>
<%-- 		<c:forEach var="comment" items="${requestScope.commentList}"> --%>

<!-- 	<tr> -->
<!-- 	<!-- 아이디, 작성날짜 -->
<!-- 	<td width="150"> -->
<!-- 		<div> -->
<%-- 			${content.userid}<br> --%>
<%-- 			<font size="2" color="lightgray">${content.codate}</font> --%>
<!-- 		</div> -->
<!-- 	</td> -->
<!-- 	<td width="550"> -->
<!-- 		<div class="text_wrapper"> -->
<%-- 			${content.contents} --%>
<!-- 		</div> -->
<!-- 	</td> -->
<!-- 	<!-- 버튼 -->
<!-- 	<td width="100"> -->
<!-- 		<div id="btn" style="text-align:center;"> -->
<!-- 			<a href="#">[답변]</a><br> -->
<!-- 			<!-- 댓글 작성자만 수정, 삭제 가능하도록 -->
<%-- 			<c:if test="${content.userid == sessionScope.sessionID}"> --%>
<!-- 				<a href="#">[수정]</a><br> -->
<!-- 				<a href="#">[삭제]</a> -->
<%-- 			</c:if> --%>
<!-- 		</div> -->
<!-- 	</td> -->
<!-- 	</tr> -->
	
<%-- 	</c:forEach> --%>
<%-- 	</c:if> --%>
	
<!-- 	<!-- 로그인 했을 경우만 댓글 작성가능 -->
<%-- 	<c:if test="${sessionScope.sessionID !=null}"> --%>
<!-- 		<tr bgcolor="#F5F5F5"> -->
<!-- 		<form id="writeCommentForm"> -->
<%-- 			<input type="hidden" name="comment_id" value="${sessionScope.sessionID}"> --%>
<!-- 		<td width="150"> -->
<!-- 			<div> -->
<%-- 				${sessionScope.sessionID} --%>
<!-- 			</div> -->
<!-- 		</td> -->
<!-- 		<!-- 본문작성 -->
<!-- 		<td width="550"> -->
<!-- 			<div> -->
<!-- 				<textarea name="comment_content" rows="4" cols="70"></textarea> -->
<!-- 			</div> -->
<!-- 		</td> -->
		
		
	
		<!-- 자바스크립트  -->
	<script src="../js/FiComments.js"></script>
</center>
</body>
