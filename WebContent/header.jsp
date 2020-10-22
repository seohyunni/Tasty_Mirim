<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="icon" href="./img/생생미림통_LOGO.ico">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" />
  <meta name="google-signin-scope" content="profile email">
   <script src="https://apis.google.com/js/platform.js" async defer></script>
  <script type="text/javascript" src="./js/restaurant.js"></script>
  <script type="text/javascript" src="./js/autocomplate.js"></script>
  <link rel="stylesheet" type="text/css" href="./css/header.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
 <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>

	<% request.setCharacterEncoding("UTF-8"); %>
</head>
<% 

String id = (String)session.getAttribute("id");
 %>
<% session.setAttribute("id", id);
	%>



<script>
$(function(){
	var lastScrollTop = 0, delta = 15;
	$(window).scroll(function(event){
		var st = $(this).scrollTop();
		
		if(Math.abs(lastScrollTop - st) <= delta)
			return; // 스크롤값을 받아서 리턴한다.
	if ((st > lastScrollTop) && (lastScrollTop>0)) {
		$("header").css("top","-115px"); // 스크롤을 내렸을때 #header의 CSS 속성중 top 값을 -50px로 변경한다.
		
	} else {
		$("header").css("top","0px"); // 스크롤을 올렸을때 #header의 CSS 속성중 top 값을 0px로 변경한다.
	}
		lastScrollTop = st;
	});
});


function checkLoginStatus(){
	
    var nameTxt = document.querySelector('#name');
    if(gauth.isSignedIn.get()){
      console.log('logined');   
      loginBtn.value = '로그아웃';
      document.getElementById("mypageBtn").style.display='inline';
      var profile = gauth.currentUser.get().getBasicProfile();
      
      var id = profile.getId();
      var name = profile.getName();
      var image = profile.getImageUrl();
      var email = profile.getEmail();
      
      var f= document.getElementById("login_form");
      f.id.value=id;
      f.name.value=name;
      f.profile.value=image;
      f.email.value=email;
       
      if(<%= id %> == null){
    	  <% session.setAttribute("id", id);%>
		  f.submit();
      }
    } else {
      console.log('logouted');
      loginBtn.value = '로그인';
      document.getElementById("mypageBtn").style.display='none';
    	  gauth.disconnect();
      <%session.removeAttribute("id");%>
    }
  }
	function init(){
	      console.log('init');
	      gapi.load('auth2', function() {
	        console.log('auth2');
	        window.gauth = gapi.auth2.init({
	          client_id:'298428641791-sggk3jdoo2dp76ugffeiborv296l2hcl.apps.googleusercontent.com'
	        })
	        gauth.then(function(){
	          console.log('googleAuth success');
	          checkLoginStatus();
	        }, function(){
	          console.log('googleAuth fail');
	        });
	      });
	    }
	  function ViewSearch(){
	        document.getElementById("SearchLayer").style.display='inline'
	    }
	function CloseSearch(){
	        document.getElementById("SearchLayer").style.display='none'
	        document.getElementById("autoInput").value=''
	    }
	
	function cookiesAllDel(){
		 var cookiesArray = "";
		 var cookiesCount = 0;
		 var ckArray = "";
		 cookiesArray = document.cookie.split(";");
		 cookiesCount = cookiesArray.length;
		 for (var i = 0; i < cookiesCount; i++ ){
		  ckArray = cookiesArray[i].split("=");
		  document.cookie = ckArray[0] + "=''; path=https://localhost:8765/; expires='';"
		 }
		}
	   
	    // autocomplete 부분을 생성
	    window.onload = function () {
	        autocomplete.setAutocomplete(document.getElementById("autoInput"), restaurant)
	        }
</script>
<body>
 <!-- header -->
<header class="common-header">
  <div class="common-header-body">
    <div class="common-header-wrap">
      <h1 class="logo"><a href="./index.jsp">생생미림통</a></h1>
        <div class="nav-scroll-wrap">
          <ul class="nav">
          <li class="mm">
            	 <a href="javascript:ViewSearch();" class="mm-link"><img style="margin-bottom:5px;" src="./img/search.png" width=32></a>
           	</li>
            <li class="mm">
              <a href="./list.jsp?sort=0" class="mm-link">맛집 리스트</a>
            </li>
             <li class="mm">
              <a href="./recommend.jsp" class="mm-link">추천</a>
            </li>
            <li class="mm">
              <a href="./ranking2.jsp" class="mm-link">랭킹</a>
            </li>
            
           </ul>
           
              <div class="googleLogin" align="center">
        <ul class="nav2">
              
               		<li class="mm">
             		 <input type="button" id="mypageBtn" value="마이페이지" onclick="location.href='./mypage.jsp';" style="display:none">
				    </li>
				  
				  <li class="mm">
		              <input type="button" id="loginBtn" value="로그인" onclick="
						   	 if(this.value === '로그인'){
						      gauth.signIn().then(function(){
						        console.log('gauth.signIn()');
						        checkLoginStatus();
						      });
						    } else {
						      gauth.signOut().then(function(){
						        console.log('gauth.signOut()');
						        checkLoginStatus();
						        gauth.disconnect();
						      });
						        gauth.disconnect();
						    	cookiesAllDel();
								location.href='logout.jsp';
						    	  	    };">
				  </li>
            </ul>
            </div>
    </div>
  </div>
  </div>
</header>
<!-- // header -->

 <div id="SearchLayer" style="position:fixed;z-index:10000;display:none; width:100%; height:100%;
      background: none rgba(0, 0, 0, 0.8);
      filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#80000000', endColorstr='#80000000');
      " align='center'>
      <img class="x" src="./img/close.png" onclick='CloseSearch()' width=60 height=60>
          <div class="srch_form autocomplete">
                <form action="./search.jsp" method="post">
	                <table class="search_table2" style=" width:auto; margin-left: 100px;">
			              <tr>
			              <td colspan=3 style="text-align: center;">	
				              <input id="autoInput" name="word"  class="searchTerm"  placeholder="맛집 검색" autocomplete="off" >
				              
			            </td>
			            <td>
			            <input type="submit" class="searchButton" value="검색" name = "btnSearch" id="btnSearch" onkeyup="enterkey();" onclick="compare()" >
			            </td>
			            </tr>
			           
		            </table>
	            </form>
          </div>
          <table style="width:auto;">
          		 <tr class="recommend_tr">
			            <script>
			            var color = ["#ff9292" ,"#f2ee97","#afe5ad", "#83b8f4", "#ecb3d2"];
			            	for(i=0; i<4; i++){
			            		var random = Math.floor(Math.random() * restaurant.length);
			            		var color_random = Math.floor(Math.random() * color.length);
			            		document.write("<td class='recommend_search'><a href='search.jsp?word="+restaurant[random]+"'><div class='recommend_div' style='border:4px solid "+color[color_random]+";'># "+restaurant[random]+"</div></a></td>");
								
			            	}
			            </script>
          </table>
    </div>

<form method="post" id="login_form" name="login_form" action="./loginOk.jsp"> 
			<input type="hidden"  name="id" value=""> 
			<input type="hidden" name="name" value="">
			<input type="hidden" name="profile" value="">
			<input type="hidden" name="email" value="">
		</form>



	<jsp:useBean id="member" class="tastymirim.Member"/>
	<jsp:setProperty name="member" property="*"/>
	
</body>
<script>
var loginBtn = document.getElementById('loginBtn');
console.log("아이디는 "+<%=id%>);
if(<%=id%> == null){
	console.log('로그인 안됨');
    loginBtn.value = '로그인';
    document.getElementById("mypageBtn").style.display='none';
}
else{
	console.log('로그인 되어잇');
	loginBtn.value = '로그아웃';
    document.getElementById("mypageBtn").style.display='inline';
}
</script>
  <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
</html>
<% session.setAttribute("id", id);
	%>