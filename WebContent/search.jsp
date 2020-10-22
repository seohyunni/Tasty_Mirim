<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>생생미림통 | 검색</title>
  
    <link rel="icon" href="./img/생생미림통_LOGO.ico">
   <link rel="stylesheet" type="text/css" href="./css/search.css" />
</head>

<body>
<% request.setCharacterEncoding("UTF-8"); %>
  <%@ include file="./header.jsp" %>
  
  <%
  int review_num = 0;
  	int res_num = 0;
  	String word = request.getParameter("word");
  	String res_name ="";
  	String res_content ="";
  	double avg_grade = 0;
  	String map = "";
  	
  	int history = 0;
  
  	Connection conn = null;
  	Statement stmt = null;
  	
  	try{
  		Class.forName("com.mysql.jdbc.Driver");
  		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tastymirim?useUnicode=true&characterEncoding=UTF-8","tastymirim","h4HX6ASpP2SeOrmw");
  		
  		if(conn == null)
  			throw new Exception("db 연결 실패");
  			stmt = conn.createStatement();
  		
  		ResultSet rs = stmt.executeQuery("select * from res where menu like '%"+word+"%' order by avg_grade desc");
  		
  		
  		%>
  		
  <div class="wrapper main-pg">
	      <!-- Content -->
	  <div class="wrap">
		  <div class="content">
		 		 <div id=search_wrap>
		 		 <h3 class="search_title">[ <font color="#FF8956"><%= word %></font> ] 검색 결과</h3>
	              		<div class="search">
			              		<div class="srch_form autocomplete" style="margin-top: 0;">
				                    <form action="./search.jsp" method="post">
						                <table>
								              <tr>
								              <td>
									              <input id="autoInput" name="word" class="searchTerm"  placeholder="맛집 검색" autocomplete="off" >
									              <input type="submit" class="searchButton" value="검색" name = "btnSearch" id="btnSearch" onkeyup="enterkey();" onclick="compare()" >
								            </td>
								            </tr>
							            </table>
					        	    </form>
					        		 </div>
					        	 </div>
			      	  </div>
	        <div class="board_list_wrap table_list rank_zzang">
	        <% if(!rs.next()){
	  		%>
		  			<table style="height: 300px;">
		        		<tr>
		        		<td>검색 결과 없음</td>
		        		</tr>
		            </table>
	         <% }else{
	        	 rs.previous();
	        	 }%>
	        	 
	        	 <div class="search_result">
	         		<table>
	         		<% while(rs.next()){
	                	   res_num = rs.getInt("resnum");
	                	   res_name = rs.getString("resname");
	              	 	  res_content = rs.getString("rescontent");
	              		   String res_image = rs.getString("image");
	              	 	  avg_grade = rs.getDouble("avg_grade");
	              	 	  String location = rs.getString("location");
	              	 	  map = rs.getString("map");
	                	    %>
	                   <tbody onClick="location.href='detail.jsp?res_num=<%= res_num %>'" class="search_contents">
	                   
	                   
	                   
		                    <tr class="ranker_tr" >
		                        <td class="image" rowspan=3 ><div class="image_wrap"><img class="profile" src="<%=res_image %>" alt="사진 준비중" ></div></td>
		                   		<td class="res_name"><%= res_name %></td>
		                    	<td class="res_score"  rowspan=2>
										<%for(int i=1;i<=(int)Math.floor(avg_grade);i++){ %>
										<img width="40" src="./img/score2.png">
										<%}
										for(int i=1;i<=5-(int)Math.floor(avg_grade);i++){
											%>
										<img width="40" src="./img/score2.png">
										<%} %>
		                    	</td>
		                    </tr>
		                    
		                    <tr>
		                    <td class="res_location"><%=location %></td>
		                    </tr>
		                    
		                    <tr>
		                    <td class="res_des" colspan=2><%= res_content %></td>
		                    </tr>
				  
	                    <% }
	                   }finally{
	                   }
	                    %>
	            </tbody>
	            </table>
	            <!-- //목록 -->
	            <!-- 페이징 -->
    </div>
    
    <!-- 하단 copyright 부분 -->

  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://code.jquery.com/jquery-migrate-3.1.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@5.3.1/js/swiper.min.js" integrity="sha256-8JTNLE6I+DHURcLWWoKCmv16gDzw0Fp4I34O2y40vC0=" crossorigin="anonymous"></script>
  <script type="text/javascript" src="./js/ui.js"></script>

</div>   	 
	</div>
	</div>
	</div>
    <%@ include file="./footer.jsp" %>
</body>


</html>
