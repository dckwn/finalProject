<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    div#preview {
        border: 3px solid #dadada;
        border-radius: 50%;
        width: 200px;
        height: 200px;
        margin: auto;
        margin-bottom: 13px;
        background-position: center center;
        background-repeat: no-repeat;
        background-size: auto 100%;
        overflow: hidden;
        background-color: rgb(232, 240, 254);
        box-shadow: inset -5px -5px 10px white, inset 5px 5px 10px #dadada;
    }
    div#preview:hover {
       background-color: #FAD4D4;
    }
    .dg-sign-form input[type=file] {
        position: absolute;
        width: 0;
        height: 0;
        padding: 0;
        overflow: hidden;
        border: 0;
    }

    .dg-sign-form input[type=file]+label {
        cursor: pointer;
        color: #757575;
    }
</style>
</head>
<body>


<div class="frame">

   <div class="dg-container">
            <h1>Change Info</h1>
            
            <form method="POST" enctype="multipart/form-data">
            	<input type="hidden" name="userid" value="${login.userid }">
            	<input type="hidden" name="prev_Profile" value="${login.profile_image }">
                <div class="dg-login">
                	<!--  프로필사진 -->
                    <div class="dg-sign-form profileSet dh-loform">
                        <div id="preview"><img id="currentProfile" src="${cpath }/upload/profile/${login.profile_image}" style="width:inherit; height:inherit;"></div>
                        <i class="fa-regular fa-image"></i>
                        <input type="file" name="profile_Upload" accept="image/*" id="file">
                        <label for="file" style="font-weight: bold;">Profile Photo</label>
                    </div>
                    <input type="text" name="username" placeholder="이름" value="${login.username }">
                    <input type="text" name="phone_num" placeholder="전화번호" value="${login.phone_num }">
                    <input type="submit" value="ChangeInfo">
                </div>
            </form>          
     </div>  
</div>

<script>
const input = document.querySelector('input[name="profile_Upload"]')
         var img = document.createElement("img");
         function changeHandler(event) {
            // event.target 은 파일을 첨부하는 input 요소이다
            // preview는 미리보기 그림을 보여줄 div 요소이다
            const preview = document.getElementById('preview')

            if (event.target.files && event.target.files[0]) {
               var reader = new FileReader();
               reader.onload = function(event) {
                  img.setAttribute("src", event.target.result);
                  img.style.width = '100%'
                  img.style.height = '100%'
                  //                img.setAttribute("width", "100%");
                  //                img.setAttribute("height", "100%");
                  document.querySelector("div#preview").appendChild(img);
                  document.querySelector('#currentProfile').classList.add('hidden')
               };

               reader.readAsDataURL(event.target.files[0]);
            } else {
               document.querySelector("div#preview").removeChild(img);
            }
         }
         

         
         input.addEventListener('change', changeHandler)
      </script>

<%@ include file="../footer.jsp" %>  
</body>
</html>