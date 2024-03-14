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
			<button><a href="${cpath }/social/with/receipt/${dto.idx}">접수하기</a></button>
			<button><a href="${cpath }/social/with/wlist">취소하기</a></button>
		</div>
	</div>

	<div>
		<div></div>
		<div>참여인원(${dto.withNum} /${dto.peopleNum })</div>

			
		<div>
				<ul>
					<li>${dto.writer }</li>
					<li></li>
				</ul>
		</div>
			<div><button><a href="${cpath }/social/with/wlist">나가기</a></button></div>
	</div>
</div>
</body>
</html>