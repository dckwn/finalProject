<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FinalProject</title>

<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
<style>
	@font-face {
        font-family: 'GangwonEdu_OTFBoldA'; 
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    *{
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	}
	body {
	    width: 100%;
	    height: auto;
	    font-family: 'GangwonEdu_OTFBoldA';
	    background-image: linear-gradient(-225deg, #E3FDF5 0%, #FFE6FA 100%);
	    background-size: 100% 100%;
	    background-repeat: no-repeat;
	}
	header{
		
	}
	.h_bar{
        position:fixed;
        background-color: white;
	    top:0px;
	    left:0px;
	    width:100%;
	    height:120px;
	    display: flex;
	    align-items: center;
	    z-index:5;
	}
	.h_bar > div{
		flex:1;
		padding: 10px;
	}
	.h_bar > div:nth-child(1){
	}
	.frame{
	  	padding-top: 120px;
    }  
    a{
    	text-decoration: none;
    	color:black;
    }
    a:hover{
    	cursor:pointer;
    	color:#dadada;
    }
    .dh-logo > a > img{
    	height:70px;
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
	.dh-chatButton{
		position: fixed;
		right:50px;
		bottom:50px;
		cursor:pointer;
		width:50px;
		height:50px;	
	}
	#chat{
		
	}
	.dh-send {
		display:flex;
		width:350px;
	}
	.dh-send > input[type="text"]{
		width:80%;
		height:35px;
		border: 0;
		border-radius: 15px;
		outline: none;
		margin-left: 10px;
  		background-color: rgb(233, 233, 233);
	}
	.dh-chatFrame{
		width:350px;
		border: 1px solid black;
		margin-top:20px;
		position: fixed;
		right:20px;
		bottom:40px;
		background-color:#f1f3f5;
	}
	.dh-chatHead{
		height:60px;
		width:350px;
		background-color: #8ABDCF;
		display:flex;
		justify-content: space-between;
		align-items: center;
	}
	.dh-chatHead > div{
		padding:10px;
	}
	.dh-message{
		display:flex;
		margin: 5px 10px;
		align-items: center;
	}
	.dh-message>div{
		display:flex;
		border-radius: 10px;
		border: 1px solid black;
		width:fit-content;
		padding: 15px;
	}
	.start{
		justify-content: flex-start;
	}
	.end{
		justify-content: flex-end;
	}
	.service{
		justify-content: center;
		padding: 0px 20px;
	}
	.out{
		cursor:pointer;
	}
	.dm{
		display:flex;
		justify-content: center;
		width:20%;
		align-items: center;
		cursor:pointer;
	}
	.dh-profile > img{
		cursor:pointer;
		width:45px;
		height:45px;
		border-radius: 50%;
		overflow: hidden;
	}
	.dh-mini{
        width:360px;
        height:auto;
        border: 1px solid #dadada;
        background-color:#f1f3f5;
        border-radius: 25px;
        text-align: center;
        position:absolute;
        top:130px;
        right:20px;
    }
    .dh-flex{
        display:flex;
    }
    .dh-flex > div{
        flex:1;
    }
    .dh-pro_img > img{
    	width:120px;
    	height:120px;
    	border-radius:60px;
    	overflow: hidden;
    }
    .dh-minipn{
    	position:relative;
    	margin: 15px 50px;
    	border-radius: 10px;
    	background-color:white;
    	padding:10px;
    }
    .dh-minip{
    	margin: 15px 20px;
    	border-radius: 10px;
    	background-color:white;
    	padding:10px;
    }
    .dh-minil{
    	border-radius: 10px 0px 0px 10px;
    	background-color:white;
    }
    .dh-minir{
   	 	border-radius: 0px 10px 10px 0px;
    	background-color:white;
    	border-left: 1px solid #dadada;
    }
    .dh-close{
    	cursor:pointer;
    	position:absolute;
    	top: 0px;
    	right:-40px;
    	padding:10px;
    }

}
</style>
</head>

<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.js"></script>
<script src="https://kit.fontawesome.com/7260f93afd.js" crossorigin="anonymous"></script>



<%
    // 현재 날짜에서 일수를 추출합니다.
    String day = new SimpleDateFormat("dd").format(new Date());
%>


<header>
	<div class="h_bar">
		<div class="dh-logo">
<!-- 			<h1> -->
 				<a href="${cpath }"><img src="${cpath }/icon/logo1.png"></a>
<!-- 			</h1> -->
		</div>
		<div>
			<ul class="sb">
				<li><a href="${cpath }/about">About</a></li>
				<li><a href="${cpath }/ticket/tkHome">Ticket</a></li>
				<li><a href="${cpath }/diet/home?when=<%= LocalDate.now() %>&day=<%=day%>">Diet</a></li>
				<li><a href="${cpath }/social/home">Social</a></li>
				<li>
					<c:if test="${empty login }">
						<a href="${cpath }/member/login"><i class="fa-solid fa-cat"></i> Login</a>
					</c:if>
					<c:if test="${not empty login }">
						<div class="dh-profile">
								<img src="${cpath }/upload/profile/${login.profile_image}">
						</div>
					</c:if>
				</li>
			</ul>
		</div>
	</div>	
</header>

<div class="dh-mini hidden">
        <div>
            <div class="dh-minipn"><h2>${login.username }</h2> <div class="dh-close"><h2>X</h2></div></div>
            <div class="dh-pro_img"><img src="${cpath }/upload/profile/${login.profile_image}"></div>
            <div class="dh-flex dh-minip">
                <div class="dh-minil"><a href="${cpath }/member/myPage">내 정보</a></div>
                <div class="dh-minir"><a href="${cpath }/member/logout">로그아웃</a></div>
            </div>
            <div class="dh-minip">
                <a href="${cpath }/social/feed/myboard">내가 쓴 글</a>
            </div>
            <div class="dh-minip">
                <a href="${cpath }/ticket/tkList">내 이용권</a>
            </div>
        </div>
    </div>

<div><img class="dh-chatButton" src="${cpath }/icon/chat.png"></div>

<div class="dh-chatFrame hidden">
	<div id="chat">
		
	</div>
</div>





<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> -->

<script>

const cpath = '${cpath}'
const userid = '${login.userid}'
const to='admin'
const back = document.getElementById('chat')
const chatFrame = document.querySelector('.dh-chatFrame')
const sockJS = new SockJS(cpath + '/endpoint')
const stomp = Stomp.over(sockJS)
const openChatButton = document.querySelector('.dh-chatButton'); // 버튼 요소를 가져옵니다.
//const sessionId = '${pageContext.session.getId()}'


if(userid != ''){
	const openMini = document.querySelector('.dh-profile > img')
	const closeMini = document.querySelector('.dh-close')
	const mini = document.querySelector('.dh-mini')
	
	openMini.onclick = () => {
		mini.classList.remove('hidden')
	}
	
	closeMini.onclick = () => {
		mini.classList.add('hidden')
	}
	stomp.connect({}, onConnect)
	openChatButton.disabled = false
}


function onConnect() {
	
	stomp.send('/app/create', {}, JSON.stringify({	// 서버에게 입장 메시지와 시간을 보낸다
		from: userid
	}))
}

async function onInput(){		//클라이언트가 채팅 요청을 했을때
		const text = '님의 상담'
	
		let tag = ''
	        tag += '<div class="dh-chatHead">'
	        tag += '<div><h3>'+userid+'</h3></div>'
	        tag += '<div class="out">상담종료</div>'
	        tag += '</div>'
	        tag += '<div id="'+userid+'" style="width: 350px; height: 500px; overflow-y: scroll;">'
			tag += '</div>'
			tag += '<div class="dh-send">'
			tag += '<input type="text" name="msg" id="msg">'
			tag += '<div class="dm">전송</div>'
			tag += '</div>'
		back.innerHTML = tag
		
		const show = document.getElementById(userid)
		const url = '${cpath}/getChat/'+ userid
		
		const result = await fetch(url).then(resp=>resp.json())
		const arr = Array.from(result)
		
		
		if(arr.length != 0){
			arr.forEach(e => {
				let po = ''
				let who = ''
				if(e.who_send != 'admin'){po = 'end'}
				else {
					po = 'start'
					who = '관리자'
				}
				
				let	str = ''
				str += '<div class="dh-message '+ po +'"><h2>'+ who +'</h2><div>' + e.content+'</div></div>'	
				show.innerHTML += str
			})
		}
		show.scrollTop = show.scrollHeight
	
	
		chatFrame.classList.remove('hidden');
		stomp.subscribe('/broker/goChat/'+ userid, chatT)
		stomp.send('/app/openChat/' + userid, {}, JSON.stringify({		
			text: text,
			from: userid
		}))
		
	
	async function outM(){
			chatFrame.classList.add('hidden')
			openChatButton.classList.remove('hidden')
			const url = '${cpath}/outChat/'+ userid
			
			const result = await fetch(url).then(resp=>resp.text())
			
			const text = 'out'	
			if(text == ''){													
				return
			}
			stomp.send('/app/sendM/' + userid, {}, JSON.stringify({		
				to: to,			
				from: userid,
				text: text
			}))
			stomp.disconnect(function() {
			    console.log('Disconnected');
			});
		}
	
	async function sendM(){
		const text = document.querySelector('input[name="msg"]').value	// 내용을 불러와서
		if(text == ''){													// 내용이 없으면 중단
			return
		}
		document.querySelector('input[name="msg"]').value = ''			// 입력창 비우기
		
		const url = '${cpath}/saveChat'
		
		const opt = {
		  method: 'POST',
		  body: JSON.stringify({ 
		  	who_send: userid,			
			who_chat: userid,
			content: text
		  }),
		  headers: {
	           'Content-Type': 'application/json; charset=utf-8'
	       }
		}
		
		const addResult = await fetch(url,opt).then(resp=>resp.text())
		if(addResult != 0) {console.log(addResult)}
		
		stomp.send('/app/sendM/' + userid, {}, JSON.stringify({		
			to: to,			
			from: userid,
			text: text
		}))
		
		document.querySelector('input[name="msg"]').focus()	// 다시 입력할 수 있도록 포커스 잡아주기
	}	
	const outBtn = document.querySelector('.out')
    const sendBtn = document.querySelector('.dm')
	const msgInput = document.querySelector('input[name="msg"]')
	
	outBtn.onclick = outM
	sendBtn.onclick = sendM
	msgInput.onkeyup = function(e){
		if(e.key == 'Enter') sendM()
	}
	
}


// 버튼이 클릭되었을 때의 이벤트 리스너를 추가합니다.
openChatButton.addEventListener('click', function(event) {
    // 버튼을 비활성화합니다.
    //openChatButton.disabled = true
    
    openChatButton.classList.add('hidden')
    onInput()
});


function chatT(chat){
	const content = JSON.parse(chat.body)
	const to = content.to
	const from = content.from
	let text = content.text
	
	let po = ''
	let who = ''
	let toA = ''
	if(from == 'admin'){toA = to; po = 'start'; who = '관리자'}
	if(to == 'admin'){toA = from; po = 'end'}
	if(text === 'out'){ text = '상담이 종료되었습니다.'; po ='service'; who=''}	
	
	let	str = ''
		str += '<div class="dh-message '+ po +'"><h2>'+ who +'</h2><div>' + text+'</div></div>'

	const show = document.getElementById(toA)
	show.innerHTML += str	
	show.scrollTop = show.scrollHeight
}


</script>

</body>
</html>