<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	footer {
            width: 100%;
            background-color: #8ABDCF;
            height: 270px;
        }
        .ftF {
            width: 950px;
            margin: auto;
            display: flex;
            padding: 40px 0;
        }
        .ftF > div{
        	flex: 1;
        }
        .sb {
  			display:flex;
            justify-content: space-between;
            align-items: center;
        }
        .right {
            padding: 20px;
            padding-left: 0px;
        }
        .right > form > input {
            padding: 10px;
            margin-right: 5px;
        }
        .left{
        	padding: 20px;
        }
        .left > p {
            font-size: 14px;
        }
</style>
</head>
<body>
	
	<footer>
    <div class="ftF">
        <div class="right">
            <h2>Subscribe for Updates</h2>
            <form>
                <input style="border: 3px solid red; width: 250px; background-color:inherit" type="email" name="email" placeholder="Enter your email here"><input style="background-color: #FCD46D; width: 90px; font-weight: bold; border: #FCD46D; height: 39px;" type="submit" value="Subsribe">
            </form>
        </div>
        <div class="left">
            <p>부산광역시 해운대구 센텀2로 25 센터드림월드 11층</p>
            <p>Tel : 1566 - 172x, info@health.com</p>
            <br>
            <p>Copyright by Health Protecter</p>
        </div>
    </div>
</footer>


</body>
</html>