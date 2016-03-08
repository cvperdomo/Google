<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.google.appengine.api.utils.SystemProperty" %>
<%@ taglib prefix="c" 
           uri="/WEB-INF/tld/c.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="html" lang="es-ES"> 
  <head>
    <title>MCDS | Usuario</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRxC6Y4f-j6nECyHWigtBATtJyXyha-XU&libraries=adsense&sensor=true&language=es"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="/scripts/jquery.min.js"></script>
    <!-- CSS -->
  	<link rel="stylesheet" type="text/css" href="css/site_global.css?4052507572"/>
  	<link rel="stylesheet" type="text/css" href="css/master_a-p_g_-maestra.css?126920684"/>
  	<link rel="stylesheet" type="text/css" href="css/menu.css?3849422309" id="pagesheet"/>
  	
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <script language="JavaScript">

		function muestra_oculta(id){
		if (document.getElementById){ //se obtiene el id
		var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
		el.style.display = (el.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div
		}
		}
		window.onload = function(){/*hace que se cargue la función lo que predetermina que div estará oculto hasta llamar a la función nuevamente*/
		muestra_oculta('contenido_a_mostrar');/* "contenido_a_mostrar" es el nombre que le dimos al DIV */
		}
</script>
<script >
  function checkForm(form)
  {
    if(form.nuevo_password.value != "" && form.nuevo_password.value == form.confirmar_password.value) {
      if(form.nuevo_password.value.length < 6) {
        alert("Error: La contraseña debe contener al menos seis caracteres!");
        form.nuevo_password.focus();
        return false;
      }
      if(form.nuevo_password.value == form.usuario.value) {
        alert("Error: El password debe de ser diferente a el nombre de usuario!");
        form.nuevo_password.focus();
        return false;
      }
      re = /[0-9]/;
      if(!re.test(form.nuevo_password.value)) {
        alert("Error: El password debe de contener almenos un numero de (0-9)!");
        form.nuevo_password.focus();
        return false;
      }
      re = /[a-z]/;
      if(!re.test(form.nuevo_password.value)) {
        alert("Error: El password debe de contener una letra miniscula (a-z)!");
        form.nuevo_password.focus();
        return false;
      }
      re = /[A-Z]/;
      if(!re.test(form.nuevo_password.value)) {
        alert("Error: El passsword debe de contener una letra mayuscula (A-Z)!");
        form.nuevo_password.focus();
        return false;
      }
    } else {
      alert("Error: Por favor verifique los password proporcionados ya que no coinciden");
      form.nuevo_password.focus();
      return false;
    }

    //alert("You entered a valid password: " + form.password.value);
    return true;
  }

</script>
  </head>
  <body class="museBGSize">
  <form action="updateUsuario" method="POST" onsubmit="return checkForm(this);">
		   <%
		String url = null;
		if (SystemProperty.environment.value() ==
		    SystemProperty.Environment.Value.Production) {
		  // Load the class that provides the new "jdbc:google:mysql://" prefix.
		  Class.forName("com.mysql.jdbc.GoogleDriver");
		  url = "jdbc:google:mysql://msapp-970:test-spring/local?user=root";
		} else {
		  // Local MySQL instance to use during development.
		  Class.forName("com.mysql.jdbc.Driver");
		  url = "jdbc:mysql://173.194.110.143:3306/local?user=root";
		}
		
		Connection conn = DriverManager.getConnection(url);
		ResultSet rs = conn.createStatement().executeQuery("SELECT nombre, primer_apellido, segundo_apellido , correo FROM user where nombre ='"+session.getAttribute("name")+"'");
		//falta estatus
		%>
  <div class="clearfix" id="page"><!-- column -->
  <div class="position_content" id="page_position_content">
  <div class="clip_frame colelem" id="u208"><!-- image -->
     <img class="block" id="u208_img" src="images/logo.png" alt="" width="185" height="57"/>
    </div>
      <div class="clearfix colelem" id="ppu256-4"><!-- group -->
     	<div class="clearfix grpelem" id="u246-4"><!-- content -->
      	<p>Inicio</p>
     </div>
     <div class="clearfix grpelem" id="pu256-4"><!-- group -->
      	<a class="nonblock nontext clearfix grpelem" id="u256-4" href="informacion_organizacion.jsp"><!-- content --><p>Organizaciones</p></a>
      	<a class="nonblock nontext museBGSize grpelem" id="u257" href="informacion_organizacion.jsp"><!-- simple frame --></a>
     </div>
     <div class="clearfix grpelem" id="pu260-4"><!-- group -->
      	<a class="nonblock nontext clearfix grpelem" id="u260-4" href="info_oportunidades.jsp"><!-- content --><p>Oportunidades</p></a>
      	<a class="nonblock nontext museBGSize grpelem" id="u261" href="info_oportunidades.jsp"><!-- simple frame --></a>
     </div>
     <div class="clearfix grpelem" id="pu264-4"><!-- group -->
      	<a class="nonblock nontext clearfix grpelem" id="u264-4" href="informacion_user.jsp">
      		<p>Usuario: <%=session.getAttribute("name")%>
      					<%if (session.getAttribute("name") != null && !session.getAttribute("name").equals("")) {
		     				} else {
      								response.sendRedirect("index.jsp");
     						}
    					%>
      		</p>
      	</a>
      	<a href="Logout" class="clearfix grpelem">Logout</a>
      	<a class="nonblock nontext museBGSize grpelem" id="u265" href="informacion_user.jsp"></a>
     </div>
     <a class="nonblock nontext museBGSize grpelem" id="u220" href="#"></a>
     <a class="nonblock nontext clearfix grpelem" id="u258-4" href="contactos.jsp"><!-- content --><p>Contactos</p></a>
     <a class="nonblock nontext museBGSize grpelem" id="u259" href="contactos.jsp"><!-- simple frame --></a>
     <a class="nonblock nontext clearfix grpelem" id="u262-4" href="reporte.jsp"><!-- content --><p>Reportes</p></a>
     <a class="nonblock nontext museBGSize grpelem" id="u263" href="reporte.jsp"><!-- simple frame --></a>
    </div>
    <div class="colelem" id="pu284"><!-- inclusion -->
     <div id="u284"><!-- simple frame --></div>
     <div class="clearfix" id="pu285-4"><!-- group -->
      <div class="clearfix grpelem" id="u285-4"><!-- content -->
       <p>MI PERFIL</p>
      </div>
     </div>
    </div>
  	<div class="colelem" id="pu288"><!-- inclusion -->
     <div id="u288"><!-- simple frame --></div>
     <div class="clearfix" id="pu323-4"><!-- group -->
      <div class="clearfix grpelem" id="u323-4"><!-- content -->
       <p>Detalle</p>
      </div>
     </div>
    </div>
    <%
	while (rs.next()) {
	
 	%>
  	<div class="clearfix colelem" id="ppu324"><!-- group -->
     <div class="grpelem" id="pu324"><!-- inclusion -->
      <div id="u324"><!-- simple frame --></div>
      <div class="clearfix" id="pu326"><!-- column -->
       <div class="colelem" id="u326"><!-- simple frame --></div>
       <div class="clearfix colelem" id="pu361-4"><!-- group -->
        <div class="clearfix grpelem" id="u361-4"><!-- content -->
         <p>Nombre usuario</p>
        </div>
        <div>
        	<input name="usuario" class="grpelem" id="u367" disabled="disabled" value="<%=rs.getString("nombre")%>">
        	<!--textarea cols="20" rows="5" name="usuario" class="grpelem" id="u365" disabled="disabled" ></textarea--></div>
       </div>
       <div class="clearfix colelem" id="pu363-4"><!-- group -->
        <div class="clearfix grpelem" id="u363-4"><!-- content -->
         <p>Correo</p>
        </div> 
        <div><input name="correo" type="text"  class="grpelem" id="u367" disabled="disabled" value="<%=rs.getString("correo")%>"></div>
        <div class="clearfix grpelem" id="u386-4"><!-- content -->
         <p><a href="#" style='cursor: pointer;' onclick="muestra_oculta('contenido_a_mostrar')"><img class="svg grpelem" id="u553" src="images/update.png" width="30" height="25" alt=""/></a></p>
        </div>
        <div>
        	<!--input type="text" name="tipo" class="grpelem" id="u389"-->
        </div>
       </div>
       <div id="contenido_a_mostrar">
       <div class="clearfix colelem" id="pu364-4"><!-- group -->
        <div class="clearfix grpelem" id="u364-4"><!-- content -->
         <p>Password actual</p>
        </div>
        <div class="grpelem" id="u368" style="z-index: 180;">
        <input name="password_actual" type="password" required="required"></div>
        <div class="clearfix grpelem" id="u387-4"><!-- content -->
         <p><!-- Button de actualizar --></p>
        </div>
        <div>
        </div>
       </div>
       <div class="clearfix colelem" id="pu381-4"><!-- group -->
        <div class="clearfix grpelem" id="u381-4"><!-- content -->
         <p>Nuevo password</p>
        </div>
        <div>
        	<input type="password" name="nuevo_password" class="grpelem" id="u382" required="required">
        </div>
        <div class="clearfix grpelem" id="u391-4"><!-- content -->
         <p>Confirmar password</p>
        </div>
        <div>
        	<input type="password" name="confirmar_password" class="grpelem" id="u392" required="required">
        </div>
       </div>
       </div>
       <div class="clearfix colelem" id="pu383-4"><!-- group -->
        <div class="clearfix grpelem" id="u383-4"><!-- content -->
         <p></p>
        </div>
        <div>
        	<!--input name="probabilidad" type="text"  class="grpelem" id="u384"-->
        </div>
        <div class="clearfix grpelem" id="u393-4"><!-- content -->
         <p></p>
        </div>
        <div><!--input name="monto_cast" type="text"  class="grpelem" id="u394" placeholder="Ejem. 9999.99"--></div>
        <div class="clearfix grpelem"></div>
       </div>
      </div>
     </div>
     <div class="clip_frame grpelem" id="u331"><!-- image -->
      <img class="block" id="u331_img" src="images/punta_baja.png" alt="" width="22" height="11"/>
     </div>
     <div class="clearfix grpelem" id="u385-4"><!-- content -->
      <p>Apellidos</p>
     </div>
     <div>
     	<input name="apellidos" class="grpelem" id="u388" disabled="disabled" value="<%=rs.getString("primer_apellido") +" "+ rs.getString("segundo_apellido")%>">
     	<!--textarea cols="20" rows="5" name="apellidos" class="grpelem" id="u388" disabled="disabled"></textarea-->
     </div>
    </div>
  	<div class="colelem" id="pu396"><!-- inclusion -->
     <div id="u396"><!-- simple frame --></div>
     <div class="clearfix" id="pu398-4"><!-- group -->
      <div class="clearfix grpelem" id="u398-4"><!-- content -->
       <p><input id="submit" type="submit" value="Guardar"></p>
      </div>
     </div>
    </div>
    <div class="clearfix colelem" id="ppu395"><!-- group -->
     <div class="grpelem" id="pu395"><!-- inclusion -->
      <div id="u395"><!-- simple frame --></div>
      <!--div class="clearfix" id="pu397">
       <div class="colelem" id="u397"></div>
       <div><textarea name="descripcion" cols="20" rows="5" class="colelem" id="u402"></textarea></div>
      </div-->
     </div>
     <div class="clip_frame grpelem" id="u399"><!-- image -->
      <!--img class="block" id="u399_img" src="images/punta_baja.png" alt="" width="22" height="11"/-->
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
  	  <%
}
conn.close();
%>
  </form>

  </body>
</html>