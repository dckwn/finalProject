<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp"%>
<style>
	table {
		border-collapse: collapse;
		height: 165px;
		padding: 10px;
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
</style>

<div class="frame">
	<div class="flex bet">
		<a href="${cpath }/social/with/add"><button>작성하기</button></a>
		<a href="${cpath }/social/with/wlist"><button>나가기</button></a>
	</div>

<div class="title">내가작성한 with</div>
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
<!-------------------------------구분선------------------------- -->
	 <div class="title">내가 함께하는 with</div>
	<table >
		

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
</body>
</html>