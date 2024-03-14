<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp"  %>
<style>
.js-feedFrame  {
		width: 1300px;
		height: 100%;
		margin-left: 20%;
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
			<div class="js-feed center"><a>FEED</a></div>
			<div class="js-with center"><a href="${cpath }/social/with/wlist">WITH</a></div>
		</div>
		
		<div class="js-feedInfo">	
			<div class="js-feedHomeBtn">
				<div>
					<a>전체보기</a>
					<span>/</span>
					<a>인기순</a>
				</div>
						
				<div>
					<c:if test="${not empty login.userid }">
						<a href="${cpath }/social/feed/myboard"><button>나의 게시글</button></a>
					</c:if>	
				</div>
			</div>
			
			<div class="js-feedList">	
				<c:forEach var="dto" items="${list }">
					<fieldset>
						<div class="js-listImgFrame">
							<c:forTokens var="fileName" items="${dto.storedFileName }" delims=":">
								<img src="${cpath }/upload/${fileName}" width="300" height="150">
							</c:forTokens>
						</div>
						<div class="js-listInfoFrame">
							<div>${dto.writer }</div>
							<div><a href="${cpath}/social/view/${dto.idx}">${dto.title }</a></div>
							<div>${dto.write_date }</div>
						</div>
					</fieldset>					
				</c:forEach>	
			</div>
		</div>		
		
	</div>				
</div>

<%@ include file="../footer.jsp" %>

</body>
</html>