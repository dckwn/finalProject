<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp"%>

<style>
	
	table{
	
	 border-collapse: collapse;
	width: 1296px;
	 
	} 
	tr > td,th {
		border: 1px solid black;
	}
	tr > td.right {
	border-right: none ;
	}
	tr > td.left {
	border-left: none ;	
	}
	tr > td.top {
	border-top: none ;	
	}
	tr > td.bottom {
	border-bottom: none ;	
	}
	tr > td {
	padding: 3px;
	margin: 2px
	}
	tr th td{
		width: 1000px;
	}
	div.bet {
	 display: flex;
	 justify-content: space-between;
	}
	tbody tr.sameNum{
		background-color: lightblue;
	}
	#withframe{
		border: 1px solid brack;
	}
	.mywith{
		font-size: 20px;
		padding-top:7px;
		padding-left: 5px;
		margin: 0
	}
	.js-feedFrame  {
		width: 1300px;
		height: 100%;
		margin: 0 auto;
		
	}
 	.js-choice { 
 		display: flex;
		justify-content: center;
 		width: 1300px;
 		 list-style: none; 
 	} 
 	.js-feed { 
 		border: 2px solid black; 
 		border-radius: 10px 15px 0 0 ; 
 		width: 650px;
 		height: 80px;  
 		font-size: 60px; 	
 		background-color: #F6F6F6;
 	} 
 	.js-with { 
 		border: 2px solid black; 
 		border-radius: 15px 10px 0 0 ; 
 		width: 650px;
 		height: 80px;  
 		font-size: 60px;
 		border-bottom: 0;
 	} 
 	.js-feedInfo {
 		border: 2px solid black;
 		border-radius: 0 0 20px 20px;
 		padding-bottom: 15px; 
 		border-top: 0; 
 	}
 	.js-feedHomeBtn {
 		display: flex;
 		justify-content: space-between;
 	}
 	.js-feedList {
 		display: flex;
 		justify-content: space-between;
 		border: 2px solid black;
 		width: 1277px;
 		margin: 5px;
 		padding: 5px;
 	}
 	.js-listImgFrame {
 		border: 1px solid black; 
 	}
 	.js-listInfoFrame {
 		border: 1px solid black; 	
 	}
 body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
    }

    .scroll-arrows {
        position: fixed;
        top: 50%;
        transform: translateY(-50%);
        left: 10px;
        z-index: 9999;
    }

    .scroll-arrow {
        width: 30px;
        height: 30px;
        background-color: #ccc;
        text-align: center;
        line-height: 30px;
        cursor: pointer;
        margin-bottom: 10px;
    }

    .scroll-arrow:hover {
        background-color: #999;
    }

    .scroll-arrow.up {
        border-radius: 50% 50% 0 0;
    }

    .scroll-arrow.down {
        border-radius: 0 0 50% 50%;
    }
    .dg-tkHome-banner {
	    width:100%;
	    text-align: center;
	    margin: 0  auto;
	}
	.dg-tkHome-banner img{
	    width: 100%;
	    height: auto;
	    margin-bottom: 30px;
	    margin-top: 0;
	    
	}

 	div.back{
 		background-image: url("${cpath }/upload/icon/yoga.png");
 		background-repeat:no-repeat;
 		background-size: contain; 
		margin-left: 90px;
 	}
 
</style>


	<div class="frame">
	
       <div class="dg-tkHome-banner">
        <img src="${cpath }/upload/mainImage/socialMain.png">
		</div>
		<div class="scroll-arrows">
		    <div class="scroll-arrow up">&uarr;</div>
		    <div class="scroll-arrow down">&darr;</div>
		</div>	
		<div class="js-feedFrame">
			<div class="js-choice">
				<div class="js-feed center"><a href="${cpath }/social/home">FEED</a></div>
				<div class="js-with center"><a href="${cpath }/social/with/wlist">WITH</a></div>
			</div>
			<div class="center" id="withframe">
				<div class="js-feedInfo">	
					<div class="js-feedHomeBtn" >
						<div class="mywith">
							<a href="${cpath }/social/with/mypage">나의with </a>/
							<a href="${cpath }/social/with/add"> 동행하기</a>
						</div>
					
						<div>	
							<p>
								<a href="${cpath }/social/with/wlist?category=요가"> <button>요가</button></a>
								<a href="${cpath }/social/with/wlist?category=헬스"> <button>헬스</button></a>
								<a href="${cpath }/social/with/wlist?category=크로스핏"> <button>크로스핏</button></a>
							</p>
							<form action="${cpath }/social/with/wlist" method="GET">
								<input type="text" name="keyword" placeholder="검색어입력">
								<input type="submit" value="검색">
							</form>
						</div>
					</div>
				
					<div>
						<table > 
							<c:forEach var="dto" items="${wlist }">
							
								<tbody>
								 	<tr class="<c:if test="${dto.withNum + 1 == dto.peopleNum}">sameNum</c:if>">
										<td class="right bottom" >작성자 : ${dto.writer}</td>
										<td class="left bottom" >운동 : ${dto.category }</td>
										<td rowspan="2">
											참여인원(${dto.withNum + 1}/ ${dto.peopleNum } )<br>
											<progress value="${dto.withNum + 1 }"   max= "${dto.peopleNum}" ></progress> 
										</td>
									</tr>
									<tr class="<c:if test="${dto.withNum + 1 == dto.peopleNum}">sameNum</c:if>">
										<td class="right top">
								            <c:choose>
								                <c:when test="${dto.withNum + 1 == dto.peopleNum}">
								                    <span>제목 : ${dto.title}</span>
								                </c:when>
								                <c:otherwise>
								                    <a href="${cpath}/social/with/${dto.idx}">제목 : ${dto.title}</a>
								                </c:otherwise>
								            </c:choose>
								        </td>
										<td class="left top">운동날 :${dto.start_date } ~ ${dto.end_date }</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>		

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const upArrow = document.querySelector('.scroll-arrow.up');
        const downArrow = document.querySelector('.scroll-arrow.down');
        const scrollStep = 100; // Adjust scroll step as needed

        upArrow.addEventListener('click', function() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });

        downArrow.addEventListener('click', function() {
            window.scrollTo({
                top: document.body.scrollHeight,
                behavior: 'smooth'
            });
        });

        window.addEventListener('scroll', function() {
            const scrollTop = window.scrollY || document.documentElement.scrollTop;

            if (scrollTop === 0) {
                upArrow.style.visibility = 'hidden';
            } else {
                upArrow.style.visibility = 'visible';
            }

            if (scrollTop + window.innerHeight >= document.body.scrollHeight) {
                downArrow.style.visibility = 'hidden';
            } else {
                downArrow.style.visibility = 'visible';
            }
        });
    });
</script>
</body>
</html>