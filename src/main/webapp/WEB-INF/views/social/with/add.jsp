 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp" %> 
<style>
    .calendar {
        font-family: Arial, sans-serif;
        border: 1px solid #ccc;
        width: 220px;
        padding: 10px;
        background-color: #f9f9f9;
        border-radius: 5px;
    }

    .calendar .month {
        text-align: center;
        font-size: 18px;
        margin-bottom: 10px;
    }

    .calendar .days {
        display: flex;
        flex-wrap: wrap;
    }

    .calendar .day {
        width: 30px;
        height: 30px;
        line-height: 30px;
        text-align: center;
        margin: 3px;
        cursor: pointer;
    }

    .calendar .day:hover {
        background-color: #ddd;
    }

    .calendar .day.active {
        background-color: #007bff;
        color: #fff;
    }

    .calendar .start {
        background-color: #28a745;
        color: #fff;
    }

    .calendar .end {
        background-color: #dc3545;
        color: #fff;
    }

    .calendar select {
        margin-bottom: 5px;
    }
</style>


<div class="frame">
	<form method="POST">
		<p><input type="text" name="title" placeholder="제목" required autofocus></p>
		 <p><input type="hidden" name="writer" value="${writer}"></p>
		<p><input type="hidden" name="choice" value="with" ></p>
		
		<p>
			
			<input type="text" name="peopleNum" placeholder="정원수" required> 
		</p>
		<p>
			<select name="category">
				<option value="헬스" >헬스</option>
				<option value="요가">요가</option>
				<option value="크로스핏">크로스핏</option>
			</select> 
		</p>
<!-- 		<p><input type="date" name="start_date" placeholder="시작" required></p> -->
<!-- 		<p><input type="date" name="end_date" placeholder="끝" required></p> -->
		
		<select id="year" onchange="updateCalendar()">
            <%-- 현재 연도에서 10년 전부터 10년 후까지 옵션 생성 --%>
            <% int currentYear = java.time.LocalDate.now().getYear(); %>
            <% for(int year = currentYear ; year <= currentYear + 20; year++) { %>
                <option value="<%= year %>"><%= year %>년</option>
            <% } %>
        </select>
        <select id="month" onchange="updateCalendar()">
            <option value="1">1월</option>
            <option value="2">2월</option>
            <option value="3">3월</option>
            <option value="4">4월</option>
            <option value="5">5월</option>
            <option value="6">6월</option>
            <option value="7">7월</option>
            <option value="8">8월</option>
            <option value="9">9월</option>
            <option value="10">10월</option>
            <option value="11">11월</option>
            <option value="12">12월</option>
        </select>
        <!-- 연도 및 월 선택 끝 -->
        
        <!-- 달력 시작 -->
        <div class="calendar">
            <div class="month"></div>
            <div class="days" id="calendarDays">
                <%-- 달력 내용은 JavaScript로 업데이트 됩니다 --%>
            </div>
        </div>
        <!-- 달력 끝 -->
        
        <!-- 선택한 시작일과 끝일을 저장하는 hidden input -->
        <input type="hidden" name="start_date" id="startDate">
        <input type="hidden" name="end_date" id="endDate">
		<p>	<input type="submit" value="with 생성"></p>
	</form>
	 <p><a href="${cpath}/social/with/mypage"><button>나가기</button></a></p>
</div> 
<script>
    // 초기화 함수
    function initCalendar() {
        updateCalendar();
    }

    // 달력 업데이트 함수
    function updateCalendar() {
        var year = document.getElementById('year').value;
        var month = document.getElementById('month').value;
        var daysInMonth = new Date(year, month, 0).getDate();
        var firstDay = new Date(year, month - 1, 1).getDay(); // 0부터 시작 (일요일)

        var calendarDays = document.getElementById('calendarDays');
        calendarDays.innerHTML = '';

        // 빈 공백 생성
        for (var i = 0; i < firstDay; i++) {
            var emptyDay = document.createElement('div');
            emptyDay.classList.add('day');
            calendarDays.appendChild(emptyDay);
        }

        // 날짜 채우기
        for (var i = 1; i <= daysInMonth; i++) {
            var dayElement = document.createElement('div');
            dayElement.classList.add('day');
            dayElement.textContent = i;
            dayElement.onclick = function () {
                selectDate(this.textContent);
            };
            calendarDays.appendChild(dayElement);
        }

        // 선택한 연도와 월 표시 업데이트
        document.querySelector('.month').textContent = year +'년'+ month + '월 ';
    }

    // 날짜 선택 함수
    function selectDate(day) {
        var startDateInput = document.getElementById('startDate');
        var endDateInput = document.getElementById('endDate');
        var selectedDate = new Date(document.getElementById('year').value, document.getElementById('month').value - 1, day);

        // 시작일과 끝일을 비교하여 처리
        if (!startDateInput.value) {
            startDateInput.value = selectedDate.toISOString().split('T')[0]; // YYYY-MM-DD 형식으로 저장
            document.querySelector('.day:nth-child(' + day + ')').classList.add('start'); // 시작일을 표시하기 위해 클래스 추가
        } else if (!endDateInput.value) {
            var startDate = new Date(startDateInput.value);
            if (selectedDate > startDate) { // 선택한 날짜가 시작일보다 이후일 경우
                endDateInput.value = selectedDate.toISOString().split('T')[0]; // YYYY-MM-DD 형식으로 저장
                document.querySelector('.day:nth-child(' + day + ')').classList.add('end'); // 끝일을 표시하기 위해 클래스 추가
            } else if (selectedDate < startDate) { // 선택한 날짜가 시작일보다 이전일 경우
                startDateInput.value = selectedDate.toISOString().split('T')[0]; // 시작일을 변경
                document.querySelectorAll('.day').forEach(function (el) {
                    el.classList.remove('start'); // 이전에 있던 시작일 표시 클래스 제거
                    el.classList.remove('end'); // 이전에 있던 끝일 표시 클래스 제거
                });
                document.querySelector('.day:nth-child(' + day + ')').classList.add('start'); // 변경된 시작일 표시
            }
        } else { // 이미 시작일과 끝일이 선택된 경우
            startDateInput.value = selectedDate.toISOString().split('T')[0]; // 선택한 날짜를 새로운 시작일로 설정
            endDateInput.value = ''; // 끝일은 초기화
            document.querySelectorAll('.day').forEach(function (el) {
                el.classList.remove('start'); // 이전에 있던 시작일 표시 클래스 제거
                el.classList.remove('end'); // 이전에 있던 끝일 표시 클래스 제거
            });
            document.querySelector('.day:nth-child(' + day + ')').classList.add('start'); // 변경된 시작일 표시
        }
    }

    // 초기화 함수 호출
    initCalendar();

    // select 요소 변경 시 달력 업데이트
    document.getElementById('month').addEventListener('change', updateCalendar);
    document.getElementById('year').addEventListener('change', updateCalendar);
</script>

 </body>
</html> 