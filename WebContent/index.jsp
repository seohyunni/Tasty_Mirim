<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  
    <link rel="icon" href="./img/생생미림통_LOGO.ico">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=yes" />
  <meta name="format-detection" content="telephone=no, address=no, email=no" />
  <title>생생미림통 | 메인</title>
  <script src="//www.gstatic.com/firebasejs/live/3.0/firebase.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@5.3.1/css/swiper.min.css" integrity="sha256-+ZTVzMkZ+H+hPXlJprtzWC8Bti4NyDr4XNA9DoupU/U=" crossorigin="anonymous" />
  <link rel="stylesheet" type="text/css" href="./css/main.css?after" /><link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap" rel="stylesheet">
 <style>
 .wrapper main-pg{font-family: 'Noto Sans KR', sans-serif;}
 </style>
<% request.setCharacterEncoding("UTF-8"); %>

</head>
<body style="padding-top:0px !important;">
<%@ include file="./header.jsp" %>

  <div class="wrapper main-pg">
      <!-- Content -->
  <div id="content-wrap" class="content-main">
    <div class="swiper-container main-swp-box" style="font-family:'Noto Sans KR',sans-serif">
      <div class="swiper-wrapper">
        <div class="swiper-slide item01">
          <div class="main-swp-item">
            <div class="main-swp-bg"><img src="./img/img_visual01.png" alt="덕봉식당" /></div>
            <div class="main-swp-box">
              <p class="main-swp-ttl" data-an="fade-up" data-an-order="1" style="font-family:'Noto Sans KR',sans-serif">덕봉식당</p>
              <p class="main-swp-sub" data-an="fade-up" data-an-order="2" style="font-family:'Noto Sans KR',sans-serif">고된 수업으로 지친 학생들, 따스한 가정집을 느껴봐~</p>
              <a href="detail.jsp?res_num=2" class="main-swp-more" data-an="fade-up" data-an-order="4" style="font-family:'Noto Sans KR',sans-serif">more</a>
            </div>
          </div>
        </div>
        <div class="swiper-slide item02">
          <div class="main-swp-item">
            <div class="main-swp-bg" style="font-family:'Noto Sans KR',sans-serif"><img src="./img/img_visual02.png" alt="더 오믈렛" /></div>
            <div class="main-swp-box_right">
              <p class="main-swp-ttl" data-an="fade-up" data-an-order="1" style="font-family:'Noto Sans KR',sans-serif">더 오믈렛</p>
              <p class="main-swp-sub" data-an="fade-up" data-an-order="2" style="font-family:'Noto Sans KR',sans-serif">폭신한 오믈렛으로 든든한 한끼 식사 어때?</p>
              <a href="detail.jsp?res_num=6" class="main-swp-more" data-an="fade-up" data-an-order="4" style="font-family:'Noto Sans KR',sans-serif">more</a>
            </div>
          </div>
        </div>
        <div class="swiper-slide item03">
          <div class="main-swp-item">
            <div class="main-swp-bg"><img src="./img/img_visual03.png" alt="참짜장" /></div>
            <div class="main-swp-box">
              <p class="main-swp-ttl" data-an="fade-up" data-an-order="1" style="font-family:'Noto Sans KR',sans-serif">참짜장</p>
              <p class="main-swp-sub" data-an="fade-up" data-an-order="2" style="font-family:'Noto Sans KR',sans-serif">가성비 GOOD ! 맛 좋고 값싼 리얼 맛집</p>
              <a href="detail.jsp?res_num=20" class="main-swp-more" data-an="fade-up" data-an-order="4" style="font-family:'Noto Sans KR',sans-serif">more</a>
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
        <p class="left-num"><span>01</span></p>
        <p class="tit">미림 계정으로<br><em>간단하게 로그인</em></p>
							<p class="txt">※미림 구글 계정이 아니면 접근 할 수 없어요 !</p>
							
		<a href='#content-wrap' class="link-go">바로가기 > </a>
      </div>
      </div>
    </div>

        <div class="right-section section02">
    <div class="inner">
      <div class="txt-wrap">
        <p class="right-num"><span>02</span></p>
        <p class="tit">다양한 카테고리의<br><em>고시촌 식당 추천</em></p>
							<p class="txt">취향에 맞는 고시촌 맛집을 더욱 쉽게 만나보세요 !</p>
		<a href='recommend.jsp' class="link-go">바로가기 > </a>
      </div>
      </div>
    </div>
 
        <div class="left-section section03">
    <div class="inner">
      <div class="txt-wrap">
        <p class="left-num"><span>03</span></p>
        <p class="tit">고시촌 맛집의<br><em>세부 정보를 한 눈에</em></p>
							<p class="txt">평균 평점, 대표 메뉴, 위치 정보, 다양한 팁 등 맛집의 모든 정보를  한 눈에 확인하세요!</p>	
		<a href='list.jsp?sort=0' class="link-go">바로가기 > </a>
      </div>
      </div>
    </div>
 
      <div class="right-section section04">
    <div class="inner">
      <div class="txt-wrap">
        <p class="right-num"><span>04</span></p>
        <p class="tit">별점과 함께하는<br><em>리뷰 시스템</em></p>
							<p class="txt">미림인들만의 솔직담백 리뷰를 만나보세요 !</p>
		<a href='list.jsp?sort=0' class="link-go">바로가기 > </a>
      </div>
      </div>
    </div>
 
      <div class="left-section section05">
    <div class="inner">
      <div class="txt-wrap">
        <p class="left-num"><span>05</span></p>
        <p class="tit">승부욕을 자극하는<br><em>랭킹 시스템</em></p>
							<p class="txt">리뷰를 가장 많이 받은 식당과, 가장 리뷰를 많이 쓴 사람을 확인해보세요 !</p>
							
		<a href='ranking2.jsp' class="link-go">바로가기 > </a>
      </div>
      </div>
    </div>


	<div class="right-section section06">
    <div class="inner">
      <div class="txt-wrap">
        <p class="right-num"><span>06</span></p>
        <p class="tit">찾고 싶은 식당 정보를<br><em>검색으로 한 번에</em></p>
							<p class="txt">식당 정보를 찾고 싶을 땐 검색 시스템을 이용해 한번에 찾아보아요 !</p>
		<a href='search.jsp' class="link-go">바로가기 > </a>
      </div>
      </div>
    </div>
  </div>
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
    delay: 3000
  },
  speed: 1200,
  loop: true,
});
</script>
</body>
</html>
