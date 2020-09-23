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
	<font color='gray' size='4' face='휴먼편지체'>
	<hr width='600' size='2' color='gray' noshade>
	<h3> Contents </h3>
	<font color='gray' size='4' face='휴먼편지체'>
	<a href='write.do'>글쓰기</a>
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
		<td><img src="/resources/imgs/${content.fipicname}" height=350></td>
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
</center>
