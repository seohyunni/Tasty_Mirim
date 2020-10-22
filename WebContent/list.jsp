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
   <link rel="stylesheet" type="text/css" href="./css/list.css" />
</head>
<script>
function read(num,name, grade, content,map){
    var f= document.getElementById("search_Form");
	f.res_num.value=num;
	f.res_name.value=name;
	f.avg_grade.value=grade;
	f.res_content.value=content;
	f.map.value=map;
	f.action="detail.jsp?res_num="+num;
	f.submit();
}
	function submit1(){
	      var f= document.getElementById("search_Form");
		  f.submit();
	}
	
</script>

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
  	
  	int sort =Integer.parseInt(request.getParameter("sort"));
  	Connection conn = null;
  	Statement stmt = null;
  	
  	try{
  		Class.forName("com.mysql.jdbc.Driver");
  		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tastymirim","tastymirim","h4HX6ASpP2SeOrmw");
  		
  		if(conn == null)
  			throw new Exception("db 연결 실패");
  			stmt = conn.createStatement();
  		 int count = 0;
  		 
			 ResultSet rs = null;  
			 if(sort == 0){
        		 rs = stmt.executeQuery("select * from res order by resname");
        	 }
        	 else if(sort == 1){
        		 rs = stmt.executeQuery("select * from res order by avg_grade desc");
        	 }
        	 else{
        		 rs = stmt.executeQuery("select * from res order by walk_time");
        	 }
  		%>
  		
      <!-- Content -->
  <div class="wrap">
	  <div class="content">
	  			<div class="category_wrap">
				  		<table class="category">
				  			<tr>
				  			<%if(sort == 0){ %>
					  				<td onclick='location.reload(true)'><img src="./img/name_sort.png"><br>이름순</td>
					  				<td onclick="location.href='./list.jsp?sort=1'"><img src="./img/score2.png"><br>별점순</td>
					  				<td onclick="location.href='./list.jsp?sort=2'"><img src="./img/location_sort.png"><br>거리순 </td>
				  			<%}else if(sort == 1){ %>
				  				<td onclick="location.href='./list.jsp?sort=0'"><img src="./img/name_sort.png"><br>이름순</td>
				  				<td onclick='location.reload(true)'><img src="./img/score2.png"><br>별점순</td>
				  				<td onclick="location.href='./list.jsp?sort=2'"><img src="./img/location_sort.png"><br>거리순 </td>
				  			<%}else if(sort == 2){ %>
				  				<td onclick="location.href='./list.jsp?sort=0'"><img src="./img/name_sort.png"><br>이름순</td>
				  				<td onclick="location.href='./list.jsp?sort=1'"><img src="./img/score2.png"><br>별점순</td>
				  				<td onclick='location.reload(true)'><img src="./img/location_sort.png"><br>거리순 </td>
				  			<%} %>
				  			</tr>
				  		</table>
	  			</div>
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
         		<table onClick="read('<%=res_num %>','<%=res_name %>','<%=avg_grade %>','<%=res_content %>','<%=map %>');" class="all_list">
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
	                    
			    
			   		 <form method="post" id="search_Form" name="search_Form" >
			    		<input type="hidden" name="res_num"  > 
						<input type="hidden" name="res_name"> 
						<input type="hidden" name="location">
						<input type="hidden" name="avg_grade">
						<input type="hidden" name="res_content">
						<input type="hidden" name="map">
						<input type="hidden" name="history" value=<%= history %>>
					</form>
					
          	  </tbody>
            </table>
                    <% }
                   }finally{
                   }
                    %>
    
    
    
    
<%@ include file="./footer.jsp" %>


  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://code.jquery.com/jquery-migrate-3.1.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@5.3.1/js/swiper.min.js"></script>
  <script type="text/javascript" src="./js/ui.js"></script>

           	 
	</div>
	</div>
	</div>
	
	
</body>


</html>
