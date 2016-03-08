<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.google.appengine.api.utils.SystemProperty" %>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<!DOCTYPE html>
<html class="html" lang="es-ES">
 <head>
  <meta http-equiv="Content-type" content="text/html;charset=UTF-8"/>
  <meta name="generator" content="2015.0.0.309"/>
  <title>MCDS | Registro </title>
  <!-- CSS -->
  <link rel="stylesheet" type="text/css" href="css/site_global.css"/>
  <link rel="stylesheet" type="text/css" href="css/master_a-p_g_-maestra.css"/>
  <link rel="stylesheet" type="text/css" href="css/menu.css" id="pagesheet"/>
  <script type="text/javascript" src="MD5.js"></script>
  <!-- Other scripts -->
  <script type="text/javascript">
 var RecaptchaOptions = {
    theme : 'clean'
 };
	function regresar(){
		window.location="index.jsp";
	}
 </script>
<script >
  function checkForm(form)
  {
    if(form.nombre.value == "") {
	  //myFunction();
	  alert("Error: Favor de insertar un nombre de usuario ");
      form.nombre.focus();
      return false;
    }
    re = /^\w+$/;
    if(!re.test(form.nombre.value)) {
      alert("Error: Nombre de usuario debe contener sólo letras, números y guiones bajos ");
      form.nombre.focus();
      return false;
    }

    if(form.password.value != "" && form.password.value == form.passwordC.value) {
      if(form.password.value.length < 6) {
        alert("Error: La contraseña debe contener al menos seis caracteres!");
        form.password.focus();
        return false;
      }
      if(form.password.value == form.nombre.value) {
        alert("Error: El password debe de ser diferente a el nombre de usuario!");
        form.password.focus();
        return false;
      }
      re = /[0-9]/;
      if(!re.test(form.password.value)) {
        alert("Error: El password debe de contener almenos un numero de (0-9)!");
        form.password.focus();
        return false;
      }
      re = /[a-z]/;
      if(!re.test(form.password.value)) {
        alert("Error: El password debe de contener una letra miniscula (a-z)!");
        form.password.focus();
        return false;
      }
      re = /[A-Z]/;
      if(!re.test(form.password.value)) {
        alert("Error: El passsword debe de contener una letra mayuscula (A-Z)!");
        form.password.focus();
        return false;
      }
    } else {
      alert("Error: Por favor verifique los password proporcionados");
      form.password.focus();
      return false;
    }

    //alert("You entered a valid password: " + form.password.value);
    return true;
  }

</script>
<script src='https://www.google.com/recaptcha/api.js'></script>
   </head>
 <body class="museBGSize">
<form action="validate.jsp" method="POST" onsubmit="return checkForm(this);">
  <div class="clearfix" id="page"><!-- column -->
   <div class="position_content" id="page_position_content">
    <div class="clip_frame colelem" id="u208"><!-- image -->
     <img class="block" id="u208_img" src="images/logo.png" alt="" width="185" height="57"/>
    </div>
    <div class="colelem" id="pu284"><!-- inclusion -->
     <div id="u284"><!-- simple frame --></div>
     <div class="clearfix" id="pu285-4"><!-- group -->
      <div class="clearfix grpelem" id="u285-4"><!-- content -->
       <p>REGISTRO USUARIO</p>
      </div>
     </div>
    </div>
    <div class="colelem" id="pu288"><!-- inclusion -->
     <div id="u288"><!-- simple frame --></div>
     <div class="clearfix" id="pu323-4"><!-- group -->
      <div class="clearfix grpelem" id="u323-4"><!-- content -->
       <p>Informacion requeridad</p>
      </div>
     </div>
    </div>
    
    <div class="clearfix colelem" id="ppu310"><!-- group -->
     <div class="grpelem" id="pu310"><!-- inclusion -->
      <div id="u310"><!-- simple frame --></div>
      <div class="clearfix" id="ppu338-4"><!-- group -->
       <div class="clearfix grpelem" id="pu338-4"><!-- column -->
        <div class="clearfix colelem" id="u338-4"><!-- content -->
         <p>Password</p>
        </div>
        <div class="clearfix colelem" id="u340-4"><!-- content -->
         <p></p>
        </div>
       </div>
       <div class="clearfix grpelem" id="pu342"><!-- column -->
        <div><input name="password" type="password" class="colelem" id="u342" required="required"></div>
        <br><br>
        <div >
        <%
          ReCaptcha c = ReCaptchaFactory.newReCaptcha("6Ld0cQoTAAAAAGoTv7lM6UoJgsHhF1aVZgxENonc", "6Ld0cQoTAAAAAOL3O3_BxYTh6Y6atZLhvA204sPn", false);
          out.print(c.createRecaptchaHtml(null, null));
        %>
        </div>
       </div>
       <div class="clearfix grpelem" id="pu346-4"><!-- column -->
        <div class="clearfix colelem" id="u346-4"><!-- content -->
         <p>Confirmar Password</p>
        </div>
       </div>
       <div class="clearfix grpelem" id="pu350"><!-- column -->
        <div><input name="passwordC" type="password" class="colelem" id="u350" required="required"></div>
       </div>
       <div class="clearfix grpelem" id="pu354-4"><!-- column -->
        <div class="clearfix colelem" id="u355-4"><!-- content -->
         <p><!-- Correo --></p>
        </div>
        <div class="clearfix colelem" id="u355-4"><!-- content -->
         <p></p>
        </div>
       </div>
        <div class="clearfix grpelem" id="pu358"><!-- column -->
        <div>
        	<!--input name="correo"  class="colelem" id="u358" required="required"-->
		</div>
       </div>
      </div>
     </div>
     <div class="grpelem" id="u289"><!-- simple frame --></div>
     <div class="clip_frame grpelem" id="u303"><!-- image -->
      <img class="block" id="u303_img" src="images/punta_baja.png" alt="" width="22" height="11"/>
     </div>
     <div class="clearfix grpelem" id="u334-4"><!-- content -->
      <p>Nombre Usuario</p>
     </div>
     <div><input name="nombre" type="text"  class="grpelem" id="u341" required="required"></div>
     <div class="clearfix grpelem" id="u345-4"><!-- content -->
      <p>Primer Apellido</p>
     </div>
     <div ><input name="primer_apellido" type="text" class="grpelem" id="u349" required="required"></div>
     <div class="clearfix grpelem" id="u353-4"><!-- content -->
      <p>Segundo Apellido</p>
     </div>
     	<div >
     	<input name="segundo_apellido" type="text" class="grpelem" id="u357" >
		</div>
    </div>
    <div class="colelem" id="pu396"><!-- inclusion -->
     <div id="u396"><!-- simple frame --></div>
     <div class="clearfix" id="pu398-4"><!-- group -->
      <div class="clearfix grpelem" id="u398-4"><!-- content -->
       <p><input id="submit" type="submit" value="Guardar"></p>
       <br>
       <p><input id="submit" type="submit" value="Regresar" onclick="regresar();"></p>
      </div>
     </div>
    </div>
    <div class="verticalspacer"></div>
   </div>
  </div>
  <div class="preload_images">
   <img class="preload" src="images/boton_menu-hover.png" alt=""/>
   <img class="preload" src="images/boton_menu-normal.png" alt=""/>
   <img class="preload" src="images/boton_menu-activo.png" alt=""/>
  </div>
  </form>
  
   </body>
</html>
