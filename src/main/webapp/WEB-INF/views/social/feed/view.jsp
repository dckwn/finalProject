<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp" %>


<div class="frame">

	<div>
		<div>
			<a href="${cpath }/social/feed/modify/${dto.idx}"><button>수정하기</button></a>
			<a href="${cpath }/social/feed/delete/${dto.idx}"><button>삭제하기</button></a>
		</div>
	
		<div>
			<a href="${cpath }/social/home"><button>돌아가기</button></a>
		</div>
	</div>

	<div>
		<fieldset>
			<div>
				<c:forTokens var="fileName" items="${dto.storedFileName }" delims=":">
					<img src="${cpath }/upload/${fileName}" height="150">
				</c:forTokens>
			</div>
			<ul>
				<li>${dto.title }</li>
				<li>${dto.writer }</li>
				<li>${dto.maintext }</li>
				<li>${dto.write_date }</li>
			</ul>
		</fieldset>
	</div>

	<fieldset>
	댓글리스트
		<c:forEach var="reply" items="${replylist }">
			<ul>
				<li>${reply.writer }</li>
				<li>${reply.content }</li>
				<li>${reply.writedate }</li>
			</ul>
		</c:forEach>
	</fieldset>
	<fieldset>	
		<form method="POST">
			<p><input type="hidden" name="board_id" value="${dto.idx}"></p>
			<p><input type="text" name="writer" placeholder="작성자를 입력하시오" required autofocus></p>
			<p>
				<textarea name="content" placeholder="댓글을 입력 하세요"></textarea>
			</p>
			<p><input type="submit" value="작성"></p>
		</form>
	</fieldset>

</div>


<%@ include file="../../footer.jsp" %>
