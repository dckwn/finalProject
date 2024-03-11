<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.dh-calender{
	width:100%;
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
	margin-left: 12px;
	width: 30px;
	height: 30px;
	text-align: center;
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
				<span id="date">Sun</span> <span id="date">MON</span><span
					id="date">TUE</span><span id="date">WED</span> <span id="date">THU</span><span
					id="date">FRI</span><span id="date">SAT</span>
			</div>
			<div class="dh-dayItem">
				<c:forEach var="i" begin="1" end="${cal.startDayOfWeek-1 }">
				<div class="dh-day">
					<input type="radio" id="day" disabled /> <label
						style="color: grey;" for="day"></label>
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
							<input type="radio" id="day" disabled /> <label
								style="color: grey;" for="day">${i }</label>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<c:if test="${month > 1 }">
				<div class="prev"><a id="nextM" href="${cpath }?strmonth=${month-1 }">&lt;</a></div>
			</c:if>
			<c:if test="${month < 12}">
				<div class="next"><a id="nextM" href="${cpath }?strmonth=${month+1 }">&gt;</a></div>
			</c:if>
		</div>
		
	</div>
	
<%@ include file="footer.jsp" %>
</body>
</html>