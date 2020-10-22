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
<head>
    <meta charset="UTF-8">
    <title>생생 미림통 : 랭킹</title>
    
    
    <link rel="icon" href="./img/생생미림통_LOGO.ico">
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

    <%@ include file="./header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	review_DAO reviewdb = new review_DAO();
	review_Bean review = new review_Bean();
	
	Member member2 = new Member();
	MemberDb memberdb = new MemberDb();
	
	
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
  		
  		ResultSet rs = stmt.executeQuery("select user_id, count(user_id) FROM review group by user_id ORDER BY count(user_id) DESC limit 10");
  		
	%>
  
    <!-- content -->
    <div class="wrap">
    	<div class="container2">
    		<section class="main">
				<div class="wrapper-demo">
					<div id="dd" class="wrapper-dropdown-5" tabindex="1">리뷰왕 TOP10
						<ul class="dropdown">
							<li><a href="ranking2.jsp"><i class="icon-user"></i>리뷰 많은 식당 TOP10</a></li>
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
            	String url="";
            	if(count == 0){
            		url = "./img/crown_gold.png";
            	}
            	else if(count == 1){
            		url="./img/crown_silver.png";
            	}
            	else{
            		url="./img/crown_copper.png";
            	}
            		member2 = memberdb.selectMember(rs.getString("user_id"));
            		String profile = member2.getProfile();
            		String user_name = member2.getName();%>
            	<td>
            		<table class="table_ranker">
                    <tr class="ranker_tr">
                        <td class="ranker"><%=++i %></td>
                    </tr>
                    <tr>
                        <td class="profile_ranker">
                        <img class=crown src="<%=url %>" alt="왕관" width=50>
                            <img class=profile src="<%=profile %>" style="background:gray" >
                        </td>
                     </tr>
                     <tr>
                     	<td class="name_ranker">
                     	<%=user_name %>
                     	</td>
                     </tr>
                    <tr>
                        <td class=rivew_ranker>리뷰 <%=rs.getString("count(user_id)") %>개</td>
                    </tr>
                    </table>
                    </td>
                    <% ++count;
            if(count == 3 || count == 4){
            	break;
            }
            } %>
                    </tr>
            </table>
            
            <table class="table_list2">
            <% while(rs.next()){
					member2 = memberdb.selectMember(rs.getString("user_id"));
        		String profile = member2.getProfile();
        		String user_name = member2.getName();
					%>
           			 <tr>
           			 <td>
           			 <table class="table_rank">
						<tr>
                        <td class="rank"><%=++i %></td>
                        <td class="name">
                            <img class=profile src=<%= profile %> style="background:gray;" width=40 height=40 >
                           	&nbsp;&nbsp;<%=user_name %>
                        </td>
                        <td class=rivew>리뷰 <%=rs.getString("count(user_id)") %>개</td>
                    </tr>
                    </table>
                    </td>
                    </tr>
					<%
					++count;
				}
            
				for(int j =0; j < 10- count; j++){
					%>
					<tr>
           			 <td>
           			 <table class="table_rank">
						<tr>
                        <td class="rank"><%=++i %></td>
                        <td class="name">
                            <img class=profile style="background:gray;" width=40 height=40 >
                           	&nbsp;&nbsp;아직 없습니다.
                        </td>
                        <td class=rivew> 리뷰 개</td>
                    </tr>
                    </table>
                    </td>
                    </tr>
					<% 
				}
				}finally{
            }%>

</table>
</div>
</div>

    <%@ include file="./footer.jsp" %>
    
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://code.jquery.com/jquery-migrate-3.1.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@5.3.1/js/swiper.min.js" integrity="sha256-8JTNLE6I+DHURcLWWoKCmv16gDzw0Fp4I34O2y40vC0=" crossorigin="anonymous"></script>
  <script type="text/javascript" src="./js/ui.js"></script>
</body>
</html>