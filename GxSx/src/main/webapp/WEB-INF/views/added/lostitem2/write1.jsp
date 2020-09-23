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
<a href='write.do'>글쓰기</a><br/>
</font>
<hr width='600' size='2' color='gray' noshade>
</center>

<form name='input' method='post' action='write.do' enctype='multipart/form-data' accept-charset='UTF-8'>
<table border='0' width='600' align='center' cellpadding='3' cellspacing='1' bordercolor='gray'>   
  
   <tr>
      <td width='20%' align='center' >작성자</td>
      <td>
         <input name='louid'/>
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
      <td><input name='losub' /></td>
   </tr>
            
   <tr>
      <td align='center'>내용</td>
      <td><textarea id='ta' name='locon' rows='10' cols='70'></textarea></td>
   </tr>
   
   <tr>
      <td align='center'>지역</td>
      <td>
         <select name="loano" id="ano">
           <option value="02">서울</option>
           <option value="051">부산</option>
           <option value="053">대구</option>
           <option value="032">인천</option>
           <option value="062">광주</option>
           <option value="042">대전</option>
           <option value="052">울산</option>
           <option value="044">세종</option>
           <option value="031">경기</option>
           <option value="033">강원</option>
           <option value="043">충북</option>
           <option value="041">충남</option>
           <option value="063">전북</option>
           <option value="061">전남</option>
           <option value="054">경북</option>
           <option value="055">경남</option>
           <option value="064">제주</option>
           <option value="0">기타</option>
         </select>
      </td>
   </tr>
   <tr>
   <td align='center'>사례</td>
   	  <td>
          <select name="logift">
          	<option value="1">있음</option>
          	<option value="0">없음</option>
   	  	  </select>
   	  </td>
   </tr>
   <tr>
      <td align='center'>위치</td>
      <td><input name='loplace' /></td>
   </tr>
<!--    <tr> -->
<!--       <td align='center'>사진</td> -->
<!--       <td> -->
<!--          <input type="text" name="lopicname" /> -->
<!--       </td> -->
<!--    </tr>    -->
   <tr>
</table>
<!--        <td colspan='2' align='center'> -->
<!--          <input type='submit' value='등록'> -->
<!--          <input type="button" value="다시입력" onclick="f()"> -->
<!--        </td> -->
<!--    </tr> -->


<hr width="600" size="2" color="gray" noshade>

<br/><br/>
	<div id=fileup align='center'>
	   <input type='file' name='files' align='center'>
	   <a href="#this" class="btn" name="delete">삭제</a>
	 </div>
<!-- 	 <div> -->
<!-- 	   <input type='file' name='files'> -->
<!-- 	 </div> -->
<!-- 	 <div> -->
<!-- 	   <input type='file' name='files'> -->
<!-- 	 </div> -->
<!-- 	<div id="filediv"> -->
<!-- 		<input type="file" name="lopicname"/> -->
<!-- 		<a href="#this" class="btn" name="delete">삭제</a> -->
<!-- 	</div> -->
	
<!-- 	<br/><br/> -->
<!-- 	<a href= file.do>파일 추가</a> -->

<input type='submit' value='등록'>

</form>
</body>
</html>