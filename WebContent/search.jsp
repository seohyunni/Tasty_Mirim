<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
  <title>생생미림통 | 검색</title>
   <link rel="stylesheet" type="text/css" href="./css/search.css" />
</head>
<body>

  <%@ include file="./header.jsp" %>
  
  <%
  	String word = request.getParameter("word");
  	String res_name ="";
  	String res_content ="";
  	int avg_grade = 0;
  	String map = "";
  
  	Connection conn = null;
  	Statement stmt = null;
  	
  	try{
  		Class.forName("com.mysql.jdbc.Driver");
  		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tastymirim","root","mirim2");
  		
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
	                    <form action="./search.jsp" method="post">
			                <table>
					              <tr>
					              <td>
						              <input id="autoInput" name="word" class="searchTerm"  placeholder="맛집 검색" >
						              <input type="submit" class="searchButton" value="검색" name = "btnSearch" id="btnSearch" onkeyup="enterkey();" onclick="compare()" >
					            </td>
					            </tr>
				            </table>
		        	    </form>
		        	 </div>
		        </div>
        <div class="board_list_wrap table_list rank_zzang">
        <% if(!rs.next()){
  		%>
  			<table>
        		<tr>
        		<td>검색 결과 없음</td>
        	</tr>
            <table>
         <% }else{
        	 rs.previous();
        	 }%>
         		<table>
                   <tbody>
                   <div class="search_result">
                   <% while(rs.next()){
                	   res_name = rs.getString("resname");
              	 	  res_content = rs.getString("rescontent");
              		   String res_image = rs.getString("image");
              	 	  avg_grade = rs.getInt("avg_grade");
              	 	  String location = rs.getString("location");
              	 	  map = rs.getString("map");
                	    %>
                   
	                    <tr class="ranker_tr" onClick="submit1()">
	                        <td class="image" rowspan=3 ><img class="profile" src="<%=res_image %>" alt="프로필 사진" width="380px" height="250px"></td>
	                   		<td class="res_name"><%= res_name %></td>
	                    	<td class="res_score"  rowspan=2>
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
	                    <td class="res_location"><%=location %></td>
	                    </tr>
	                    
	                    <tr>
	                    <td class="res_des" colspan=2><%= res_content %></td>
	                    </tr>
                    </div>
	                    
			    
			    <form method="post" id="search_Form" name="search_Form" action="./amasuvin_info.jsp"> 
						<input type="hidden"  name="res_name" value="<%= res_name %>"> 
						<input type="hidden" name="avg_grade" value="<%=avg_grade%>">
						<input type="hidden" name="res_content" value="<%=res_content%>">
						<input type="hidden" name="map" value="<%=map%>">
					</form>
                    <% }
                   }finally{
                   }
                    %>
            </tbody></table>
            <!-- //목록 -->
            <!-- 페이징 -->
    </div>
    
    <!-- 하단 copyright 부분 -->
<footer id="footerWrap">
  <div id="footer">
      <!-- div class 들어갈 자리 -->

      <!--div class 들어갈 자리 -->
      <div class="sns">
      <img class="footer_icon" width="30" height="30" src="https://c7.uihere.com/files/353/468/986/menlo-park-facebook-social-media-computer-icons-social-networking-service-facebook-new-logo-png-thumb.jpg">
      <img class="footer_icon" width="30" height="30" src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/1024px-Instagram_logo_2016.svg.png">
      <img class="footer_icon" width="30" height="30" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAY1BMVEVQq/H///9ApvBHqPFEp/A8pPDs9f1bsPLg7/zx+P57vfT7/f/R5/vC3/n2+/622fjb7Pxtt/OXyvZVrvFks/K+3fnU6Pvn8v2o0vfJ4/qMxfWk0PeDwfSw1viVyfZxufMroO+odDONAAAGvElEQVR4nO2d65ayOgyGIWkREQUBD4jivv+r3OJhxhMKNGn5ZuX5NzNrCi+0zaFp8TxBEARBEARBEARBEARBEARBEARBEARBEARBEARBEIS/CaI6g4iub4UBBMij6pCs5qtkW0c5qD+lEmFSxQv/nmlZe/BXREK+3fjvSDMPvv2rnVs0AoryrbwLq/yDxtO/zpW9Ox2GmsQf9J01eu/7Kp4fTT32jgyHL/oaMv36jwj7tPkb6d3QT+GqeD/+ngnzx0sjYBWc/1J+Gaf9bmcREUvUVSd9Dfu714gQ/fTsgvB21Nb3J6QS9byzQN/fXl8W6sk2+Plt/Kb/DufU4JSyPfg2xTyygovZfOjXlLZCnaeEDV23h3Uvgb4/18tns5lRmgqcndsMqSRC2lOg78+ef7Gm7KNY31qlkQh9xmALpGPm7pGnFBJVZi7QL2in9t+GU/POjwWBQFrbhbu7pkPjpiFove/O7GkdUvUwbILcTKPq4qp9IfoRiHpJYDSeHvrCzPRPzAUerwJP/lsdhhSv8+URGsw3PU39GxaXSQYhzxqrSuG6LV8ukg2X+NpYT8JTEICgiiq83ArBK8T962XmQyXCp4C3C8l/Ot8f1tPbjVDYfXxnvjYDB2NuKHCepNO7H0nss4fbd5ea7Yc0/r6twQQ0VrHtruYDMn7QLejtCJXn1vrcg2Xv10jhzvwwM7TMvwrbg/GkZ07zQ1P9mVIJfHTangj6mUZzY3gnsCULN0Th8dOF4kkPjXrxqalebKjkNXzxsw7d03AEHtuVlDS2gC9PfpF1HI4YUQksSZNQHZIqwb6Txre+wxAOlIlSr5uZDvf6u0YkCJwaamKBHa1YsPvqAagVhb7ZkX49RneLyqcVfn64KiEQ+JzkJ6G7NzlffhqQJAprlhW1HhHBJsNWkRQJDL9iWVHrF9XFuxaRJJEFj8K+kfks3nnw6giQWAsmhQNC8/BwhKdX+S5bMBaFw/ytWZwVeF84QhE8cSkcPEks0qQuFJx04s8KzygVesooUx3ESbYvcgjNFWZcCtE4DXhiRvAOd2z1F50KJyyw56sw0f2XNTk4sgk8ddTp9+vzQ1mA8aJwQjCMjOHopFFxK/b4mLGxBIPjfYpbV5OLd0KXhhhMQB79Xv3leH92wZRziWT1IPcKL2ncWVlPAPTS8VgsOXrpb0QQlIe6divxwBHhU0QEZLCUlJIup5jCY/DHYAZvsAikKIChgsNYnEyE6do7ITGLQrJkPAFbnsjCtLyAEOpa7CuadPXdCKbgkLiCwgAOn+3MaLppwrVJRvcty+aCLYUxgqjpwp/P0aS0i9v3jCK6Z8wGez23uLDBmYXyPLpSmMHwOKU3xjDZHHg3VIJ7s8/bSQnKe03Z8M2kN4mOTQbnTHqT6Na1sbFzm2JL1mB4gt8XiQ6DYabQ8Jmu25PpmbLPMzd67FAmxcI8c0N5JAV4PZlZ09cA+cF6CpUt9m1Bwc6ycbSrrwF1nsX2vPGVFVPRMMm1hit5tLUm0do5LZj5i01almUcBjaHor1X+Lrb0g729DkKMJgDwwecJGxmVg/a0QTFd32xe5SQg2xGaM0jvWA/dcqdvHiBbntWNxKLluICyZ6C7kwdnFhGu5n3G5YC30dsLratLE8zFyzOp4GjU/Wg/n5vNCxdnaoHllIZlbuDEbWVpJudBGILYKGez4WhuEMt2QvbiU+76g0Cc86NcWdFVyDirOmrXA7CGwgZW6aG5GwdAlDVPD4c0fF+FCAsE/o5h628axhKF1VMqnLjfpJ5BkHny11NFB3THvtIB/5HVMwQuFbSAnpEb3CsAmFHlAQf4RhsQI8qVWx+uCYHqMn2CjkNJ1rRR7I0sf3EWgegoDvBy+DISTagoKux4ThbxxDUHz/e0BOWs3WMULijXKZJRhJMXEEFxxXlKvDC5GBbchBUtKKNJ8qxfCAIT+9OFdWaeA1/tnPVQ49eU3lx+QxTU30xiapVSh/Vl3SHPPYlCvxNGs8bynXIlFub7h1OMWihuPvg+ONVyuMtmi1z90ae0il7Jl2OwwZCwbN0H0bj0Negl/SFQmnU4bRMi8AkIbWB5ccDFt2gMKPK4U+3374Z5wiEI0VnjbsdWOsGBNyZ7SpJx/9dQwRvVw4ckussH9fs0gYCLLdhT5WbJHo+KHLcoPaO265rFekh8v7FL4sigvb21Tyctr7OxSbe7ib6X1T3wylg1MoronqbnMKPNE3DE+l6nlR1VHhKvzmn9d8Em4/5wi9/9au+giAIgiAIgiAIgiAIgiAIgiAIgiAIgiAIgiAIbvkfbf5iltAgrL0AAAAASUVORK5CYII=">
      </div>
      <!-- div class = "copyright" 들어갈 자리-->
      <p class="copy">Copyright 2020 ⓒ seohyun &amp; hyerim &amp; taehui All rights reserved. </p>
  </div></footer>

  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://code.jquery.com/jquery-migrate-3.1.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@5.3.1/js/swiper.min.js" integrity="sha256-8JTNLE6I+DHURcLWWoKCmv16gDzw0Fp4I34O2y40vC0=" crossorigin="anonymous"></script>
  <script type="text/javascript" src="./js/ui.js"></script>

</div>
           	 
	</div>
	</div>
	</div>
</body>

<script>
	function submit1(){
	      var f= document.getElementById("search_Form");
		  f.submit();
	}
</script>
</html>
