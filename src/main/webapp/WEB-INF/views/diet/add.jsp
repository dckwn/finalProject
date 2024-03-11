<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.dh-searchbar{
		padding-top:50px;
	}
	.search{
		display:flex;
		width: fit-content;
		margin: auto;
		justify-content: center;
		border: 1px solid #dadada;
		border-radius: 15px;
		overflow: hidden;
		align-items: center;
	}
	.search > input[type="text"]{
		border: 0px;
		width: 400px;
		height: 35px;
		font-size: 18px;
		padding-left: 10px;
		background-color:inherit;
	}
	.search > input[type="text"]:focus{
		outline: none;
	}
	.search > input[type="button"]{
		border:none;
		background:none;
		cursor:pointer;
		background-image: url('/finalProject/resources/image/search.png');
		background-size: contain;
		background-repeat:no-repeat;
		width:30px;
		
	}
	.category{
		display:flex;
		max-width:1000px;
		margin: 10px auto;
		justify-content: center;
	}
	input[type="checkbox"]{
		appearance: none;
	}
	input[type="checkbox"] + label{
		padding: 10px;
		cursor: pointer;
		border: 1px solid #dadada;
		border-radius: 20px;
		overflow: hidden;
	}
	input[type="checkbox"]:checked + label{/* 체크된 경우의 배경색 */
		color: white;
    	background-color: #007bff; 
    	border: 1px solid #007bff;
	}
	#items{
		padding-bottom:50px;
	}
	.item {
        display: flex;
        max-width: 1200px;
        margin: auto;
    }
    .item>div {
        flex: 1;
        border: 1px solid grey;
        padding: 10px;
        text-align : right;
    }
    .item>div:nth-child(1) {
        flex: 4;
        text-align: left;
    }
    .item>div:nth-child(8){
    	text-align: center;
    	cursor: pointer;
    }
    .item>div:nth-child(8):hover{
    	background-color:#007bff;
    	color:white;
    }
    .item:nth-child(1)>div{
		font-weight: bolder;
		text-align:center;
	}
	.dh-load{
		text-align: center;
	}
	.dh-load > img{
		width: 100px;
		height:100px;
	}
	.dh-addFood{
		width: 750px;
		margin:auto;
		text-align: right;
	}
	#dh-modal > .content{
	width: 400px;
	height : 400px;
	border-radius: 50%;
	background-color: white;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	box-shadow: 20px 20px 50px black;
	z-index: 3;
	transition-duration: 0.5s;
	
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	}
	#dh-modal > .dh-overlay{
		width: 100%;
		height: 100%;
		background-color: rgba(0,0,0,0.5);
		position: fixed;
		top: 0;
		left:0;
		z-index: 2;
	}
	#dh-modal.hidden >  .content{
		transition-duration: unset;
		top:150%;
	}
	#dh-modal.hidden > .dh-overlay{
		display: none;
	}
</style>
</head>
<body>

<div id="dh-modal" class="hidden">
	<div class="content">
		<form id="addForm" method="POST">
			<h3>음식 직접 등록</h3>
			<p><input type="text" name="group_name" placeholder="카테고리" required></p>
			<p><input type="text" name="food_name" placeholder="이름" required></p>
			<p><input type="text" name="capacity" placeholder="내용량" required></p>
			<p><input type="text" name="tan" placeholder="탄수화물(g)" required></p>
			<p><input type="text" name="dan" placeholder="단백질(g)" required></p>
			<p><input type="text" name="ji" placeholder="지방(g)" required></p>
			<p><input type="text" name="dang" placeholder="당(g)" required></p>
			<p><input type="text" name="na" placeholder="나트륨(g)" required></p>
			<p><input type="text" name="kcal" placeholder="열량(kcal)" required></p>
			<p>
				<input type="submit" value="등록">
				<input id="close" type="button" value="돌아가기">
			</p>
			
		</form>
	</div>
	<div class="dh-overlay"></div>
</div>

<div class="frame">
	<div class="dh-searchbar">
		<div class="search">
				<input type="text" name="searchName">
				<input id="searchBtn" type="button" value="">
		</div>
		<div class="dh-addFood"><input id="open" type="button" value="음식 등록"></div>
		<div class="category">
		<c:forEach var="cate" items="${category}">
			<input type="checkbox" id="check${cate }" name="group_name" value="${cate }">
	  		<label for="check${cate }">#${cate }</label><br>
		</c:forEach>
		</div>	
	</div>
	
	<div id="items"></div>
	<div class="dh-load hidden"><img src="${cpath }/resources/image/Loading_icon.gif"></div>
</div>

<input type="hidden" name="userid" value="test">
<input type="hidden" name="meal_time" value="${meal_time }">
			

<%@ include file="../footer.jsp" %>

<script>
	const searchName = document.querySelector('input[name="searchName"]')
	const searchBtn = document.getElementById('searchBtn')
	const cate = document.querySelectorAll('input[type="checkbox"]')
	
	var selectValues = [];
	
	async function clickHandler(){
		let offset = 0;
		let fetchnum = 40;
		console.log('test')
		let url = '${cpath}/diet/getSearch?food_name='+searchName.value+'&group_name='+ selectValues
			url += '&offset='+offset+'&fetchnum='+fetchnum
		const items = document.getElementById('items')
		const result = await fetch(url).then(resp => resp.json())
		const arr = Array.from(result)
		
		let base = ''
		if(arr.length != 0){
			base += '<div class="item ">'
			base +=	'	<div>이름(내용량)</div>'
			base +=	'	<div>탄수화물(g)</div>'
			base +=	'	<div>단백질(g)</div>'
			base +=	'	<div>지방(g)</div>'
			base +=	'	<div>당(g)</div>'
			base +=	'	<div>나트륨(mg)</div>'
			base +=	'	<div>열량 (kcal)</div>'
			base +=	'	<div></div>'
			base +=	'</div>'	
		}
		items.innerHTML = base
		
		arr.forEach(e =>{
			let tag = ''
			tag += '<div class="item hidden">'
			tag += '<div>'+e.food_name+'('+e.capacity +'g)</div>'
			tag += '<div>'+e.tan+'</div>'
			tag += '<div>'+e.dan+'</div>'
			tag += '<div>'+e.ji+'</div>'			
			tag += '<div>'+e.dang+'</div>'			
			tag += '<div>'+e.na+'</div>'			
			tag += '<div>'+e.kcal+'</div>'			
			tag += '<div class="dh-add" idx="'+e.idx+'">등록</div>'			
			tag += '</div>'
			
			items.innerHTML += tag;
			
		})
		
		const addBtnList = document.querySelectorAll('.dh-add')
		addBtnList.forEach(function(e){
			e.addEventListener('click', async function(){
				var idx = e.getAttribute('idx')
				const meal_time = '${meal_time}'
				const userid = '${login.userid}'
				const addUrl = '${cpath}/diet/addNutrition'
				const when = '${param.when}'
				
				alert('${param.when}')
				alert(when)
				
				
				const opt = {
					  method: 'POST',
					  body: JSON.stringify({ 
						  userid: userid,
						  food_idx: idx,
						  meal_time: meal_time,
						  add_date: when
						  }),
					  headers: {
				           'Content-Type': 'application/json; charset=utf-8'
				       }
				}
				
				const addResult = await fetch(addUrl,opt).then(resp=>resp.text())
				if(addResult != 0){
					alert('등록되었습니다')
					location.href = '${cpath}/diet/home'
				}
				else{
					alert('등록 실패!')
				}
			})
		})
		
		document.body.onscroll = function(event) {
        const ob = {
        		scrollTop: window.scrollY,               // 스크롤된 세로의 위치
                clientHeight: window.innerHeight,         // 브라우저에 보여지는 창의 높이
                scrollHeight: document.body.scrollHeight   // 문서 전체의 높이
           }
			console.log(ob)
           const flag = ob.scrollTop + ob.clientHeight === ob.scrollHeight
           if(flag) {
        	   const loading = document.querySelector('.dh-load')
        	   loading.classList.remove('hidden')
           
               setTimeout(async function() {
        	   	   loading.classList.add('hidden')
            	   
	               offset = offset + fetchnum;
				   fetchnum = 20;
					
				   url = '${cpath}/diet/getSearch?food_name='+searchName.value+'&group_name='+ selectValues
				   url += '&offset='+offset+'&fetchnum='+fetchnum
	               
	               const result = await fetch(url).then(resp => resp.json())
								
	               const arr = Array.from(result)
	            	   console.log(arr)
	               arr.forEach(e =>{
						let tag = ''
						tag += '<div class="item hidden">'
						tag += '<div>'+e.food_name+'('+e.capacity +'g)</div>'
						tag += '<div>'+e.tan+'</div>'
						tag += '<div>'+e.dan+'</div>'
						tag += '<div>'+e.ji+'</div>'			
						tag += '<div>'+e.dang+'</div>'			
						tag += '<div>'+e.na+'</div>'			
						tag += '<div>'+e.kcal+'</div>'			
						tag += '<div class="dh-add" idx="'+e.idx+'">등록</div>'			
						tag += '</div>'
						
						items.innerHTML += tag;
						
					})
					if(arr.length < fetchnum){
						document.body.onscroll = null
					}
			   }, 1500);
               
           }
    	}
		
	}	
	
	searchBtn.onclick = clickHandler
	
	function changeCheck(){
		selectValues.length = 0;
		const cateList = document.querySelectorAll('input[type="checkbox"]:checked')
		cateList.forEach(function(checkbox) {
			selectValues.push(checkbox.value)
		})
		clickHandler()
	}
	
	cate.forEach(function(e){e.onchange = changeCheck})
	const modal = document.getElementById('dh-modal')
	const btns = [
			document.getElementById('open'),
			document.getElementById('close'),
			document.querySelector('div.dh-overlay')
		]
		btns.forEach(b => b.onclick = event => modal.classList.toggle('hidden'))		
	
</script>

</body>
</html>