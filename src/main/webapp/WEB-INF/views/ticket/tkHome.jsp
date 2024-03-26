<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.alert{
    background: #ffdb9b;
    padding: 20px 40px;
    min-width: 100%;
    position: fixed;
    right: 0px;
    top: 120px;
    overflow: hidden;
    border-radius: 4px;
    border-left: 8px solid #ffa502;
    z-index:6;
}
.alert.show{
    animation: show_slide 1s ease forwards; 
}
.alert.showAlert{
    opacity: 1;
    pointer-events: auto;
}

@keyframes show_slide{
    0%{
        transform: translateX(100%);
    }
    40%{
        transform: translateX(-10%);
    }
    80%{
        transform: translateX(0%);
    }
    100%{
        transform: translateX(-10px);
    } 
}
.hide{
    display: none;
}
@keyframes hide_slide{
    0%{
        transform: translateX(-10px);
    }
    40%{
        transform: translateX(0%);
    }
    80%{
        transform: translateX(-10%);
    }
    100%{
        transform: translateX(100%);
    }
}

.alert .fa-exclamation-circle{
    position: absolute;
    left: 20px;
    top: 50%;
    transform: translateY(-50%);
    color: #ce8500;
    font-size: 30px;
}
.alert .msg{
    padding: 0 20px;
    font-size: 18px;
    color: #ce8500;
}
.close-btn{
    position: absolute;
    right: 0px;
    top: 50%;
    transform: translateY(-50%);
    background: #ffd080;
    padding: 20px 18px;
    cursor: pointer;
    z-index:7;

}
.close-btn:hover{
    background: #ffc766;
}
.close-btn .fa-times{
    color: #ce8500;
    font-size: 22px;
    line-height: 100%;
}
<!-- -->

.yj-menu {
	display: flex;
    justify-content: space-between;
	width: 1200px;
	margin: 0 auto;
    align-items: center;
    margin: 200px auto;
    margin-bottom: 500px;
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
.yj-hello{
	margin: 100px;
}
</style>

</head>
<body>

<div class="frame">
	<div class="dg-tkHome-banner">
        <img src="${cpath }/upload/mainImage/ticketMain.png">
	        <div class="yj-hello">
		        <c:if test="${not empty login }">
		        <h1 style="padding: 50px;">[${login.username}]님</h1>	
		        </c:if>
	        <h3>Health Protector에 오신 것을 환영합니다</h3>
	        
	        </div>
    </div>

	<div class="yj-menu">
		<div class="yj-box">
            <img src="https://plus.unsplash.com/premium_photo-1663076204670-0ddd1e380e86?q=80&w=2952&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
            <div class="dg-content">
                <h1>Check-In</h1>
                <a href="${cpath }/ticket/useTicket"><button class="dg-content-btn" id="CheckIn">Let's  go!</button></a>
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
	
	<div class="alert hide ticketAlert">
        <span class="fas fa-exclamation-circle"></span>
        <span class="msg">Warning: 이용권이 없습니다</span>
        <div class="close-btn ticketClose">
            <span class="fas fa-times"></span>
        </div>    
    </div>
    
</div>
	
<%@ include file="../footer.jsp" %>

<script>
const openBtn = document.getElementById('CheckIn')
const ticketClose = document.querySelector('.ticketClose')
const ticketModal = document.querySelector('.ticketAlert')


openBtn.addEventListener('click',function(event){
	const login = '${login.userid}'
	if(login != '' && '${tkCount}' == 0){
		event.preventDefault()
		ticketModal.classList.remove('hide')
	}
})

ticketClose.addEventListener('click',function(event){
	ticketModal.classList.add('hide')
})

</script>

</body>
</html>