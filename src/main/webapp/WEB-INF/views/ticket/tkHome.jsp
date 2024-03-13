<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.yj-menu{
display: flex;
justify-content: space-around;

}
.yj-box{
 height: 200px;
 width: 200px;
 background-color: skyblue;
 font-size: 25px;
 text-align: center;
 margin-top: 20px;
}


</style>



</head>
<body>

<div class="frame">
	
	<h1>신유진님,</h1>	
	<h3>Health Protector에 오신 것을 환영합니다</h3>
	

	<div class="yj-menu">
		<div class="yj-box">
		<a href="${cpath }/ticket/useTicket">이용권 사용</a>
		</div>
		
		<div class="yj-box">
		<a href="${cpath }/ticket/tkBuy">이용권 구매</a>
		</div>
		
		<div class="yj-box">
		<a href="${cpath }/ticket/tkList">이용권 조회</a>
		</div>
	</div>
	
</div>
	
<%@ include file="../footer.jsp" %>


</body>
</html>