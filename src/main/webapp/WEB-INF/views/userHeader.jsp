<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FinalProject</title>
<style>
	*{
		padding:0;
		margin:0;
	}
	header{
		
	}
	.h_bar{
        position:fixed;
        background-color: white;
	    top:0px;
	    left:0px;
	    width:100%;
	    height:140px;
	    border:1px solid yellow;
	    display: flex;
	    align-items: center;
	}
	.h_bar > div{
		flex:1;
		padding: 10px;
	}
	.h_bar > div:nth-child(1){
	}
	.frame{
	  	padding-top: 160px;
	  	background-color:#f1f3f5;
	  	height:2000px;
    }  
    a{
    	text-decoration: none;
    	color:black;
    }
    a:hover{
    	cursor:pointer;
    	color:#dadada;
    }
    .h_bar > div > ul{
    	padding-right:20px;
    }
    .h_bar > div > ul > li{
    	list-style: none;
    }
    .sb{
    	display:flex;
    	justify-content: space-between;
    	align-items: center;
    }
    @font-face {
            font-family: 'GangwonEdu_OTFBoldA';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
    body {
         	font-family: 'GangwonEdu_OTFBoldA';
 }
</style>
</head>
<body>




<header>
	<div class="h_bar">
		<div><h1><a href="${cpath }">헤헤</a></h1></div>
		<div>
			<ul class="sb">
				<li><a href="${cpath }/about">About</a></li>
				<li><a href="${cpath }/ticket/tkHome">Ticket</a></li>
				<li><a href="${cpath }/diet/home">Diet</a></li>
				<li><a href="${cpath }/social/home">Social</a></li>
				<li><a href="${cpath }/member/login">Login</a></li>
			</ul>
		</div>
	</div>
</header>


</body>
</html>