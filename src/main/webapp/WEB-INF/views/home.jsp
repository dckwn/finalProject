<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.dh-homeImg{
	width:100%;
	margin:auto;
	text-align: center;
}
.dh-homeImg > img{
	width: 100%;
}
.bg-video {
  position: relative;
  height: 100%;
  width: 100%;
  overflow: hidden;
  z-index: -1;
  opacity:0.5;
}

.bg-video__content {
  height: 100%;
  width: 100%;
  object-fit: cover; 
  
}
</style>
</head>
<body>
	<div class="frame">
	<div class="bg-video">
		  <video class="bg-video__content" autoplay muted loop>
		    <source src="${cpath }/upload/운동.mp4" type="video/mp4" />
		    
		  </video>
	</div>
	
	</div>
	
	<script>
   
//         const checkHandler = function(){
//            if('${login.userid}' != '' && '${totalCount}' <= 2){
//         		warn.classList.remove(hidden)         
//            }

	</script>
	
<%@ include file="footer.jsp" %>
	
</body>
</html>