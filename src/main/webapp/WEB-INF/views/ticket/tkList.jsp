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
  <form id="refundForm" method="POST">
    <table>
		<thead>
			<tr>
				<td>환불여부</td>
				<td>사용자</td>
				<td>이용권</td>
				<td>사용개수</td>
				<td>구매날짜</td>
				<td>만료날짜</td>		
			</tr>
		</thead>
	<tbody>		
			<c:forEach var="dto" items="${list }">
			
			<tr>
				<td>
					<c:if test="${dto.tkCount > dto.tk_value}">
						<input type="checkbox" name="arr" value="${dto.idx}">
					</c:if>
				</td>
				<td>${dto.userid }</td>
				<td>${dto.ticket_id}</td>
				<td>${dto.tkCount}</td>
				<td>${dto.buyDay }</td>
				<td>${dto.expirDay }</td>
			</tr>
			</c:forEach>
	</tbody>
	</table>
 
   <input type="submit" value="환불하기">
   </form>
   
</div>   

<script>
const counts = []
const refundCheck = document.getElementById('refundCheck')
const submit = document.querySelector('input[type="submit"]')
const click = document.querySelectorAll('input[type="checkbox"]')

function clickHandler(event){
	const idx = event.target.value

	if(event.target.checked){
		counts.push(idx);
		console.log(counts)
	}
}

function submitHandler(event) {
	event.preventDefault()
    const countsString  = counts.join(',')
    refundForm.action = '${cpath}/ticket/refund/' + countsString
	refundForm.submit();
  }
  
  submit.onclick = submitHandler
  
  click.forEach(checkbox => {
      checkbox.addEventListener('click', clickHandler)
  })
  
</script>

<%@ include file="../footer.jsp" %>

</body>
</html>