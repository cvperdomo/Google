<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.google.appengine.api.utils.SystemProperty" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" 
           uri="/WEB-INF/tld/c.tld" %>
<!DOCTYPE html>
<html class="html" lang="es-ES">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MCDS | Organizaciones</title>
	<script type="text/javascript" language="javascript" src="scripts/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" language="javascript" src="scripts/jquery.dataTables.min.js"></script>

	<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css">
	<link rel="stylesheet" type="text/css" href="css/site_global.css"/>
	<link rel="stylesheet" type="text/css" href="css/master_a-p_g_-maestra.css"/>
	<link rel="stylesheet" type="text/css" href="css/dos.css" id="pagesheet"/>


<style type="text/css" class="init">
	tfoot input {
		width: 100%;
		padding: 3px;
		box-sizing: border-box;
	}

	</style>
<script type="text/javascript" class="init">

$(document).ready(function() {
    // Setup - add a text input to each footer cell
    $('#example tfoot th').each( function () {
        var title = $('#example thead th').eq( $(this).index() ).text();
        $(this).html( '<input type="text" placeholder="'+title+'" />' );
    } );
 
    // DataTable
    var table = $('#example').DataTable();
 
    // Apply the search
    table.columns().every( function () {
        var that = this;
 
        $( 'input', this.footer() ).on( 'keyup change', function () {
            that
                .search( this.value )
                .draw();
        } );
    } );
} );


</script>

</head>
<body class="museBGSize">


<form id="f1" action="eliminarOrganizacion" method="POST">
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
      <a class="nonblock nontext MuseLinkActive museBGSize grpelem" id="u275" href="informacion_organizacion.jsp"><!-- simple frame --></a>
     </div>
     <div class="clearfix grpelem" id="pu278-4"><!-- group -->
      <a class="nonblock nontext MuseLinkActive clearfix grpelem" id="u278-4" href="info_oportunidades.jsp"><!-- content --><p>Oportunidades</p></a>
      <a class="nonblock nontext museBGSize grpelem" id="u279" href="info_oportunidades.jsp"><!-- simple frame --></a>
     </div>
     <div class="clearfix grpelem" id="pu282-4"><!-- group -->
      <!--a class="nonblock nontext MuseLinkActive clearfix grpelem" id="u282-4" href="#"><p>Usuario</p></a-->
      <!--a class="nonblock nontext museBGSize grpelem" id="u283" href="#"></a-->
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
    "SELECT e.id_organizacion as organizacion, e.NOMBRE_ORGANIZACION AS organizacion, e.TELEFONO AS organizacion , j.NOMBRE_CONTACTO AS contacto  FROM organizacion e, contacto j WHERE e.ID_CONTACTO  = j.ID_CONTACTO;");
%>
<div class="colelem" id="pu404"><!-- inclusion -->
     <div id="u404"><!-- simple frame --></div>
     <div class="clearfix" id="pu405-4"><!-- group -->
      <div class="clearfix grpelem" id="u405-4"><!-- content -->
       <p>AGREGAR ORGANIZACIÓN</p>
      </div>
      <a href="/organizacion.jsp"> <img class="svg grpelem" id="u535" src="images/mas.svg" width="24" height="23"  alt="Agregar Nueva Organizacion" data-mu-svgfallback="images/mas_poster_.png"/><!-- svg --></a>
      <img class="svg grpelem" id="u540" src="images/back.svg" width="25" height="25" alt="" data-mu-svgfallback="images/back_poster_.png"/><!-- svg -->
      <img class="svg grpelem" id="u543" src="images/next.svg" width="25" height="25" alt="" data-mu-svgfallback="images/next_poster_.png"/><!-- svg -->
     </div>
    </div>

<table id="example" class="display" cellspacing="0" >
        <thead>
            <tr>
                <th>
                	<div class="grpelem" id="pu406"><!-- inclusion -->
	     			<div id="u406"><!-- simple frame --></div>
	     			 <div class="clearfix" id="pu410-4"><!-- group -->
	       			  <div class="clearfix grpelem" id="u410-4"><!-- content -->
       			  		Nombre
	       			  </div>
	      			 </div>
	     			</div>
       			 </th>
                 <th>
                 <div class="grpelem" id="pu506"><!-- inclusion -->
			      <div id="u506"><!-- simple frame --></div>
			      <div class="clearfix" id="pu510-4"><!-- group -->
			       <div class="clearfix grpelem" id="u510-4"><!-- content -->
                 		Contácto Principal
              		</div>
			      </div>
			     </div>
                 </th>
                <th>
                 <div class="grpelem" id="pu512"><!-- inclusion -->
      <div id="u512"><!-- simple frame --></div>
      <div class="clearfix" id="pu516-4"><!-- group -->
       <div class="clearfix grpelem" id="u516-4">
                Teléfono principal
                </div>
      </div>
     </div>
                </th>
                <th>
                <div class="grpelem" id="pu518"><!-- inclusion -->
      <div id="u518"><!-- simple frame --></div>
      <div class="clearfix" id="pu522-4"><!-- group -->
       <div class="clearfix grpelem" id="u522-4"><!-- content -->
                Asiganado a
                 </div>
      </div>
     </div>
                </th>
                <th><div class="grpelem" id="pu524"><!-- inclusion -->
      <div id="u524"><!-- simple frame --></div>
      <div class="clearfix" id="pu528-3"><!-- group -->
       <div class="clearfix grpelem" id="u528-3"><!-- content -->
        <p>&nbsp;</p>
       </div>
      </div>
     </div></th>
                <th></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th>
                <div class="grpelem" id="pu406"><!-- inclusion -->
	     			<div id="u406"><!-- simple frame --></div>
	     			 <div class="clearfix" id="pu410-4"><!-- group -->
	       			  <div class="clearfix grpelem" id="u410-4"><!-- content -->
	       			  Nombre
	       				</div>
	      			 </div>
	     			</div>	  
	       		</th>
                <th>Contácto Principal</th>
                <th>Teléfono principal</th>
                <th>Asiganado a</th>
                <th></th>
                <th></th>
            </tr>
        </tfoot>
 
        <tbody>
         <%
			while (rs.next()) {
				int id = rs.getInt(1);
 	%>
            <tr>
                <td><div class="grpelem" id="pu406"><!-- inclusion -->
     			 <div id="u406"><!-- simple frame --></div>
     			  <div class="clearfix" id="pu410-4"><!-- group -->
       			  <div class="clearfix grpelem" id="u410-4"><!-- content -->
                <%= rs.getString(2)%>
                 </div>
      			 </div>
     			</div></td>
                <td><div class="grpelem" id="pu506"><!-- inclusion -->
      <div id="u506"><!-- simple frame --></div>
      <div class="clearfix" id="pu510-4"><!-- group -->
       <div class="clearfix grpelem" id="u510-4"><!-- content -->
       </div>
      </div>
     </div>
     </td>
                <td>
                <div class="grpelem" id="pu512"><!-- inclusion -->
      <div id="u512"><!-- simple frame --></div>
      <div class="clearfix" id="pu516-4"><!-- group -->
       <div class="clearfix grpelem" id="u516-4"><!-- content -->
       <%= rs.getString(3)%>
       </div>
      </div>
     </div>
       </td>
                <td>
                <div class="grpelem" id="pu518"><!-- inclusion -->
      <div id="u518"><!-- simple frame --></div>
      <div class="clearfix" id="pu522-4"><!-- group -->
       <div class="clearfix grpelem" id="u522-4"><!-- content -->
       <%= rs.getString(4)%>
        </div>
      </div>
     </div>
       </td>
                <td>
			     <div class="grpelem" id="pu560"><!-- inclusion -->
			      <div id="u560"><!-- simple frame --></div>
			      <input name="id_organizacion" type="text" value="<%=rs.getInt(1)%>" style="display: none;">
			       <a href="javascript:submit()"><img class="svg grpelem" id="u553" src="images/rest.svg" width="36" height="25" alt="" data-mu-svgfallback="images/rest_poster_.png"/><!-- svg --></a>
			     </div>
     			</td>
     		    <td>
			     <div class="grpelem" id="pu505"><!-- inclusion -->
			      <div id="u505"><!-- simple frame --></div>
			      <input name="id_organizacion" type="text" value="<%=rs.getInt(1)%>" style="display: none;">
			      <!--input id="submit" type="submit" value="Eliminar" style="z-index: 102;"-->
			       <a href="update_organizacion.jsp?<%=id%>"> <img class="svg grpelem" id="u550" src="images/lapiz.svg" width="36" height="25" alt="" data-mu-svgfallback="images/lapiz_poster_.png"/></a>
			     </div>
     			</td>
            </tr>
            <%
			}
			conn.close();
			%>
            
        </tbody>
    </table>
  </div>
    <div class="verticalspacer"></div>
  </div>
  <div class="preload_images">
   <img class="preload" src="images/boton_menu-activo.png" alt=""/>
   <img class="preload" src="images/boton_menu-hover.png" alt=""/>
   <img class="preload" src="images/boton_menu-normal.png" alt=""/>   
  </div>
</form>
</body>
</html>