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
	.dh-calender{
	margin:auto;
	width:35%;
}
.dh-dayItem {
	display: flex;
	flex-wrap: wrap;
	
}
.dh-day {
	width: 55px;
	height: 50px;
	padding: 2px 18px;
}

.dh-day input[type=radio] {
	display: none;
}

.dh-day input[type=radio]+label {
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 25px;
	cursor: pointer;
 	color: #dadada; 
	font-size: 20px;
}

.dh-day input[type=radio]:checked+label {
 	background-color: #dadada; 
}
span#date {
	display: table-cell;
	vertical-align: middle;
	padding-left: 33px;
	width: 57px;
	height: 50px;
	color: #aaa;
	font-weight: 400;
	font-size: 22px;
}
h3#month{
	vertical-align: middle;
	color: #aaa;
	font-weight: 500;
	font-size: 50px;
}
.prev{
	position:absolute;
	width:100px;
	height:100px;
	top: 320px;
	left: 540px;
}
.next{
	position:absolute;
	width:100px;
	height:100px;
	top: 320px;
	right: 500px;
}
a#prevM{
	vertical-align: middle;
	color: #dadada;
	font-weight: 400;
	font-size: 100px;
}
a#nextM{
	vertical-align: middle;
	color: #dadada;
	font-weight: 400;
	font-size: 100px;
}
</style>
</head>
<body>



<div class="frame">

	<div class="dh-calender">
		
			<div class="dateItem">
				<div><h3 id="month">${month} ${cal.month }</h3></div>
				<div>
					<span id="date">Sun</span> 
					<span id="date">MON</span>
					<span id="date">TUE</span>
					<span id="date">WED</span>
					<span id="date">THU</span>
					<span id="date">FRI</span>
					<span id="date">SAT</span>
				</div>
			</div>
			<div class="dh-dayItem">
				<c:forEach var="i" begin="1" end="${cal.startDayOfWeek-1 }">
				<div class="dh-day">
					<input type="radio" id="day" disabled /> 
					<label style="color: grey;" for="day"></label>
				</div>
				</c:forEach>
				<c:forEach var="i" begin="1" end="${cal.lastDay }">
					<c:set var="day" value="" />
					
					<c:if test="${day != 0}">
						<div class="dh-day">
							<input type="radio" name="date_id" id="day${i}" value="${day }" ${param.date_id == day ? 'checked':''} />
							<label for="day${i}">${i }</label>
						</div>
					</c:if>
					<c:if test="${day == 0}">
						<div class="dh-day">
							<input type="radio" name="when" id="day${i}" value="${i}"/> 
							<label style="color: grey;" for="day${i}">${i }</label>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<c:if test="${month > 1 }">
				<div class="prev"><a id="nextM" href="${cpath }/diet/home?strmonth=${month-1 }&when=${param.when}">&lt;</a></div>
			</c:if>
			<c:if test="${month < 12}">
				<div class="next"><a id="nextM" href="${cpath }/diet/home?strmonth=${month+1 }&when=${param.when}">&gt;</a></div>
			</c:if>
		</div>

	
	<div class="info">
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
	
	<div class="meals">
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
		const dayList = document.querySelectorAll('input[type="radio"]');
		
		function getDay(e) {
			let month = '${month}'
			if(month < 10){month = '0'+ month}
			let when = '2024-'+month+'-'
		    let day = e.target.value
		    if(day < 10){day = '0'+ day}
		    when += day
		    location.href = '${cpath}/diet/home?strmonth=${month}&when='+when
		}
	
		dayList.forEach(radio => {
		    radio.addEventListener('click', getDay);
		});
	</script>


<script>
// 	const radioBtnList = document.querySelectorAll('input[type="radio"]')
	
// 	function getByDate(e){
// 		location.href = '${cpath}/diet/home?when='+e.target.value
// 	}
	
// 	radioBtnList.forEach(e => e.onclick = getByDate)
	
</script>






</body>
</html>