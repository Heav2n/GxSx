<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<table border='2' width='600' align='center' noshade>
	<c:forEach var="locomment" items="${locomment}" varStatus="status">
	<tr id="locomment_${locomment.comno}">
		<td align='center'>댓글${locomment.userid}</td>
		<td>${locomment.contents}</td> 
		<td>
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
		
		
		
	  	<form action="../LostComment/delete" method="POST" id="formdel${locomment.comno}">
		  <div class="input-group"> 
			<input type="hidden" name="lono" value="${locomment.lono}"/> 
			<input type="hidden" name="comno" value="${locomment.comno}"/> 
			<span class="input-group-btn"> 
			<button id="btndel${locomment.comno}" class="btn btn-default" type="button" onclick="commentDelete('${locomment.lono}');" value="${locomment.comno}">삭제</button>	
			<div id="locomdel_input_${locomment.comno}"></div>
			</span>
		</form>
		</td>
	</tr>
	</c:forEach>
	</table>