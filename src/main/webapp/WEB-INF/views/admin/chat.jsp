<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#root > a{
		padding-right: 20px;
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
		background-color:#f1f3f5;
	}
	.dh-chatHead{
		height:60px;
		width:350px;
		background-color: #bbb;
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
</style>
</head>
<body>

<div class="frame">
	<div>
		<div id="root">
		</div>
		<div class="dh-chatFrame hidden">
			<div id="chat">
				
				
			</div>
		</div>
	</div>
</div>


<script>

const messageArea = document.getElementById('root')
const back = document.getElementById('chat')
const chatFrame = document.querySelector('.dh-chatFrame')
var subscriptionId
stomp.connect({}, onConnect)

function onConnect() {
	
	stomp.subscribe('/broker/cons/admin', receiveA)
}

loadChat()

async function loadChat(){
		const url = '${cpath}/loadChat'
		
		const result = await fetch(url).then(resp=>resp.json())
		const arr = Array.from(result)
		arr.forEach(e=> {
			let str = ''
			str += '<a class="goChat"><span id="user">'+ e +'</span>님의 상담</a>'
			messageArea.innerHTML += str
		})
		const goChat = document.querySelectorAll('.goChat')
		goChat.forEach(e => e.addEventListener('click', startChat));
}

const startChat = async function goChatHandler(e){
	
	const userSpan = e.currentTarget.querySelector('#user')		
    if (userSpan) {
    	
        who = userSpan.innerText
        let tag = ''
        tag += '<div class="dh-chatHead">'
        tag += '<div><h3>'+who+'</h3></div>'
        tag += '<div class="out">상담종료</div>'
        tag += '</div>'
        tag += '<div id="'+who+'" style="width: 350px; height: 600px; overflow-y: scroll;">'
		tag += '</div>'
		tag += '<div class="dh-send">'
		tag += '<input type="text" name="msg" id="msg">'
		tag += '<div class="dm">전송</div>'
		tag += '</div>'
		back.innerHTML = tag
		
		const show = document.getElementById(who)
		const url = '${cpath}/getChat/'+ who
		
		const result = await fetch(url).then(resp=>resp.json())
		const arr = Array.from(result)
		
		
		if(arr.length != 0){
			arr.forEach(e => {
				let po = ''
				let who = ''
				if(e.who_send == 'admin'){po = 'end'}
				else {
					po = 'start'
					who = e.who_send
				}
				
				let	str = ''
				str += '<div class="dh-message '+ po +'"><h2>'+ who +'</h2><div>' + e.content+'</div></div>'	
				show.innerHTML += str
			})
		}
		show.scrollTop = show.scrollHeight
		
		
		chatFrame.classList.remove('hidden')
        
        if (subscriptionId) {
		    stomp.unsubscribe(subscriptionId)
		}
        subscriptionId = stomp.subscribe('/broker/goChat/' + who, chatT).id
        
    }
	stomp.send('/app/sendM/' + who, {}, JSON.stringify({		
		to: '0',			
		from: '',
		text: ''
	}))
	const outBtn = document.querySelector('.out')
	const sendBtn = document.querySelector('.dm')
	const msgInput = document.querySelector('input[name="msg"]')

	outBtn.onclick = outM
	sendBtn.onclick = sendM
	msgInput.onkeyup = function(e){
		if(e.key == 'Enter') sendM()
	}
}

function chatT(chat){
	const content = JSON.parse(chat.body)
	const to = content.to
	const from = content.from
	let text = content.text
	
	let po = ''
	let who = ''
	let toA = ''
	if(from == 'admin'){toA = to; po = 'end'}
	if(to == 'admin'){who = from; toA = from; po = 'start'}
	if(text === 'out'){ text = '상담이 종료되었습니다.'; po ='service'; who=''}	
	
	let	str = ''
		str += '<div class="dh-message '+ po +'"><h2>'+ who +'</h2><div>' + text+'</div></div>'
		
	const show = document.getElementById(toA)
	show.innerHTML += str	
	show.scrollTop = show.scrollHeight
}

async function sendM(){
	const to = who
	const text = document.querySelector('input[name="msg"]').value	// 내용을 불러와서
	if(text == ''){													// 내용이 없으면 중단
		return
	}
	document.querySelector('input[name="msg"]').value = ''			// 입력창 비우기
	
	const url = '${cpath}/saveChat'
		
	const opt = {
	  method: 'POST',
	  body: JSON.stringify({ 
	  	who_send: 'admin',			
		who_chat: to,
		content: text
	  }),
	  headers: {
           'Content-Type': 'application/json; charset=utf-8'
       }
	}
	
	const addResult = await fetch(url,opt).then(resp=>resp.text())
	if(addResult != 0) {console.log(addResult)}
	
	stomp.send('/app/sendM/' + who, {}, JSON.stringify({		
		to: who,			
		from: userid,
		text: text
	}))
	
	document.querySelector('input[name="msg"]').focus()	// 다시 입력할 수 있도록 포커스 잡아주기
}	

async function outM(){
	chatFrame.classList.add('hidden')
	
	const to = who
	
	const url = '${cpath}/outChat/'+ who
	
	const result = await fetch(url).then(resp=>resp.text())
	
	const text = 'out'	
	if(text == ''){													
		return
	}
	stomp.send('/app/sendM/' + who, {}, JSON.stringify({		
		to: who,			
		from: userid,
		text: text
	}))
	stomp.disconnect(function() {
	    console.log('Disconnected');
	});
}	

	function receiveA(chat) {
		const content = JSON.parse(chat.body)		//메시지를 받으면
		const text = content.text					//누구에게서 온 메시지 인지 어떤 내용인지 
		const from = content.from
		const userid = '${login.userid}'
		let who = ''
		
		let str = ''
		str += '<a class="goChat"><span id="user">'+from +'</span>' + text + '</a>'
		const check = document.querySelectorAll('#user')
		if(check != null ){
			check.forEach(e => {
				if(e.innerText == from){str = ''}
			})
		}
		messageArea.innerHTML += str
		
		const goChat = document.querySelectorAll('.goChat')			
		goChat.forEach(e => e.addEventListener('click', startChat));
	}
</script>

</body>
</html>