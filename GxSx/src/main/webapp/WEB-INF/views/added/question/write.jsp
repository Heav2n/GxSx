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
<h3> Write </h3>
</font>
<font color='gray' size='4' face='휴먼편지체'>
<a href='list.do'>목록</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</font>
<hr width='600' size='2' color='gray' noshade>
</center>

<form id='write_form' name='input' method='post' action='Questioninsert.do' accept-charset='UTF-8'>
<table border='0' width='600' align='center' cellpadding='3' cellspacing='1' bordercolor='gray'>   
  
   <tr>
      <td width='20%' align='center' >작성자</td>
      <td>
         <input name='quid' value='${user.usersid}'/>
      </td>
   </tr>
 
<!--    <tr> -->
<!--       <td width='20%' align='center'>등록날짜</td> -->
<!--       <td><input name='fidate' /></td> -->
<!--    </tr> -->
   
   <tr>
      <td align='center'>종류</td>
      <td>
         <select name="locname" id="cname">
           <option value="가방">가방</option>
           <option value="귀금속">귀금속</option>
           <option value="도서용품">도서용품</option>
           <option value="서류">서류</option>
           <option value="산업용품">산업용품</option>
           <option value="핸드폰">핸드폰</option>
           <option value="현금">현금</option>
           <option value="카드">카드</option>
           <option value="노트북">노트북</option>
           <option value="악기">악기</option>
           <option value="지갑">지갑</option>
           <option value="증명서">증명서</option>
           <option value="스포츠용품">스포츠용품</option>
           <option value="전자기기">전자기기</option>
           <option value="자동차">자동차</option>
           <option value="의류">의류</option>
           <option value="기타">기타</option>
         </select>
      </td>
   </tr>
   
   <tr>
      <td align='center'>제목</td>
      <td><input name='qsub' /></td>
   </tr>
            
   <tr>
      <td align='center'>내용</td>
      <td><textarea id='ta' name='qcon' rows='10' cols='70'></textarea></td>
   </tr>
<center> 
<input type='button' value='등록' onclick='write_form()'>
</center>
</form>
<script>		
	function write_form(){
		alert("들어왔니?");
		if(confirm("문의글을 등록하시겠습니까?") == true){
			document.getElementById('write_form').submit();
		}else{
			return false;
		}
	}
</script>
</body>
</html>