<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
  <title>생생미림통 | 맛집 리스트</title>
  
    <link rel="icon" href="./img/생생미림통_LOGO.ico">
  <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="./css/list.css" />
</head>

<body style="background:#ff976a;">
<% request.setCharacterEncoding("UTF-8"); %>
  <%@ include file="./header.jsp" %>
  
  <%
  int review_num = 0;
  	int res_num = 0;
  	String res_name ="";
  	String res_content ="";
  	double avg_grade = 0;
  	String map = "";
  	
  	int history = 0;
  	
  	int list_division =Integer.parseInt(request.getParameter("list_division"));
  	String msg= "";
  	String msg2="";
  	switch(list_division){
  		case 01: msg="가성비 맛집 식당"; msg2="학생들을 위한 가성비갑 식당 리스트"; break;
  		case 02: msg="5분 거리 식당"; msg2="힘들고 지쳐도 밥은 챙겨먹어야지"; break;
  		case 03: msg="간단하게 먹기 좋은 식당"; msg2="혼밥러들은 필독!"; break;
  		case 04: msg="일식 식당"; msg2="일식 음식이 땡길 땐"; break;
  		case 05: msg="맛있는 디저트 집 모음"; msg2="저녁먹고 후식으로 즐기기 딱 좋은 가게들"; break;
  		case 06: msg="회식 장소 추천"; msg2="밥도 먹고 팀원들과 돈독한 팀웍도 쌓아보자"; break;
  		
  	}
  	Connection conn = null;
  	Statement stmt = null;
  	
  	try{
  		Class.forName("com.mysql.jdbc.Driver");
  		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tastymirim?useUnicode=true&characterEncoding=UTF-8","tastymirim","h4HX6ASpP2SeOrmw");
  		
  		if(conn == null)
  			throw new Exception("db 연결 실패");
  			stmt = conn.createStatement();
  		 int count = 0;
  		 
  		ResultSet rs = stmt.executeQuery("select * from res where list_division like '%"+list_division+"%' order by avg_grade desc");
  		if(list_division == 02){
  			rs = stmt.executeQuery("select * from res where walk_time <=5 order by avg_grade desc");
  		}
  		
  		%>
  		
      <!-- Content -->
  <div class="wrap">
	  <div class="content">
	  		<table class="banner">
	  			<tr>
	  				<td class="msg"><%=msg %><br><div class="msg2"><%=msg2 %></div></td>
	  			</tr>
	  		</table>
	 		 <div id=search_wrap>
	 		 
        <% if(!rs.next()){
  		%>
  			<table>
        		<tr>
        		<td>검색 결과 없음</td>
        	</tr>
            </table>
         <% }else{
        	 rs.previous();
	        	
        	 }%>
        	 
         		<% while(rs.next()){
                	   res_num = rs.getInt("resnum");
                	   res_name = rs.getString("resname");
              	 	  res_content = rs.getString("rescontent");
              		   String res_image = rs.getString("image");
              	 	  avg_grade = rs.getDouble("avg_grade");
              	 	  String location = rs.getString("location");
              	 	  map = rs.getString("map");
              	 	 
                	    %>
         		<table onClick="location.href='detail.jsp?res_num=<%=res_num %>'" class="all_list">
                   <tbody >
                   
	                    <tr class="ranker_tr" >
	                        <td class="image" rowspan=3 ><div class="image_wrap"><img src="<%=res_image %>" alt="사진 준비중"> </div></td>
	                   		<td class="res_name"><%= ++count %>.&nbsp;<%= res_name %></td>
	                    	<td class="res_score">
									<%for(int i=1;i<=(int)Math.floor(avg_grade);i++){ %>
									<img width="35" src="./img/score2.png">
									<%}
									for(int i=1;i<=5-(int)Math.floor(avg_grade);i++){
										%>
									<img width="35" src="./img/score1.png">
									<%} %>
									&nbsp;<%= avg_grade %>
	                    	</td>
	                    </tr>
	                    
	                    <tr>
	                    <td class="res_location" colspan=2><%=location %></td>
	                    </tr>
	                    
	                    <tr>
	                    <td class="res_des" colspan=2><%= res_content %></td>
	                    </tr>
	                    
            </tbody>
            </table>
                    <% }
                   }finally{
                   }
                    %>
    
    
	</div>
	</div>
	</div>
    
    
    
    <!-- 하단 copyright 부분 -->


  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://code.jquery.com/jquery-migrate-3.1.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@5.3.1/js/swiper.min.js" integrity="sha256-8JTNLE6I+DHURcLWWoKCmv16gDzw0Fp4I34O2y40vC0=" crossorigin="anonymous"></script>
  <script type="text/javascript" src="./js/ui.js"></script>

           	 
	
</body>


</html>
