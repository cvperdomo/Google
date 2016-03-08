<html>
<head>
  <title>Demo: Getting an email address using the Google+ Sign-in button</title>
  <style type="text/css">
  .hide { display: none;}
  .show { display: block;}
  </style>
  <script src="https://apis.google.com/js/plusone.js" type="text/javascript"></script>
</head>
<body>
  <!-- Coloca este JavaScript asíncrono justo delante de la etiqueta </body> -->
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
  </script>
  <style type="text/css">
    #customBtn {
      display: inline-block;
      background: #cc3732;
      color: white;
      width: 175px;
      border-radius: 5px;
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
  <span class="label">Sign in with:</span>
  <div id="customBtn" class="customGPlusSignIn">
    <span class="icon"></span>
    <span class="buttonText">Google</span>
  </div>
</body>
</html>