<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp"%>

<style>
	div.line{
	border:1px solid black;

	}
    div.flex { 
    display: flex;
   }
    div.bet {
    display: flex;
   justify-content: space-between;
    }
</style>



<div class="frame flex ">
	<div>
		<div class="line">WITH상세보기</div>
		<div> 제목 : ${dto.title }</div>
		<div> 작성 : ${dto.writer }</div>
		<div> 운동 : ${dto.category }</div>
		<div> 운동날짜 : ${dto.start_date }~${dto.end_date }</div>
		<div class="bet">
<%-- 			<button><a href="${cpath }/social/with/receipt/${dto.idx}">접수하기</a></button> --%>
		     <c:choose>
                <c:when test="${dto.writer eq loginuser.userid}">
                    <!-- 작성자인 경우에는 아무 것도 표시하지 않음 -->
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${alreadyJoined}">
                            <!-- 이미 참여한 경우 버튼을 숨김 -->
                            <a href="${cpath }/social/with/cancel/${dto.idx}"><button>취소하기</button></a>
                        </c:when>
                        <c:otherwise>
                            <!-- 참여하지 않은 경우에만 "접수하기" 버튼 표시 -->
                            <a href="${cpath }/social/with/receipt/${dto.idx}"><button>접수하기</button></a>
                        </c:otherwise>
                    </c:choose>
                    <!-- 이미 참여한 경우 버튼을 숨김 -->
                    
                </c:otherwise>
            </c:choose>
<%-- 		<a href="${cpath }/social/with/cancel/${dto.idx}"><button>취소하기</button></a> --%>
		<div><a href="${cpath }/social/with/wlist"><button>나가기</button></a></div>
		</div>
	</div>

	<div>
		<div></div>
		<div>참여인원(${dto.withNum + 1} /${dto.peopleNum })</div>

				
				
				
		<div>
			<ul>
				<li>${dto.writer }</li>
				<c:forEach var="dto" items="${withList }">
					<li> ${dto.withPeople}</li>
				</c:forEach>
			</ul>
		</div>
		
	</div>
</div>


</body>
</html>