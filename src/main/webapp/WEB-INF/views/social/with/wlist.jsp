<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp"%>
<style>
	table{
	 border-collapse: collapse;
	} 
	tr > td.right {
	border-right: none ;
	}
	tr > td.left {
	border-left: none ;	
	}
	tr > td.top {
	border-top: none ;	
	}
	tr > td.bottom {
	border-bottom: none ;	
	}
	tr > td {
	padding: 3px;
	margin: 2px
	}
	div.bet {
	 display: flex;
	 justify-content: space-between;
	}
	
	</div></div>
</style>
	<div class="frame">
		<div class="bet" >
			
		<div><a href="${cpath }/social/with/mypage">나의with</a></div>
		<div>	
				<select>
					<option value="작성자">작성자</option>
					<option value="제목">제목</option>
					<option value="날짜">날짜</option>
				</select>
				
				<input type="text" placeholder="검색어입력">
				<input type="submit" value="검색">
		</div>
		
	</div>

		<table border="1" cellpadding="10" cellsapcing="0"> 
			<thead>
				<tr>
					<th colspan="2">목록</th>
				
					<th>참여인원</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="dto" items="${wlist }">
				<tr>
					<td class="rigth bottom" >작성자 : ${dto.writer}</td>
					<td class="left bottom" >정원수 : ${dto.peopleNum }</td>
					<td rowspan="2"><progress value="${dto.withNum }"   max= "${dto.peopleNum}" ></progress> </td>
				</tr>
				<tr>
					<td class="rigth top"><a href="${cpath }/social/with/${dto.idx}">제목 : ${dto.title}</a></td>
					<td class="left top">운동날 :${dto.start_date } ~ ${dto.end_date }</td>
					
				</tr>
				
			</c:forEach>
			</tbody>
			
		</table>
		</div>
		


</body>
</html>