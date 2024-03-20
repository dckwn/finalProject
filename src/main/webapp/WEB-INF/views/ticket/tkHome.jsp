<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


.yj-menu {
	display: flex;
    justify-content: space-between;
	width: 1200px;
	margin: 0 auto;
    align-items: center;
    margin: 60px auto;
}

.yj-box {
	width: 320px;
	height: 400px;
	background-color: skyblue;
	border-radius: 20px;
    overflow: hidden;
    border: 8px solid #fff;
    position: relative;

}
.yj-box img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 15px;
}
.dg-content {
    width: 100%;
    height: 100%;
    top: 0;
    right: -100%;
    position: absolute;
    background: #b9cfd675;
    border-radius: 15px;
    backdrop-filter: blur(5px);
    color: #f1f3f5;
    padding: 30px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    transition: 2s;
}
.yj-box:hover .dg-content {
    right: 0;

}

.dg-content h1 {
    /* text-transform: uppercase; */
    font-size: 45px;
    font-weight: 500;
    margin-bottom: 30px;
}
.dg-content-btn {
    color: #1f3d47;
    background: #8fabba;
    width: 120px;
    padding: 10px 20px;
    border-radius: 5px;
    text-transform: capitalize;
    border: none;
    outline: none;
    font-weight: 500;
    cursor: pointer;
}
.dg-tkHome-banner {
    width:100%;
    text-align: center;
    margin: 0 auto 50px auto;
}
.dg-tkHome-banner img{
    width: 100%;
    height: auto;
    margin-bottom: 30px;
    margin-top: 0;
}
.dg-tkHome-banner h1 {
    font-size: 40px;
    font-weight: 500;
}
.dg-tkHome-banner h3 {
    font-size: 30px;
    font-weight: 500;
}

</style>



</head>
<body>


	
	



<div class="frame">
	<div class="dg-tkHome-banner">
        <img src="${cpath }/upload/mainImage/ticketMain.png">
        <h1>[${login.userid}]님,</h1>	
        <h3>Health Protector에 오신 것을 환영합니다</h3>
        <br>
    </div>

	<div class="yj-menu">
		<div class="yj-box">
            <img src="https://plus.unsplash.com/premium_photo-1663076204670-0ddd1e380e86?q=80&w=2952&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
            <div class="dg-content">
                <h1>Check-In</h1>
                <a href="${cpath }/ticket/useTicket"><button class="dg-content-btn">Let's  go!</button></a>
            </div>
		</div>
		
		<div class="yj-box">
		    <img src="https://images.unsplash.com/photo-1524863479829-916d8e77f114?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
            <div class="dg-content">
                <h1>Ticket Purchase</h1>
                <a href="${cpath }/ticket/tkBuy"><button class="dg-content-btn">Pay now!</button></a>
            </div>
		</div>
		
		<div class="yj-box">
            <img src="https://images.unsplash.com/photo-1599058917212-d750089bc07e?q=80&w=2669&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
            <div class="dg-content">
                <h1>My Ticket</h1>
         	    <a href="${cpath }/ticket/tkList"><button class="dg-content-btn">My Ticket</button></a>
            </div>
		</div>
	</div>
	
</div>
	
	
<%@ include file="../footer.jsp" %>


</body>
</html>