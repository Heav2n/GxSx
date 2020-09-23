<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
	</head>
	
	<body>
		<div>
			<form action="tempsignup.do" method="post">
	    
				<input type="text" value="${kakaouser.userid}" disabled>
				<input type="hidden" name="userid" value="${kakaouser.userid}">
				<input type="text" name="upwd" placeholder="Enter your PWD">
				<input type="text" name="uname" value="${kakaouser.uname}">
				<c:if test="${ kakaouser.uemail.equals('temp')}">
					<input type="text" name="uemail" placeholder="Enter your EMAIL">
				</c:if>
				<c:if test="${ !kakaouser.uemail.equals('temp')}">
					<input type="text" name="uemail" value="${kakaouser.uemail}" disabled>
				</c:if>
				<input type="text" name="upnum" placeholder="Enter your PHONE NUMBER">
				
				<input type="submit" value="전송"/>
			</form>
		</div>
	
	</body>
</html>