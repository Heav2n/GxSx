<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>


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
<center>
	<font color='gray' size='4' face='휴먼편지체'>
	<hr width='600' size='2' color='gray' noshade>
	<h3>문의 게시판</h3>
	<hr width='600' size='2' color='gray' noshade>
	</font>
	
	<table border='2' width='600' align='center' noshade>
	<tr>
	<td width='20%' align='center'>No</td>
	<td>${question.qno}</td>
	</tr>
	<tr>
	<td width='20%' align='center'>작성자</td>
	<td>${question.quid}</td>
	</tr>
	<tr>
	<td align='center'>제목</td>
	<td>
	<c:out value="${question.qsub}"></c:out>
	</td>
	</tr>
	<tr>
	<td align='center'>내용</td>
	<td>${question.qcon}</td>
	</tr>
	<tr>
	<td align='center'>운영자댓글</td>
	<td>${question.qreply}</td>
	</tr>		
	</table>
	
	

	
	<hr width='600' size='2' color='gray' noshade>
	<font color='gray' size='4' face='휴먼편지체'>
	
	 &nbsp;&nbsp;| 
	<a href='del.do?qno=${question.qno}'>삭제</a>
	 &nbsp;&nbsp;| 
	<a href='list.do'>이전 페이지</a>
	</font>
	<hr width='600' size='2' color='gray' noshade>
	
	
	 <!--  댓글  -->
     <div id="comment-input" class="container">
	 <c:if test="${empty question.qreply}"> 
        <label for="content">comment</label>
        <form action="reupdate.do" method="GET">
            <div class="input-group">
               <input type="hidden" id="qno" name="qno" value="${question.qno}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="submit">등록</button>
               </span>
              </div>
        </form>
    </c:if>
    </div>    
    <div>
      <button class="btn btn-default" type="button" onclick="qreply('${question.qno}','${question.qreply}');">댓글수정</button>
    </div>
      
		<!-- 자바스크립트  -->
	<script src="../js/questionrepley.js"></script>
</center>
