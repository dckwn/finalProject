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
	tbody tr.sameNum{
		background-color: lightblue;
	}
	.js-feedFrame  {
		width: 1300px;
		height: 100%;
		margin-left: 20%;
	}
 	.js-choice { 
 		display: flex;
		justify-content: center;
 		width: 1300px;
 		 list-style: none; 
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
 	} 
 	.js-feedInfo {
 		border: 2px solid black;
 		border-radius: 0 0 20px 20px;
 		padding-bottom: 15px; 
 	}
 	.js-feedHomeBtn {
 		display: flex;
 		justify-content: space-between;
 		margin: 5px;
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
			
				<div class="js-choice">
					<ul >
						<li ><a class="menuLink js-feed center" href="${cpath }/social/home">feed</a></li>
						<li ><a class="menuLink js-with center" href="${cpath }/social/with/wlist">with</a></li>
					</ul>
				</div>
				
				<div class="js-feedInfo">	
					<div class="js-feedHomeBtn" >
						<div>
							<a href="${cpath }/social/with/mypage">나의with</a>
						</div>
					
						<div>	
							<p>
								<a href="${cpath }/social/with/wlist?category=요가"> <button>요가</button></a>
								<a href="${cpath }/social/with/wlist?category=헬스"> <button>헬스</button></a>
								<a href="${cpath }/social/with/wlist?category=크로스핏"> <button>크로스핏</button></a>
							</p>
							<form action="${cpath }/social/with/wlist" method="GET">
								<input type="text" name="keyword" placeholder="검색어입력">
								<input type="submit" value="검색">
							</form>
						</div>
					</div>
				</div>		
		

		<table border="1" cellpadding="10" cellsapcing="0"> 
			<c:forEach var="dto" items="${wlist }">
			
			<tbody>
			 	<tr class="<c:if test="${dto.withNum + 1 == dto.peopleNum}">sameNum</c:if>">
					<td class="right bottom" >작성자 : ${dto.writer}</td>
					<td class="left bottom" >운동 : ${dto.category }</td>
					<td rowspan="2">
						참여인원(${dto.withNum + 1}/ ${dto.peopleNum } )<br>
						<progress value="${dto.withNum + 1 }"   max= "${dto.peopleNum}" ></progress> 
					</td>
				</tr>
				<tr class="<c:if test="${dto.withNum + 1 == dto.peopleNum}">sameNum</c:if>">
				
					  <td class="right top">
            <c:choose>
                <c:when test="${dto.withNum + 1 == dto.peopleNum}">
                    <span>제목 : ${dto.title}</span>
                </c:when>
                <c:otherwise>
                    <a href="${cpath}/social/with/${dto.idx}">제목 : ${dto.title}</a>
                </c:otherwise>
            </c:choose>
        </td>
					<td class="left top">운동날 :${dto.start_date } ~ ${dto.end_date }</td>
					
				</tr>
				
			</tbody>
			
			</c:forEach>
		</table>
		</div>
	</div>

</body>
</html>