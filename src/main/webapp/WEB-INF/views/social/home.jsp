<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp"  %>
<style>
    .js-feedFrame  {
        width: 1300px;
        height: 100%;
        margin: 10px auto;
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
        border-radius: 15px 15px 0 0 ;
        width: 650px;
        height: 80px;  
        font-size: 60px;      
    } 
    .js-with { 
        border: 10px solid white;
        border-radius: 15px 15px 0 15px ; 
        width: 650px;
        height: 80px;  
        font-size: 60px;
    } 
    .js-feedInfo {
        border: 10px solid white;
        background-color: #99ffff;
        border-top: none;
        border-radius: 0 0 20px 20px;
        padding-bottom: 15px; 
    }
    .js-feedHomeBtn {
        display: flex;
        justify-content: space-between;
        padding: 10px; 
    }
    .js-listImgFrame {
        height: 150px; 
    }
    .js-listImgFrame > img {
        border-radius: 10px;
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
        justify-content: center;
        flex-flow: wrap;
    }
    .js-item > div {
        margin: 5px;
        width:300px;
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
    /* 하트 모양 */
    .heart {
        cursor: pointer;
        width: 23px;
        height: 17px;
        display: inline-block;
        font-size: 14px;
        line-height: 30px;
    }
    /* 빈 하트 모양 */
    .empty-heart:before {
        content: '♡'; /* 빈 하트 아이콘 */
    }
    /* 채워진 하트 모양 */
    .filled-heart:before {
        content: '♥'; /* 채워진 하트 아이콘 */
    }
</style>
<div class="frame">
    <div class="js-topImg" style="width: 100%; text-align: center;">
        <img src="${cpath }/upload/mainImage/socialmain.png" style="max-width: 100%;">
    </div>
    <div class="js-feedFrame">
        <div class="js-choice">
            <div class="js-feed center"><a>FEED</a></div>
            <div class="js-with center"><a href="${cpath }/social/with/wlist">WITH</a></div>
        </div>
        
        <div class="js-feedInfo">   
            <div class="js-feedHomeBtn">
                <div>
                    <a href="${cpath }/social/home">최신순</a>
                    <span>/</span>
                    <a>인기순</a>
                </div>
                <div>
                    <c:if test="${not empty login.userid }">
                        <a href="${cpath }/social/feed/write"><button>추가하기</button></a>
                    </c:if>
                </div>

            </div>
            
            <div class="js-root">    
                <div class="js-item">
                    <c:forEach var="dto" items="${list }">
                        <div>
                            <div>
                                <div class="js-listImgFrame">
                                    <c:forTokens var="fileName" items="${dto.storedFileName }" delims=":">
                                        <img src="${cpath }/upload/${fileName}" width="300" height="150">
                                    </c:forTokens>
                                </div>
                                <div>
                                	<c:if test="${not empty login.userid }">
	                                    <div class="heart empty-heart" onclick="toggleHeart(this, ${dto.idx})"></div>
	                                    <span class="count">0</span>
                                    </c:if>
                                    <c:if test="${empty login.userid }">
                                   		<div class="heart filled-heart"></div>
	                                    <span class="count">0</span>
                                    </c:if>
                                </div>
                                <div>
                                    <div style="font-size: 25px;"><a href="${cpath}/social/feed/view/${dto.idx}">${dto.title }</a></div>
                                    <div style="font-size: 15px;">@_ ${dto.writer }</div>
                                    <div style="font-size: 12px;">${dto.write_date }</div>
                                </div>
                            </div>
                        </div>                  
                    </c:forEach>
                </div>    
            </div>
        </div>      
    </div>              
</div>




<script>
    // 무한 스크롤
    const root = document.querySelector('.js-root');
    root.onscroll = function(event) {
        const ob = {
            scrollTop: event.target.scrollTop,
            clientHeight: event.target.clientHeight,
            scrollHeight: event.target.scrollHeight
        };

        const flag = ob.scrollTop + ob.clientHeight === ob.scrollHeight;
        if(flag) {
            console.log('추가 불러오기 !!');
            const num = +document.querySelector('.js-item:last-child').innerText;
            for(let i = num + 1; i < num + 6; i++) {
                const tag = `<div class="js-item">
                	<c:forEach var="dto" items="${list }">
                    <div>
                        <div>
                            <div class="js-listImgFrame">
                                <c:forTokens var="fileName" items="${dto.storedFileName }" delims=":">
                                    <img src="${cpath }/upload/${fileName}" width="300" height="150">
                                </c:forTokens>
                            </div>
                            <div>
                            	<c:if test="${not empty login.userid }">
                                    <div class="heart empty-heart" onclick="toggleHeart(this, ${dto.idx})"></div>
                                    <span class="count">0</span>
                                </c:if>
                                <c:if test="${empty login.userid }">
                               		<div class="heart filled-heart"></div>
                                    <span class="count">0</span>
                                </c:if>
                            </div>
                            <div>
                                <div style="font-size: 25px;"><a href="${cpath}/social/feed/view/${dto.idx}">${dto.title }</a></div>
                                <div style="font-size: 15px;">@_ ${dto.writer }</div>
                                <div style="font-size: 12px;">${dto.write_date }</div>
                            </div>
                        </div>
                    </div>                  
                </c:forEach>
            </div>`;
            
            root.innerHTML += tag;
            }
        }
    };

  
 	// 하트 모양 클릭 시 이벤트 처리
    function toggleHeart(element, boardId) {
        if (element.classList.contains('empty-heart')) {
            element.classList.remove('empty-heart');
            element.classList.add('filled-heart');
            increaseCount(element.nextElementSibling, boardId); // 클릭 카운트 증가
            saveHeartState(boardId, true); // 하트 상태 저장
        } else {
            element.classList.remove('filled-heart');
            element.classList.add('empty-heart');
            decreaseCount(element.nextElementSibling, boardId); // 클릭 카운트 감소
            saveHeartState(boardId, false); // 하트 상태 저장
        }
    }

    // 클릭 카운트 증가
    function increaseCount(countElement, boardId) {
        let count = parseInt(countElement.textContent);
        count++;
        countElement.textContent = count;
        saveClickCount(boardId, count); // 클릭 카운트 저장
    }

    // 클릭 카운트 감소
    function decreaseCount(countElement, boardId) {
        let count = parseInt(countElement.textContent);
        count--;
        countElement.textContent = count;
        saveClickCount(boardId, count); // 클릭 카운트 저장
    }

    // 하트 상태 저장
    function saveHeartState(boardId, isLiked) {
        localStorage.setItem(`heart_${boardId}`, isLiked ? 'filled' : 'empty');
    }

    // 클릭 카운트 저장
    function saveClickCount(boardId, count) {
        localStorage.setItem(`clickCount_${boardId}`, count);
    }

    // 페이지 로드 시 저장된 하트 상태와 클릭 카운트를 가져와서 UI에 반영
    window.onload = function() {
        const boardIds = document.querySelectorAll('.js-item [data-board-id]');
        boardIds.forEach(boardId => {
            const heartElement = document.querySelector(`.js-item [data-board-id="${boardId}"] .heart`);
            const countElement = document.querySelector(`.js-item [data-board-id="${boardId}"] .count`);
            const savedHeartState = localStorage.getItem(`heart_${boardId}`);
            const savedClickCount = localStorage.getItem(`clickCount_${boardId}`);
            if (savedHeartState === 'filled') {
                heartElement.classList.add('filled-heart');
            } else {
                heartElement.classList.add('empty-heart');
            }
            countElement.textContent = savedClickCount || 0;
        });
    };
</script>
<%@ include file="../footer.jsp" %>

</body>
</html>