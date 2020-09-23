<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	
<head>
	<title> SANSIL </title>
	<meta charset="utf-8">
	<script type="text/javascript" language="javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		
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
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>
<center>
<font color='gray' size='4' face='휴먼편지체'>
<hr width='600' size='2' color='gray' noshade>
<h3> QUESTION </h3>
<font color='gray' size='4' face='휴먼편지체'>
<a href='../'>인덱스</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</font>
<hr width='600' size='2' color='gray' noshade>

<TABLE border='2' width='600' align='center' noshade>
<TR size='2' align='center' noshade bgcolor='AliceBlue'>
	<th bgcolor='AliceBlue'>no</th>
	<th color='gray'>ID</th>
	<th color='gray'>글제목</th>
	<th color='gray'>문의글</th>

</TR>
<tbody id="question">
<c:if test="${empty question}">
	<tr align="center" noshade>
	   <td colspan="5">데이터가 하나도 없음</td>
	</tr>
</c:if>
<c:forEach items="${question}" var="question">
	<TR align='center' noshade>
		<TD>${question.qno}</TD>
		<TD>${question.quid}</TD>
	    <TD>
	      <a href="questionco.do?qno=${question.qno}">
		    ${question.qsub}
		  </a>
		</TD>
		<TD>${question.qcon}</TD>
	   </TR> 
</c:forEach>
</tbody>      
</TABLE>

<nav aria-label="...">

  <ul id="question-paging" class="pagination" style="display:inline-flex">
    <li class="page-item disabled" onclick="selectQuestionPage(${questionPage.startPage-1})">
      <span class="page-link" >Previous</span>
    </li>
    <c:forEach var="index" begin="${questionPage.startPage}" end="${questionPage.endPage}" step="1">
    	<c:choose>
    		<c:when test="${index==questionPage.currentPage}">
			    <li id="pageNum${index}" class="page-item active" onclick="selectQuestionPage(${index})">
			      <span class="page-link">
			        ${index}
			        <span class="sr-only">(current)</span>
			      </span>
			    </li>
    		</c:when>
    		<c:otherwise>
		   		<li id="pageNum${index}" class="page-item" onclick="selectQuestionPage(${index})">
		   			<span class="page-link">
		   				${index}
		   			</span>
		   		</li>
	
    		</c:otherwise>
    	</c:choose>
    </c:forEach>
    <li class="page-item disabled" onclick="selectQuestionPage(${questionPage.endPage+1})">
      <span class="page-link">Next</span>
    </li>
  </ul>
</nav>
<input id="currentPage" type="hidden" value="${questionPage.currentPage}">
<input id="prevPage" type="hidden" value="${questionPage.currentPage}">
<input id="startPage" type="hidden" value="${questionPage.startPage}">
<input id="endPage" type="hidden" value="${questionPage.endPage}">
<input id="rangeSize" type="hidden" value="${questionPage.rangeSize}">
<input id="pageCount" type="hidden" value="${questionPage.pageCount}">


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<!-- 자바스크립트  -->
	<script src="../../js/question.js"></script>

</body>

</center>
</html>