<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "tastymirim.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.PrintWriter" %>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html lang="en">
   <% request.setCharacterEncoding("UTF-8");%>
<head>
  <meta charset="utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="생생 정보통">
    <meta name="keywords" content="고시촌 맛집, 미림 맛집, 도장깨기, 리뷰 및 평점">
    <title>생생 미림통</title>
    <link rel="icon" href="./img/생생미림통_LOGO.ico">

    <link rel="stylesheet" type="text/css" href="./css/recommend.css">
    <link rel="stylesheet" type="text/css" href="./css/slick.css"/>
    
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
</head>
<body style="background: #ececec;">

    <%@ include file="./header.jsp" %>
    <%
   
   	  resBean res = new resBean();
	  resDB resdb = new resDB();	
	  
	  Connection conn = null;
	  
	  int res_num = 0;
	  String res_name ="";
	  String res_image = "";
	  double avg_grade = 0;
   		%>
    
    
    <div class="container">
		<!-- main_background -->
		<main class="background">
            <!-- contents -->
            <div class="contents">
                <div class="big_title" style="margin-top:50px;">믿고 보는 맛집 리스트</div><br>
                <div class="content123">
                    <div class="content1">
                        <div class="recommend">
                            <img src="https://www.agoda.com/wp-content/uploads/2019/03/Best-restaurants-in-Seoul-Fine-dining-Jungsik-Seoul-Mingles-restaurant.jpg">
                            <a href="./recommend_list.jsp?list_division=01">
                                <div class="recommend_over">
                                    <div class="recommend_tit">가성비 맛집 식당</div>돈 없는 학생들 모여 !!
                                </div> 
                            </a>
                        </div>
                        <div class="recommend">
                            <img src="https://catalyst.or.kr/wp-content/uploads/2017/01/KakaoTalk_20170102_150825279-e1486526096208.jpg">
                            <a href="./recommend_list.jsp?list_division=02">
                                <div class="recommend_over">
                                    <div class="recommend_tit">5분 거리 식당</div>걷기 힘들고 지칠 땐 !
                                </div> 
                            </a>
                        </div>
                        <div class="recommend enter">
                            <img src="https://img0.yna.co.kr/mpic/YH/2019/09/15/MYH20190915001600038_P4.jpg">
                            <a href="./recommend_list.jsp?list_division=03">
                                <div class="recommend_over">
                                    <div class="recommend_tit">간단하게 먹기 좋은 식당</div>이곳이라면 혼밥도 맛있게 즐길 수 있지
                                </div> 
                            </a>
                        </div>
                    </div>
                    <div class="content2">
                        <div class="recommend">
                            <img src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=https%3A%2F%2Fcfile21.uf.tistory.com%2Fimage%2F2345023D55C84DDD1F3C76">
                            <a href="./recommend_list.jsp?list_division=04">
                                <div class="recommend_over">
                                    <div class="recommend_tit">일식 식당</div>오늘은 일본식 음식이 땡기는군
                                </div> 
                            </a>
                        </div>
                        <div class="recommend">
                            <img src="https://blog.hmgjournal.com/images/contents/article/201602171355-Reissue-dessert-anguk-01.jpg">
                            <a href="./recommend_list.jsp?list_division=05">
                                <div class="recommend_over">
                                    <div class="recommend_tit">맛있는 디저트 집 모음</div>저녁먹고 후식으로 즐기기 딱 좋은 가게들
                                </div> 
                            </a>
                        </div>
                        <div class="recommend enter">
                            <img src="https://file3.instiz.net/data/file3/2018/03/17/4/e/8/4e885741a0a17fd54f185edde3f7d87f.jpg">
                            <a href="./recommend_list.jsp?list_division=06">
                                <div class="recommend_over">
                                    <div class="recommend_tit">회식 장소 추천</div>오늘 위장에 기름칠 어때?
                                </div> 
                            </a>
                        </div>
                    </div>
                </div>
                
	                <div class="big_title">고시촌 죽돌이 이서현이 적극 추천하는 식당</div><br>
			                <div class="content_set">
			                <%
								  	Statement stmt = null;
			
						              	try{
						              		Class.forName("com.mysql.jdbc.Driver");
						              		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tastymirim?useUnicode=true&characterEncoding=UTF-8","tastymirim","h4HX6ASpP2SeOrmw");
			              		
								  		if(conn == null)
								  			throw new Exception("db 연결 실패");
								  			stmt = conn.createStatement();
								  		 int count = 0;
								  		 
								  		ResultSet rs = stmt.executeQuery("select * from res where list_division like '%이서현%' order by avg_grade desc");
								  		
								  		while(rs.next()){
								  			res_num = rs.getInt("resnum");
						                	   res_name = rs.getString("resname");
						              		   res_image = rs.getString("image");
						              	 	  avg_grade = rs.getDouble("avg_grade");
								  		%>
			                    <div class="restaurant">
			                        <a href="detail.jsp?res_num=<%=res_num%>">
			                            <div class="restaurant_img">
			                                <img src="<%=res_image%>">
			                            </div>
			                        </a>
			                        <div class="restaurant_name"><%=res_name %></div>
			                        <div class="restaurant_score"><%=avg_grade %></div>
			                   </div>
			                    <%} %>
                </div>
                
                
                <div class="big_title">스트레스를 날려버리는 매운음식 판매점</div><br>
                <div class="content_set">
                <% rs = stmt.executeQuery("select * from res where list_division like '%매움%' order by avg_grade desc");
		  		
			  		while(rs.next()){
			  			res_num = rs.getInt("resnum");
	                	   res_name = rs.getString("resname");
	              		   res_image = rs.getString("image");
	              	 	  avg_grade = rs.getDouble("avg_grade"); %>
                    <div class="restaurant">
			                        <a href="detail.jsp?res_num=<%=res_num%>">
			                            <div class="restaurant_img">
			                                <img src="<%=res_image%>">
			                            </div>
			                        </a>
			                        <div class="restaurant_name"><%=res_name %></div>
			                        <div class="restaurant_score"><%=avg_grade %></div>
			                   </div>
                 <%} %>
                 </div>
            </div>
            <!-- //contents -->
        </main>
        <% }finally{
        
        }
        	%>
        
        <!-- //main_background -->
    </div>
    
    
<%@ include file="./footer.jsp" %>

    <!-- script -->
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="./js/slick.min.js"></script>
    <script>
        //이미지 갤러리
		$('.content123').slick({
            dots: true,
			autoplay: true,
			autoplaySpeed: 5000,
			slidesToShow: 1,
			slidesToScroll: 1
		});
    </script>
    <!-- //script -->
</body>
</html>