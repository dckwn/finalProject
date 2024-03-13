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
	댓글 리스트(수정 삭제)
		<div>left(다른 사람의 댓글)</div>
<%-- 		${dto.content } --%>
<%-- 		<a>${dto.writer }</a> --%>
<%-- 		${dto.writedate } --%>
		<div>right(나의 댓글)</div>
	</fieldset>
	<fieldset>	
		<form method="POST">
			<p>
				<textarea name="content" placeholder="댓글을 입력 하세요" style="width: ; height: ;" ></textarea>
			</p>
			<p><input type="submit" value="작성"></p>
		</form>
	</fieldset>

</div>


<%@ include file="../../footer.jsp" %>
