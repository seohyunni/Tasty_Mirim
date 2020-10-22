<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="tastymirim.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <link rel="icon" href="./img/생생미림통_LOGO.ico">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta name="author" content="MBS(미림 방송국)">
    <meta name="description" content="생생 정보통">
    <meta name="keywords" content="고시촌 맛집, 미림 맛집, 도장깨기, 리뷰 및 평점">
    <title>생생 미림통</title>
    <link rel="icon" href="./img/생생미림통_LOGO.ico">
    <link rel="stylesheet" type="text/css" href="./css/mypage.css">
<% request.setCharacterEncoding("UTF-8"); %>
</head>

<%@ include file="./header.jsp" %>
<body style="background: #ececec;">

<script>

function delete1(review_num){
    var f= document.getElementById("delete_Form");
	f.review_num.value=review_num;
	f.action="delete.jsp";
	f.submit();
}
</script>
<% 	Member member2 = new Member();
MemberDb memberdb = new MemberDb(); 
member2 = memberdb.selectMember(id);
String user_name = member2.getName();
String user_email = member2.getEmail().toLowerCase();
String profile = member2.getProfile();

review_DAO reviewdb = new review_DAO();
review_Bean review = new review_Bean();

resBean res = new resBean();
resDB resdb = new resDB();

Connection conn = reviewdb.getConn();

ArrayList<review_Bean> vlist= reviewdb.review_get2(id);
int totalRecord = 0;
	%>
      <div class="wrap" style="margin-left:280px;">
      		<div class="content">
      			
      			
      		</div>
      </div>
<div class="container">

				<!-- content1 -->
				<div class="content12">
	                <div class="content1">
	             			   <img src="https://attach.s.op.gg/forum/20180120032052_171313.jpg" class="background_photo">
	                </div>
	               <!-- content1 -->
	               
	                <!-- content2 -->
	                <div class="content2">
	             			   <img src="<%= profile %>" class="profile">
	                	<table class="my_info">
	                		<tr>
	                			<td class="name"><%=user_name %></td>
	                		</tr>
	                		<tr>
	                			<td class="email"><%= user_email %></td>
	                		</tr>
	                	</table>
	                </div>
	               <!-- content2 -->
               </div>
                <!-- content5 -->
                <div class="content5">
                        <div class="tit">내가 쓴 리뷰</div>
                                
                                <hr class="review_hr">
                                <div class="review_scroll">
                                
                                <%int count = vlist.size();
								if(count==0){
									%>
                                <table>
                                	
                                        <tbody>
                                        <tr>
                                            <td rowspan="3" style="    text-align: center;font-size: 20px;height: 570px;">
                                            	작성한 리뷰가 없습니다.
                                            </td>
                                        </tr>
                                        </tbody>
                                 </table>
                                <% 
							 	
								}
								else{
								for(int i =0; i<vlist.size(); i++){
									review = vlist.get(i);
									int review_num = review.getReview_num();
									String user_id = review.getUser_id();
									String user_name2 = review.getUser_name();
									int res_num = review.getRes_num();
									String review_content= review.getReview_content();
									String review_photo = review.getReview_photo();
									int review_star = review.getReview_star();
									Date review_regdate =review.getReview_regdate();
									
									res = resdb.selectRes(res_num);
									String res_name = res.getResname();
         %>        
                                    <table  class="review_list" style="margin-bottom: 20px;" onclick="location.href='detail.jsp?res_num=<%=res_num%>'">
                                	
                                        <tbody>
                                       <!--  <tr>
                                        	<td colspan="3"><%= res_name %>
                                        	</td>
                                        </tr>-->
                                        <tr>
                                            <td rowspan="3" valign="top" class="review_profile">
                                                <img src="<%=profile %>" class="profile_photo">
                                                <div class="profile_name"><%=user_name %></div>
                                            </td>
                                            <td class="res_name">
                                            	<%= res_name %>
                                            </td>
                                            <td class="review_score">
                                                	<%for(int j=1;j<=review_star;j++){ %>
													<img width="30" height="30" src="https://image.flaticon.com/icons/svg/148/148841.svg">
													<%}
													for(int j=1;j<=5-review_star;j++){
														%>
													<img width="30" height="30" src="https://image.flaticon.com/icons/png/512/149/149222.png">
													<%} %>
                                            </td>
                                            
                                            <td class="review_date">
                                                <div><%= review_regdate %></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" valign="top" class="review_content">
                                                <div class="content_size"><%=review_content %></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" valign="top" class="review_photo">
                                            	<% if(review_photo != null){ %>
                                                <img src="./fileFolder/<%=review_photo %>" class="photo_user">
                                                <%}else {
                                                }%>
                         
                                            </td>
                                        </tr>
                                        <% if(user_id.equals(id)) {
                                        	%>
                                        <tr>
                                        	<td colspan=4 class="delete_td">
                                        		<form id="delete_Form" method="post">
												<input type="hidden" name="review_num" >
												<input type="hidden" name="history" value="2">
                                        		<input class="delete_submit" type="button" value="삭제" onclick="delete1(<%=review_num%>)">
                                        		</form>
                                        	</td>
                                        </tr>
                                        <%} %>
                                        </tbody>
                                    </table>
                                       
	     <%}
								}%>
								</div>
                        </div>
                    </div>
                <!-- //content5 -->
    </div>
          

<%@ include file="./footer.jsp" %>
    </body>


    
</html>
