<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="./css/restaurant_info.css">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
   
    <meta name="description" content="생생 정보통">
    <meta name="keywords" content="고시촌 맛집, 미림 맛집, 도장깨기, 리뷰 및 평점">
    <title>생생 미림통</title>
    <link rel="icon" href="./img/생생미림통_LOGO.ico">

    <!--반응형-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    
    <style>

        /* Set the size of the div element that contains the map */
 
       #map {
       position:relative;
    float: right;
    top:129px;
    height: 400px;
    width:500px;
 
        }
 
     </style>

<% request.setCharacterEncoding("UTF-8"); %>
<% String res_name = request.getParameter("res_name");
int avg_grade = Integer.parseInt(request.getParameter("avg_grade"));
String res_content = request.getParameter("res_content");
String map = request.getParameter("map");%>
</head>
    <body> 
    <%@ include file="./header.jsp" %>
   
        
  <div class="wrap">
	  <div class="content">
	
       <div class="title">
       		<table class="title_table">
       			<tr>
       				<td id="res_name">
				            <%=res_name %>
				    </td>
				</tr>
				
				<tr>
					<td id = "text_star">
				            평균 평점
		        	</td>
		       	</tr>
		       	
				<tr>
					<td id="star">
				            <%for(int i=1;i<=avg_grade;i++){ %>
									<img width="40" height="40" src="https://image.flaticon.com/icons/svg/148/148841.svg">
									<%}
									for(int i=1;i<=5-avg_grade;i++){
										%>
									<img width="40" height="40" src="https://image.flaticon.com/icons/png/512/149/149222.png">
									<%} %>
		        	</td>
		       	</tr>
		       	
		       	<tr>
		       		<td class="score">
		       			<%=avg_grade %>
		       		</td>
		       	</tr>
		       </table>
		  </div>
	<div id="map"></div>

        <script>
          var map;
          function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
              center: {<%=map%>},
              zoom: 20
            }); //지도
            var amasubin={<%=map%>};
            var marker = new google.maps.Marker({position: amasubin, map: map});//마커띄우기
            
            var contentString = '<h1 id="firstHeading" class="firstHeading"><%=res_name%></h1>';
        	var infowindow = new google.maps.InfoWindow({
          	content: contentString
        	});

        var marker = new google.maps.Marker({
          position: amasubin,
          map: map,
          title: '<%=res_name%>'
        });
        marker.addListener('click', function() {
          infowindow.open(map, marker);
        });
          }
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDkJihoSRc45bcEXnfJiWn2x2Pup43tAvk&callback=initMap"
        async defer></script>
       
        
    
    
        
	<div class="menu_wrap">
		<h3 class="menu_title"> 메뉴</h3>
		<table class="menu_table">
			<tr >
				<td id="menu">
					             컵 라이스
				</td>
				<td class="menu_price">
						3000원
				</td>
			</tr>
			<tr >
				<td id="menu">
					             컵 라이스
				</td>
				<td class="menu_price">
						3000원
				</td>
			</tr>
			<tr >
				<td id="menu">
					             컵 라이스
				</td>
				<td class="menu_price">
						3000원
				</td>
			</tr>
			<tr >
				<td id="menu">
					             컵 라이스
				</td>
				<td class="menu_price">
						3000원
				</td>
			</tr>
			<tr >
				<td id="menu">
					             컵 라이스
				</td>
				<td class="menu_price">
						3000원
				</td>
			</tr>
					        
		</table>
	</div>
        
       <div class=tip_wrap>
       	<h3 class="tip_title">재학생의 꿀팁</h3>
       		<table class="tip_table">
       	<tr>
       	<td id="tip">
       		<%=res_content %>
       	</td>
       </tr>
       	</table>		
   
       
         
		 <div id="goto_review_box">          
		<div class="text_goto_review">
		 <a href="#" style="color:white" >리뷰 보기</a>
		 </div>
		</div>
		    </div>
	     
		

        <footer id="footerWrap">
            <div id = "footer">
                <div class="sns">
                <img class="footer_icon" width=30  height=30 src="http://bitly.kr/DVzNB6HvW" >
                <img class="footer_icon" widqth=30  height=30 src="http://bitly.kr/G95VeBiNS">
                <img class="footer_icon" width=30  height=30 src="data:image/png;base64,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">
                </div>
                <p class="copy">Copyright 2020 ⓒ seohyun & hyerim & taehui All rights reserved. </p>
            </div></div></footer>
  

</body>
</html>
