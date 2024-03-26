<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .js-topImg {
    	margin: auto auto;
    	text-align: center;
    }
	.js-userInfoFrame {
		border: 10px solid white;
		background-color: #99ffff;
		border-radius: 20px;
		width: 1300px;
		height: 250px;
		margin: 0 auto;		
		display: flex;
	}
	.js-userInfo_left {
		border: 1px solid white;
		border-radius: 20px;
		margin: 10px;
		padding: 10px;		
		flex: 2;
		margin-right: 5px;	
	}
	.js-userInfo_left > div > img {
		width: 242px;
		height: 192px;
		border-radius: 10px;
	}
	.js-userInfo_right {
		border: 1px solid white;
		border-radius: 20px;
		margin: 0 auto;
		padding: 15px;
		padding-top: 30px;
		flex: 8;	
		font-size: 25px;
		margin-left: 5px;	
	}
	.js-feedMyBoardBtn {
		display: flex;
		justify-content: flex-end;
	}
	 .js-feedFrame  {
		width: 1300px;
		margin: 0 auto;
	}
 	.js-choice { 
 		display: flex;
		justify-content: center;
 		width: 1300px;
 	} 
 	.js-feed { 
 		border: 10px solid white; 
 		background-color: #99ffff;
 		border-bottom: none;
 		border-right: none;
 		border-radius: 10px 15px 0 0 ;
 		width: 650px;
 		height: 80px;  
 		font-size: 60px; 		
 	} 
 	.js-with { 
 		border: 10px solid white; 
 		border-radius: 15px 10px 0 15px; 
 		width: 650px;
 		height: 80px;  
 		font-size: 60px;
 	} 
 	.js-feedInfo {
 		border: 10px solid white;
 		background-color: #99ffff;
 		border-top: none;
 		border-radius: 0 0 20px 20px;
 		margin: 0 auto;
 	}
 	.js-feedMyBoardBtn {
 		display: flex;
 		justify-content: flex-end;
 		padding: 10px;
 	}
 	
 	.js-listImgFrame {
 		height: 150px; 
 	}
 	.js-root {
        width: 1255px;
        height: 580px;      /* 높이를 고정 */
        margin: 10px;
        padding: 10px;
        overflow-y: scroll;
    }
    .js-item {
        width: 1255px;
        display: flex;
        flex-flow: wrap;
    }
    .js-item > div {
    	margin: 5px;
    	width: 300px;
    }
     button {
		border: none;
		outline: none;
		background-color: #8fabba;
		border-radius: 5px;
		font-family: 'GangwonEdu_OTFBoldA';
		font-size: 15px;
		margin: 5px;
		width: 64px;
		height: 21px;
	}
</style>
</head>
<body>

<div class="frame">
	<div class="js-topImg">
		<img src="${cpath }/upload/mainImage/socialmain.png" style="max-width: 100%;">
	</div>
	<div class="js-userInfoFrame">
		<div class="js-userInfo_left center">
			<div><img src="${cpath }/upload/profile/${login.profile_image}"></div>
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
					<a href="${cpath }/social/feed/write"><button>추가하기</button></a>
				</div>
			</div>
					
			<div class="js-root">
				<div class="js-item">
					<c:forEach var="dto" items="${list }">
						<c:if test="${login.userid == dto.writer }">
							<div>
								<div class="js-listImgFrame">
									<c:forTokens var="fileName" items="${dto.storedFileName }" delims=":">
											<img src="${cpath }/upload/${fileName}" width="300" height="150">
									 </c:forTokens>
								</div>
								<div class="js-listInfoFrame">
									<div style="font-size: 25px;"><a href="${cpath}/social/feed/view/${dto.idx}">${dto.title }</a></div>
									<div style="font-size: 15px;">@_${dto.writer }</div>
									<div style="font-size: 12px;">
										${dto.write_date }
										<a href="${cpath }/social/feed/modify/${dto.idx}"><button>✏</button></a>
										<a href="${cpath }/social/feed/delete/${dto.idx}"><button>❎</button></a>
									</div>
								</div>
							</div>
						</c:if>					
					</c:forEach>
				</div>
			</div>				
		</div>
	</div>

</div>

<script>
        const root = document.querySelector('.js-root')
        root.onscroll = function(event) {
            const ob = {
                scrollTop: event.target.scrollTop,      // 현재 스크롤 상단 위치
                clientHeight: event.target.clientHeight,// 화면에 보여지는 높이
                scrollHeight: event.target.scrollHeight,// 스크롤 가능한 전체 높이
            }
            console.log(ob)

            const flag = ob.scrollTop + ob.clientHeight === ob.scrollHeight
            if(flag) {
                console.log('추가 불러오기 !!')
                const num = +document.querySelector('.item:last-child').innerText
                for(let i = num + 1; i < num + 6; i++) {
                    const tag = `<div class="js-item">${i}</div>`
                    root.innerHTML += tag
                }
            }
        }
</script>


<%@ include file="../../footer.jsp" %>

</body>
</html>