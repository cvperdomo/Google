
<html>
<head>
  <title>Demo: Getting an email address using the Google+ Sign-in button</title>
  <style type="text/css">
  .hide { display: none;}
  .show { display: block;}
  </style>
  <script src="https://apis.google.com/js/plusone.js" type="text/javascript"></script>
  <script type="text/javascript">
  /*
   * Activado cuando el usuario acepta el inicio de sesi�n, cancela o cierra el
   * cuadro de di�logo de autorizaci�n.
   */
  function loginFinishedCallback(authResult) {
    if (authResult) {
      if (authResult['error'] == undefined){
        gapi.auth.setToken(authResult); // Almacena el token recuperado.
        toggleElement('signin-button'); // Oculta el inicio de sesi�n si se ha accedido correctamente.
        getEmail();                     // Activa la solicitud para obtener la direcci�n de correo electr�nico.
      } else {
        console.log('An error occurred');
      }
    } else {
      console.log('Empty authResult');  // Se ha producido alg�n error
    }
  }

  /*
   * Inicia la solicitud del punto final userinfo para obtener la direcci�n de correo electr�nico del
   * usuario. Esta funci�n se basa en gapi.auth.setToken que contiene un token
   * de acceso de OAuth v�lido.
   *
   * Cuando se completa la solicitud, se activa getEmailCallback y recibe
   * el resultado de la solicitud.
   */
  function getEmail(){
    // Carga las bibliotecas oauth2 para habilitar los m�todos userinfo.
    gapi.client.load('oauth2', 'v2', function() {
          var request = gapi.client.oauth2.userinfo.get();
          request.execute(getEmailCallback);
        });
  }

  function getEmailCallback(obj){
    var el = document.getElementById('email');
    var email = '';

    if (obj['email']) {
      email = 'Email: ' + obj['email'];
    }

    //console.log(obj);   // Sin comentario para inspeccionar el objeto completo.

    el.innerHTML = email;
    toggleElement('email');
  }

  function toggleElement(id) {
    var el = document.getElementById(id);
    if (el.getAttribute('class') == 'hide') {
      el.setAttribute('class', 'show');
    } else {
      el.setAttribute('class', 'hide');
    }
  }
  </script>
</head>
<body>
  <div id="signin-button" class="show">
     <div class="g-signin" data-callback="loginFinishedCallback"
      data-approvalprompt="force"
      data-clientid="830140823856-e33h5j4nmi7n2gr3cb87q42vekni01vd.apps.googleusercontent.com"
      data-scope="https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/userinfo.email"
      data-height="short"
      data-cookiepolicy="single_host_origin"
      >
    </div>
  </div>

  <div id="email" class="hide"></div>
</body>
</html>