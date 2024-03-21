<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>Insert title here</title>
<style>
@font-face {
        font-family: 'GangwonEdu_OTFBoldA';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    body {
        font-family: 'GangwonEdu_OTFBoldA';
 	}
 	*{ 
 		padding:0; 
 		margin:0; 
 	} 
	header{
		
	}
	.frame{
	  	padding-top: 160px;
	  	padding-left:200px;
	  	background-color:#f1f3f5;
	  	height: 2000px;
    }  
    a{
    	text-decoration: none;
    	color:black;
    }
    a:hover{
    	cursor:pointer;
    	color:#dadada;
    }
    .sb{
    	display:flex;
    	justify-content: space-between;
    	align-items: center;
    }
    .hidden{
    	display:none;
    }
    .Mauto{
		margin: auto;
	}
	.center{
		display:flex;
		justify-content: center;
		align-items: center;
	}
</style>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>







<script>

const cpath = '${cpath}'
const userid = '${login.userid}'

const sockJS = new SockJS(cpath + '/endpoint')
const stomp = Stomp.over(sockJS)

stomp.connect({}, onConnect)

function onConnect() {
	stomp.send('/app/create', {}, JSON.stringify({	// 서버에게 입장 메시지와 시간을 보낸다
		from: userid
	}))
}

</script>



</body>
</html>