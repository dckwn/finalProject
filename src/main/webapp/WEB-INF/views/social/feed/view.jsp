<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp" %>

<style>
.js-viewTopFrame {
		width: 1800px;
		margin-left: 8%;
		display: flex;
		justify-content: flex-end;
	}
	.js-viewFrame {
		border: 1px solid black;
		width: 1800px;
		height: 35%;
		margin-left: 8%;
		display: flex;
		justify-content: space-between;
	}
	.js-viewLeft {
	 	border: 1px solid black;
	 	flex: 5;
	}
	.js-viewLeft img {
		width: 1282px;
		height: 698px;
	}
	.js-viewRight {
		border: 1px solid black;
		display: block;
		flex: 2;	
	}
	.js-viewRightTop {
		border: 1px solid black;
	}
	.js-viewRightMid {
		border: 1px solid black;
	}
	.js-viewRightBottom {
		border: 1px solid black;
	}
</style>

<div class="frame">
	<div class="js-viewTopFrame">
		<a href="${cpath }/social/home"><button>돌아가기</button></a>
	</div>
			
	<div class="js-viewFrame">
		
		<div class="js-viewLeft">
			<c:forTokens var="fileName" items="${dto.storedFileName }" delims=":">
				<img src="${cpath }/upload/${fileName}">
			</c:forTokens>
		</div>
			
		<div class="js-viewRight">
			<div class="js-viewRightTop">
				<div>
		<%-- 		<c:if test="${not empty login.userid == dto.writer} }"> --%>
						<a href="${cpath }/social/feed/modify/${dto.idx}"><button>✏</button></a>
						<a href="${cpath }/social/feed/delete/${dto.idx}"><button>❎</button></a>
		<%-- 		</c:if>	 --%>
				</div>
				<div>${dto.title }</div>
				<div>${dto.writer }</div>
				<div>${dto.maintext }</div>
				<div>${dto.write_date }</div>
			</div>
				
			<div class="js-viewRightMid">
				<fieldset>
				댓글리스트
					<c:forEach var="reply" items="${replylist }">
						<ul>
							<li>${reply.writer }</li>
							<li>
								${reply.content }
			<%-- 					<c:if test=""> --%>
									<button>✏</button>
									<button>❎</button>
			<%-- 					</c:if> --%>
							</li>
							<li>${reply.writedate }</li>	
						</ul>
					</c:forEach>
				</fieldset>
			</div>		
				
			<div class="js-viewRightBottom">
				<fieldset>
					<form method="POST">
						<c:if test="${not empty login.userid }">
							<p><input type="hidden" name="board_id" value="${dto.idx}"></p>
							<p><input type="text" name="writer" value="${login.userid }"></p>
							<p>
								<textarea name="content" placeholder="댓글을 입력 하세요"></textarea>
							</p>
							<p><input type="submit" value="작성"></p>
						</c:if>
						<c:if test="${empty login.userid }">
							<p>
								<a href="${cpath }/member/login"><textarea name="content" placeholder="로그인이 필요합니다"></textarea></a>
							</p>
							<p><input type="submit" value="작성"></p>
						</c:if>
					</form>
				</fieldset>
			</div>
				
		</div>
	</div>
</div>


<%@ include file="../../footer.jsp" %>
