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
  <script src="//www.gstatic.com/firebasejs/live/3.0/firebase.js"></script>
  <link rel="stylesheet" type="text/css" href="./css/header.css" />
</head>

<% request.setCharacterEncoding("UTF-8"); %>
</head>
<% String id = (String)session.getAttribute("id");%>


<script>


function checkLoginStatus(){
	
    var nameTxt = document.querySelector('#name');
    if(gauth.isSignedIn.get()){
      console.log('logined');   
      loginBtn.value = '로그아웃';
      document.getElementById("mypageBtn").style.display='inline';
      var profile = gauth.currentUser.get().getBasicProfile();
      console.log('ID: ' + profile.getId());
      console.log('Full Name: ' + profile.getName());
      console.log('Image URL: ' + profile.getImageUrl());
      console.log('Email: ' + profile.getEmail());
      
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
		  f.submit();
      }
    } else {
      console.log('logouted');
      loginBtn.value = '로그인';
      document.getElementById("mypageBtn").style.display='none';
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
              <a href="./stamp.html" class="mm-link">도장깨기</a>
            </li>
            <li class="mm">
              <a href="./ranking.jsp" class="mm-link">랭킹</a>
            </li>
        <ul class="nav2">
            </li>
              <div class="googleLogin" align="center">
              
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
				      });
				    };search();
				  ">
				  </li>
            </div>
            
                <a href="javascript:ViewSearch();" class="mm-link02"><img src="https://cdn2.iconfinder.com/data/icons/font-awesome/1792/search-512.png" width=45 heigth=45></a>
              </li>
            </ul>
    </div>
  </div>
  
  <div class="common-header-dim"></div>
</header>
<!-- // header -->

 <div id="SearchLayer" style="position:fixed;z-index:10000;display:none; width:100%; height:100%;
      background: none rgba(0, 0, 0, 0.8);
      filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#80000000', endColorstr='#80000000');
      " align='center'>
          <div class="srch_form autocomplete">
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
      <image class="x" src="https://www.iconsdb.com/icons/preview/white/x-mark-xxl.png" onclick='CloseSearch()' width=60 height=60>
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
	console.log('djelRKwl');
    loginBtn.value = '로그인';
    document.getElementById("mypageBtn").style.display='none';
}
else{
	console.log('dhkTsk');
	loginBtn.value = '로그아웃';
    document.getElementById("mypageBtn").style.display='inline';
}
<% session.setAttribute("id", id); %>

</script>
</html>