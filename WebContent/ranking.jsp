<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta name="author" content="MBS(미림 방송국)">
    <meta name="description" content="생생 정보통">
    <meta name="keywords" content="고시촌 맛집, 미림 맛집, 도장깨기, 리뷰 및 평점">
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="674385516199-09jd3ks7bi0fjttunjbmvovbdi0k8q1d.apps.googleusercontent.com">
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=yes" />
  <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>생생 미림통 : 랭킹</title>
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@5.3.1/css/swiper.min.css" integrity="sha256-+ZTVzMkZ+H+hPXlJprtzWC8Bti4NyDr4XNA9DoupU/U=" crossorigin="anonymous" />
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://code.jquery.com/jquery-migrate-3.1.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@5.3.1/js/swiper.min.js" integrity="sha256-8JTNLE6I+DHURcLWWoKCmv16gDzw0Fp4I34O2y40vC0=" crossorigin="anonymous"></script>
  <script src="https://apis.google.com/js/platform.js" async defer></script>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@5.3.1/css/swiper.min.css" integrity="sha256-+ZTVzMkZ+H+hPXlJprtzWC8Bti4NyDr4XNA9DoupU/U=" crossorigin="anonymous" />
  <link rel="icon" href="./img/생생미림통_LOGO.ico">
    <link rel="stylesheet" type="text/css" href="./css/header.css">
    <link rel="stylesheet" type="text/css" href="./css/ranking.css">
    
</head>
<body bgcolor=">

    <%@ include file="./header.jsp" %>

  
    <!-- content -->
    <div class="wrap">
        <h1 class="ranking_title">리뷰왕 TOP 10</h1>
        <div class="board_list_wrap table_list rank_zzang">
            <!-- 크아짱랭킹은 rank_zzang 클래스 추가 -->
            <!-- 목록 -->
            <table>
                    <tr class=ranker_tr>
                        <td class="ranker">1</td>
                        <td class="name_ranker">
                            <img class=crown src="./img/crown_gold.png" alt="왕관" width=50>
                            <img class=profile src="./img/임시_프로필사진.png" alt="프로필 사진" width=50 height=50>
                            임태희
                        </td>
                        <td class=rivew_ranker>리뷰 55개</td>
                    </tr>
                    <tr class=ranker_tr>
                        <td class="ranker">2</td>
                        <td class="name_ranker">
                            <img class=crown src="./img/crown_silver.png" alt="왕관" width=50>
                            <img class=profile src="./img/임시_프로필사진.png" alt="프로필 사진" width=50 height=50>
                            서혜림
                        </td>
                        <td class=rivew_ranker>리뷰 45개</td>
                    </tr>
                    <tr class=ranker_tr>
                        <td class="ranker">3</td>
                        <td class="name_ranker">
                            <img class=crown src="./img/crown_copper.png" alt="왕관" width=50>
                            <img class=profile src="./img/임시_프로필사진.png" alt="프로필 사진" width=50 height=50>
                            이서현
                        </td>
                        <td class=rivew_ranker>리뷰 32개</td>
                    </tr>
                    <tr >
                        <td class="rank">4</td>
                        <td class="name">
                            <img class=profile src="./img/임시_프로필사진.png" alt="프로필 사진" width=40 height=40>
                            임태희
                        </td>
                        <td class=rivew>리뷰 20개</td>
                    </tr>
                    <tr >
                        <td class="rank">5</td>
                        <td class="name">
                            <img class=profile src="./img/임시_프로필사진.png" alt="프로필 사진" width=40 height=40>
                            임태희
                        </td>
                        <td class=rivew>리뷰 18개</td>
                    </tr>
                    <tr >
                        <td class="rank">6</td>
                        <td class="name">
                            <img class=profile src="./img/임시_프로필사진.png" alt="프로필 사진" width=40 height=40>
                            임태희
                        </td>
                        <td class=rivew>리뷰 16개</td>
                    </tr>
                    <tr >
                        <td class="rank">7</td>
                        <td class="name">
                            <img class=profile src="./img/임시_프로필사진.png" alt="프로필 사진" width=40 height=40>
                            임태희
                        </td>
                        <td class=rivew>리뷰 12개</td>
                    </tr>
                    <tr >
                        <td class="rank">8</td>
                        <td class="name">
                            <img class=profile src="./img/임시_프로필사진.png" alt="프로필 사진" width=40 height=40>
                            임태희
                        </td>
                        <td class=rivew>리뷰 10개</td>
                    </tr>
                    <tr >
                        <td class="rank">9</td>
                        <td class="name">
                            <img class=profile src="./img/임시_프로필사진.png" alt="프로필 사진" width=40 height=40>
                            임태희
                        </td>
                        <td class=rivew>리뷰 6개</td>
                    </tr>
                    <tr style="border-width:0px;">
                        <td class="rank">10</td>
                        <td class="name">
                            <img class=profile src="./img/임시_프로필사진.png" alt="프로필 사진" width=40 height=40>
                            임태희
                        </td>
                        <td class=rivew>리뷰 4개</td>
                    </tr>
            </table>
            <!-- //목록 -->
            <!-- 페이징 -->
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

  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://code.jquery.com/jquery-migrate-3.1.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@5.3.1/js/swiper.min.js" integrity="sha256-8JTNLE6I+DHURcLWWoKCmv16gDzw0Fp4I34O2y40vC0=" crossorigin="anonymous"></script>
  <script type="text/javascript" src="./js/ui.js"></script>
</body>
</html>