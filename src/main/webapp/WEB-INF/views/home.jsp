<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.body {
   position: relative;
}
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
   .dg-Home-container {
      position: absolute;
      top: 0;
        left: 30%;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        z-index: 2;
    }
    h2.dg-title {
        position: relative;
        font-size: 70px;
        color: #383d52;
        -webkit-text-stroke: 0.2vw #383d52;
        text-transform: uppercase;
    }
    h2.dg-title::before {
        content: attr(data-text);
        position: absolute;
        top: 0;
        left: 0;
        width: 0;
        height: 100%;
        /* color: #01fe87; */
        color: white;
        -webkit-text-stroke: 0vw #383d52;
        /* border-right: 2px solid #01fe87; */
        border-right: 2px solid white;
        overflow: hidden;
        animation: animate 5s linear infinite;
    }
    @keyframes animate {
        0%,10%,100% {
            width: 0;
        }
        70% {
            width: 100%;
        }
    }

	   /* LinkSNS_fixed*/
        .linkSNS {
            position: fixed;
            top: 40%;
            right: 0;
            margin: 0;
            padding: 0;
        }
        .linkSNS .div {
           height: 40px;
           width: 40px;
        }
        .linkSNS a {
           width: 30px;
           height: 30px;
            text-decoration: none;
            color: black;
            padding: 0;
            text-align: center;
        }
        .linkSNS a:hover {
            color: white;
        }
        .linkSNS i {
            width: 100%;
            height: 100%;
            margin: 0;
            color: white;
            padding: 10px;
            font-size: 30px;
             background-color: orange;
             border-radius:  25px 0 0 25px;
        }
/*---------end-fixed-----------------*/

</style>
</head>
<body>
	<div class="frame center">
      <div class="bg-video">
           <video class="bg-video__content" autoplay muted loop>
             <source src="${cpath }/upload/운동.mp4" type="video/mp4" />
           </video>
      </div>
      <div class="dg-Home-container">
           <h2 class="dg-title" data-text="HEALTH PROTECTOR">HEALTH PROTECTOR</h2>
          </div>
   </div>
   
    <div class="linkSNS">
             <div><a href="#"><i class="fa-brands fa-instagram"></i></a></div>
             <div><a href="#"><i class="fa-brands fa-facebook-f"></i></a></div>
             <div><a href="#"><i class="fa-brands fa-youtube"></i></a></div>
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