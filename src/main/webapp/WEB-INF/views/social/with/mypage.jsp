<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp"%>
<style>
div.bet {
	display: flex;
	justify-content: space-between;
}
</style>

<div class="frame">
	<div class="flex">
		<a href="${cpath }/social/with/add"><button>작성하기</button></a>
	</div>

	<table border="1" cellpadding="10" cellspacing="0">
		<thead>
			<tr>
				<th colspan="2">목록</th>
				<th>참여인원</th>
				<th>수정하기</th>
				<th>삭제하기</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td class="rigth bottom">작성자 : ${dto.writer}</td>
					<td class="left bottom">인원수 : ${dto.peopleNum }</td>
					<td rowspan="2"><progress value="${dto.withNum }"
							max="${dto.peopleNum}"></progress></td>
					<td rowspan="2"><a
						href="${cpath }/social/with/modify/${dto.idx}"><button>수정</button></a></td>
					<td rowspan="2"><a
						href="${cpath }/social/with/delete/${dto.idx}"><button>삭제</button></a></td>
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