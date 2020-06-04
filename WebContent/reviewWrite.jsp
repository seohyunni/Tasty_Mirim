<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
	<meta name="author" content="MBS(미림 방송국)">
    <meta name="description" content="생생 정보통">
    <meta name="keywords" content="고시촌 맛집, 미림 맛집, 도장깨기, 리뷰 및 평점">

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8">
    <title>생생미림통</title>

    <link rel="icon" href="생생미림통_LOGO.ico">

    <!-- css_style -->
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/review_write.css">

</head>
<body>
<%@ include file="./header.jsp" %>
<%
Date now = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String today = sf.format(now);
%>

    <div id="wrap">
        <section id="content">
            <div class="content">
                <form name="reviewform" method="POST" action="writeAction.jsp">
                    <div class="name">작성자 <input type="text" name="name"></div>
                    <div class="content1">내용</div>
                    <div class="content2">
                        <textarea cols="30" rows="12" name="content"></textarea>
                    </div>
                    <div class="score1">별점</div>
                    <span class="star-input">
                        <span class="input">
                            <input type="radio" name="star-input" value="1" id="p1">
                            <label for="p1">1</label>
                            <input type="radio" name="star-input" value="2" id="p2">
                            <label for="p2">2</label>
                            <input type="radio" name="star-input" value="3" id="p3">
                            <label for="p3">3</label>
                            <input type="radio" name="star-input" value="4" id="p4">
                            <label for="p4">4</label>
                            <input type="radio" name="star-input" value="5" id="p5">
                            <label for="p5">5</label>
                        </span>
                        <output for="star-input"><b>0</b>점</output>						
                    </span>
                    <div class="addPhoto1">업로드 사진 첨부</div>
                    <div class="addPhoto2">
                        <!-- <input type="file" name="addPhoto" class="addPhotoButton" value="no imge"> -->
                        <input type="file" name="profile_pt" id="profile_pt" onchange="previewImage(this,'View_area')">
                        <div id='View_area' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline;'></div>
                    </div>
                    <div class="write">
                        <input type="submit" name="write" class="write" value="작성하기">
                    </div>
                    <div class="delete">
                        <input type="reset" name="delete" class="delete" value="다시쓰기">
                    </div>
                    <input type=hidden name=com_date value="<%= today %>">
                </form>
            </div>
        </section>
    </div>
    
    
    <!-- script -->
    <script src="js/review_write.js"></script>
    <script src="js/jquery-1.11.3.min.js"></script>
</body>
</html>