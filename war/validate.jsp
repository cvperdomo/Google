<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="net.tanesha.recaptcha.ReCaptchaImpl"%>
<%@ page import="net.tanesha.recaptcha.ReCaptchaResponse"%>
<%@ page import="com.google.appengine.api.utils.SystemProperty" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html class="html" lang="es-ES">
 <head>
  <meta http-equiv="Content-type" content="text/html;charset=UTF-8"/>
  <meta name="generator" content="2015.0.0.309"/>
  <title>MCDS | Validacion </title>
  <!-- CSS -->
  <link rel="stylesheet" type="text/css" href="css/site_global.css"/>
  <link rel="stylesheet" type="text/css" href="css/master_a-p_g_-maestra.css"/>
  <link rel="stylesheet" type="text/css" href="css/menu.css" id="pagesheet"/>
  <!-- Other scripts -->
  <script type="text/javascript">
  function regresar(){
		window.location="index.jsp";
	}
 </script>
</head>
<body class="museBGSize">
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
       <p>Detalle de registro</p>
      </div>
     </div>
    </div>
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
		PreparedStatement insert = null;
		Connection conn = DriverManager.getConnection(url);
		
		String remoteAddr = request.getRemoteAddr();
		ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
		reCaptcha.setPrivateKey("6Ld0cQoTAAAAAOL3O3_BxYTh6Y6atZLhvA204sPn");

		String challenge = request
				.getParameter("recaptcha_challenge_field");
		String uresponse = request.getParameter("recaptcha_response_field");
		ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(
				remoteAddr, challenge, uresponse);

		if (reCaptchaResponse.isValid()) {
			conn.setAutoCommit(false);
				String nombre = request.getParameter("nombre");
				String primer_apellido = request.getParameter("primer_apellido");
				String segundo_apellido = request.getParameter("segundo_apellido");
				String password = request.getParameter("password");
			insert = conn.prepareStatement("INSERT INTO user (nombre , primer_apellido ,segundo_apellido, password) VALUES( ? , ? , ? , ?)");
			insert.setString(1, nombre);
			insert.setString(2, primer_apellido);
			insert.setString(3, segundo_apellido);
			insert.setString(4, password);
			insert.executeUpdate();
			conn.commit();
			//out.print("Usuario "+ nombre +" registrado correctamente ");
			%>
			<div class="clearfix colelem" id="ppu310"><!-- group -->
			<div class="grpelem" id="pu310">
			 <div id="u310"><!-- simple frame --></div>
			  <div class="clearfix" id="ppu338-4">
				<div class="grpelem" id="u289"><!-- simple frame --></div>
				<div class="clearfix grpelem" id="u334-4"><!-- content -->
	      			<p>Usuario: <%= nombre %> registrado correctamente</p>
	    		</div>
	    		<div class="clearfix grpelem" id="u345-4"><!-- content -->
			      <p>Ir a pagina Login<a href="index.jsp"><img class="svg grpelem" id="u553" src="images/icon_llave.png" width="20" height="15" alt=""/></a></p>
			    </div>
      			</div>	
      		  </div>
      		</div>
      		<div class="colelem" id="pu396"><!-- inclusion -->
		     <div id="u396"><!-- simple frame --></div>
		     <div class="clearfix" id="pu398-4"><!-- group -->
		      <div class="clearfix grpelem" id="u398-4"><!-- content -->
		       <p></p>
		      </div>
		     </div>
		    </div>
		<%} else {%>
			<div class="clearfix colelem" id="ppu310"><!-- group -->
			<div class="grpelem" id="pu310">
			<div id="u310"><!-- simple frame --></div>
			<div class="clearfix" id="ppu338-4">
				<div class="grpelem" id="u289"><!-- simple frame --></div>
					<div class="clearfix grpelem" id="u334-4"><!-- content -->
		  				<p>Fallo en la captura de reCaptcha</p>
					</div>
					<div class="clearfix grpelem" id="u345-4"><!-- content -->
				      <p>Regresar a la pagina anterior<a href="registro.jsp"><img class="svg grpelem" id="u553" src="images/volver.png" width="20" height="15" alt=""/></a></p>
				    </div>
		  			<div class="clearfix grpelem" id="u353-4"><!-- content -->
				      <p>Ir a pagina Login<a href="index.jsp"><img class="svg grpelem" id="u553" src="images/icon_llave.png" width="20" height="15" alt=""/></a></p>
				    </div>
		  			</div>
		  		</div>
  			</div>
  			<div class="colelem" id="pu396"><!-- inclusion -->
		     <div id="u396"><!-- simple frame --></div>
		     <div class="clearfix" id="pu398-4"><!-- group -->
		      <div class="clearfix grpelem" id="u398-4"><!-- content -->
		       <p></p>
		      </div>
		     </div>
		    </div>
			<%
		}
	%>

 <div class="verticalspacer"></div>
   </div>
  </div>

  <div class="preload_images">
   <img class="preload" src="images/boton_menu-hover.png" alt=""/>
   <img class="preload" src="images/boton_menu-normal.png" alt=""/>
   <img class="preload" src="images/boton_menu-activo.png" alt=""/>
  </div>
</body>
</html>