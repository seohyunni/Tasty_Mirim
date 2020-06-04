<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "tastymirim.ReviewBoard" %>
<%@ page import = "tastymirim.ReviewDBBoard" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
	<meta name="author" content="MBS(미림 방송국)">
    <meta name="description" content="생생 정보통">
    <meta name="keywords" content="고시촌 맛집, 미림 맛집, 도장깨기, 리뷰 및 평점">
    <title>생생미림통</title>

    <link rel="icon" href="생생미림통_LOGO.ico">

    <!-- css_style -->
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/review_score.css">
</head>


<body>
    <div id="wrap">
        <header id="header">
            <div class="header">
                <div class="header_menu">
                    <a href="#">마이페이지</a>
                    <a href="#">로그인</a>
                </div>
                <div class="header_tit">HOT CUP REVIEW</div><br>
            </div>
        </header>
        <section id="content">
            <div class="content">
                <div class="reviewPhoto">
                    photo
                </div>
                <div class="reviewScore">
                	<!-- 별점 js reviewWrite.html에서 소스 가져오기 -->
                    <input type="button" name="scoreButton1" class="scoreButton1"> <input type="button" name="scoreButton2" class="scoreButton2"> <input type="button" name="scoreButton3" class="scoreButton3"> <input type="button" name="scoreButton4" class="scoreButton4"> <input type="button" name="scoreButton5" class="scoreButton5">
                </div>
                <div class="name">
                	작성자 : name
                </div>
                <div class="contentcontent">
                	content
                </div>
                <div class="date">
                    com_date
                </div>
            </div>
            <input type = "button" value = "작성하기" class="write" onClick = "javascript:location.href = 'reviewWrite.jsp'">
        </section>
    </div>
    <script src="js/jquery.min_1.12.4.js"></script>
</body>
</html>