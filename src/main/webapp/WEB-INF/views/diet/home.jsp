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
.dh-doughnut{
	width:50%;
}
</style>

</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>


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
		<h3>[${login.userid }] (${param.when })</h3>
		<div>${info.intake } 칼로리 (탄:${info.userTan } 단: ${info.userDan } 지: ${info.userJi } )</div>
		<div class="dh-doughnut">
			<canvas id="doughnut-chart" width="auto" height="150vh">
			</canvas>
		</div>
		<c:if test="${NutDto != null }">
			<br>
			<div>칼로리 : ${NutDto.user_kcal }</div>
			<div>탄수화물 : ${NutDto.user_tan }</div>
			<div>단백질 : ${NutDto.user_dan }</div>
			<div>지방 : ${NutDto.user_ji }</div>
			<div>당 : ${NutDto.user_dang }</div>		
			<div>나트륨 : ${NutDto.user_na }</div>	
		</c:if>
	</div>
	
	<div class="meals">
		<div class="achim">
			<h3>아침</h3>
			<div>
				<c:forEach var="m" items="${foodM }">
					<div>
						<p>${m.food_name } (<span class="dh-m">${m.kcal }</span> kcal)</p>
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
						<p>${l.food_name } (<span class="dh-l">${l.kcal }</span> kcal)</p>
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
						<p>${d.food_name } (<span class="dh-d">${d.kcal }</span> kcal)</p>
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
						<p>${y.food_name } (<span class="dh-y">${y.kcal }</span> kcal)</p>
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
		const dhm = document.querySelectorAll('.dh-m')
		const dhl = document.querySelectorAll('.dh-l')
		const dhd = document.querySelectorAll('.dh-d')
		const dhy = document.querySelectorAll('.dh-y')
		const all = '${info.intake}'
		
		let m = 0
		let l = 0
		let d = 0
		let y = 0
		
		dhm.forEach(e=> m += +e.innerText)
		dhl.forEach(e=> l += +e.innerText)
		dhd.forEach(e=> d += +e.innerText)
		dhy.forEach(e=> y += +e.innerText)
		
		let minus = all - (m+l+d+y)
		
		new Chart(document.getElementById("doughnut-chart"), {
		    type: 'doughnut',
		    data: {
		      labels: ["아침", "점심", "저녁", "간식", "남은 양"],
		      datasets: [
		        {
		          label: "Population (millions)",
		          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#f1f3f5"],
		          data: [m,l,d,y,minus]
		        }
		      ],
		      borderWidth: 0,
              scaleBeginAtZero: true
		    },
		    options: {
		    	
		      title: {
		        display: false,
		        text: '총 권장 섭취량  '+all
		      }
		    }
		});
		
		
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







</body>
</html>