<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{  
 		box-sizing: unset; 
 	} 
	.dh-info{
		width:1000px;
		margin: auto;
	}
	.dh-infoDetail{
		display:flex;
		justify-content: space-around;
		padding:20px;
	}
	.dh-infoDetail>div:nth-child(1){
		position:relative;
		flex:3;
	}
	.dh-infoDetail>div:nth-child(2){
		flex:3;
		padding:20px;
		border: 1px solid black;
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
	
	.dh-calM{
		width:1000px;
		height: 500px;
		background-image: url('/icon/calender.png'); 
		background-size: 1000px 500px;
		background-repeat:no-repeat;
		margin: auto;		
		padding-top: 50px;
	}
	.dh-calBack{
	width:100%;
	height:fit-content;
	margin:auto;
	position: fixed;
	top:95px;
	left:0px;
	z-index:6;
	transition-duration: 1.5s;
}
	.calHidden{
		top:-600px;
	}
	div.overlay {
            z-index: 2;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color:#f1f3f5;
            background-color: rgba(0, 0, 0, 0.5); 
        }
	.dh-calender{
	position:relative;
	width:680px;
	margin: 0 auto;
}
.dh-dayItem {
	display: flex;
	flex-wrap: wrap;
	
}
.dh-day {
	width: 57px;
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
	width: 35px;
	height: 35px;
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
	top: 180px;
	left: -50px;
}
.next{
	position:absolute;
	width:100px;
	height:100px;
	top: 180px;
	right: -70px;
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
	height:500px;
	border: 1px solid black;
}
.dh-doughnutText{
	position:absolute;
	font-size: 30px;
	top:220px;
	left:140px;
}
.dh-showWhen{
	display:flex;
	justify-content: flex-end;
	align-items: center;
	padding:20px;
}
.dh-showWhen > div > img{
	padding-bottom:8px;
}
.dh-showCal{
	cursor: pointer;
	height:40px;
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

</style>

</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>

<c:if test="${info.intake==null}">
	<script>
		alert('정보를 입력하세요')
		location.href="${cpath}/diet/info"
	</script>
</c:if>

<div class="frame">

	<div class="dg-tkHome-banner">
        <img src="${cpath }/upload/mainImage/dietMain.png">
<%--         <h1>[${login.userid}]님,</h1>	 --%>
<!--         <h3>Health Protector에 오신 것을 환영합니다</h3> -->
<!--         <br> -->
    </div>

	<div class="dh-calBack calHidden">
		<div class="dh-calM">
		
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
							<input type="radio" id="day${i+100}" disabled /> 
							<label style="color: grey;" for="day${i+100}"></label>
						</div>
						</c:forEach>
						<c:forEach var="i" begin="1" end="${cal.lastDay }">
							<c:set var="day" value="${param.day }" />
							<c:if test="${!dateList.contains(i)}">
								<div class="dh-day">
									<input type="radio" name="when" id="day${i}" value="${i}" ${day==i ? 'checked':''} />
									<label for="day${i}">${i }</label>
								</div>
							</c:if>
							<c:if test="${dateList.contains(i)}">
								<div class="dh-day">
									<input type="radio" name="when" id="day${i}" value="${i}" ${day==i ? 'checked':''}/> 
									<label style="color: grey;" for="day${i}">${i }</label>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<c:if test="${month > 1 }">
						<div class="prev"><a id="nextM" href="${cpath }/diet/home?strmonth=${month-1 }&when=${param.when}&s=1">&lt;</a></div>
					</c:if>
					<c:if test="${month < 12}">
						<div class="next"><a id="nextM" href="${cpath }/diet/home?strmonth=${month+1 }&when=${param.when}&s=1">&gt;</a></div>
					</c:if>
				</div>
		</div>
	</div>
	<div class="overlay hidden"></div>

	
	<div class="dh-info">
		<div class="dh-showWhen">
			<h1>${param.when }　</h1><div><img class="dh-showCal" src="${cpath }/icon/cal.png"></div>
		</div>
		<div class="dh-infoDetail">
			<div class="dh-doughnut">
				<canvas id="myChart" width="300vh" height="300vh">
				</canvas>
					<div class="dh-doughnutText">총 : ${info.intake } (kcal)</div>
			</div>
			<div>
				<c:if test="${NutDto != null }">
					<br>
					<div>${info.intake } 칼로리 (탄:${info.userTan } 단: ${info.userDan } 지: ${info.userJi } )</div>
					<div>칼로리 : ${NutDto.user_kcal }</div>
					<div>탄수화물 : ${NutDto.user_tan }</div>
					<div>단백질 : ${NutDto.user_dan }</div>
					<div>지방 : ${NutDto.user_ji }</div>
					<div>당 : ${NutDto.user_dang }</div>		
					<div>나트륨 : ${NutDto.user_na }</div>	
				</c:if>
			</div>
		</div>
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
		const cal = document.querySelector('.dh-showCal')
		const overlay = document.querySelector('div.overlay')
		 function clickHandler(event) {
            const btns = document.querySelector('.dh-calBack')
            btns.classList.toggle('calHidden')
            overlay.classList.toggle('hidden')
        }

		overlay.onclick = clickHandler
		cal.onclick = clickHandler
		const test = '${param.s}'
		console.log(test)
		if(test == 1){
			clickHandler()
		}
		
		let m = 0
		let l = 0
		let d = 0
		let y = 0
		
		dhm.forEach(e=> m += +e.innerText)
		dhl.forEach(e=> l += +e.innerText)
		dhd.forEach(e=> d += +e.innerText)
		dhy.forEach(e=> y += +e.innerText)
		
		let minus = all - (m+l+d+y)
		
		const data = {
		      labels: ["아침", "점심", "저녁", "간식", "남은 양"],
		      datasets: [{
		          label: "Diet",
		          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#f1f3f5"],
		          data: [m,l,d,y,minus],
			      borderWidth: 0,
	              scaleBeginAtZero: true
		        }]
		}
		
		new Chart(document.getElementById('myChart'), {
		    type: 'doughnut',
		    data,
		    options: {
		        cutoutPercentage: 65, // 도넛 차트의 중심에 텍스트를 표시하기 위해 cutoutPercentage를 설정합니다.
		        legend: {
		            display: true, // 레이블을 표시하지 않도록 설정합니다.
		            labels: {
		                fontSize: 12 // 라벨의 폰트 크기를 12px로 설정합니다.
		            }
		        },
		        animation: {
		            animateScale: true, // 애니메이션을 허용합니다.
		            animateRotate: true // 도넛 차트 회전 애니메이션을 허용합니다.
		        },
		        tooltips: {
		            enabled: true,
		            callbacks: {
		                // 툴팁에 표시될 라벨을 동적으로 생성하는 콜백 함수
		                label: function(tooltipItem, data) {
		                	var label = data.labels[tooltipItem.index];
		                    var value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
		                    var labelText = label +' ('+ value + 'kcal)'; 
		                    return labelText;
		                }
		            },
			        backgroundColor: 'rgba(0, 0, 0, 0)',
			        bodyFontFamily: 'GangwonEdu_OTFBoldA',
			        bodyFontSize: 20, // 툴팁 본문의 폰트 크기를 설정합니다.
			        bodyFontColor: 'black'
		        }
// 		        plugins: {
// 		            doughnutLabelPlugin // 사용자 정의 플러그인 추가
// 		        }
		    }
		})
		
		
		function getDay(e) {
			let month = '${month}'
			if(month < 10){month = '0'+ month}
			let when = '2024-'+month+'-'
		    let day = e.target.value
		    if(day < 10){day = '0'+ day}
		    when += day
		    location.href = '${cpath}/diet/home?strmonth=${month}&when='+when+'&day='+day
		}
	
		dayList.forEach(radio => {
		    radio.addEventListener('click', getDay);
		});
	</script>

</body>
</html>