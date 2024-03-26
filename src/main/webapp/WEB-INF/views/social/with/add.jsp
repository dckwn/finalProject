
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp"%>
<style>
* {
   box-sizing: unset;
}


div.enterbox {
   width: max-content;
   margin:0 auto;
   margin-top: 10px;
   border-radius: 15px;
   padding: 10px;
   box-shadow: -7px -7px 10px white, 5px 5px 10px
      rgba(198, 196, 196, 0.585);
   gap:20px;
}

.dg-tkHome-banner {
       width:100%;
       text-align: center;
       margin: 0  auto;
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



div.bet {
   display: flex;
   justify-content: space-between;
   align-items: : center;
}



 select {
   width: 290px;
   height:40px;
   font-size: 18px;
   margin-top: 9px;
   padding:1px;
   border: 0 solid black; 
   border-radius: 5px;
   box-shadow: -7px -7px 10px white, 5px 5px 10px
      rgba(198, 196, 196, 0.585);
   background-color: inherit;
}
input {
   width: 290px;
   height:40px;
   font-size: 18px;
   margin-top: 11px;
   margin-bottom: 9px;
   padding:1px;
   border: 0 solid black; 
   border-radius: 5px;
   box-shadow: -7px -7px 10px white, 5px 5px 10px
      rgba(198, 196, 196, 0.585);
}

.fsize {
   width: 82px;
   height: 25px;
   font-size: 15px;
   margin-top: 26px;
   border-radius: 5px;
   background: linear-gradient(to right,#dae2f8, #d7dde8);
}

.Ssize {
   width: 140px;
   height: 30px;
   font-size: 14px;
   margin-top: 5px;
   margin-bottom: 1px;
   border-radius: 5px;
}
div.wbox{
   margin: 100px auto;
}

.calendar {
   font-family: Arial, sans-serif;
   border: 0px solid #ccc;
   width: 273px;
   height: 275px;
   padding: 10px;
   margin: 0 8px;
   margin-top: 10px;
   background-color: #f9f9f9;
   border-radius: 5px;
   box-shadow: -7px -7px 10px white, 5px 5px 10px
      rgba(198, 196, 196, 0.585);
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
/* 9 */
.btn-9 {
  border: none;
  transition: all 0.3s ease;
  overflow: hidden;
}
.btn-9:after {
  position: absolute;
  content: " ";
  z-index: -1;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
   background-color: #1fd1f9;
background-image: linear-gradient(315deg, #1fd1f9 0%, #b621fe 74%);
  transition: all 0.3s ease;
}
.btn-9:hover {
  background: transparent;
  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
    inset -4px -4px 6px 0 rgba(255,255,255,.5),
    inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
  color: #fff;
}
.btn-9:hover:after {
  -webkit-transform: scale(2) rotate(180deg);
  transform: scale(2) rotate(180deg);
  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
    inset -4px -4px 6px 0 rgba(255,255,255,.5),
    inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
}
.noncolor{
background-color: inherit;
}
</style>


<div class="frame">
   <div class="dg-tkHome-banner">
      <img src="${cpath }/upload/mainImage/socialMain.png">
   </div>
      <form method="POST">
   <div class="enterbox wbox">
             <h1 style="margin-left:40%; letter-spacing: 5px; ">동행구하기</h1>
         <div class="bet">   
            <div class="enterbox">
               <div class="bet">
               <!-- 달력 구현 하기 -->
               <select id="year" class="Ssize" onchange="updateCalendar()">
                  <%int currentYear = java.time.LocalDate.now().getYear();%>
                  <%for (int year = currentYear; year <= currentYear + 20; year++) {%>
                  <option value="<%=year%>"><%=year%>년
                  </option>
                  <%}%>
               </select>
               
               <select id="month" class="Ssize" onchange="updateCalendar()">
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
               </div>
               <!-- 동행게시글 제목, 정원수, 카테고리  -->
               <p>
                  <input type="text" name="title" placeholder="제목"  class="noncolor" required autofocus>
               </p>
               <p>
                  <input type="hidden" name="writer" value="${writer}">
               </p>
               <p>
                  <input type="hidden" name="choice" value="with">
               </p>
               <p>
                  <input type="text" name="peopleNum" placeholder="정원수" class= "noncolor" required>
               </p>
               <p>
                  <select name="category">
                     <option value="헬스">헬스</option>
                     <option value="요가">요가</option>
                     <option value="크로스핏">크로스핏</option>
                  </select>
               </p>
               <div class="bet">
               <p>
                  <input type="submit" class="fsize custom-btn btn-9" value="with 생성">
               </p>
               <p>
                  <a href="${cpath}/social/with/mypage">
                     <input type="button" class="fsize custom-btn btn-9" value="나가기">
                  </a>
               </p>
               </div>
            
            </div>

            <div class="">
               <div class="calendar ">
                  <div class="month"></div>
                  <div class="days" id="calendarDays"></div>
               </div>

               <input type="hidden" name="start_date" id="startDate">
               <input type="hidden" name="end_date" id="endDate">
            </div>
   </div>

            
               
            
            </div>
      </form>
</div>

<script>
// 초기화 함수
function initCalendar() {
    updateCalendar();
}

//달력 업데이트 함수 수정
function updateCalendar() {
    var year = document.getElementById('year').value;
    var month = document.getElementById('month').value;
    var daysInMonth = new Date(year, month, 0).getDate();
    var firstDayOfWeek = new Date(year, month - 1, 1).getDay(); // 첫째 날의 요일 (0: 일요일, 1: 월요일, ..., 6: 토요일)
    var calendarDays = document.getElementById('calendarDays');
    calendarDays.innerHTML = '';

    // 공백으로 시작하는 날짜 삽입
    for (var i = 0; i < firstDayOfWeek; i++) {
        var emptyDayElement = document.createElement('div');
        emptyDayElement.classList.add('day', 'empty');
        calendarDays.appendChild(emptyDayElement);
    }

    // 날짜 삽입
    for (var i = 1; i <= daysInMonth; i++) {
        var dayElement = document.createElement('div');
        dayElement.classList.add('day');
        dayElement.textContent = i;
        dayElement.dataset.day = i; // 날짜를 데이터 속성에 저장
        dayElement.onclick = function() {
            var clickedDay = parseInt(this.dataset.day); // 클릭한 날짜를 정수로 파싱하여 저장
            selectDate(clickedDay); // 클릭한 날짜를 선택 함수에 전달
        };
        calendarDays.appendChild(dayElement);
    }

    document.querySelector('.month').textContent = year + '년 ' + month + '월'; // 달력의 현재 년도와 월을 표시
}

// //클릭한 날짜를 처리하는 함수
// function selectDate(day) {
//     var startDateInput = document.getElementById('startDate');
//     var endDateInput = document.getElementById('endDate');
//     var targetDayElement = document.querySelector('.day[data-day="' + day + '"]');

//     // 시작일이 설정된 후에는 끝일이 시작일 이전의 날짜를 선택하지 못하도록 처리
//     if (startDateInput.value && day < parseInt(startDateInput.value)) {
//         return;
//     }
    
//     // 클릭한 날짜가 시작일이나 종료일이 이미 설정되어 있는 경우 초기화
//     if (startDateInput.value && endDateInput.value) {
//         startDateInput.value = '';
//         endDateInput.value = '';
//         document.querySelectorAll('.day').forEach(function(el) {
//             el.classList.remove('start', 'end');
//         });
//     } else {
//         // 시작일이나 종료일이 설정되어 있지 않은 경우 설정
//         if (!startDateInput.value) {
//            let selectStart = year +'/'+ month + '/' + day 
//             startDateInput.value = selectStart;
//             targetDayElement.classList.add('start');
//         } else if (!endDateInput.value) {
//            let endStart = year +'/'+ month + '/' + day 
//             endDateInput.value = endStart;
//             targetDayElement.classList.add('end');
//         }
//     }

//     // 클릭한 날짜가 선택된 후에도 표시되는 날짜가 고정되도록 설정
//     document.getElementById('year').value = targetDayElement.dataset.year;
//     document.getElementById('month').value = targetDayElement.dataset.month;
//     updateCalendar();
// }

//클릭한 날짜를 처리하는 함수
function selectDate(day) {
    var startDateInput = document.getElementById('startDate');
    var endDateInput = document.getElementById('endDate');
    var targetDayElement = document.querySelector('.day[data-day="' + day + '"]');
    let mValue= month.value 
   if(mValue - 10 < 0){mValue = '0' + mValue}
    let dValue= day 
   if(dValue - 10 < 0){dValue = '0' + day}
    
    // 시작일이 설정된 후에는 끝일이 시작일 이전의 날짜를 선택하지 못하도록 처리
    if (year.value+'-'+mValue+'-'+dValue < startDateInput.value) {
        return;
    }
    
    // 클릭한 날짜가 시작일이나 종료일이 이미 설정되어 있는 경우 초기화
    if (startDateInput.value && endDateInput.value) {
        startDateInput.value = '';
        endDateInput.value = '';
        document.querySelectorAll('.day').forEach(function(el) {
            el.classList.remove('start', 'end');
        });
    } else {
        // 시작일이나 종료일이 설정되어 있지 않은 경우 설정
        if (!startDateInput.value) {
           let selectStart = year.value +'-'+ mValue + '-' + dValue 
            startDateInput.value = selectStart;
            targetDayElement.classList.add('start');
        } else if (!endDateInput.value) {
           console.log(endDateInput.value)
           let endStart = year.value +'-'+ mValue + '-' + dValue 
            endDateInput.value = endStart;
            targetDayElement.classList.add('end');
        }
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