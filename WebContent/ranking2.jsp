<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "tastymirim.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
   
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
    <link rel="stylesheet" type="text/css" href="./css/ranking.css">

</head>
<body style="background:#ececec;">
<% request.setCharacterEncoding("UTF-8"); %>
    <%@ include file="./header.jsp" %>
<%
	
	review_DAO reviewdb = new review_DAO();
	review_Bean review = new review_Bean();
	
	resBean res = new resBean();
	resDB resdb = new resDB();
	
	
	Connection conn = null;
  	Statement stmt = null;
  	int i =0;
	int count = 0;
	try{
  		Class.forName("com.mysql.jdbc.Driver");
  		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tastymirim?useUnicode=true&characterEncoding=UTF-8","tastymirim","h4HX6ASpP2SeOrmw");
  		
  		if(conn == null)
  			throw new Exception("db 연결 실패");
  			stmt = conn.createStatement();
  		
  		ResultSet rs = stmt.executeQuery("select res_num, count(res_num) FROM review group by res_num ORDER BY count(res_num) DESC limit 10");
  		
	%>
  
    <!-- content -->
    <div class="wrap">
    	<div class="container2">
    		<section class="main">
				<div class="wrapper-demo">
					<div id="dd" class="wrapper-dropdown-5" tabindex="1">리뷰 많은 식당 TOP10
						<ul class="dropdown">
							<li><a href="ranking.jsp"><i class="icon-user"></i>리뷰왕 TOP10</a></li>
						</ul>
					</div>
				​</div>
			</section>
			
		<!-- jQuery if needed -->
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script type="text/javascript">

			function DropDown(el) {
				this.dd = el;
				this.initEvents();
			}
			DropDown.prototype = {
				initEvents : function() {
					var obj = this;

					obj.dd.on('click', function(event){
						$(this).toggleClass('active');
						event.stopPropagation();
					});	
				}
			}

			$(function() {

				var dd = new DropDown( $('#dd') );

				$(document).click(function() {
					// all dropdowns
					$('.wrapper-dropdown-5').removeClass('active');
				});

			});

		</script>
            <!-- 크아짱랭킹은 rank_zzang 클래스 추가 -->
            <!-- 목록 -->
            <table class="table_list">
            <tr>
            <% while(rs.next()){
            		res = resdb.selectRes(rs.getInt("res_num"));
            		String res_name = res.getResname();
            		String res_image = res.getImage();
            		double avg_grade = res.getAvg_grade();%>
            	<td>
            		<table class="table_ranker2" onclick="location.href='detail.jsp?res_num=<%=rs.getInt("res_num")%>'">
                    <tr class="ranker_tr">
                        <td class="ranker"><%=++i %></td>
                    </tr>
                    <tr>
                        <td class="res_image_td">
                        	<div class="res_image_div">
                            	<img class="res_image" src="<%=res_image%>" style="background:gray" >
                            </div>
                        </td>
                     </tr>
                     <tr>
                     	<td class="name_ranker">
                     	<%=res_name %>&nbsp;<font style="color:#FF8956"><%=avg_grade %></font>
                     	</td>
                     </tr>
                    <tr>
                        <td class=rivew_ranker>리뷰 <%=rs.getString("count(res_num)") %>개</td>
                    </tr>
                    </table>
                    </td><% ++count;
			            if(count == 3){
			            	break;
			            }
                    } %>
                    </tr>
                    <tr>
            <% while(rs.next()){
            		res = resdb.selectRes(rs.getInt("res_num"));
            		String res_name = res.getResname();
            		String res_image = res.getImage();
            		double avg_grade = res.getAvg_grade();%>
            	<td>
            		<table class="table_ranker2" onclick="location.href='detail.jsp?res_num=<%=rs.getInt("res_num")%>'">
                    <tr class="ranker_tr">
                        <td class="ranker"><%=++i %></td>
                    </tr>
                    <tr>
                        <td class="res_image_td">
                        	<div class="res_image_div">
                            	<img class="res_image" src="<%=res_image%>" style="background:gray" >
                            </div>
                        </td>
                     </tr>
                     <tr>
                     	<td class="name_ranker">
                     	<%=res_name %>&nbsp;<font style="color:#FF8956"><%=avg_grade %></font>
                     	</td>
                     </tr>
                    <tr>
                        <td class=rivew_ranker>리뷰 <%=rs.getString("count(res_num)") %>개</td>
                    </tr>
                    </table>
                    </td>
                    <% ++count;
			            if(count == 6){
			            	break;
			            }
                    } %>
                    </tr>
                    <tr>
            <% while(rs.next()){
            		res = resdb.selectRes(rs.getInt("res_num"));
            		String res_name = res.getResname();
            		String res_image = res.getImage();
            		double avg_grade = res.getAvg_grade();%>
            	<td>
            		<table class="table_ranker2" onclick="location.href='detail.jsp?res_num=<%=rs.getInt("res_num")%>'">
                    <tr class="ranker_tr">
                        <td class="ranker"><%=++i %></td>
                    </tr>
                    <tr>
                        <td class="res_image_td">
                        	<div class="res_image_div">
                            	<img class="res_image" src="<%=res_image%>" style="background:gray" >
                            </div>
                        </td>
                     </tr>
                     <tr>
                     	<td class="name_ranker">
                     	<%=res_name %>&nbsp;<font style="color:#FF8956"><%=avg_grade %></font>
                     	</td>
                     </tr>
                    <tr>
                        <td class=rivew_ranker>리뷰 <%=rs.getString("count(res_num)") %>개</td>
                    </tr>
                    </table>
                    </td><% ++count;
			            if(count == 9){
			            	break;
			            }
                    } %>
                    </tr>
                    <tr>
            <% while(rs.next()){
            		res = resdb.selectRes(rs.getInt("res_num"));
            		String res_name = res.getResname();
            		String res_image = res.getImage();
            		double avg_grade = res.getAvg_grade();%>
            	<td>
            		<table class="table_ranker2" onclick="location.href='detail.jsp?res_num=<%=rs.getInt("res_num")%>'">
                    <tr class="ranker_tr">
                        <td class="ranker"><%=++i %></td>
                    </tr>
                    <tr>
                        <td class="res_image_td">
                        	<div class="res_image_div">
                            	<img class="res_image" src="<%=res_image%>" style="background:gray" >
                            </div>
                        </td>
                     </tr>
                     <tr>
                     	<td class="name_ranker">
                     	<%=res_name %>&nbsp;<font style="color:#FF8956"><%=avg_grade %></font>
                     	</td>
                     </tr>
                    <tr>
                        <td class=rivew_ranker>리뷰 <%=rs.getString("count(res_num)") %>개</td>
                    </tr>
                    </table>
                    </td><% ++count;
			            if(count == 10){
			            	break;
			            }
                    } %>
                    </tr>
                    
            </table>
            
         
					<% 
				}finally{
            }%>
</div>
</div>

    <%@ include file="./footer.jsp" %>
    
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://code.jquery.com/jquery-migrate-3.1.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@5.3.1/js/swiper.min.js" integrity="sha256-8JTNLE6I+DHURcLWWoKCmv16gDzw0Fp4I34O2y40vC0=" crossorigin="anonymous"></script>
  <script type="text/javascript" src="./js/ui.js"></script>
</body>
</html>