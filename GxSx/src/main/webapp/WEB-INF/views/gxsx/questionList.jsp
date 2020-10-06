<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class='wrap-table-shopping-cart'>
	<table class='table-shopping-cart'>
		<tr class='table_head'>
			<th class=''>No</th>
			<th class=''>Title</th>
			<th class=''>Finish</th>
		</tr>
		
		
		<c:forEach items="${ vo.list }" var="list">
		<tr class='table_row'>
			<th class=''>${ list.rnum }</th>
		<td>	
		<a href="../Question/questionco.do?qno=${list.qno}">
		    ${list.qsub}
		 </a>
		</td>	                                   
			
			<c:if test="${ list.qreply == null }">
				<td class=''>미완료</td>
			</c:if>
			<c:if test="${ list.qreply != null }">
				<td class=''>완료</td>
			</c:if>
		</tr>
		</c:forEach>
	</table>
</div>

<div class="flex-c-m flex-w w-full p-t-38" id="paging">
  	<c:if test="${ vo.page.startPage != 1 }">
	  <p class="flex-c-m how-pagination1 trans-04 m-all-7"
	  onclick="selectQuestionPage(${ vo.page.startPage-1 });">
	  &#171;
	  </p>
  	</c:if>

    <c:forEach begin="${ vo.page.startPage }" end="${ vo.page.endPage }" step="1" varStatus="status">
    <c:choose>
    	<c:when test="${ status.index eq vo.page.currentPage }">
	    	<p class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"
	    	onclick="selectQuestionPage(${ status.index });">
			      ${ status.index }
			</p>
    	</c:when>
    	<c:otherwise>
	    	<p class="flex-c-m how-pagination1 trans-04 m-all-7"
	    	onclick="selectQuestionPage(${ status.index });">
			      ${ status.index }
			</p>
    	</c:otherwise>
    </c:choose>
    </c:forEach>
  	<c:if test="${ vo.page.endPage ne vo.page.pageCount }">
      <p class="flex-c-m how-pagination1 trans-04 m-all-7"
      onclick="selectQuestionPage(${ vo.page.endPage+1 });">
      	&#187;
      </p>
  	</c:if>
  </div>
