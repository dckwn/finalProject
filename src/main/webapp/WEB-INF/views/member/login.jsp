<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp" %>
<style>
    .frame {
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .dg-container {
        width: 500px;
        padding: 60px;
        border: 2px solid #FAD4D4;
        border-radius: 10px;
        display: flex;
        justify-content: center;
        text-align: center;
        flex-direction: column;
        align-items: center;
        gap: 1.5em;
        box-shadow: -7px -7px 10px white, 5px 5px 10px rgba(0, 0, 0, 0.585);
    }
    h1 {
        font-size: 45px;
        color: #8A7575;
    }
    .dg-login input {
        width: 100%;
        margin: 5px auto;
        font: 16px;
        font-weight: 600;
        color: #8A7575;
        padding: 15px;
        border: none;
        outline: none;
        border-radius: 25px;
        background-color: #FAD4D4;
        box-shadow: inset -5px -5px 10px white, inset 5px 5px 10px #dadada;
    }
    .dg-login input[type="submit"] {
        margin-top: 20px;
        display: inline-block;
        width: 200px;
        height: 50px;
        color: #8A7575;
        font-weight: bold;
        letter-spacing: 4px;
        text-transform: uppercase;
        font-size: 18px;
        border-radius: 25px;
        box-shadow: -5px -5px 10px white, 5px 5px 10px rgba(0, 0, 0, 0.485);
        background-color: #FAD4D4;
        border: none;
        cursor:pointer;
    }
    .dg-login input[type="submit"]:hover {
        background-color: #dadada;
    }
    .dg-sign-info a {
        color: #8A7575;
        margin: auto 45px;
    }


   
</style>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

<div class="frame">

   <div class="dg-container">
            <h1>Sign In</h1>
            
            <form method="POST">
                <div class="dg-login">
                    <input type="text" name="userid" placeholder="ID" autofocus >
                    <input type="password" name="userpw" placeholder="Password" required>
                    <input type="submit" value="Sign In">
                </div>
            </form>
            <div class="dg-sign-info">
                <a href="${cpath }/member/join">Sign up</a>
                <a href="#">Forget Password</a>
            </div>
     </div>
   











</div>
<%@ include file="../footer.jsp" %>
<script type="text/javascript">
//     var naver_id_login = new naver_id_login("HLEF4d7TfziQUSCX1qmd", "http://localhost:8080/Study4/member/login/test");
//     var state = naver_id_login.getUniqState();
//     naver_id_login.setButton("white", 2,40);
//     naver_id_login.setDomain("http://localhost:8080");
//     naver_id_login.setState(state);
//     naver_id_login.setPopup();
//     naver_id_login.init_naver_id_login();
</script>
</body>
</html>