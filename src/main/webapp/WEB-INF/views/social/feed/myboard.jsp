<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.js-userInfoFrame {
		border: 2px solid black;
		border-radius: 20px;
		width: 1300px;
		height: 250px;
		margin-bottom: 30px; 
		margin-left: 20%;		
		display: flex;
	}
	.js-userInfo_left {
		border: 1px solid black;
		border-radius: 20px;
		margin: 10px;
		padding: 10px;		
		flex: 2;
		margin-right: 5px;	
	}
	.js-userInfo_right {
		border: 1px solid black;
		border-radius: 20px;
		margin: 10px;
		padding: 15px;
		padding-top: 30px;
		flex: 8;	
		font-size: 25px;
		margin-left: 5px;	
	}
	.js-feedMyBoardBtn {
		display: flex;
		justify-content: flex-end;
		margin: 5px;
	}
</style>
</head>
<body>

<div class="frame">
	
	<div class="js-userInfoFrame">
		<div class="js-userInfo_left center">
			<div>${login.profile_image }</div>
		</div>
		<div class="js-userInfo_right">
				<p>
					<span>ID : </span>
					${login.userid }
				</p>

				<p>
					<span>NAME : </span>
					${login.username }
				</p>

				<p>
					<span>BIRTH : </span>
					${login.birth }
				</p>
				<p>
					<span>EMAIL : </span>
					${login.email }
				</p>
			
				<p>
					<span>GENDER : </span>
					${login.gender }
				</p>
			
				<p>
					<span>PHONE_NUM : </span>
					${login.phone_num }
				</p>
		</div>
	</div>
		
	<div class="js-feedFrame">
		<div class="js-choice">
			<div class="js-feed center"><a>FEED</a></div>
			<div class="js-with center"><a>WITH</a></div>
		</div>
		
		
		<div class="js-feedInfo">	
			<div class="js-feedMyBoardBtn">
				<div>
					<a href="${cpath }/social/feed/write"><button>➕</button></a>
					<a href="${cpath }/social/feed/modify/${dto.idx}"><button>✏</button></a>
					<a href="${cpath }/social/feed/delete/${dto.idx}"><button>❎</button></a>
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


<%@ include file="../../footer.jsp" %>

</body>
</html>