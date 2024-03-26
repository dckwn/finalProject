<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp"%>

<style>
	* {
	box-sizing: unset;
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
	div.enterbox {
	width: max-content;
	height: 100%;
	margin:100px auto;
	margin-top: 10px;
	padding: 10px;
	border-radius: 15px;
	box-shadow: -7px -7px 10px white, 5px 5px 10px
		rgba(198, 196, 196, 0.585);
	gap:20px;
	}
	div.box-right{
	width: 220px;
	margin:0 auto;
	margin-top: 10px;
	padding: 11px;
	border-radius: 15px;
	box-shadow: -7px -7px 10px white, 5px 5px 10px
		rgba(198, 196, 196, 0.585);
	}
	div.box-left{
	width: max-content;
	margin:0 auto;
	margin-top: 10px;
	padding: 10px;
	border-radius: 15px;
	box-shadow: -7px -7px 10px white, 5px 5px 10px
		rgba(198, 196, 196, 0.585);
	}
	div.boxtitle{
	width: 95%;
	text-align: center;
	font-size: 28px;
	margin:0 auto;
	
	padding-top: 10px;
	border-radius: 13px;
	box-shadow: -7px -7px 10px white, 5px 5px 10px
		rgba(198, 196, 196, 0.585);
	}
	div.boxtext{

	margin:0 auto;
	margin-top: 10px;
	margin-bottom : 20px;
	padding: 10px;
	border-radius: 15px;
	box-shadow: -7px -7px 10px white, 5px 5px 10px
		rgba(198, 196, 196, 0.585);
	}
	.dg-tkHome-banner {
	width: 100%;
	text-align: center;
	margin: auto auto;
	}
	button {
		margin : 5px atuo;
		border: 0px solid  black;
	}
    div.flex { 
    display: flex;
   }
    div.bet {
    display: flex;
   justify-content: space-between;
    }
    li, ui{
		list-style-type: none;
    }
    div.mar{
    	margin-top:0;
    	margin-bottom: 120px;
    }
	    /* 15 */
	.btn-15 {
	   background: #000;
	  color: black;
	  z-index: 1;
	}
	.btn-15:after {
	  border-radius: 15px;
	  position: absolute;
	  content: "";
	  width: 0;
	  height: 100%;
	  top: 0;
	  right: 0;
	  z-index: -1;
	   background: #e0e5ec;
	  transition: all 0.3s ease;
	}
	.btn-15:hover {
	  color: #000;
	}
	.btn-15:hover:after {
	  left: 0;
	  width: 100%;
	  border-radius: 15px;
	}
	.btn-15:active {
	  top: 2px;
	}
	    
    /* 16 */
	.btn-16 {
	  background: #000;
	  color: black;
	  z-index: 1;
	}
	.btn-16:after {
	  border-radius: 15px;
	  position: absolute;
	  content: "";
	  width: 0;
	  height: 100%;
	  top: 0;
	  left: 0;
	  direction: rtl;
	  z-index: -1;
	  background: #e0e5ec;
	  transition: all 0.3s ease;
	}
	.btn-16:hover {
	  color: #000;
	}
	.btn-16:hover:after {
	  left: auto;
	  right: 0;
	  width: 100%;
	  border-radius: 15px;
	}
	.btn-16:active {
	  top: 2px;
	}
	.custom-btn {
	  width: 55px;
	  height: 13px;
	  padding: 5px 15px;
	  font-family: 'GangwonEdu_OTFBoldA', sans-serif;
	  font-weight: 300;
	  background: transparent;
	  cursor: pointer;
	  transition: all 0.3s ease;
	  position: relative;
	  display: inline-block;
	  border-radius: 15px;
	box-shadow: -7px -7px 10px white, 5px 5px 10px
		rgba(198, 196, 196, 0.585);
	}
	.font{
	
	font-size:20px;
	padding-left: 10px;
	}

</style>


<div class="frame">
<div class="dg-tkHome-banner">
        <img src="${cpath }/upload/mainImage/socialMain.png">
		</div>
	<div class="enterbox bet">
		<div class="box-left">
		<div class="boxtitle" >WITH상세보기</div>
		<div class="boxtext">
			<div class="font"> 제목 : ${dto.title }</div>
			<div class="font"> 작성 : ${dto.writer }</div>
			<div class="font"> 운동 : ${dto.category }</div>
			<div class="font"> 운동날짜 : ${dto.start_date }~${dto.end_date }</div>
		</div>
<%-- 			<button><a href="${cpath }/social/with/receipt/${dto.idx}">접수하기</a></button> --%>
		<div class="bet">
			<c:choose>
				<c:when test="${dto.writer eq loginuser.userid}">
                    <!-- 작성자인 경우에는 아무 것도 표시하지 않음 -->
                </c:when>
				<c:otherwise>
					<c:choose>
                    	<c:when test="${alreadyJoined}">
                            <!-- 이미 참여한 경우 버튼을 숨김 -->
                            <a href="${cpath }/social/with/cancel/${dto.idx}"><button class="custom-btn btn-15">취소하기</button></a>
                        </c:when>
                        <c:otherwise>
                            <!-- 참여하지 않은 경우에만 "접수하기" 버튼 표시 -->
                            <a href="${cpath }/social/with/receipt/${dto.idx}"><button class="custom-btn btn-15">접수하기</button></a>
                        </c:otherwise>
                    </c:choose>
                    <!-- 이미 참여한 경우 버튼을 숨김 -->
                </c:otherwise>
            </c:choose>
<%-- 		<a href="${cpath }/social/with/cancel/${dto.idx}"><button>취소하기</button></a> --%>
			<div> <a href="${cpath }/social/with/wlist"><button class="custom-btn btn-16">나가기</button></a></div>
			</div>
		</div>
		<div class="box-right">
			<div></div>
			<div class="boxtitle">참여인원(${dto.withNum + 1} /${dto.peopleNum })</div>
			<div class="boxtext">
				<ul>
					<li class="font">${dto.writer }</li>
					<c:forEach var="dto" items="${withList }">
						<li class="font"> ${dto.withPeople}</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>


</body>
</html>