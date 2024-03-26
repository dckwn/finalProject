<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.dg-mp-Container {
	position:relative;
    width: 1200px;
    margin: 100px auto;
    padding: 40px;
    border-radius: 15px;
    box-shadow: -7px -7px 10px white, 5px 5px 10px rgba(198, 196, 196, 0.585);
    gap: 20px;
    
}
h1 {
    margin: 10px auto 20px auto;
    color: #8A7575;
}
.dg-mp-Boxes {
    display: flex;
    flex: 7;
    margin:auto;
    padding: 20px;
    border-radius: 15px;
    box-shadow: -7px -7px 10px white, 5px 5px 10px rgba(198, 196, 196, 0.585);
    gap: 10px;
    color: #8A7575;
    font-size: 14px;
}
.dg-mp-dbBox {
    width: 260px;
    margin:auto;
    padding: 20px;
    border-radius: 15px;
    box-shadow: -7px -7px 10px white, 5px 5px 10px rgba(198, 196, 196, 0.585);
}
.dg-mp-userBox {
    display: flex;
    width: 100%;
    padding: 30px;
    margin: 10px auto;
    border-radius: 15px;
    box-shadow: -7px -7px 10px white, 5px 5px 10px rgba(198, 196, 196, 0.585);
    color: #8A7575;
    font-size: 14px;
}
.dg-mp-userBox p {
    margin: 5px auto;
    font-size:15px;
}
.dg-mp-userBox p i {
    font-size: 7px;
    margin-right:7px;
}
.dg-userBox-Left{
    flex: 1;
}
.dg-userBox-Right {
    flex: 1;
}
.dg-mp-user {
    flex: 3;
    margin: auto;
    padding: 20px;
    border-radius: 15px;
    box-shadow: -7px -7px 10px white, 5px 5px 10px rgba(198, 196, 196, 0.585);
    /* box-shadow: inset -5px -5px 10px white, inset 5px 5px 10px #dadada; */
    margin-top: 75px;
}

#preview {
        border: 3px solid #dadada;
        border-radius: 50%;
        width: 200px;
        height: 200px;
        margin: auto;
        background-position: center center;
        background-repeat: no-repeat;
        background-size: auto 100%;
        overflow: hidden;
        background-color: rgb(232, 240, 254);
        box-shadow: -7px -7px 10px white, 5px 5px 10px rgba(198, 196, 196, 0.585);
    }
.dh-modify-nav{
	position:absolute;
	bottom:25px;
	right:50px;
}
.dh-modify-nav > ul{
	display: flex;
	width:240px;
	justify-content: space-around;
}
.dh-modify-nav > ul > li{
	list-style: none;
}
</style>
</head>
<body>
	<div class="frame">
   
        
       <div class="dg-mp-Container sb">
            <div class="dg-block">
                <h1><i class="fa-solid fa-house-user"></i>My Page</h1>
            
                <div class="dg-mp-Boxes dg-mp-framset">
                    
                    <div class="dg-mp-dbBox sb">
                        <div>키</div>
                        <div>${info.height }</div>
                    </div>
                    <div class="dg-mp-dbBox sb">
                        <div>몸무게</div>
                        <div>${info.weight }</div>
                    </div>
                    <div class="dg-mp-dbBox sb">
                        <div>활동지수</div>
                        <div>${info.activity }</div>
                    </div>
                </div>
                <div class="dg-mp-userBox">
                        <div class="dg-userBox-Left">
                            <p><i class="fa-solid fa-circle-dot"></i>아이디 : ${login.userid }</p>
                            <p><i class="fa-solid fa-circle-dot"></i>이름 : ${login.username }</p>
                            <p><i class="fa-solid fa-circle-dot"></i>전화번호 : ${login.phone_num }</p>
                            
                        </div>

                        <div class="dg-userBox-Right">
                            <p><i class="fa-solid fa-circle-dot"></i>성별 : ${login.gender }</p>
                            <p><i class="fa-solid fa-circle-dot"></i>생년월일 : ${login.birth }</p>
                            <p><i class="fa-solid fa-circle-dot"></i>이메일 : ${login.email }</p>
                        </div>
                    </div>
            </div>

            <!--유저 정보-->
            
            <div class="dg-mp-user">
                <div class="dg-mp-image center">
                    <img id="preview" src="${cpath }/upload/profile/${login.profile_image}">
                </div>

            </div>
            
            <div class="dh-modify-nav">
            	<ul>
            		<li><a href="${cpath }/member/chIf">회원정보수정</a></li>
            		<li><a href="${cpath }/member/chPw">비밀번호변경</a></li>
            	</ul>         
            </div>
       </div>


       <div class="dg-mp-Info">
			
       </div>




    </div>

</body>
</html>