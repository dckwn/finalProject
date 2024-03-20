<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="userHeader.jsp" %>
<script>
	const url = '${url}'
	const msg = '${msg}'
	const cpath = '${cpath}'
	
	if(url == '') {
		alert('삭제에 실패했습니다')
		history.go(-1)
	}
	else {
		alert(msg)
		location.href = cpath + url
	}
</script>
</body>
</html>