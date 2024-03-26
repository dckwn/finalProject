<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.alert{
    background: #ffdb9b;
    padding: 20px 40px;
    min-width: 100%;
    position: fixed;
    right: 0px;
    top: 120px;
    overflow: hidden;
    border-radius: 4px;
    border-left: 8px solid #ffa502;
    z-index:6;
}
.alert.show{
    animation: show_slide 1s ease forwards; 
}
.alert.showAlert{
    opacity: 1;
    pointer-events: auto;
}

@keyframes show_slide{
    0%{
        transform: translateX(100%);
    }
    40%{
        transform: translateX(-10%);
    }
    80%{
        transform: translateX(0%);
    }
    100%{
        transform: translateX(-10px);
    } 
}
.hide{
    display: none;
}
@keyframes hide_slide{
    0%{
        transform: translateX(-10px);
    }
    40%{
        transform: translateX(0%);
    }
    80%{
        transform: translateX(-10%);
    }
    100%{
        transform: translateX(100%);
    }
}

.alert .fa-exclamation-circle{
    position: absolute;
    left: 20px;
    top: 50%;
    transform: translateY(-50%);
    color: #ce8500;
    font-size: 30px;
}
.alert .msg{
    padding: 0 20px;
    font-size: 18px;
    color: #ce8500;
}
.close-btn{
    position: absolute;
    right: 0px;
    top: 50%;
    transform: translateY(-50%);
    background: #ffd080;
    padding: 20px 18px;
    cursor: pointer;
    z-index:7;

}
.close-btn:hover{
    background: #ffc766;
}
.close-btn .fa-times{
    color: #ce8500;
    font-size: 22px;
    line-height: 100%;
}




<!-- -->
*{
    box-sizing: unset;
}
.dh-calender{
   margin:auto;
   width:680px;
   position:relative;
   margin-top: 60px;
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
   font-size: 20px;
   height: 45px;
}

/* .dh-day input[type=radio]:checked+label {
    background-image: url("C:/upload/출석체크.png");
    background-repeat: no-repeat;
    background-size: contain;
    background-position: center;
} */
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
.yj-date{
    display: flex;
    justify-content: space-between;
}

</style>
</head>
<body>

<div class="frame">

<!-- <table> -->
<!--     <thead> -->
<!--       <tr> -->
<!--          <td>아이디</td> -->
<!--          <td>출석날짜</td> -->
<!--       </tr> -->
<!--    </thead> -->
<!--    <tbody> -->
<%--       <c:forEach var="dto" items="${list}"> --%>
<!--       <tr> -->
<%--          <td>${dto.userid }</td> --%>
<%--          <td>${dto.checkDate }</td> --%>
<!--       </tr> -->
<%--       </c:forEach> --%>
<!--    </tbody> -->
<!-- </table> -->

<div class="dh-calender">
      	 
         <div class="dateItem">
            <div class="yj-date">
            	<div><h3 id="month">${month} ${cal.month }</h3></div>
            	<div style="display: flex;">
            		<div style="margin: auto; color: grey;">출석 횟수 ${totalCheckDate }회</div>
            		<div style="width: 72px;"></div>
            	</div>
            </div>
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
               
               <c:if test="${list.contains(i) }">
                  <div class="dh-day">
                     <input type="radio" name="when" id="day${i}" value="${i }" />
                     <label for="day${i}"><img src="${cpath }/upload/출석체크.png" style="width: 50px;"></label>
                  </div>
               </c:if>
               <c:if test="${!list.contains(i) }">
                  <div class="dh-day">
                     <input type="radio" name="when" id="day${i}" value="${i}"/> 
                     <label style="color: grey;" for="day${i}">${i }</label>
                  </div>
               </c:if>
            </c:forEach>
         </div>
         <c:if test="${month > 1 }">
            <div class="prev"><a id="nextM" href="${cpath }/ticket/abList?strmonth=${month-1 }">&lt;</a></div>
         </c:if>
         <c:if test="${month < 12}">
            <div class="next"><a id="nextM" href="${cpath }/ticket/abList?strmonth=${month+1 }">&gt;</a></div>
         </c:if>
      </div>
      
   </div>
   
   <div class="alert hide ticketZero">
        <span class="fas fa-exclamation-circle"></span>
        <span class="msg">Warning: "${tkCount}"개 이용권이 있습니다</span>
        <div class="close-btn ticketClose">
            <span class="fas fa-times"></span>
        </div>    
    </div>
   
   
   
   <script>
      const dayList = document.querySelectorAll('input[type="radio"]');
      
      function getDay(e) {
         let month = '${month}'
         if(month < 10){month = '0'+ month}
         let when = '2024-'+month+'-'
          let day = e.target.value
          if(day < 10){day = '0'+ day}
          when += day
          alert(when)
      }
   
      dayList.forEach(radio => {
          radio.addEventListener('click', getDay);
      });
   </script>
  
  <script>
  const ZeroModal = document.querySelector('.ticketZero')
  const ticketClose = document.querySelector('.ticketClose')
  
  window.onload = function() {
	  const login = '${login.userid}'
	  if(login != '' && 0 < '${tkCount}' && '${tkCount}' < 3 ){
		  event.preventDefault()
		  ZeroModal.classList.remove('hide')
	  }
  }
  
  ticketClose.addEventListener('click',function(event){
	  ZeroModal.classList.add('hide')
})
  
  </script> 
   
   
   
   
<%@ include file="../footer.jsp" %>
</body>
</html>