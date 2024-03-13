<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
	const url = '${url}'
	const msg = '${msg}'
	const cpath = '${cpath}'
	
	if(url == '') {
		alert(msg)
		location.href = cpath + url
	}
	else {
		alert(msg)
		history.go(-1)
	}
</script>

</body>
</html>