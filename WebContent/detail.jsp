<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="tastymirim.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
   <% request.setCharacterEncoding("UTF-8");%>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="생생 정보통">
    <meta name="keywords" content="고시촌 맛집, 미림 맛집, 도장깨기, 리뷰 및 평점">
    <title>생생 미림통</title>
    <link rel="icon" href="./img/생생미림통_LOGO.ico">

    <link rel="stylesheet" type="text/css" href="./css/detail.css">
    <link rel="stylesheet" type="text/css" href="./css/slick.css"/>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/lightgallery.css">
  <script>
     function chk_file_type(obj) {
   	  var file_kind = obj.value.lastIndexOf('.');
   	  var file_name = obj.value.substring(file_kind+1,obj.length);
   	  var file_type = file_name.toLowerCase();



   	  var check_file_type=new Array();
   	  check_file_type=['jpg','gif','png','jpeg','bmp'];



   	  if(check_file_type.indexOf(file_type)==-1){
   	   alert('이미지 파일만 선택할 수 있습니다.');
   	   var parent_Obj=obj.parentNode
   	   var node=parent_Obj.replaceChild(obj.cloneNode(true),obj);
   	   return false;
   	  }
   	 }
     	
     </script>
</head>
<body style="background: #ececec;">

    <%@ include file="./header.jsp" %>
<% 
int res_num = Integer.parseInt(request.getParameter("res_num"));
%>
<script>

function delete1(review_num){
    var f= document.getElementById("delete_Form");
	f.review_num.value=review_num;
	f.action="delete.jsp";
	f.submit();
}

function form_check(){
	var f2= document.getElementById("write_Form");
	if(<%=id%> == null){
		alert("로그인 먼저 해주세요 !");
		return false;
	}
	if(f2.review_star.value == null || f2.review_star.value == 0){
		alert("별점을 선택해주세요 !");
		return false;
	}
	if(f2.review_content.value == null || (f2.review_content.value).length <= 0){
		alert("리뷰를 작성해주세요 !");
		return false;
	}
}

</script>

        <%
	
	review_DAO reviewdb = new review_DAO();
	review_Bean review = new review_Bean();
	
	resBean res = new resBean();
	resDB resdb = new resDB();
	
	Member member2 = new Member();
	MemberDb memberdb = new MemberDb();
	
	Connection conn = reviewdb.getConn();
	
	
	
	res = resdb.selectRes(res_num);
	
	String res_name = "";
	res_name = res.getResname();
	

	if(res_name==null){
		res_name="";
	}
	String res_location ="";
	res_location = res.getLocation();

	if(res_location==null){
		res_location="";
	}
	
	String res_content = "";
	res_content = res.getRescontent();
	if(res_content==null){
		res_content="";
	}
	
	double avg_grade = 0;
	avg_grade = res.getAvg_grade();
	
	String map = "";
	map = res.getMap();
	if(map == null){
		map ="";
	}
	String res_phone = res.getPhone();

	if(res_phone==null){
		res_phone="";
	}
	
	String [] res_rep_menu = res.getRep_menu().split("\\n");

	if(res_rep_menu== null){
		res_rep_menu = new String[3];
		res_rep_menu[0] = "";
		res_rep_menu[1] = "";
		res_rep_menu[2] = "";	
	}
	String[] res_price = res.getPrice().split("\\n");
	if(res_price== null){
		res_price = new String[3];
		res_price[0] = "";
		res_price[1] = "";
		res_price[2] = "";	
	}
	String[] res_photo = res.getPhoto().split("\\n");
	if(res_photo== null){
		res_photo = new String[3];
		res_photo[0] = "";
		res_photo[1] = "";
		res_photo[2] = "";
		
	}
	String opening_time = res.getOpening_time();
	if(opening_time ==null){
		opening_time = "";
	}
	String walk_time = res.getWalk_time();

	if(walk_time ==null){
		walk_time = "";
	}
	

	
	ArrayList<review_Bean> vlist= reviewdb.review_get(res_num);
	int totalRecord = 0;
	
	
	%>
    
    <div class="container">
		<!-- main_background -->
		<main class="background">
            <!-- contents -->
			<div class="contents">
                <!-- content1 -->
				<div class="content1">
                    <div class="contentimg">
                    <%if(res_photo != null) {%>
                        <div class="imgimg">
                            <img src="<%= res_photo[0] %>">
                        </div>
                        <div class="imgimg">
                            <img src="<%= res_photo[1] %>">
                        </div>
                        <div class="imgimg">
                            <img src="<%= res_photo[2] %>">
                        </div>
                     <% } %>
                    </div>
                </div>
                <!-- //content1 -->
                <!-- content2 -->
                <div class="content2">
                    <h2 class="name"><%=res_name %>
                    <div class="score">
                         <%for(int i=1;i<=(int)Math.floor(avg_grade);i++){ %>
									<img width="40" height="40" src="./img/score2.png">
									<%}
									for(int i=1;i<=5-(int)Math.floor(avg_grade);i++){
										%>
									<img width="40" height="40" src="./img/score1.png">
									<%} %>
                        <div><%=avg_grade %></div>
                        </h2>
                    
                	<table class="introduce">
                		<tr>
                			<td class="small_tit">재학생의 꿀팁 </td>
                		</tr>
                		<tr>
                			<td class="content_con"><%=res_content %></td>
                		</tr>
                		<tr>
                			<td class="small_tit">매장 주소 </td>
                		</tr>
                		<tr>
                			<td class="content_con"><%=res_location %></td>
                		</tr>
                		<tr>
                			<td class="small_tit">전화번호 </td>
                		</tr>
                		<tr>
                			<td class="content_con"><%=res_phone %></td>
                		</tr>
                		<tr>
                			<td class="small_tit">영업 시간 </td>
                		</tr>
                		<tr>
                			<td class="content_con"><%= opening_time %></td>
                		</tr>
                	</table>
                    
                </div>
                <!-- //content3 -->
                <!-- content4 -->
                <div class="content4">
                    <table class="menu" >
                        <thead ><tr><th class="tit">메뉴 정보</th></tr></thead>
                          <tbody>
            					<% for(int i =0; i < res_rep_menu.length;i++ ){
            						%> 
            						<tr><td class="menu_name"><%=res_rep_menu[i] %></td>
            							<td class="price"><%=res_price[i] %>원</td>
            						</tr>
            					<% } %>
            					</tbody>
            					</table>
                    <table class="map">
                        <thead><tr><th class="tit" style="padding-bottom: 0px;">매장 위치</th></tr></thead>
                        <tbody>
                        	<tr>
                        		<td class="time">학교에서 <%=walk_time%>분 거리에 위치함</td>
                        	</tr>
                        	<tr>
                        		<td>
                        			<div id="map"></div>

							        <script>
							          var map;
							          function initMap() {
							            map = new google.maps.Map(document.getElementById('map'), {
							              center: {<%=map%>},
							              zoom: 20
							            }); //지도
							            var amasubin={<%=map%>};
							            var marker = new google.maps.Marker({position: amasubin, map: map});//마커띄우기
							            
							            var contentString = '<h1 id="firstHeading" class="firstHeading"><%=res_name%></h1>';
							        	var infowindow = new google.maps.InfoWindow({
							          	content: contentString
							        	});
							
							        var marker = new google.maps.Marker({
							          position: amasubin,
							          map: map,
							          title: '<%=res_name%>'
							        });
							        marker.addListener('click', function() {
							          infowindow.open(map, marker);
							        });
							          }
							          
							          
							        </script>
							        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDkJihoSRc45bcEXnfJiWn2x2Pup43tAvk&callback=initMap"
							        async defer></script>
                    			</td>
                    		</tr>
                    	</tbody>
                </table>
                </div>
                <!-- //content4 -->
                <!-- content5 -->
                <div class="content5">
                        <div class="tit" style="font-size:40px">REVIEW</div>
                                <form action="./writeAction.jsp" method="post" id="write_Form" onsubmit="return form_check();" enctype="multipart/form-data" encoding="application/x-www-form-urlencoded">
                                        <table class="review_write_table">
                                            <tr>
                                                <td colspan=2 class="review_restaurant_name"> 
                                                	<span class="review_star">
														 <span class="input">
													    	<input type="radio" name="review_star" value="1" id="p1">
													    	<label for="p1">1</label>
													    	<input type="radio" name="review_star" value="2" id="p2">
													    	<label for="p2">2</label>
													    	<input type="radio" name="review_star" value="3" id="p3">
													    	<label for="p3">3</label>
													    	<input type="radio" name="review_star" value="4" id="p4">
													    	<label for="p4">4</label>
													    	<input type="radio" name="review_star" value="5" id="p5">
													    	<label for="p5">5</label>
													  	</span>
													  	<output for="review_star"><b>0</b>점</output>						
													</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" colspan=2  class="review_content">
                                                    <textarea rows="8" name="review_content" placeholder="리뷰를 작성해주세요!"></textarea>
                                                </td>
                                            </tr>
                                            <hr>
                                            <tr>
                                            	<td style="padding:10px;">
                                            		<input type="file" id="BSbtninfo" name="review_file" accept="image/gif,image/jpeg,imgae/png" onchange='chk_file_type(this)'>
                                            	</td>
                                            	 <input type="hidden" name="user_id" id="user_id" value="<%= id %>">
						                        <input type="hidden" name="res_num" value="<%= res_num %>">
												<input type="hidden" name="res_name" value="<%= res_name %>">
												<input type="hidden" name="avg_grade" value="<%= avg_grade %>">
												<input type="hidden" name="res_content" value="<%= res_content %>">
												<input type="hidden" name="map" value="<%= map %>">
												<input type="hidden" name="history" value="1">
                                            	<td class="review_submit">
                                            		<input type="submit" class="button" value="등 록">
                                            	</td>
                                            </tr>
                                        </table>
                                </form>
                                
                                <hr class="review_hr">
                                <%int count = vlist.size();
								if(count==0){
									%>
                                
                                <% 
							 	
								}
								else{
								for(int i =0; i<vlist.size(); i++){
									review = vlist.get(i);
									int review_num = review.getReview_num();
									String user_id = review.getUser_id();
									String user_name = review.getUser_name();
									String review_content= review.getReview_content();
									String review_photo = review.getReview_photo();
									int review_star = review.getReview_star();
									Date review_regdate =review.getReview_regdate();
									
									member2 = memberdb.selectMember(user_id);
									String profile = member2.getProfile();
         %>        
                                    <table  class="review_list" style="margin-bottom: 20px;">
                                	
                                        <tbody>
                                        <tr>
                                            <td rowspan="3" valign="top" class="review_profile">
                                                <img src="<%=profile %>" class="profile_photo">
                                                <div class="profile_name"><%=user_name %></div>
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
                                            <td colspan="2" valign="top" class="review_content">
                                                <div class="content_size"><%=review_content %></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" valign="top" class="review_photo">
                                            	<% if(review_photo != null){ %>
	                                            	<div class="lightgallery">
												        <a href="./fileFolder/<%=review_photo%>"><img src="./fileFolder/<%=review_photo%>" class="photo_user"></a>
												         </div>
                                                <%}else {
                                                }%>
                         
                                            </td>
                                        </tr>
                                        <% if(user_id.equals(id)) {
                                        	%>
                                        <tr>
                                        	<td colspan=3 class="delete_td">
                                        		<form id="delete_Form" method="post">
                                        		<input type="hidden" name="res_num" value="<%=res_num %>">
												<input type="hidden" name="review_num" >
												<input type="hidden" name="history" value="1">
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
                <!-- //content5 -->
            </div>
            <!-- //contents -->
        </main>
        <!-- //main_background -->
    <!-- script -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/lightgallery.min.js"></script>
    <script src="js/lightgallery-all.min.js"></script>
    <script>
        //라이트 박스
        $(".lightgallery").lightGallery({
            thembnail: true,
            autoplay: true,
            pause: 3000,
            progressBar: true
        }); 
    </script>
    <%@ include file="./footer.jsp" %>
      
    
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="./js/slick.min.js"></script>
    <script>
    /* 별점 주기 */
    var starRating = function(){
    	var $star = $(".review_star"), $result = $star.find("output>b");
    		
    	$(document).on("focusin", ".review_star>.input", function(){
    		$(this).addClass("focus");
        }).on("focusout", ".review_star>.input", function(){
    		var $this = $(this);
    		
    		setTimeout(function(){
    			if($this.find(":focus").length === 0){
    				$this.removeClass("focus");
    			}
    		}, 100);
    	}).on("change", ".review_star :radio", function(){
    		$result.text($(this).next().text());
    	}).on("mouseover", ".review_star label", function(){
    		$result.text($(this).text());
    	}).on("mouseleave", ".review_star>.input", function(){
    		var $checked = $star.find(":checked");
    				
    		if($checked.length === 0){
    			$result.text("0");
    		} else {
    			$result.text($checked.next().text());
    		}
    	});
    };
    	
    starRating();


    /* 파일 업로드 */
    function previewImage(targetObj, View_area) {
    	var preview = document.getElementById(View_area); //div id
    	var ua = window.navigator.userAgent;

        //ie일때(IE8 이하에서만 작동)
    	if (ua.indexOf("MSIE") > -1) {
    		targetObj.select();
    		try {
    			var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
    			var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);

    			if (ie_preview_error) {
    				preview.removeChild(ie_preview_error); //error가 있으면 delete
    			}

    			var img = document.getElementById(View_area); //이미지가 뿌려질 곳

    			//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
    			img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
    		} catch (e) {
    			if (!document.getElementById("ie_preview_error_" + View_area)) {
    				var info = document.createElement("<p>");
    				info.id = "ie_preview_error_" + View_area;
    				info.innerHTML = e.name;
    				preview.insertBefore(info, null);
    			}
    		}
        //ie가 아닐때(크롬, 사파리, FF)
    	} else {
    		var files = targetObj.files;
    		for ( var i = 0; i < files.length; i++) {
    			var file = files[i];
    			var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
    			if (!file.type.match(imageType))
    				continue;
    			var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
    			if (prevImg) {
    				preview.removeChild(prevImg);
    			}
                var img = document.createElement("img"); 
                
    			img.id = "prev_" + View_area;
    			img.classList.add("obj");
    			img.file = file;
    			img.style.width = '100px'; 
                img.style.height = '100px';
                
                preview.appendChild(img);
                
    			if (window.FileReader) { // FireFox, Chrome, Opera 확인.
    				var reader = new FileReader();
    				reader.onloadend = (function(aImg) {
    					return function(e) {
    						aImg.src = e.target.result;
    					};
    				})(img);
    				reader.readAsDataURL(file);
    			} else { // safari is not supported FileReader
    				//alert('not supported FileReader');
    				if (!document.getElementById("sfr_preview_error_"+ View_area)) {
    					var info = document.createElement("p");
    					info.id = "sfr_preview_error_" + View_area;
    					info.innerHTML = "not supported FileReader";
    					preview.insertBefore(info, null);
    				}
    			}
    		}
    	}
    }
        //이미지 갤러리
		$('.contentimg').slick({
			autoplay: true,
			autoplaySpeed: 4000,
			slidesToShow: 2,
			slidesToScroll: 1
		});
        
      
        
    </script>
    <!-- //script -->
</body>
</html>
