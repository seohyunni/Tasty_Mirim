<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=yes" />
  <meta name="format-detection" content="telephone=no, address=no, email=no" />
  <title>생생미림통 | 메인</title>
  <script src="//www.gstatic.com/firebasejs/live/3.0/firebase.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@5.3.1/css/swiper.min.css" integrity="sha256-+ZTVzMkZ+H+hPXlJprtzWC8Bti4NyDr4XNA9DoupU/U=" crossorigin="anonymous" />
  <link rel="stylesheet" type="text/css" href="./css/main.css?after" />
  
<% request.setCharacterEncoding("UTF-8"); %>

</head>
<body>
<%@ include file="./header.jsp" %>

  <div class="wrapper main-pg">
      <!-- Content -->
  <div id="content-wrap" class="content-main">
    <div class="swiper-container main-swp-box">
      <div class="swiper-wrapper">
        <div class="swiper-slide item01">
          <div class="main-swp-item">
            <div class="main-swp-bg"><img src="./img/img_visual01.png" alt="덕봉식당" /></div>
            <div class="main-swp-box">
              <p class="main-swp-ttl" data-an="fade-up" data-an-order="1">덕봉식당</p>
              <p class="main-swp-sub" data-an="fade-up" data-an-order="2">고된 수업으로 지친 학생들, 따스한 가정집을 느껴봐~</p>
              <a href="#" class="main-swp-more" data-an="fade-up" data-an-order="4">more</a>
            </div>
          </div>
        </div>
        <div class="swiper-slide item02">
          <div class="main-swp-item">
            <div class="main-swp-bg"><img src="./img/img_visual02.png" alt="더 오믈렛" /></div>
            <div class="main-swp-box_right">
              <p class="main-swp-ttl" data-an="fade-up" data-an-order="1">더 오믈렛</p>
              <p class="main-swp-sub" data-an="fade-up" data-an-order="2">폭신한 오믈렛으로 든든한 한끼 식사 어때?</p>
              <a href="#" class="main-swp-more" data-an="fade-up" data-an-order="4">more</a>
            </div>
          </div>
        </div>
        <div class="swiper-slide item03">
          <div class="main-swp-item">
            <div class="main-swp-bg"><img src="./img/img_visual03.png" alt="참짜장" /></div>
            <div class="main-swp-box">
              <p class="main-swp-ttl" data-an="fade-up" data-an-order="1">참짜장</p>
              <p class="main-swp-sub" data-an="fade-up" data-an-order="2">가성비 GOOD ! 맛 좋고 값싼 리얼 맛집</p>
              <a href="#" class="main-swp-more" data-an="fade-up" data-an-order="4">more</a>
            </div>
          </div>
        </div>
      </div>
      <!-- Add Pagination -->
      <div class="swiper-pagination"></div>
    </div>


  </div>
  <!-- // Content -->
<div class="container main">
  <div class="left-section section01">
    <div class="inner">
      <div class="txt-wrap">
        <p class="left-num"><span>01</span> 메인페이지</p>
        <div class="left-section_content">
        <img class="left-img" src="./img/introduce01.PNG">
        <p class="section01_txt01">구글 아이디로<br>로그인이 가능해요!</p>
        <p class="section01_txt02">색다른 음식점 추천!<br>배너를 보고 정보를<br>얻을 수 있어요!</p>
        <img class="section01_arrow01" src="./img/right_arrow01.png">
        <img class="section01_arrow02" src="./img/right_arrow01.png" >
      </div>
      </div>
    </div>
  </div>

  <div class="section section02">
      <div class="inner">
        <div class="txt-wrap">
          <p class="num"><span>02</span> 지도 기능</p>
          <div class="section02_content">
              <img class="img" src="./img/introduce02.PNG">
          <p class="section02_txt01">구글 map을 이용해<br>맛집 위치를 알 수 있어요!</p>
          <p class="section02_txt02">위치 아이콘을 클릭하면<br>음식점의 평균 평점과<br>대표 메뉴, 최근 리뷰를<br>볼 수 있어요!</p>
          <p class="section02_txt03">가장 최근에 써진 리뷰를 볼 수 있어요!<br>더보기를 누르면 더 많은<br>리뷰를 볼 수 있어요 +ㅁ+</p>
          <img class="section02_arrow01" src="./img/right_arrow01.png">
          <img class="section02_arrow02" src="./img/right_arrow01.png" >
        </div>
        </div>
      </div>
    </div>

        <div class="left-section section03">
          <div class="inner">
            <div class="txt-wrap">
              <p class="left-num"><span>03</span> 음식점 세부 정보</p>
              <div class="left-section03_content">
              <img class="left-img" src="./img/introduce03.PNG">
              <p class="section03_txt01">재학생이 추천하는 메뉴와<br>다양한 팁들을 확인해 보세요</p>
              <img class="section03_arrow01" src="./img/right_arrow01.png">
            </div>
            </div>
          </div>
        </div>
 
        <div class="section section04">
            <div class="inner">
              <div class="txt-wrap">
                <p class="num"><span>04</span> 리뷰 & 별점</p>
                <div class="section04_content">
                    <img class="img" src="./img/introduce04.PNG">
                <p class="section04_txt01">해당 음심점에 대한 모든<br>리뷰를 확인할 수 있어요!<br>리뷰를 통해 자신의 입맛과<br>비슷한 음식점을 찾아봐요!</p>
                <img class="section04_arrow01" src="./img/right_arrow01.png">
              </div>
              </div>
            </div>
          </div>
 
      <div class="left-section section05">
        <div class="inner">
          <div class="txt-wrap">
            <p class="left-num"><span>05</span> 도장깨기 지도</p>
            <div class="left-section_content">
            <img class="left-img" src="./img/introduce05.PNG">
            <p class="section05_txt01">도장깨기 맛집에 선정된 top 5 음식점은<br>지도와 세부 정보에 도장 사진이 떠요!</p>
            <p class="section05_txt02">5개의 도장깨기를 완료하면<br>특별한 칭호 주어져요!</p>
            <p class="section05_txt03">도장깨기를 완료한 음식점은<br>도장깨기 지도에서 볼 수 있어요!</p>
            <img class="section05_arrow01" src="./img/right_arrow01.png">
            <img class="section05_arrow02" src="./img/right_arrow01.png" >
            <img class="section05_arrow03" src="./img/right_arrow01.png" >
          </div>
          </div>
        </div>
      </div>
 
      <div class="section section06">
          <div class="inner">
            <div class="txt-wrap">
              <p class="num"><span>06</span> 마이페이지</p>
              <div class="section02_content">
                  <img class="img" src="./img/introduce06.PNG">
              <p class="section06_txt01">지금까지 자신이 작성한 리뷰를<br>한 눈에 확인할 수 있어요!</p>
              <p class="section06_txt02">도장깨기에서 얻은 칭호를<br>확인할 수 있어요!</p>
              <img class="section06_arrow01" src="./img/right_arrow01.png">
              <img class="section06_arrow02" src="./img/right_arrow01.png" >
            </div>
            </div>
          </div>
        </div>

      <div class="left-section section07">
        <div class="inner">
          <div class="txt-wrap">
            <p class="left-num"><span>07</span> 랭킹시스템</p>
            <div class="left-section07_content">
            <img class="left-img" src="./img/introduce07.PNG">
            <p class="section07_txt01">리뷰를 많이 작성해서<br>리뷰왕의 자리에 도전해 보세요!</p>
            <img class="section07_arrow01" src="./img/right_arrow01.png">
          </div>
          </div>
        </div>
      </div>

      <div class="section section08">
          <div class="inner">
            <div class="txt-wrap">
              <p class="num"><span>08</span> 리뷰 작성</p>
              <div class="section04_content">
                <img class="img" src="./img/introduce08.PNG">
                <p class="section08_txt01">별점은 1점 단위로 매길 수 있어요!</p>
                <p class="section08_txt02">리뷰는 하루에 하나만<br>남길 수 있어요!</p>
                <p class="section08_txt03">사진을 첨부하지 않으면 작성할 수 없어요!</p>
                <img class="section08_arrow01" src="./img/right_arrow01.png">
                <img class="section08_arrow02" src="./img/right_arrow01.png" >
                <img class="section08_arrow03" src="./img/right_arrow01.png" >
              
            </div>
            </div>
          </div>
        </div>


<!-- 하단 copyright 부분 -->
<footer id="footerWrap">
  <div id = "footer">
      <!-- div class 들어갈 자리 -->

      <!--div class 들어갈 자리 -->
      <div class="sns">
      <img class="footer_icon" width=30  height=30 src="https://c7.uihere.com/files/353/468/986/menlo-park-facebook-social-media-computer-icons-social-networking-service-facebook-new-logo-png-thumb.jpg" >
      <img class="footer_icon" width=30  height=30 src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/1024px-Instagram_logo_2016.svg.png">
      <img class="footer_icon" width=30  height=30 src="data:image/png;base64,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">
      </div>
      <!-- div class = "copyright" 들어갈 자리-->
      <p class="copy">Copyright 2020 ⓒ seohyun & hyerim & taehui All rights reserved. </p>
  </div></footer>

  </div>
  <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://code.jquery.com/jquery-migrate-3.1.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@5.3.1/js/swiper.min.js" integrity="sha256-8JTNLE6I+DHURcLWWoKCmv16gDzw0Fp4I34O2y40vC0=" crossorigin="anonymous"></script>
  <script type="text/javascript" src="./js/ui.js"></script>
  <script type="text/javascript">
  
// 메인 이미지 풀사이즈로 유지
$(document).ready(function(){
  var agent = navigator.userAgent.toLowerCase();
  if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
      forIE();
    }
});

function forIE(){
  $(".main-swp-bg img").each(function(){
    var t = $(this), // 이미지 태그
      s = 'url(' + t.attr('src') + ')', // 이미지 태그의 src를 가져옴.
      p = t.parent(), // 부모 컨테이너 '.img-box'
      d = $('<div class="backGround"></div>'); // div를 하나 만듦.

    t.hide(); //이미지는 숨기고.
    p.append(d); //부모div에 생성한 div를 붙임.

    d.css({
      'position': 'absolute',
      'width': '100%',
      'height': '100%',
      'background-size': 'cover',
      'background-repeat': 'no-repeat',
      'background-position': 'center',
      'background-image': s
    });
  });
}
//메인 스와이프
var swiper = new Swiper('.main-swp-box.swiper-container', {
  pagination: {
    el: '.swiper-pagination',
    clickable: true
  },
  centeredSlides: true,
  autoplay: {
    delay: 5000
  },
  speed: 1200,
  loop: true,
});
</script>
</body>
</html>
