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
.dh-calender{
   margin:auto;
   width:680px;
   position:relative;
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
               
               <c:if test="${list.contains(i) }">
                  <div class="dh-day">
                     <input type="radio" name="when" id="day${i}" value="${i }" />
                     <label for="day${i}">${i }</label>
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
            <div class="prev"><a id="nextM" href="${cpath }?strmonth=${month-1 }">&lt;</a></div>
         </c:if>
         <c:if test="${month < 12}">
            <div class="next"><a id="nextM" href="${cpath }?strmonth=${month+1 }">&gt;</a></div>
         </c:if>
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
   
<%@ include file="../footer.jsp" %>
</body>
</html>