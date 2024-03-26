<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp" %>
<style>
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: underline;
	}
	p.relative {
		position: relative;
		height: 200px;
		margin-left: 10px;
		margin-bottom: 10px;
	}
	input[type="file"] {
		opacity: 0;
		position: absolute;
		top: 0;
		left: 0;
		width: 200px;
		height: 200px;
	}
	label[for="upload"] {
		position: absolute;
		top: 0;
		left: 0;
		display: flex;
		justify-content: center;
		align-items: center;
		width: 200px;
		height: 200px;
		border: 5px solid white;
		border-radius: 50%;
		overflow: hidden;
		font-size: 14px;
		text-align: center;
		background-position: center;
		background-size: auto 100%;
		background-repeat: no-repeat;
	}
	.js-writeFrame {
		border: 10px solid white;
		background-color: #99ffff;
		border-radius: 30px;
		width: 570px;
		padding-left: 30px;
		margin: 10px auto;
	}
	input[type="submit"] {
		border: none;
		outline: none;
		background-color: #8fabba;
		border-radius: 5px;
		font-family: 'GangwonEdu_OTFBoldA';
		font-size: 15px;
		margin: 5px;
		width: 92px;
		height: 24px;
	}
</style>

<div class="frame">
	<div class="js-writeFrame">
		<form method="POST" enctype="multipart/form-data">
			<p><input type="hidden" name="idx" value="${dto.idx }"></p>
			<div>
				<p class="relative">
					<label for="upload">파일을 끌어서 놓거나<br>클릭하세요</label>
					<input id="upload" type="file" name="upload" multiple>
				</p>
			</div>
			<div>
				<p><input type="text" name="writer" value="@_${login.userid }" readonly style="border: none; background-color:#99ffff;"></p>
				<p><input type="text" name="title" placeholder="제목을 입력하세요" value="${dto.title }" required></p>
				<p>
					<textarea name="maintext" placeholder="본문을 여기에 작성하세요" required style="width: 500px; height: 300px;">
						${dto.maintext }
					</textarea>
				</p>
				<input type="submit" value="수정완료">
			</div>
		</form>
	</div>
</div>





<script>
// 미리보기
const inputFile = document.querySelector('input[id="upload"]')
const preview = document.querySelector('label[for="upload"]')
inputFile.onchange = function(event) {
    if(event.target.files && event.target.files[0]) {
        const reader = new FileReader()
        reader.onload = function(e) {
            preview.style.backgroundImage = 'url(' + e.target.result + ')'
            preview.style.fontSize = 0
        }
        reader.readAsDataURL(event.target.files[0])
    }
    else {
    	preview.style.fontSize = '14px'		
    }
}
</script>
<%@ include file="../../footer.jsp" %>
</body>
</html>