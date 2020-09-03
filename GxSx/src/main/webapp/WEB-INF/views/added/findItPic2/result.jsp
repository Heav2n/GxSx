<%@ page language="java" contentType="text/html; charset=utf-8"%>
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
	<h1>Upload completed</h1>

		<div class="result-images">

         <img src="${pageContext.request.contextPath }${url }" style="width:150px">

		</div>
<p> <a href='/../index.jsp'> 다시 업로드 하기 </a> /p>
</center>
