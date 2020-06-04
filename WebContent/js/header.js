function checkLoginStatus(){
    var loginBtn = document.querySelector('#loginBtn');
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
       
      if(<%= id %> == null || "".equals(<%=id%>)){
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
    }
   
    // autocomplete 부분을 생성
    window.onload = function () {
        autocomplete.setAutocomplete(document.getElementById("autoInput"), restaurant)
        }