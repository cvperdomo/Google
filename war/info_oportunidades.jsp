<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.google.appengine.api.utils.SystemProperty" %>
<%@ taglib prefix="c" 
           uri="/WEB-INF/tld/c.tld" %>
<!DOCTYPE html>
<html class="html" lang="es-ES">
<head>
  <meta http-equiv="Content-type" content="text/html;charset=UTF-8"/>
  <meta name="generator" content="2015.0.0.309"/>
  <title>MCDS | Oportunidades</title>
  <!-- CSS -->
  <link rel="stylesheet" type="text/css" href="css/site_global.css?4052507572"/>
  <link rel="stylesheet" type="text/css" href="css/master_a-p_g_-maestra.css?126920684"/>
  <link rel="stylesheet" type="text/css" href="css/dos.css?374079320" id="pagesheet"/>
  <script type="text/javascript">
function submit(){
	document.forms["f3"].submit();
}
</script>
   </head>
 <body class="museBGSize">
<form id="f3" action="eliminarOportunidad" method="POST">
  <div class="clearfix" id="page"><!-- column -->
   <div class="position_content" id="page_position_content">
    <div class="clip_frame colelem" id="u208"><!-- image -->
     <img class="block" id="u208_img" src="images/logo.png" alt="" width="185" height="57"/>
    </div>
    <div class="clearfix colelem" id="ppu274-4"><!-- group -->
     <div class="clearfix grpelem" id="u272-4"><!-- content -->
      <p>Inicio</p>
     </div>
     <div class="clearfix grpelem" id="pu274-4"><!-- group -->
      <a class="nonblock nontext MuseLinkActive clearfix grpelem" id="u274-4" href="informacion_organizacion.jsp"><!-- content --><p>Organizaciones</p></a>
      <a class="nonblock nontext museBGSize grpelem" id="u275" href="informacion_organizacion.jsp"><!-- simple frame --></a>
     </div>
     <div class="clearfix grpelem" id="pu278-4"><!-- group -->
      <a class="nonblock nontext MuseLinkActive clearfix grpelem" id="u278-4" href="info_oportunidades.jsp"><!-- content --><p>Oportunidades</p></a>
      <a class="nonblock nontext MuseLinkActive museBGSize grpelem" id="u275" href="info_oportunidades.jsp"><!-- simple frame --></a>
     </div>
     <div class="clearfix grpelem" id="pu282-4"><!-- group -->
      <a class="nonblock nontext MuseLinkActive clearfix grpelem" id="u282-4" href="informacion_user.jsp">
      	<p>Usuario: <%=session.getAttribute("name")%>
      	<%if (session.getAttribute("name") != null && !session.getAttribute("name").equals("")) {
		     } else {
      				response.sendRedirect("index.jsp");
     		}
    	%>
      	</p>
      </a>
      <a href="Logout" class="clearfix grpelem">Logout</a>
      <a class="nonblock nontext museBGSize grpelem" id="u283" href="informacion_user.jsp"></a>
     </div>
     <a class="nonblock nontext museBGSize grpelem" id="u273" href="#"></a>
     <a class="nonblock nontext MuseLinkActive clearfix grpelem" id="u276-4" href="contactos.jsp"><!-- content --><p>Contactos</p></a>
     <a class="nonblock nontext museBGSize grpelem" id="u277" href="contactos.jsp"><!-- simple frame --></a>
     <a class="nonblock nontext MuseLinkActive clearfix grpelem" id="u280-4" href="reporte.jsp"><!-- content --><p>Reportes</p></a>
     <a class="nonblock nontext museBGSize grpelem" id="u281" href="reporte.jsp"><!-- simple frame --></a>
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

Connection conn = DriverManager.getConnection(url);
ResultSet rs = conn.createStatement().executeQuery(
    "SELECT o.NOMBRE_OPORTUNIDAD as oportunidad, o.ORGANIZACION as oportunidad, c.NOMBRE_CONTACTO as contacto, f.NOMBRE_FUENTE as fuente , o.id_oportunidad as oportunidad FROM oportunidad o,contacto c,  fuente f WHERE o.ID_CONTACTO = c.ID_CONTACTO and o.ID_FUENTE = f.ID_FUENTE;");
%>
		
    <div class="colelem" id="pu404"><!-- inclusion -->
     <div id="u404"><!-- simple frame --></div>
     <div class="clearfix" id="pu405-4"><!-- group -->
      <div class="clearfix grpelem" id="u405-4"><!-- content -->
       <p>Oportunidades</p>
      </div>
      <a href="/oportunidad.jsp"> <img class="svg grpelem" id="u535" src="images/mas.svg" width="24" height="23"  alt="Agregar Nueva Organizacion" data-mu-svgfallback="images/mas_poster_.png"/><!-- svg --></a>
      <img class="svg grpelem" id="u540" src="images/back.svg" width="25" height="25" alt="" data-mu-svgfallback="images/back_poster_.png"/><!-- svg -->
      <img class="svg grpelem" id="u543" src="images/next.svg" width="25" height="25" alt="" data-mu-svgfallback="images/next_poster_.png"/><!-- svg -->
     </div>
    </div>
    <table>
    <div class="clearfix colelem" id="ppu406"><!-- group -->
    
    <tr>
     <div class="grpelem" id="pu406"><!-- inclusion -->
      <div id="u406"><!-- simple frame --></div>
      <div class="clearfix" id="pu410-4"><!-- group -->
       <div class="clearfix grpelem" id="u410-4"><!-- content -->
        <p>Nombre</p>
       </div>
      </div>
     </div>
     </tr>
     
     <tr>
     <div class="grpelem" id="pu506"><!-- inclusion -->
      <div id="u506"><!-- simple frame --></div>
      <div class="clearfix" id="pu510-4"><!-- group -->
       <div class="clearfix grpelem" id="u510-4"><!-- content -->
        <p>Contácto Principal</p>
       </div>
      </div>
     </div>
     </tr>
     
     <tr>
     <div class="grpelem" id="pu512"><!-- inclusion -->
      <div id="u512"><!-- simple frame --></div>
      <div class="clearfix" id="pu516-4"><!-- group -->
       <div class="clearfix grpelem" id="u516-4"><!-- content -->
        <p>Organizacion</p>
       </div>
      </div>
     </div>
     </tr>
     
     <tr>
     <div class="grpelem" id="pu518"><!-- inclusion -->
      <div id="u518"><!-- simple frame --></div>
      <div class="clearfix" id="pu522-4"><!-- group -->
       <div class="clearfix grpelem" id="u522-4"><!-- content -->
        <p>Fuente</p>
       </div>
      </div>
     </div>
     </tr>
     <tr>
     <div class="grpelem" id="pu524"><!-- inclusion -->
      <div id="u524"><!-- simple frame --></div>
      <div class="clearfix" id="pu528-3"><!-- group -->
       <div class="clearfix grpelem" id="u528-3"><!-- content -->
        <p>&nbsp;</p>
       </div>
      </div>
     </div>
     </tr>
    </div>
    </table>
    <div class="clearfix colelem" id="pppu507"><!-- group -->
    <div class="grpelem" id="u407"><!-- simple frame --></div>
     <!--div class="grpelem" id="u503">< simple frame></div-->
     <div class="grpelem" id="u513"><!-- simple frame --></div>
     <div class="grpelem" id="u525"><!-- simple frame --></div>
     <div class="clip_frame grpelem" id="u526"><!-- image -->
      <img class="block" id="u526_img" src="images/punta_baja.png" alt="" width="21" height="11"/>
     </div>
     <div class="clip_frame grpelem" id="u563"><!-- image -->
      <img class="block" id="u563_img" src="images/punta_baja.png" alt="" width="21" height="11"/>
     </div>
     <div class="clip_frame grpelem" id="u408"><!-- image -->
      <img class="block" id="u408_img" src="images/punta_baja.png" alt="" width="21" height="11"/>
     </div>
     <div class="clip_frame grpelem" id="u514"><!-- image -->
      <img class="block" id="u514_img" src="images/punta_baja.png" alt="" width="21" height="11"/>
     </div>
     <!-- Termine img punta -->
     
     <table >
     <%
	while (rs.next()) {
 	%>
    	<tr>
    		<td >
    			<div class="grpelem" id="pu406"><!-- inclusion -->
     			 <div id="u406"><!-- simple frame --></div>
     			  <div class="clearfix" id="pu410-4"><!-- group -->
       			  <div class="clearfix grpelem" id="u410-4"><!-- content -->
        			<p><%= rs.getString(1)%></p>
       			  </div>
      			 </div>
     			</div>
    		</td>
           	
           	<td >
           	<div class="grpelem" id="pu506"><!-- inclusion -->
      <div id="u506"><!-- simple frame --></div>
      <div class="clearfix" id="pu510-4"><!-- group -->
       <div class="clearfix grpelem" id="u510-4"><!-- content -->
        <p><%= rs.getString(3)%></p>
       </div>
      </div>
     </div>
           	</td>
     <td>
     <div class="grpelem" id="pu512"><!-- inclusion -->
      <div id="u512"><!-- simple frame --></div>
      <div class="clearfix" id="pu516-4"><!-- group -->
       <div class="clearfix grpelem" id="u516-4"><!-- content -->
        <p><%= rs.getString(2)%></p>
       </div>
      </div>
     </div>
     </td>         	
     <td>
     <div class="grpelem" id="pu518"><!-- inclusion -->
      <div id="u518"><!-- simple frame --></div>
      <div class="clearfix" id="pu522-4"><!-- group -->
       <div class="clearfix grpelem" id="u522-4"><!-- content -->
        <p><%= rs.getString(4)%></p>
       </div>
      </div>
     </div>
     </td>          	
     <td>
     <div class="grpelem" id="pu560"><!-- inclusion -->
      <div id="u560"><!-- simple frame --></div>
      <input name="id_oportunidad" type="text" value="<%=rs.getInt(5)%>" style="display: none;">
       <a href="javascript:submit()"> <img class="svg grpelem" id="u553" src="images/rest.svg" width="36" height="25" alt="" data-mu-svgfallback="images/rest_poster_.png"/><!-- svg --></a>
     </div>
     </td>
     
     <td>
     <div class="grpelem" id="pu505"><!-- inclusion -->
      <div id="u505"><!-- simple frame --></div>
       <a href="#"> <img class="svg grpelem" id="u550" src="images/lapiz.svg" width="36" height="25" alt="" data-mu-svgfallback="images/lapiz_poster_.png"/><!-- svg --></a>
     </div>
     </td>          	
            </tr>
      <%
}
conn.close();
%>
     </table>
    </div>
    <div class="verticalspacer"></div>
   
   </div>
  <div class="preload_images">
   <img class="preload" src="images/boton_menu-activo.png" alt=""/>
   <img class="preload" src="images/boton_menu-hover.png" alt=""/>
   <img class="preload" src="images/boton_menu-normal.png" alt=""/>   
  </div>
  </div>
  </form>
   </body>
</html>
