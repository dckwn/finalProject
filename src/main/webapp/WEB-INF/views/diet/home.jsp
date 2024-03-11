<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.info{
		width:1000px;
		margin: auto;
	}
	.meals{
		display:flex;
		flex-wrap: wrap;
		width: 1000px;
		margin: 20px auto;
	}
	.meals > div{
		width: 450px;
		padding: 10px;
	}
</style>
</head>
<body>


<div class="frame">

	<div>
	</div>

	<div class="dh-when hidden">
		<c:forEach var="showDate" items="${dateList }">
			<input type="radio" id="${showDate }" name="show_date" value="${showDate }">
		    <label for="${showDate }">${showDate }</label><br>	
		</c:forEach>
	</div>
	<div class="info hidden">
		<h3>[${login.userid }]님의 총 권장 섭취량 (${param.when })</h3>
		<div> [테스트하려고 직접 작성한 값] </div>
		<div>2275 칼로리 (탄:113 단: 45 지: 68 )</div>
		<br>
		<div> [DB에서 받은 값] </div>
		<div>칼로리 : ${NutDto.user_kcal }</div>
		<div>탄수화물 : ${NutDto.user_tan }</div>
		<div>단백질 : ${NutDto.user_dan }</div>
		<div>지방 : ${NutDto.user_ji }</div>
		<div>당 : ${NutDto.user_dang }</div>		
		<div>나트륨 : ${NutDto.user_na }</div>	
	</div>
	
	<div class="meals hidden">
		<div class="achim">
			<h3>아침</h3>
			<div>
				<c:forEach var="m" items="${foodM }">
					<div>
						<p>${m.food_name } (${m.kcal } kcal)</p>
					</div>
				</c:forEach>
			</div>
			<a href="${cpath }/diet/add/아침?when=${param.when}">추가하기</a>
		</div>
		<div class="jumshim">
			<h3>점심</h3>
			<div>
				<c:forEach var="l" items="${foodL }">
					<div>
						<p>${l.food_name } (${l.kcal } kcal)</p>
					</div>
				</c:forEach>
			</div>
			<a href="${cpath }/diet/add/점심?when=${param.when}">추가하기</a>
		</div>
		<div class="juneuck">
			<h3>저녁</h3>
			<div>
				<c:forEach var="d" items="${foodD }">
					<div>
						<p>${d.food_name } (${d.kcal } kcal)</p>
					</div>
				</c:forEach>
			</div>
			<a href="${cpath }/diet/add/저녁?when=${param.when}">추가하기</a>
		</div>
		<div class="gansick">
			<h3>간식</h3>
			<div>
				<c:forEach var="y" items="${foodY }">
					<div>
						<p>${y.food_name } (${y.kcal } kcal)</p>
					</div>
				</c:forEach>
			</div>
			<a href="${cpath }/diet/add/간식?when=${param.when}">추가하기</a>
		</div>	
	</div>
</div>

<%@ include file="../footer.jsp" %>



<script>
	const radioBtnList = document.querySelectorAll('input[type="radio"]')
	
	function getByDate(e){
		location.href = '${cpath}/diet/home?when='+e.target.value
	}
	
	radioBtnList.forEach(e => e.onclick = getByDate)
	
</script>






</body>
</html>