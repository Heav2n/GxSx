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
<h3> Lostitem </h3>
<font color='gray' size='4' face='휴먼편지체'>
<a href='../'>인덱스</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href='write.do'>글쓰기</a><br/>
</font>
<hr width='600' size='2' color='gray' noshade>

<TABLE border='2' width='600' align='center' noshade>
<TR size='2' align='center' noshade bgcolor='AliceBlue'>
	<th bgcolor='AliceBlue'>no</th>
	
	<th color='gray'>SUB</th>
	<th color='gray'>CON</th>
	<th color='gray'>DATE</th>
</TR>
<tbody id="lostitem">
<c:if test="${empty lostitem2}">
	<tr align="center" noshade>
	   <td colspan="5">데이터가 하나도 없음</td>
	</tr>
</c:if>
<c:forEach items="${lostitem2}" var="lostitem">
	<TR align='center' noshade>
		<TD>${lostitem.lono}</TD>
		<TD>
		<a href="locontent.do?lono=${lostitem.lono}">
		    ${lostitem.losub}
		  </a>
		</TD>
	    <TD>${lostitem.locon}</TD>
		<TD>${lostitem.lodate}</TD>
	   </TR> 
</c:forEach>
</tbody>      
</TABLE>

<nav aria-label="...">

  <ul id="paging" class="pagination" style="display:inline-flex">
    <li class="page-item disabled" onclick="selectlostitemPage(${listpage.startPage-1})">
      <span class="page-link" >Previous</span>
    </li>
    <c:forEach var="index" begin="${listpage.startPage}" end="${listpage.endPage}" step="1">
    	<c:choose>
    		<c:when test="${index==listpage.currentPage}">
			    <li id="pageNum${index}" class="page-item active" onclick="selectlostitemPage(${index})">
			      <span class="page-link">
			        ${index}
			        <span class="sr-only">(current)</span>
			      </span>
			    </li>
    		</c:when>
    		<c:otherwise>
		   		<li id="pageNum${index}" class="page-item" onclick="selectlostitemPage(${index})">
		   			<span class="page-link">
		   				${index}
		   			</span>
		   		</li>
	
    		</c:otherwise>
    	</c:choose>
    </c:forEach>
    <li class="page-item disabled" onclick="selectlostitemPage(${listpage.endPage+1})">
      <span class="page-link">Next</span>
    </li>
  </ul>
</nav>
<input id="currentPage" type="hidden" value="${listpage.currentPage}">
<input id="prevPage" type="hidden" value="${listpage.currentPage}">
<input id="startPage" type="hidden" value="${listpage.startPage}">
<input id="endPage" type="hidden" value="${listpage.endPage}">
<input id="rangeSize" type="hidden" value="${listpage.rangeSize}">
<input id="pageCount" type="hidden" value="${listpage.pageCount}">


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<!-- 자바스크립트  -->
	<script src="../js/lostitem.js"></script>

</body>

</center>
</html>