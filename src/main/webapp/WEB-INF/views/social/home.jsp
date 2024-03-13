<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp"  %>

<div class="frame">
		
	<div>
		<div><a>FEED</a></div>
		<div><a>WITH</a></div>
	</div>
	
	<div>
		<div>
			
			<div>
				<div>
					<a>전체보기</a>
					<span>/</span>
					<a>인기순</a>
				</div>
				
				<div>
					<a href="${cpath }/social/feed/myboard"><button>나의 게시글</button></a>
				</div>
			
			</div>
			
			<div>	
				<c:forEach var="dto" items="${list }">
					<fieldset>
						<div>
							<c:forTokens var="fileName" items="${dto.storedFileName }" delims=":">
								<img src="${cpath }/upload/${fileName}" height="150">
							</c:forTokens>
						</div>
						<ul>
							<li>${dto.writer }</li>
							<li><a href="${cpath}/social/view/${dto.idx}">${dto.title }</a></li>
							<li>${dto.write_date }</li>
						</ul>
					</fieldset>					
				</c:forEach>
			</div>				
			
		</div>
	</div>
				
</div>

<%@ include file="../footer.jsp" %>

</body>
</html>