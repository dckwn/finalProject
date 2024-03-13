<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="frame">

<table>
 	<thead>
		<tr>
			<td>아이디</td>
			<td>출석날짜</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.userid }</td>
			<td>${dto.checkDate }</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>