<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp"%>
<style>
	table {
		border-collapse: collapse;
		height: 165px;
		padding: 10px;
		margin-top: 10px;
		
	}
	div.bet {
		display: flex;
		justify-content: space-between;
	}
	td,th {
	 border: 1px solid black;
	 padding: 3px 3px;
	}

	th:nth-child(4),
    td:nth-child(4),
    th:nth-child(4) + td,
    th:nth-child(4) + td + td, 
	th:nth-child(5),
    td:nth-child(5),
    th:nth-child(5) + td,
    th:nth-child(5) + td + td{
        border: none; /* 해당 셀의 테두리 제거 */
        padding: 0 10px;
    }
	
	button {
		margin-bottom: 2px;
	}
	
	div.title{
		margin-top: 15px;
	}
	.fix{
		position: fixed;
	}
	.js-feedFrame  {
		width: 1300px;
		height: 100%;
		margin-left: 20%;
 		border-top:0;
	}
 	.js-choice { 
 		display: flex;
		justify-content: center;
 		width: 1300px;
 	} 
 	.js-feed { 
 		border: 2px solid black; 
 		border-radius: 10px 15px 0 0 ; 
 		width: 650px;
 		height: 80px;  
 		font-size: 60px; 		
 	} 
 	.js-with {
 		border: 2px solid black; 
 		border-radius: 15px 10px 0 0 ; 
 		width: 650px;
 		height: 80px;  
 		font-size: 60px;
 		border-bottom : 0px;
 	} 
 	.js-feedInfo {
 		
 		border: 2px solid black;
 		border-radius: 0 0 20px 20px;
 		padding-bottom: 15px; 
 		border-top: 0;
 	}
 	.js-feedHomeBtn {
 		display: flex;
 		justify-content: space-between;
 	}
 	.js-feedList {
 		display: flex;
 		justify-content: space-between;
 		border: 2px solid black;
 		width: 1277px;
 		margin: 5px;
 		padding: 5px;
 	}
 	.js-listImgFrame {
 		border: 1px solid black; 
 	}
 	.js-listInfoFrame {
 		border: 1px solid black; 	
 	}

</style>


<div class="frame">
	<div class="js-feedFrame">
		<div class="js-choice ">
			<div class="js-feed center"><a>FEED</a></div>
			<div class="js-with center"><a href="${cpath }/social/with/wlist">WITH</a></div>
		</div>
		
		<div class="js-feedInfo">	
			<div class="flex bet">
		<a href="${cpath }/social/with/add"><button>작성하기</button></a>
		<a href="${cpath }/social/with/wlist"><button>나가기</button></a>
	</div>

	<div class="center">	
<div class="title">
	<h3 class="fix">내가작성한 with</h3>
	<table >
		<tbody>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td class="rigth bottom">작성자 : ${dto.writer}</td>
					<td class="left bottom">운동 : ${dto.category }</td>
					<td rowspan="2">
						참여인원(${dto.withNum + 1}/ ${dto.peopleNum } )<br>
						<progress value="${dto.withNum+1 }" max="${dto.peopleNum}"></progress>
					</td>
					<td rowspan="2">
						<a href="${cpath }/social/with/modify/${dto.idx}"><button>수정</button></a><br>
						<a href="${cpath }/social/with/delete/${dto.idx}"><button>삭제</button></a>
					</td>
				</tr>
				<tr>
					<td class="rigth top ">제목 : ${dto.title}</td>
					<td class="left top ">운동날 :${dto.start_date } ~ ${dto.end_date }</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
<!-------------------------------구분선------------------------- -->
	 <div class="title">
		<h3 class="fix"> 내가 함께하는 with</h3>
			<table>
				<tbody>
					<c:forEach var="dto" items="${wJoinList}">
						<tr>
							<td class="rigth bottom">작성자 : ${dto.writer}</td>
							<td class="left bottom">운동 : ${dto.category }</td>
							<td rowspan="2" >
								참여인원(${dto.withNum + 1}/ ${dto.peopleNum })<br>
								<progress value="${dto.withNum+1 }" max="${dto.peopleNum}"></progress>
							</td>
							<td rowspan="2" >
								<a href="${cpath}/social/with/wcancel/${dto.idx}"><button>취소</button></a>
							</td>	
						</tr>
						<tr>
							<td class="rigth top">제목 : ${dto.title}</td>
							<td class="left top">운동날 :${dto.start_date } ~ ${dto.end_date }</td>

						</tr>
					</c:forEach>
				</tbody>
			</table> 
		
		</div>
	</div>
</div>	
</div>				
</div>

</body>
</html>