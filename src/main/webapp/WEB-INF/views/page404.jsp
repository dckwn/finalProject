<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.errorFrame {
		margin: 107px auto;
		padding: 50px;
		text-align: center;
		border-radius: 20px;
		 box-shadow: -7px -7px 10px white, 5px 5px 10px rgba(198, 196, 196, 0.585);
		color: #8A7575;
	}
	.errorFrame h1 {
		font-size: 60px;
		margin: 20px auto;
	}
	.errorFrame p {
		margin: 10px auto;
	}
	#backBtn {
		width: 200px;
		margin-top: 20px;
		padding: 10px 20px;
		font-size: 20px;
		border-radius: 5px;
		background-color: #dadada;
		color: #8A7575;
		border: none;
		outline: none;
		cursor: pointer;
		box-shadow: -3px -3px 5px white, 3px 3px 5px rgba(0, 0, 0, 0.585);
	}
	#backBtn:hover {
		color: white;
		background-color: #8A7575;
	}
</style>
</head>
<body>

<div class="frame center">
	<div class="errorFrame">
		<h1>404 Page Not Found</h1>
	    <p>죄송합니다. 요청하신 페이지를 찾을 수 없습니다.</p>
	    <a href="${cpath }/"><button id="backBtn">Home</button></a>
	</div>
</div>



<%@ include file="footer.jsp" %>
</body>
</html>