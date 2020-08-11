<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title> Spring Board </title>
	<meta charset="utf-8">
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
	<script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script type="text/javascript">	
		$(function() {
			$("#btnsearch").on("click", function(){
				$.ajax({
				   url: "../lostitem/search02.json", 
				   type: "POST",
				   dataType: "json",
				   data: { losub: $("#losub").val()},				
				   success: function(responseData){
				 //var jsObj = JSON.parse(responseData);
				 	
                   if(!responseData){
						  alert("존재하지 않는 name 임");
						  return false;
					  }
					  var html= "";
					  html += "<table border='1' width='50%'>";
					  html += "<tr>";
					  html += "<th>번호</th>";
					  html += "<th>이름</th>";
					  html += "<th>주소</th>";
					  html += "<th>날짜</th>";
					  html += "<th>날짜2</th>";
					  html += "</tr>";
					
					  if(responseData.length != 0){
 						  for(var i=0; i<responseData.length; i++){
 							  html += "<tr align='center' noshade>";
 							  html += "<td>"+responseData[i].lono+"</td>";
 							  html += "<td>"+responseData[i].louid+"</td>";
 							  html += "<td>"+responseData[i].locname+"</td>";
 							  html += "<td><a href='content.do?seq="+responseData[i].lono+"'>";
 							  html += responseData[i].losub+"</a></td>";
 							  html += "<td>"+responseData[i].lodate+"</td>";
 							  html += "</tr>";
						  }
 					  }else{
 						  html += "<tr align='center' noshade>";
 						  html += "<td colspan='5'>데이터가 하나도 없음</td>";
 						  html += "</tr>";
 					  }
  					  html += "</table>";
  						
  					  $("#container").html(html);
				   }
			   });
		   });
		})//start-end
	</script>
</head>
<body>
<center>
<font color='gray' size='4'>
<hr width='600' size='2' color='gray' noshade>
<h3> Spring Board ( Spring5 + MyBatis )</h3>
<font color='gray' size='4'>
<a href='../'>인덱스</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href='write.do'>글쓰기</a><br/>
</font>
<hr width='600' size='2' color='gray' noshade>

<div id="container">

<TABLE border='2' width='600' align='center' noshade>
<TR size='2' align='center' noshade bgcolor='AliceBlue'>
	<th bgcolor='AliceBlue'>no</th>
	<th color='gray'>writer</th>
	<th color='gray'>e-mail</th>
	<th color='gray'>subject</th>
	<th color='gray'>date</th>
</TR>

	<c:if test="${empty lostResult}">
		<tr align="center" noshade>
		   <td colspan="5">데이터가 하나도 없음</td>
		</tr>
	</c:if>
	<c:forEach items="${lostResult.list}" var="lostitem">
		<TR align='center' noshade>
			<TD>${lostitem.lono}</TD>
			<TD>${lostitem.louid}</TD>
			<TD>${lostitem.locname}</TD>
		    <TD>
		      <a href="content.do?seq=${lostitem.lono}">
			    ${lostitem.losub}
			  </a>
			</TD>
			<TD>${lostitem.lodate}</TD>
		   </TR>
	</c:forEach>      
	     
	</TABLE>
	
</div>

	<hr width='600' size='2' color='gray' noshade>
	<font color='gray' size='3'>
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
	           location.href="ficontentsearch.do?ps="+ps;
	       }
	    </script>
	    
	</font>

	<hr width='600' size='2' color='gray' noshade>
	
	    <form method="post" action="search02.do?">
		      <div id="f-element">
		        <input id="losub" type="text" name="losub" placeholder="search test" autocomplete="off">
		     
		      <button id="btnsearch" type="button" class="shadow">검색</button>
		       </div>
		</form>
	    
</center>
</body>
</html>