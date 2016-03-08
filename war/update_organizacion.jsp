<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.google.appengine.api.utils.SystemProperty" %>
<!DOCTYPE html>
<html class="html" lang="es-ES">
 <head>
  <meta http-equiv="Content-type" content="text/html;charset=UTF-8"/>
  <meta name="generator" content="2015.0.0.309"/>
  <title>MCDS | Organizacion</title>
  <!-- CSS -->
  <link rel="stylesheet" type="text/css" href="css/site_global.css"/>
  <link rel="stylesheet" type="text/css" href="css/master_a-p_g_-maestra.css"/>
  <link rel="stylesheet" type="text/css" href="css/menu.css" id="pagesheet"/>
  <!-- Other scripts -->
    <script>
function cambio5(a) {
var x = a.selectedIndex;
console.log(x);
//alert(x);
}

function cambio3(a) {
	var x = a.selectedIndex;
	console.log(x);
	}
	
function cambio4(a) {
	var x = a.selectedIndex;
	console.log(x);
	}
</script>
   </head>
 <body class="museBGSize">
<form action="UpdateOrganizacion" method="POST">
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
//Connection coo = DriverManager.getConnection(url);
//String id_organizacion = request.getParameter("id");
//PreparedStatement stmt =null;
//ResultSet resul= stmt.executeQuery("Select nombre_organizacion from organizacion where id_organizacion="+id_organizacion);

//if(resul.next())
//{
//String nombre_organizacion=resul.getString("nombre_organizacion");
//ingredient_name=resul.getString("ingredient_name");
//ingredient_category=resul.getString("ingredient_category");
//ingredient_price=resul.getDouble("ingredient_price");
//quantity=resul.getDouble("quantity");
//}



Connection conn = DriverManager.getConnection(url);
ResultSet rs = conn.createStatement().executeQuery(
		"SELECT ID_INDUSTRIA, NOMBRE FROM industria");
ResultSet rss = conn.createStatement().executeQuery(
		"SELECT ID_TIPO, NOMBRE FROM tipo");
ResultSet r =  conn.createStatement().executeQuery(
		"SELECT ID_CONTACTO, NOMBRE_CONTACTO, APELLIDO FROM contacto");

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
      	<!--a class="nonblock nontext clearfix grpelem" id="u264-4" href="info_oportunidades.jsp"><p></p></a-->
      	<!--a class="nonblock nontext museBGSize grpelem" id="u265" href="info_oportunidades.jsp"></a-->
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
       <p>NUEVA ORGANIZACION</p>
      </div>
     </div>
    </div>
    <div class="colelem" id="pu288"><!-- inclusion -->
     <div id="u288"><!-- simple frame --></div>
     <div class="clearfix" id="pu323-4"><!-- group -->
      <div class="clearfix grpelem" id="u323-4"><!-- content -->
       <p>Detalles</p>
      </div>
     </div>
    </div>
    
    <div class="clearfix colelem" id="ppu310"><!-- group -->
     <div class="grpelem" id="pu310"><!-- inclusion -->
      <div id="u310"><!-- simple frame --></div>
      <div class="clearfix" id="ppu338-4"><!-- group -->
       <div class="clearfix grpelem" id="pu338-4"><!-- column -->
        <div class="clearfix colelem" id="u338-4"><!-- content -->
         <p>Teléfono primario</p>
        </div>
        <div class="clearfix colelem" id="u339-4"><!-- content -->
         <p>Correo primario</p>
        </div>
        <div class="clearfix colelem" id="u340-4"><!-- content -->
         <p>Ingreso anual</p>
        </div>
       </div>
       <div class="clearfix grpelem" id="pu342"><!-- column -->
        <div><input name="telefono" type="text"  class="colelem" id="u342" placeholder="Ejem. 55555555"></div>
        <div ><input name="correo_p" type="text" class="colelem" id="u343" placeholder="ejemplo@ejemplo.com"></div>
        <div ><input name="ingreso_anual" type="text"  class="colelem" id="u344" placeholder="Ejem. 999.99"></div>
       </div>
       <div class="clearfix grpelem" id="pu346-4"><!-- column -->
        <div class="clearfix colelem" id="u346-4"><!-- content -->
         <p>Empleados</p>
        </div>
        <div class="clearfix colelem" id="u347-4"><!-- content -->
         <p>Correo secundario</p>
        </div>
       </div>
       <div class="clearfix grpelem" id="pu350"><!-- column -->
        <div><input name="empleado" type="text"  class="colelem" id="u350"></div>
        <div><input name="correo_s" type="text" class="colelem" id="u351" placeholder="ejemplo@ejemplo.com"></div>
       </div>
       <div class="clearfix grpelem" id="pu354-4"><!-- column -->
        <div class="clearfix colelem" id="u354-4"><!-- content -->
         <p>Tipo</p>
        </div>
        <div class="clearfix colelem" id="u355-4"><!-- content -->
         <p>Asignado a</p>
        </div>
       </div>
       <div class="clearfix grpelem" id="pu358"><!-- column -->
        <div>
        	<select name="tipo_i" class="colelem" id="u358" onchange="cambio3(this)">
				<option value="null">--Seleccionar--</option>
				<%while (rss.next()) {
 				%>
				<option value="<%=rss.getInt("ID_TIPO")%>"><%=rss.getString("NOMBRE") %></option>
				<%}
					
				%>
			</select>
		</div>
        <div>
        	<select name="asiganado_a" class="colelem" id="u359" onchange="cambio4(this)">
				<option value="null">--Seleccionar--</option>
				<%while (r.next()) {
 				%>
				<option value="<%=r.getInt("ID_CONTACTO")%>"><%=r.getString("NOMBRE_CONTACTO")+" "+ r.getString("APELLIDO") %></option>
				<%}
					
				%>
			</select>
		</div>
       </div>
      </div>
     </div>
     <div class="grpelem" id="u289"><!-- simple frame --></div>
     <div class="clip_frame grpelem" id="u303"><!-- image -->
      <img class="block" id="u303_img" src="images/punta_baja.png" alt="" width="22" height="11"/>
     </div>
     <div class="clearfix grpelem" id="u334-4"><!-- content -->
      <p>Nombre de la organización</p>
     </div>
     <div><input name="nombre_organizacion" type="text"  class="grpelem" id="u341"></div>
     <div class="clearfix grpelem" id="u345-4"><!-- content -->
      <p>Sitio Web</p>
     </div>
     <div ><input name="sitio_web" type="text" class="grpelem" id="u349" placeholder="www.ejemplo.com"></div>
     <div class="clearfix grpelem" id="u353-4"><!-- content -->
      <p>Industria</p>
     </div>
     	<div >
     		<select name="nombre_industria" class="grpelem" id="u357" onchange="cambio5(this)">
				<option value="null">--Seleccionar--</option>
     			<% while (rs.next()) {
 				%>
				<option value="<%=rs.getInt("ID_INDUSTRIA")%>"><%=rs.getString("NOMBRE") %></option>
				<%}
					conn.close();
				%>
			</select>
			  
		</div>
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
         <p>Dirección de facturación</p>
        </div>
        <div><textarea name="direccion_f" cols="20" rows="5" class="grpelem" id="u365" placeholder="Direccion"></textarea></div>
       </div>
       <div class="clearfix colelem" id="pu363-4"><!-- group -->
        <div class="clearfix grpelem" id="u363-4"><!-- content -->
         <p>Ciudad</p>
        </div>
        <div><input name="ciudad_f" type="text"  class="grpelem" id="u367" placeholder="Cuidad"></div>
        <div class="clearfix grpelem" id="u386-4"><!-- content -->
         <p>Ciudad</p>
        </div>
        <div><input name="ciudad_e" type="text" class="grpelem" id="u389" placeholder="Cuidad"></div>
       </div>
       <div class="clearfix colelem" id="pu364-4"><!-- group -->
        <div class="clearfix grpelem" id="u364-4"><!-- content -->
         <p>Estado.</p>
        </div>
        <div><input name="estado_f" type="text"  class="grpelem" id="u368" placeholder="Estado"></div>
        <div class="clearfix grpelem" id="u387-4"><!-- content -->
         <p>Estado.</p>
        </div>
        <div><input name="estado_e" type="text"  class="grpelem" id="u390" placeholder="Estado"></div>
       </div>
       <div class="clearfix colelem" id="pu381-4"><!-- group -->
        <div class="clearfix grpelem" id="u381-4"><!-- content -->
         <p>C.P.</p>
        </div>
        <div><input name="cp_f" type="text"  class="grpelem" id="u382" placeholder="Ejem. 55555"></div>
        <div class="clearfix grpelem" id="u391-4"><!-- content -->
         <p>C.P.</p>
        </div>
        <div><input name="cp_e" type="text"  class="grpelem" id="u392" placeholder="Ejem. 55555"></div>
       </div>
       <div class="clearfix colelem" id="pu383-4"><!-- group -->
        <div class="clearfix grpelem" id="u383-4"><!-- content -->
         <p>País.</p>
        </div>
        <div><input name="pais_f" type="text"  class="grpelem" id="u384" placeholder="Pais"></div>
        <div class="clearfix grpelem" id="u393-4"><!-- content -->
         <p>País.</p>
        </div>
        <div><input name="pais_e" type="text"  class="grpelem" id="u394" placeholder="Pais"></div>
       </div>
      </div>
     </div>
     <div class="clip_frame grpelem" id="u331"><!-- image -->
      <img class="block" id="u331_img" src="images/punta_baja.png" alt="" width="22" height="11"/>
     </div>
     <div class="clearfix grpelem" id="u385-4"><!-- content -->
      <p>Dirección de envío</p>
     </div>
     <div><textarea cols="20" rows="5" name="direccion_e" class="grpelem" id="u388" placeholder="Direccion"></textarea></div>
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
       <div><textarea name="descripcion" cols="20" rows="5" class="colelem" id="u402"></textarea></div>
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
  		<input name="id_org" type="text">
    	<input id="submit" type="submit" value="Guardar">
  	 </div>
  </form>
  
   </body>
</html>
