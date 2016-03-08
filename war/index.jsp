<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html class="html" lang="es-ES">
 <head>
  <meta http-equiv="Content-type" content="text/html;charset=UTF-8"/>
  <meta name="generator" content="2015.0.0.309"/>
  <title>Inicio</title>
  <!-- CSS -->
  <link rel="stylesheet" type="text/css" href="css/site_global.css?4052507572"/>
  <link rel="stylesheet" type="text/css" href="css/master_a-p_g_-maestra.css?126920684"/>
  <link rel="stylesheet" type="text/css" href="css/index.css?262474351" id="pagesheet"/>
  <!-- Other scripts -->
 <style type="text/css">
  .hide { display: none;}
  .show { display: block;}
  </style>
  <script src="https://apis.google.com/js/plusone.js" type="text/javascript"></script>
  <script type="text/javascript">
  (function() {
    var po = document.createElement('script');
    po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/client:plusone.js?onload=render';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(po, s);
  })();

  function render() {
    gapi.signin.render('customBtn', {
      'callback': '',
      'clientid': '830140823856-e33h5j4nmi7n2gr3cb87q42vekni01vd.apps.googleusercontent.com',
      'cookiepolicy': 'single_host_origin',
      'requestvisibleactions': 'http://schemas.google.com/AddActivity',
      'scope': 'https://www.googleapis.com/auth/plus.login'
    });
  }
  
  function redirect(){
	  window.location="registro.jsp";
  }
  </script>
  <style type="text/css">
    #customBtn {
      display: inline-block;
      background: #cc3732;
      color: white;
      width: 175px;
      border-radius: 10px;
    }
    #customBtn:hover {
      background: #e74b37;
      cursor: hand;
    }
    span.label {
      font-weight: bold;
    }
    span.icon {
      background: url('/+/images/branding/btn_red_32.png') transparent 10px 50% no-repeat;
      display: inline-block;
      vertical-align: middle;
      width: 40px;
      height: 40px;
    }
    span.buttonText {
      display: inline-block;
      vertical-align: middle;
      padding-left: 40px;
      padding-right: 40px;
    }
  </style>
   </head>
 <body class="museBGSize">
<form action="Login" method="post">
  <div class="clearfix" id="page"><!-- group -->
   <div class="clip_frame grpelem" id="u208"><!-- image -->
    <img class="block" id="u208_img" src="images/logo.png" alt="" width="185" height="57"/>
   </div>
   <div class="grpelem" id="pu177"><!-- inclusion -->
    <div class="museBGSize" id="u177"><!-- simple frame --></div>
    <div class="clearfix" id="ppu178-4"><!-- column -->
     <div class="clearfix colelem" id="pu178-4"><!-- group -->
      <div class="clearfix grpelem" id="u178-4"><!-- content -->
       <p>LOGIN</p>
      </div>
      <div class="clip_frame grpelem" id="u179"><!-- image -->
       <img class="block" id="u179_img" src="images/icon_llave.png" alt="" width="24" height="10"/>
      </div>
     </div>
     <div><input type="text" name="username" class="colelem" id="u181" required="required" placeholder="Usuario"/></div>
     <div><input type="password" name="userpass" class="colelem" id="u185" required="required" placeholder="Password" /></div>
     <!-- Button login anda google -->
     <div class="clearfix colelem" id="u182"><!-- group -->
      <div class="museBGSize clearfix grpelem" id="u183"><!-- group -->
       <div class="clearfix grpelem" id="u184-4"><!-- content -->
        <p><input type="submit" value="Login" /></p>
		  <span class="label"></span>
		  <div id="customBtn" class="customGPlusSignIn">
		    <span class="icon"></span>
		    <span class="buttonText">Google +</span>
		  </div>
       </div>
      </div>
     </div>
   <!-- Button registro -->  
    <div class="clearfix colelem" id="u182"><!-- group -->
      <div class="museBGSize clearfix grpelem" id="u183"><!-- group -->
       <div class="clearfix grpelem" id="u184-4"><!-- content -->
        <p><input type="submit" value="Registro" onclick="redirect();" /></p>
       </div>
      </div>
     </div>
    </div>
   </div>
   <div class="verticalspacer"></div>
  </div>
  <div class="preload_images">
   <img class="preload" src="images/boton.png" alt=""/>
  </div>
</form>
   </body>
</html>
