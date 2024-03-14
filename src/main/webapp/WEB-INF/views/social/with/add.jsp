 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp" %> 


<div class="frame">
	<form method="POST">
	<p><input type="text" name="title" placeholder="제목" required autofocus></p>
	<p><input type="hidden" name="writer" value="jjang"></p>
	<p><input type="hidden" name="choice" value="with" ></p>
	
	<p>
		
		<input type="text" name="peopleNum" placeholder="정원수" required> 
	</p>
	<p>
		<select name="category">
			<option value="헬스" >헬스</option>
			<option value="요가">요가</option>
			<option value="크로스핏">크로스핏</option>
		</select> 
	</p>
	<p><input type="date" name="start_date" placeholder="시작" required></p>
		<p><input type="date" name="end_date" placeholder="끝" required></p>
	<p>	<input type="submit" value="입력"></p>
	</form>
</div> 

 </body>
</html> 