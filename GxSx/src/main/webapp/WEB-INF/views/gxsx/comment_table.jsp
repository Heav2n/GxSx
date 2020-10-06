<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<table border='2' width='600' align='center' noshade>
	<c:forEach var="ficomment" items="${ficomment}" varStatus="status">
	<tr id="ficomment_${ficomment.comno}">
		<td align='center'>댓글${ficomment.userid}</td>
		<td>${ficomment.contents}</td> 
		<td>
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
		
		
		
	  	<form action="../FindComment/delete" method="POST" id="formdel${ficomment.comno}">
		  <div class="input-group"> 
			<input type="hidden" name="fino" value="${ficomment.fino}"/> 
			<input type="hidden" name="comno" value="${ficomment.comno}"/> 
			<span class="input-group-btn"> 
			<button id="btndel${ficomment.comno}" class="btn btn-default" type="button" onclick="commentDelete('${ficomment.fino}');" value="${ficomment.comno}">삭제</button>	
			<div id="ficomdel_input_${ficomment.comno}"></div> 
			</span>
		</form>
		</td>
	</tr>
	</c:forEach>
	</table>