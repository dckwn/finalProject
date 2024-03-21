<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="userHeader.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.yj-intro{
	margin-top: 50px;
	}
        .text-table{
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            margin: 100px auto;
            margin-top: 20px;
        }
        .text-table > div > p{
        	padding: 5px;
        }
        .yj-icon{
        	display: flex;
        	justify-content: center;
        	
        }
        .widget1{
            border: 1px solid black;
            width: 1300px;
            margin: auto;
        }
        .widget2{
            border-top: 2px solid black;
            width: 1300px;
            margin: auto;
        }
        .health-image {
            max-width: 1300px;
            display: flex;
            margin: auto;
            align-items: center;
        }

		.dh-homeImg{
		width:100%;
		margin:auto;
		text-align: center;
	}
		.dh-homeImg > img{
			width: 100%;
		}
		
        
    </style>
</head>
<body>
<div class="frame">

	<div class="dh-homeImg"><img src="${cpath }/upload/mainImage/Home.png"></div>

    <div class="yj-intro">
    	
    	
    
        <div>
            <h1 style="text-align: center;"><span style="color: black; font-size: 22px;">Health Protector는 최고급 헬스 기구들만 갖춘 부산의 최고의 피트니스 센터로 인정받고 있습니다.</span></h1>   
        </div>
        <div class="text-table">
            <div>
                <p style="text-align: center;">부산 최대 규모의 호텔형 구조 및 명품 머신들을 비롯한 넉넉한 주차공간과</p>
                <p style="text-align: center;">부산 해운대를 배경으로한 세개 지점과 문화의거리인 서면점으로 구성되어&nbsp;</p>
                <p style="text-align: center;">해운대가 제공하는 자연, 마린시티와 센텀시티의 품격, 서면의 문화 속에서 회원님에게 쾌적한 &nbsp;힐링 공간을 제공해드립니다.</p>
                <p style="text-align: center;">또한, &nbsp;전문 트레이너 및 운영진은 체계적인 트레이닝을 제공합니다.</p>
            </div>
        </div>
        <div class="text-table">
            <div class="widget1"></div>
            <div>
                <h3 style="margin: 0px; text-align: center; letter-spacing:2px;"><strong><span style="color: rgb(0, 0, 0); font-size: 40px;">BRAND POSITIONING</span></strong></h3>
            </div>
            <div class="widget2"></div>
        </div>

        
        <div class="text-table">
        <div class="health-image">
            <div><img src="https://cdn.imweb.me/thumbnail/20201130/2e05633624de6.png" style="width: 219px;"></div>
            <div>
                <div></div>
                <img src="https://cdn.imweb.me/thumbnail/20201130/b3310f960d8d2.png" style="width: 219px;">
            </div>
            <div><img src="https://cdn.imweb.me/thumbnail/20201130/b7cd916602b4c.png" style="width: 219px;"></div>
        </div>

        <div class="health-image">
            <div><img src="https://cdn.imweb.me/thumbnail/20201130/ac49b1e63012b.png" style="width: 219px;"></div>
            <div><img src="https://cdn.imweb.me/thumbnail/20201130/0c3787ce9bb9d.png" style="width: 219px;"></div>
            <div><img src="https://cdn.imweb.me/thumbnail/20201130/48c1ffb1d468c.png" style="width: 219px;"></div>
        </div>
        </div>

        <div class="text-table">
            <div class="widget1"></div>
            <div>
                <h3 style="margin: 0px; text-align: center; letter-spacing:2px;"><strong><span style="color: rgb(0, 0, 0); font-size: 40px;">CENTER FACILITY</span></strong></h3>
            </div>
            <div class="widget2"></div>
        </div>
        
        <div class="health-image">
            <div class="text-table">
                <div class="yj-icon"><img src="${cpath }/upload/car.png" style="width: 50px;"></div>
                <div>easy traffic</div>
            </div>

            <div class="text-table">
                <div class="yj-icon"><img src="${cpath }/upload/moon.png" style="width: 50px;"></div>
                <div>24hours</div>
            </div>

            <div class="text-table">
                <div class="yj-icon"><img src="${cpath }/upload/member.png" style="width: 50px;"></div>
                <div>membership</div>
            </div>

            <div class="text-table">
                <div class="yj-icon"><img src="${cpath }/upload/shower.png" style="width: 50px;"></div>
                <div>clean</div>
            </div>
        </div>

    </div>
</div>
<%@ include file="footer.jsp" %>  
</body>
</html>