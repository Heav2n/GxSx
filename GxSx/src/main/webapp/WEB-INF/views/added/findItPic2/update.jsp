<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title> GxSx </title>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
	    function f(){
	    	input.email.value = "";
	    	input.subject.value = "";
	    	//input.content.innerText = "";
	    	$("#ta").text("");
	    	
	    	input.email.focus();
	    }
	</script>
</head>
<body>
<center>
<font color='gray' size='4' face='휴먼편지체'>
<hr width='600' size='2' color='gray' noshade>
<h3> Update </h3>
</font>
<font color='gray' size='4' face='휴먼편지체'>
<a href='list.do'>목록</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href='write.do'>글쓰기</a><br/>
</font>
<hr width='600' size='2' color='gray' noshade>
</center>

<form name='input' method='post' action='update.do'>
<input type="hidden" name="fino" value="${update.fino}">
<table border='0' width='600' align='center' cellpadding='3' cellspacing='1' bordercolor='gray'>	
	<tr>
	   <td width='20%' align='center' >작성자</td>
	   <td>
	      <input name='fiuid' readonly value='${update.fiuid}'/>
	   </td>
	</tr>
	
	<tr>
		<td width='20%' align='center'>등록날짜</td>
		<td><input name='fidate' readonly value='${update.fidate}'/></td>
	</tr>
	
	<tr>
		<td align='center'>종류</td>
		<td><input name='ficname' value='${update.ficname}'/></td>
	</tr>
	
	<tr>
		<td align='center'>제목</td>
		<td><input name='fisub' value='${update.fisub}'/></td>
	</tr>
				
	<tr>
		<td align='center'>내용</td>
		<td><textarea id='ta' name='ficon' rows='10' cols='70'>${update.ficon}</textarea></td>
	</tr>
	
	<tr>
		<td align='center'>지역</td>
		<td><input name='fiano' value='${update.fiano}'/></td>
	</tr>
	
	<tr>
		<td align='center'>위치</td>
		<td><input name='fiplace' value='${update.fiplace}'/></td>
	</tr>
	
	<tr>
		<td align='center'>완료여부</td>
		<td><input name='fifin' value='${update.fifin}'/></td>
	</tr>
	
	<tr>
		<td align='center'>사진</td>
		<td><img src="/resources/imgs/${update.fipicname}" height=350>
			<input type="hidden" name="fipicname" value="${update.fipicname}"/>
		</td>
	</tr>
	
	<tr>
		 <td colspan='2' align='center'>
			<input type='submit' value='수정'>
			<input type="button" value="다시입력" onclick="f()">
		 </td>
	</tr>

</table>
<hr width="600" size="2" color="gray" noshade>
</form>
</body>
</html>

