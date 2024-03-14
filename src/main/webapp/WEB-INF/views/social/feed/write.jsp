<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp" %>


<div class="frame">
	<form method="POST" enctype="multipart/form-data">
		<p><input type="file" name="upload" multiple></p>
		<p><input type="text" name="writer" value="${login.userid }" readonly></p>
		<p><input type="text" name="title" placeholder="제목을 입력하세요" required></p>
		<p>
			<textarea name="maintext" placeholder="본문을 여기에 작성하세요" required style="width: 500px; height: 300px;" ></textarea>
		</p>
		<input type="submit" value="작성완료">
	</form>
</div>


<%@ include file="../../footer.jsp" %>

</body>
</html>`