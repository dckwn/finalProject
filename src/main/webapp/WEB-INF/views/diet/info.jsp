<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{  
 		box-sizing: unset; 
 	}
.dh-login {
	border: 1px solid #dadada;
	padding: 20px;
	width: 400px;
	background-color: white;
	border-radius: 6px;
}

.dh-loform {
	display: table;
	table-layout: fixed;
	border: 1px solid #dadada;
	padding: 14px 17px 13px;
	box-sizing: border-box;
	width: 100%;
}

.dh-check {
	border-radius: 6px 6px 0 0;
	box-shadow: none;
	position: relative;
}

.dh-loform:nth-child(4) {
	border-radius: 0 0 6px 6px;
	box-shadow: none;
	position: relative;
	display: flex;
	padding: 0px;
	margin-bottom: 40px;
}

.dh-loginbutton {
	text-decoration: none;
	border: 0px;
	background: 0 0;
	font-family: 'Open Sans', sans-serif;
	font-size: 20px;
	font-weight: 700;
	line-height: 24px;
	color: #fff;
	margin: 0 auto;
	cursor: pointer;
}

.dh-lobutton {
	display: block;
	width: 100%;
	padding: 13px 0 13px;
	border-radius: 6px;
	border: solid 1px rgba(0, 0, 0, .15);
	background-color: #dadada;
	box-sizing: border-box;
	position: relative;
	z-index: 5;
}

.dh-input {
	width: 100%;
	font-size: 16px;
	font-weight: 400;
	line-height: 19px;
	letter-spacing: -.5px;
	color: #222;
	box-sizing: border-box;
	display: table-cell;
	padding-right: 30px;
	border: 0px;
	padding: 1px;
}

.dh-loform input[type=radio] {
	display: none;
}

.dh-loform input[type=radio]+label {
	border: 1px solid #dadada;
	border-top: 0px;
	font-family: 'Open Sans', sans-serif;
	display: flex;
	justify-content: center;
	height: 100%;
	flex: 3;
	background-color: #fff;
	color: #757575;
	padding: 14px 17px 13px;
	overflow: hidden;
	border-radius: 2px;
	font-size:15px;
	cursor: pointer;
}
.dh-loform input[type=radio]:nth-child(5)+label{
	flex:5;
}

.dh-loform input[type=radio]:checked+label {
	background-color: #555;
	color: #fff;
}

div#preview {
	border: 1px solid #dadada;
	border-radius: 50%;
	width: 200px;
	height: 200px;
	margin-bottom: 13px;
	background-position: center center;
	background-repeat: no-repeat;
	background-size: auto 100%;
	overflow: hidden;
}

.dh-checkId {
	display: flex;
	align-items: center;
}

.dh-checkbutton {
	text-decoration: none;
	border: 0px;
	background: 0 0;
	width: 70px;
	font-family: 'Open Sans', sans-serif;
	font-size: 13px;
	font-weight: 300;
	line-height: 24px;
	color: #757575;
	margin: 0 auto;
	cursor: pointer;
	z-index: 5;
}

.dh-chbutton {
	display: block;
	width: fit-content;
	border-radius: 6px;
	border: solid 1px rgba(0, 0, 0, .15);
	background: 0 0;
	box-sizing: border-box;
	position: relative;
}

button#noch {
	color: #dadada;
}

p#result {
	margin-left: 40px;
	padding-top: 10px;
	display:none;
	font-family: 'Open Sans', sans-serif;
}
</style>
</head>
<body>

	<div class="frame">
	<div class="Mauto">		
		<div class="center">
			<div class="dh-login center">
				<div class="dh-join">
					<form method="POST">
						<input type="hidden" name="userid" value="${login.userid }">
						<div class="dh-loform">
							<div class="center">
								<img src="${cpath }/icon/height1.png" height="25" width="25"
									style="padding-right: 20px;"> <input class="dh-input"
									type="text" name="height" placeholder="키" required>
							</div>
						</div>
						<div class="dh-loform">
							<div class="center">
								<img src="${cpath }/icon/weight2.png" height="25" width="25"
									style="padding-right: 20px;"> <input class="dh-input"
									type="text" name="weight" placeholder="몸무게" required>
							</div>
						</div>
						<div class="dh-loform">
							<input id="dh-activity1" type="radio" name="activity" value="25" required>
								<label for="dh-activity1">가벼운활동</label> 
							<input id="dh-activity2" type="radio" name="activity" value="33" required>
								<label for="dh-activity2">일상적업무</label>
							<input id="dh-activity3" type="radio" name="activity" value="40" required>
								<label for="dh-activity3">심한활동(육체노동)</label>
						</div>
						<div class="dh-lobutton center">
							<button class="dh-loginbutton center">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>