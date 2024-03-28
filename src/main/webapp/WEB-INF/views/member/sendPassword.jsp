<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .frame {
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .dg-container {
        width: 500px;
        padding: 60px;
        border: 2px solid #FAD4D4;
        border-radius: 10px;
        display: flex;
        justify-content: center;
        text-align: center;
        flex-direction: column;
        align-items: center;
        gap: 1.5em;
        box-shadow: -7px -7px 10px white, 5px 5px 10px rgba(0, 0, 0, 0.585);
    }
    h1 {
        font-size: 45px;
        color: #8A7575;
    }
    .dg-login input {
        width: 100%;
        margin: 5px auto;
        font: 16px;
        font-weight: 600;
        color: #8A7575;
        padding: 15px;
        border: none;
        outline: none;
        border-radius: 25px;
        background-color: #FAD4D4;
        box-shadow: inset -5px -5px 10px white, inset 5px 5px 10px #dadada;
    }
    .dg-login input[type="submit"] {
        margin-top: 20px;
        display: inline-block;
        width: 200px;
        height: 50px;
        color: #8A7575;
        font-weight: bold;
        letter-spacing: 1px;
        text-transform: uppercase;
        font-size: 18px;
        border-radius: 25px;
        box-shadow: -5px -5px 10px white, 5px 5px 10px rgba(0, 0, 0, 0.485);
        background-color: #FAD4D4;
        border: none;
        cursor:pointer;
    }
    .dg-login input[type="submit"]:hover {
        background-color: #dadada;
    }
    .dg-sign-info a {
        color: #8A7575;
        margin: auto 45px;
    }
    
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

</style>
</head>
<body>
<div class="frame">
	<div class="hidden">${aa }</div>
	<div class="dg-container">
            <h1>Find Password</h1>
            
            <form method="POST">
                <div class="dg-login">
                    <input type="text" name="userid" placeholder="ID" autofocus >
                    <input type="text" name="email" placeholder="email" required>
                    <input type="submit" value="Find Password" class="yj-password">
                </div>
            </form>
     </div>
     
     <div class="alert hide emailAlert">
        <span class="fas fa-exclamation-circle"></span>
        <span class="msg">Warning: 정보가 틀렸습니다</span>
        <div class="close-btn emailClose">
            <span class="fas fa-times"></span>
        </div>    
    </div>


</div>
<%@ include file="../footer.jsp" %>


<script>
	const password = document.querySelector('.yj-password')
	const emailAlert = document.querySelector('.emailAlert')
	const emailClose = document.querySelector('.emailClose')


	password.addEventListener('click', async function(event){
		event.preventDefault()
		let userid = document.querySelector('input[name="userid"]').value
		let email = document.querySelector('input[name="email"]').value
	
		const url = '${cpath}/member/sendPassword' 
		const opt = {
			  method: 'POST',
			  body: JSON.stringify({ 
				  userid: userid,
				  email: email
				  }),
			  headers: {
		           'Content-Type': 'application/json; charset=utf-8'
		       }
		}
	
	const addResult = await fetch(url,opt).then(resp=>resp.text())
	if(addResult != 0){
		alert('메일로 임시 비밀번호를 보냈습니다')
		location.href = '${cpath}/member/login'
	}
	else{
		emailAlert.classList.remove('hide')
	}
})

emailClose.addEventListener('click', function(event){
	emailAlert.classList.add('hide')
})

</script>


</body>
</html>