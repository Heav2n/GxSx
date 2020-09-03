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
<h3>My Page</h3>
<font color='gray' size='4' face='휴먼편지체'>
<a href='../'>인덱스</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</font>
<hr width='600' size='2' color='gray' noshade>

<TABLE border='2' width='600' align='center' noshade>
<TR size='2' align='center' noshade bgcolor='AliceBlue'>
	<th bgcolor='AliceBlue'>no</th>
	<th color='gray'>분실물사진</th>
	<th color='gray'>아이디</th>
	<th color='gray'>분실물</th>
	<th color='gray'>제목</th>	
	<th color='gray'>날짜</th>
</TR>
<tbody id="lostItems">
<c:if test="${empty lost}">
	<tr align="center" noshade>
	   <td colspan="5">데이터가 하나도 없음</td>
	</tr>
</c:if>
<c:forEach items="${lost}" var="lost">
	<TR align='center' noshade>
		<TD>${lost.lono}</TD>
		<TD>
		<img src= "../../resources/Lostimgs/${lost.lopicname}" width=100px height=100px>
		</TD>
		<TD>${lost.louid}</TD>
		<TD>${lost.locname}</TD>
	    <TD>
	      <a href="content.do?seq=${lost.lono}">
		    ${lost.losub}
		  </a>
		</TD>
		<TD>${lost.lodate}</TD>
	   </TR> 
</c:forEach>
</tbody>      
</TABLE>

<nav aria-label="...">

  <ul id="lost-paging" class="pagination" style="display:inline-flex">
    <li class="page-item disabled" onclick="selectLostItemPage(${lostPage.startPage-1})">
      <span class="page-link" >Previous</span>
    </li>
    <!-- start for -->
    <c:forEach var="index" begin="${lostPage.startPage}" end="${lostPage.endPage}" step="1">
    	<c:choose>
    		<c:when test="${index==lostPage.currentPage}">
			    <li id="pageNum${index}" class="page-item active" onclick="selectLostItemPage(${index})">
			      <span class="page-link">
			        ${index}
			        <!-- <span class="sr-only">(current)</span> -->
			      </span>
			    </li>
    		</c:when>
    		<c:otherwise>
		   		<li id="pageNum${index}" class="page-item" onclick="selectLostItemPage(${index})">
		   			<span class="page-link">
		   				${index}
		   			</span>
		   		</li>
	
    		</c:otherwise>
    	</c:choose>
    </c:forEach>
    <!-- end for -->
    <li class="page-item disabled" onclick="selectLostItemPage(${lostPage.endPage+1})">
      <span class="page-link">Next</span>
    </li>
  </ul>
</nav>
<input id="currentPage" type="hidden" value="${lostPage.currentPage}">
<input id="prevPage" type="hidden" value="${lostPage.currentPage}">
<input id="startPage" type="hidden" value="${lostPage.startPage}">
<input id="endPage" type="hidden" value="${lostPage.endPage}">
<input id="rangeSize" type="hidden" value="${lostPage.rangeSize}">
<input id="pageCount" type="hidden" value="${lostPage.pageCount}">



<TABLE border='2' width='600' align='center' noshade>
<TR size='2' align='center' noshade bgcolor='AliceBlue'>
	<th bgcolor='AliceBlue'>no</th>
	<th color='gray'>습득물사진</th>
	<th color='gray'>아이디</th>
	<th color='gray'>습득물</th>
	<th color='gray'>제목</th>
	<th color='gray'>날짜</th>	
</TR>

<c:if test="${empty find}">
	<tr align="center" noshade>
	   <td colspan="5">데이터가 하나도 없음</td>
	</tr>
</c:if>

<c:forEach items="${find}" var="find">
	<TR align='center' noshade>
		<TD>${find.fino}</TD>
		<TD>
		<img src= "../../resources/Findimgs/${find.fipicname}" width=100px height=100px>
		</TD>
		<TD>${find.fiuid}</TD>
		<TD>${find.ficname}</TD>
	    <TD>
	      <a href="content.do?seq=${find.fino}">
		    ${find.fisub}
		  </a>
		</TD>
		<TD>${find.fidate}</TD>
	   </TR> 
</c:forEach>      
     
</TABLE>

<nav aria-label="...">

  <ul id="find-paging" class="pagination" style="display:inline-flex">
    <li class="page-item disabled" onclick="selectFindItemPage(${findPage.startPage-1})">
      <span class="page-link" >Previous</span>
    </li>
    <!-- start for -->
    <c:forEach var="index" begin="${findPage.startPage}" end="${findPage.endPage}" step="1">
    	<c:choose>
    		<c:when test="${index==findPage.currentPage}">
			    <li id="pageNum${index}" class="page-item active" onclick="selectFindItemPage(${index})">
			      <span class="page-link">
			        ${index}
			        <!-- <span class="sr-only">(current)</span> -->
			      </span>
			    </li>
    		</c:when>
    		<c:otherwise>
		   		<li id="pageNum${index}" class="page-item" onclick="selectFindItemPage(${index})">
		   			<span class="page-link">
		   				${index}
		   			</span>
		   		</li>
	
    		</c:otherwise>
    	</c:choose>
    </c:forEach>
    <!-- end for -->
    <li class="page-item" onclick="selectFindItemPage(${findPage.endPage+1})">
      <span class="page-link">Next</span>
    </li>
  </ul>
</nav>
</font>

<input id="currentPage" type="hidden" value="${findPage.currentPage}">
<input id="prevPage" type="hidden" value="${findPage.currentPage}">
<input id="startPage" type="hidden" value="${findPage.startPage}">
<input id="endPage" type="hidden" value="${findPage.endPage}">
<input id="rangeSize" type="hidden" value="${findPage.rangeSize}">
<input id="pageCount" type="hidden" value="${findPage.pageCount}">

<!--  <hr width='600' size='2' color='gray' noshade>
<font color='gray' size='3' face='휴먼편지체'>
    (총페이지수 : ${lostResult.totalPageCount})
    &nbsp;&nbsp;&nbsp;
    <c:forEach begin="1" end="${lostResult.totalPageCount}" var="i">
        <a href="list.do?cp=${i}">
   			<c:choose>
   			    <c:when test="${i==lostResult.page}">
                	<strong>${i}</strong>
                </c:when>
                <c:otherwise>
                    ${i}
                </c:otherwise>
			</c:choose>
    	</a>&nbsp;
    </c:forEach>
    ( TOTAL : ${lostResult.totalCount} )
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       page size : 
    <select id="psId" name="ps" onchange="f(this)">
    	<c:choose>
    		<c:when test="${lostResult.pageSize == 3}">
    		   <option value="3" selected>3</option>
		       <option value="5">5</option>
		       <option value="10">10</option>
    		</c:when>
    		<c:when test="${lostResult.pageSize == 5}">
    		   <option value="3">3</option>
		       <option value="5" selected>5</option>
		       <option value="10">10</option>
    		</c:when>
    		<c:when test="${lostResult.pageSize == 10}">
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
           location.href="list.do?ps="+ps;
       }
    </script>
    
</font>
<hr width='600' size='2' color='gray' noshade>
    -->


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<!-- 자바스크립트  -->
	<script src="../../js/list.js"></script>
<%-- 	<css src="../../css/Pagination.css"></css> --%>
</body>

</center>
</html>