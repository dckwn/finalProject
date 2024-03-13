<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="frame">

   <div class="dg-left">
      <h1 style="color: blue;">${login.userid }님,</h1>
      <div>
         <p class="dg-tfont1">총 구매 개수는</p><p class="dg-sfont2"></p>
      </div>
      <div>
         <p class="dg-tfont1">총 구매 가격은</p><p class="dg-sfont3"></p>
      </div>
   </div>
   
   
	<div class="dg-right">
         <form method="POST">
         
	    <table>
			<thead>
				<tr>
					<td>번호</td>
					<td>이용권</td>
					<td>가격</td>
					<td>수량</td>
				</tr>
			</thead>
		<tbody>
				<c:forEach var="dto" items="${list }">
				<tr>
					<td>${dto.idx }</td>
					<td><a href="${cpath}/ticket/tkBuy/${dto.idx}">${dto.tk_content}</a></td>
					<td>${dto.price}</td>
					<td>
						<select class="yj-tkSelect" idx="${dto.idx }" price=${dto.price }>
							<c:forEach var="i" begin="0" end="10" step="1" >
								<option value="${i }" >${i}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				</c:forEach>
		</tbody>
		</table>
        <div class="yj-result"></div>              
		     <input type="hidden" name="idx" value="${dto.idx }">
				<table>
					<tr>
					<td><input type="hidden" name="userid" value="${dto.userid }"></td>
					</tr>
					<tr>
					<td><input type="hidden" name="ticket_id" value="${dto.ticket_id }"></td>
					</tr>
					<tr>
					<td><input type="hidden" name="ticketCount" value="${dto.ticketCount }"></td>
					</tr>
					<tr>
					<td><input type="hidden" name="expirDay" value="${dto.expirDay }"></td>
					</tr>
					<tr>
					<td><input type="hidden" name="buyPrice" value="${dto.buyPrice }"></td>
					</tr>
				</table>
			<input type="submit" value="구매하기">
         </form>
  	</div> 
     
      <div class="dg-btn1"></div> 
</div>

<script>
	// select 가 onchange가 될 때 각각의 이용권 idx, 수량, 총 가격(idx에 해당하는 이용권 * 수량) 을 script 변수에 저장
	const selectList = document.querySelectorAll('.yj-tkSelect')
	const show = document.querySelector('.yj-result')
	const buy = document.querySelector('input[type="submit"]')
	
	let arr = new Array(3)
	
	function getTotal(){
		let total = 0
		for (let i = 0; i < arr.length; i++) {
	       if(arr[i]) total += arr[i].price * arr[i].count;
	    }
		show.innerHTML = '<h3>'+total+'</h3>'
	}
	
	function changeHandler(e){
		let ob = {
			count: e.target.value || 0,
			idx: e.target.getAttribute('idx') || 0,
			price: e.target.getAttribute('price') || 0
		}
		arr[ob.idx-1] = ob
		
		getTotal()		
	}
	
	selectList.forEach(e => e.onchange = changeHandler)
	// 총 가격을 출력
	
	function buyHandler(event){
		event.preventDefault()
		let counts = new Array(3)
		for(let i = 0; i < arr.length; i++){
			if(arr[i]){ counts[i] = arr[i].count}
			else	{counts[i] = 0}
		}
		console.log(counts)
 		location.href = '${cpath}/ticket/Buy/'+ counts
	}
	buy.onclick = buyHandler
	

</script>

<%@ include file="../footer.jsp" %>

</body>
</html>