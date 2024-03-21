<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .center {
        text-align: center;
    }
   #buyTable {
      border: 0px solid #A5AAA3;
        border-collapse: collapse;
        width: 975px;
        height: 400px;
        margin: auto;
        padding: 0;
   }
    th {
        border-bottom: 1px solid #A5AAA3 ;
    }
    td {
        font-size: 20px;
        border-bottom: 1px solid #A5AAA3;
        padding: 0 30px;
    }

    tr > th {
        font-size: 25px;
        padding: 5px;
    }
    select {
        margin: 0 5px;
        padding: 5px;
        border: 2px solid #A5AAA3;
        border-radius: 5px;
        width: 100px;
    }
    select:focus {
        border: 2px solid red;
    }
    .payBox{
    display: flex;
    justify-content: flex-end;
    margin: 30px 0;    
    }
     #payBtn { 
         margin: auto;
         padding: 7px; 
         font-weight: bold; 
     } 
     #payBtn:hover { 
         background-color: white; 
         color: #A5AAA3; 
         cursor:pointer;
     } 
    .yj-ment{
    margin: 200px auto;
    text-align: center;
    font-size: 42px;
    }
    .yj-img{
    display: flex;
    justify-content: center;
    margin-bottom: 200px;
    }
    .yj-img img{
    width: 980px;
    height: 550px;
    }
    .pay1{
    font-size: 50px;
    display: flex;
   	justify-content: space-between;
    }
    
    select {
    width: 200px;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #fff;
    color: #333;
    background-size: 20px auto, 100% 100%;
    background-repeat: no-repeat;
    padding-right: 30px;
    font-family: 'IBMPlexSansKR-Regular';
   }

   select:hover {
       border-color: #999;
   }
   
   select option:checked {
       background-color: #f0f0f0;
   }
   
   .dg-right{
   	width: 975px;
   	margin:auto;
   }
       
</style>

</head>
<body>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<div class="frame">

   <div class="yj-ment">
   <p>2024-03-19 | health protector </p>
   <h1>welcome weekend</h1>
   <p>${login.userid }님 　  ticket shop</p>
   </div>

   <div class="yj-img"><img src="https://static.wixstatic.com/media/84770f_4f19a39d47b540fb942ba6b844462f7f~mv2_d_5208_3472_s_4_2.jpg/v1/fill/w_1469,h_828,fp_0.50_0.50,q_85,usm_0.66_1.00_0.01,enc_auto/84770f_4f19a39d47b540fb942ba6b844462f7f~mv2_d_5208_3472_s_4_2.jpg">
   </div>

   <div class="dg-right">
         <form method="POST">
         
       <table id="buyTable">
         <thead>
            <tr>
               <td>번호</td>
               <td>Ticket type</td>
               <td>Price(원)</td>
               <td>Quantity</td>
            </tr>
         </thead>
      <tbody>
            <c:forEach var="dto" items="${list }">
            <tr>
               <td>${dto.idx }</td>
               <td><a href="${cpath}/ticket/tkBuy/${dto.idx}">${dto.tk_content}</a></td>
               <td>${dto.price}</td>
               <td>
                  <select class="yj-tkSelect" idx="${dto.idx }" price=${dto.price }>
                     <c:forEach var="i" begin="0" end="10" step="1" >
                        <option value="${i }" >${i}</option>
                     </c:forEach>
                  </select>
               </td>
            </tr>
            </c:forEach>
      </tbody>
      </table>
      <div class="payBox">
         <div>
            <div class="pay1">
               <p>Total</p>
            <div class="yj-result">0</div>
            </div>
                  
              <input type="hidden" name="idx" value="${dto.idx }">
               
                  
                  <input type="hidden" name="userid" value="${dto.userid }">
                  <input type="hidden" name="ticket_id" value="${dto.ticket_id }">
                  <input type="hidden" name="ticketCount" value="${dto.ticketCount }">
                  <input type="hidden" name="expirDay" value="${dto.expirDay }">
                  <input type="hidden" name="buyPrice" value="${dto.buyPrice }">
                  <input type="submit" id="payBtn" value="구매하기" style="border: 2px solid grey;
                   width: 333px; height: 50px;">
         </div>
       </div>
         </form>
     </div> 
     
      <div class="dg-btn1"></div> 
</div>




<script>
   // select 가 onchange가 될 때 각각의 이용권 idx, 수량, 총 가격(idx에 해당하는 이용권 * 수량) 을 script 변수에 저장
   const selectList = document.querySelectorAll('.yj-tkSelect')
   const show = document.querySelector('.yj-result')
   const buy = document.querySelector('input[type="submit"]')
   
   let arr = new Array(3)
   
   function getTotal(){
      let total = 0
      for (let i = 0; i < arr.length; i++) {
          if(arr[i]) total += arr[i].price * arr[i].count;
       }
      totalAmount = total; 
      show.innerHTML = '<h3>'+total+'</h3>'
   }
   
   function changeHandler(e){
      let ob = {
         count: e.target.value || 0,
         idx: e.target.getAttribute('idx') || 0,
         price: e.target.getAttribute('price') || 0
      }
      arr[ob.idx-1] = ob
      
      getTotal()      
   }
   
   selectList.forEach(e => e.onchange = changeHandler)
   // 총 가격을 출력
   
   
   var IMP = window.IMP;
   IMP.init("imp23767114"); 
   
   let totalAmount = 0; 
   
   // 결제 요청
     function requestPay() {
    getTotal(); // 총 결제 금액 업데이트

    // IMP.request_pay 호출
    IMP.request_pay({
        pg: "html5_inicis.INIpayTest", 
        pay_method: "card", 
        merchant_uid: 'merchant_123456',
        name: "Health Protector",
        amount: 500,
        buyer_tel : '010-1234-1234',
        buyer_email: " "
    }, function(rsp) {
        if (rsp.success) {
            var imp_uid = rsp.imp_uid; // 결제 고유 번호(imp_uid) 추출
            alert("결제가 완료되었습니다. imp_uid: " + imp_uid); // alert 내용 수정
            buyHandler();
        } else {
            alert('결제에 실패하였습니다. 에러 메시지: ' + rsp.error_msg);
        }
    });
}     
    
    function buyHandler() {
      let counts = new Array(selectList.length).fill(0);
      for(let i = 0; i< arr.length; i++) {
         if(arr[i]) { counts[arr[i].idx - 1] = arr[i].count;}
      }
      location.href = '${cpath}/ticket/Buy/'+ counts;
   }
    
    
    document.getElementById('payBtn').addEventListener('click', function(event) {
        event.preventDefault(); 
        requestPay(); 
    });
   

   /* 
   function buyHandler(event){
      event.preventDefault()
      let counts = new Array(3)
      for(let i = 0; i < arr.length; i++){
         if(arr[i]){ counts[i] = arr[i].count}
         else   {counts[i] = 0}
      }
      console.log(counts)
       location.href = '${cpath}/ticket/Buy/'+ counts
   }
   buy.onclick = buyHandler */
   

</script>

<%@ include file="../footer.jsp" %>

</body>
</html>