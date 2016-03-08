<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.google.appengine.api.utils.SystemProperty" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="html" lang="es-ES"> 
  <head>
    <title>MCDS | Contacto</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRxC6Y4f-j6nECyHWigtBATtJyXyha-XU&libraries=adsense&sensor=true&language=es"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="/scripts/jquery.min.js"></script>
    <!-- CSS -->
  	<link rel="stylesheet" type="text/css" href="css/site_global.css?4052507572"/>
  	<link rel="stylesheet" type="text/css" href="css/master_a-p_g_-maestra.css?126920684"/>
  	<link rel="stylesheet" type="text/css" href="css/menu.css?3849422309" id="pagesheet"/>
    <script>
    var map = null;
	var marker = null;
     
    function load_map() {
        var myLatlng = new google.maps.LatLng(20.68009, -101.35403);
        var myOptions = {
            zoom: 4,
            center: myLatlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById('map_canvas'),myOptions);
        //map = new google.maps.Map($('#map_canvas').get(0), myOptions);
    
    }
     
    $('#search').live('click', function() {
        //se obtiene la direccion y se le asignamos a la variable
        var address = $('#address').val();
        var ciudad = $('#ciudad').val();
        var estado = $('#estado').val();
        var cp = $('#cp').val();
        var pais = $('#pais').val();
        var add = address+" "+ ciudad+" "+ estado +" "+cp +" "+ pais;
        console.log(address+" "+ ciudad+" "+ estado +" "+cp +" "+ pais);
        // Creamos el Objeto Geocoder
        var geocoder = new google.maps.Geocoder();
        // se hace la petición indicando la dirección e invocamos la función
        // geocodeResult enviando todo el resultado obtenido
        geocoder.geocode({'address': add}, geocodeResult);
    });
     
    function geocodeResult(results, status) {
        //Se verifica el estatus
        if (status == 'OK') {
            // Si hay resultados encontrados centramos y se pinta de nuevo el mapa
            var mapOptions = {
                center: results[0].geometry.location,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            map = new google.maps.Map($("#map_canvas").get(0), mapOptions);
            // fitBounds acercará el mapa con el zoom adecuado de acuerdo a lo buscado
            map.fitBounds(results[0].geometry.viewport);
            // para dibujar marcador con la ubicación del primer resultado obtenido
            var markerOptions = { position: results[0].geometry.location }
            var marker = new google.maps.Marker(markerOptions);
            marker.setMap(map);
        } else {
            alert("No se encontraron resultados, con la direccion proporsionada: \n" + "Verificar datos proporsionados");
        }
    }
    google.maps.event.addDomListener(window, 'load', load_map);
    
    $(document).ready(function() {
    	load_map();
    });
    </script>
    
    
    <script>
function test(a) {
var x = a.selectedIndex;
console.log(x);
//alert(x);
}
function test2(a) {
	var x = a.selectedIndex;
	console.log(x);
	//alert(x);
	}
function cambio(a) {
	var x = a.selectedIndex;
	console.log(x);
	}
	
function cambio2(a) {
	var x = a.selectedIndex;
	console.log(x);
	}
</script>
    
  </head>
  <body class="museBGSize">
  <form action="registroContactoD" method="POST">
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
		ResultSet rs = conn.createStatement().executeQuery(
				"SELECT ID_ORGANIZACION, NOMBRE_ORGANIZACION FROM organizacion");
		ResultSet rss = conn.createStatement().executeQuery(
				"SELECT ID_FUENTE, NOMBRE_FUENTE FROM fuente");
		ResultSet r =  conn.createStatement().executeQuery(
				"SELECT ID_CONTACTO, NOMBRE_CONTACTO FROM contacto");
		ResultSet res =  conn.createStatement().executeQuery(
				"SELECT ID_CONTACTO, NOMBRE_CONTACTO FROM contacto");

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
     <a class="nonblock nontext museBGSize grpelem" id="u220" href="#"><!-- simple frame --></a>
     <a class="nonblock nontext clearfix grpelem" id="u258-4" href="contactos.jsp"><!-- content --><p>Contactos</p></a>
     <a class="nonblock nontext museBGSize grpelem" id="u259" href="contactos.jsp"><!-- simple frame --></a>
     <a class="nonblock nontext clearfix grpelem" id="u262-4" href="reporte.jsp"><!-- content --><p>Reportes</p></a>
     <a class="nonblock nontext museBGSize grpelem" id="u263" href="reporte.jsp"><!-- simple frame --></a>
    </div>
    <div class="colelem" id="pu284"><!-- inclusion -->
     <div id="u284"><!-- simple frame --></div>
     <div class="clearfix" id="pu285-4"><!-- group -->
      <div class="clearfix grpelem" id="u285-4"><!-- content -->
       <p>Nuevo Contacto</p>
      </div>
     </div>
    </div>
  	<div class="colelem" id="pu288"><!-- inclusion -->
     <div id="u288"><!-- simple frame --></div>
     <div class="clearfix" id="pu323-4"><!-- group -->
      <div class="clearfix grpelem" id="u323-4"><!-- content -->
       <p>Informacion Basica</p>
      </div>
     </div>
    </div>
    
  	<div class="clearfix colelem" id="ppu324"><!-- group -->
     <div class="grpelem" id="pu324"><!-- inclusion -->
      <div id="u324"><!-- simple frame --></div>
      <div class="clearfix" id="pu326"><!-- column -->
       <div class="colelem" id="u326"><!-- simple frame --></div>
       <div class="clearfix colelem" id="pu361-4"><!-- group -->
        <div class="clearfix grpelem" id="u361-4"><!-- content -->
         <p>Nombre(s)</p>
        </div>
        <div>
        	<textarea name="nombre_contacto" cols="20" rows="5" class="grpelem" id="u365"></textarea></div>
       </div>
       <div class="clearfix colelem" id="pu363-4"><!-- group -->
        <div class="clearfix grpelem" id="u363-4"><!-- content -->
         <p>Telefono Oficina</p>
        </div>
        <div><input name="telefono_oficina" type="text"  class="grpelem" id="u367" placeholder="585858558"></div>
        <div class="clearfix grpelem" id="u386-4"><!-- content -->
         <p>Organizacion</p>
        </div>
        <div>
        	<!--input name="organizacion" type="text"  class="grpelem" id="u389"-->
        	<select name="nombre_organizacion" class="grpelem" id="u389" onchange="cambio(this)">
        		<option value="null">--Seleccionar--</option>
        		<% while (rs.next()) {
 				%>
 				<option value=<%=rs.getInt("ID_ORGANIZACION")%>><%=rs.getString("NOMBRE_ORGANIZACION")%></option>
				<%}
				%>
        	</select>
        </div>
       </div>
       <div class="clearfix colelem" id="pu364-4"><!-- group -->
        <div class="clearfix grpelem" id="u364-4"><!-- content -->
         <p>Telefono Celular</p>
        </div>
        <div><input name="telefono_celular" type="text"  class="grpelem" id="u368" placeholder="044 55555555"></div>
        <div class="clearfix grpelem" id="u387-4"><!-- content -->
         <p>Fuente</p>
        </div>
        <div>
        	<select name="nombre_fuente" class="grpelem" id="u390" onchange="test(this)">
        		<option value="null">--Seleccionar--</option>
        		<% while (rss.next()) {
 				%>
				<option value="<%=rss.getInt("ID_FUENTE")%>"><%=rss.getString("NOMBRE_FUENTE")%></option>
				<%}	%>
        	</select>
        </div>
       </div>
       <div class="clearfix colelem" id="pu381-4"><!-- group -->
        <div class="clearfix grpelem" id="u381-4"><!-- content -->
         <p>Reportar a</p>
        </div>
        <div>
        	<select name="reportar_a" class="grpelem" id="u382" onchange="test2(this)">
        		<option value="null">--Seleccionar--</option>
        		<% while (r.next()) {
 				%>
				<option value="<%=r.getInt("ID_CONTACTO")%>"><%=r.getString("NOMBRE_CONTACTO") %></option>
				<%}
				%>
        	</select>
        </div>
        <div class="clearfix grpelem" id="u391-4"><!-- content -->
         <p>Puesto</p>
        </div>
        <div><input name="puesto" type="text"  class="grpelem" id="u392"></div>
       </div>
       <div class="clearfix colelem" id="pu383-4"><!-- group -->
        <div class="clearfix grpelem" id="u383-4"><!-- content -->
         <p>*Asignado a</p>
        </div>
        <div>
        	<!--input name="asignado_a" type="text"  class="grpelem" id="u384"-->
        	<select name="asignado_a" class="grpelem" id="u384" onchange="cambio2(this)">
        		<option value="null">--Seleccionar--</option>
        		<% while (res.next()) {
 				%>
				<option value="<%=res.getInt("ID_CONTACTO")%>"><%=res.getString("NOMBRE_CONTACTO") %></option>
				<%}
					conn.close();
				%>
        	</select>
        </div>
        <div class="clearfix grpelem" id="u393-4"><!-- content -->
         <p>Correo Primario</p>
        </div>
        <div><input name="correo_primario" type="text"  class="grpelem" id="u394" placeholder="ejemplos@ejemplo.com"></div>
       </div>
      </div>
     </div>
     <div class="clip_frame grpelem" id="u331"><!-- image -->
      <img class="block" id="u331_img" src="images/punta_baja.png" alt="" width="22" height="11"/>
     </div>
     <div class="clearfix grpelem" id="u385-4"><!-- content -->
      <p>Apellidos</p>
     </div>
     <div><textarea cols="20" rows="5" name="apellido" class="grpelem" id="u388"></textarea></div>
    </div>

  	
  	
  	
  	<div class="colelem" id="pu325"><!-- inclusion -->
     <div id="u325"><!-- simple frame --></div>
     <div class="clearfix" id="pu329-4"><!-- group -->
      <div class="clearfix grpelem" id="u329-4"><!-- content -->
       <p>Dirección</p>
      </div>
     </div>
    </div>
  	    <div class="clearfix colelem" id="ppu324"><!-- group -->
     <div class="grpelem" id="pu324"><!-- inclusion -->
      <div id="u324"><!-- simple frame --></div>
      <div class="clearfix" id="pu326"><!-- column -->
       <div class="colelem" id="u326"><!-- simple frame --></div>
       <div class="clearfix colelem" id="pu361-4"><!-- group -->
        <div class="clearfix grpelem" id="u361-4"><!-- content -->
         <p>Direccion</p>
        </div>
        <div class="grpelem" id="u365"><textarea id="address" name="direccion_e" class="grpelem" placeholder="Dirección Calle/Colonia" style="z-index: 102"></textarea></div>
       </div>
       <div class="clearfix colelem" id="pu363-4"><!-- group -->
        <div class="clearfix grpelem" id="u363-4"><!-- content -->
         <p>Ciudad</p>
        </div>
        <div class="grpelem" id="u367"><input name="ciudad_e" type="text" id="ciudad" placeholder="Cuidad" ></div>
       </div>
       <div class="clearfix colelem" id="pu364-4"><!-- group -->
        <div class="clearfix grpelem" id="u364-4"><!-- content -->
         <p>Estado.</p>
        </div>
        <div  class="grpelem" id="u368"><input name="estado_e" type="text" id="estado" placeholder="Estado"></div>
       </div>
       <div class="clearfix colelem" id="pu381-4"><!-- group -->
        <div class="clearfix grpelem" id="u381-4"><!-- content -->
         <p>C.P.</p>
        </div>
        <div class="grpelem" id="u382"><input name="cp_e" type="text" id="cp" placeholder="C.P."></div>
       </div>
       <div class="clearfix colelem" id="pu383-4"><!-- group -->
        <div class="clearfix grpelem" id="u383-4"><!-- content -->
         <p>País.</p>
        </div>
        <div  class="grpelem" id="u384"><input name="pais_e" type="text" id="pais" placeholder="Pais"></div>
       </div>
      </div>
     </div>
     <div class="clip_frame grpelem" id="u331"><!-- image -->
      <img class="block" id="u331_img" src="images/punta_baja.png" alt="" width="22" height="11"/>
     </div>
     <div class="clearfix grpelem" id="u385-4"><!-- content -->
      <p><div  id='map_canvas' style="width:400px; height:145px;" id="u388"></div><input type="button" id="search" value="Verificar Direccion" /></p>
     </div>
     <div></div>
    </div>
  	<div class="colelem" id="pu396"><!-- inclusion -->
     <div id="u396"><!-- simple frame --></div>
     <div class="clearfix" id="pu398-4"><!-- group -->
      <div class="clearfix grpelem" id="u398-4"><!-- content -->
       <p>Comentarios</p>
      </div>
     </div>
    </div>
    <div class="clearfix colelem" id="ppu395"><!-- group -->
     <div class="grpelem" id="pu395"><!-- inclusion -->
      <div id="u395"><!-- simple frame --></div>
      <div class="clearfix" id="pu397"><!-- column -->
       <div class="colelem" id="u397"><!-- simple frame --></div>
       <div><textarea name="comentario" cols="20" rows="5" class="colelem" id="u402"></textarea></div>
      </div>
     </div>
     <div class="clip_frame grpelem" id="u399"><!-- image -->
      <img class="block" id="u399_img" src="images/punta_baja.png" alt="" width="22" height="11"/>
     </div>
    </div>
    <div class="colelem" id="pu396"><!-- inclusion -->
     <div id="u396"><!-- simple frame --></div>
     <div class="clearfix" id="pu398-4"><!-- group -->
      <div class="clearfix grpelem" id="u398-4"><!-- content -->
       <p>Foto</p>
      </div>
     </div>
    </div>
    <div class="clearfix colelem" id="ppu395"><!-- group -->
     <div class="grpelem" id="pu395"><!-- inclusion -->
      <div id="u395"><!-- simple frame --></div>
      <div class="clearfix" id="pu397"><!-- column -->
       <div class="colelem" id="u397"><!-- simple frame --></div>
       <div><input name="foto" type="file" class="colelem" id="u402"></div>
      </div>
     </div>
     <div class="clip_frame grpelem" id="u399"><!-- image -->
      <img class="block" id="u399_img" src="images/punta_baja.png" alt="" width="22" height="11"/>
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
  
	<div align="center">
    	<input id="submit" type="submit" value="Guardar">
  	</div>
  </form>

  </body>
</html>