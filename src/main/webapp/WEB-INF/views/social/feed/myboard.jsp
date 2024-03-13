<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="frame">
	<div>
		
		<div>
			<div>
				<div>유저정보란</div>
			</div>
		</div>
		
		<div>
			<div><a>FEED</a></div>
			<div><a>WITH</a></div>
		</div>
		
		<div>
			<div>
				
				<div>
					<div>
						<a href="${cpath }/social/feed/write"><button>추가하기</button></a>
					</div>
				</div>
				
				<div>
					<div>
						<p>
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
						</p>	
					</div>				
				</div>
				
			</div>
		</div>
		
	</div>
</div>

<%@ include file="../../footer.jsp" %>

</body>
</html>