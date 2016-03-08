package com.ms.gae.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.utils.SystemProperty;
import com.google.cloud.sql.jdbc.Statement;

@SuppressWarnings("serial")
public class RegistroContactoD  extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws IOException {
		String url = null;
	    try {
	      if (SystemProperty.environment.value() ==
	          SystemProperty.Environment.Value.Production) {
	        Class.forName("com.mysql.jdbc.GoogleDriver");
	        url = "jdbc:google:mysql://msapp-970:test-spring/local?user=root";
	      } else {
	        Class.forName("com.mysql.jdbc.Driver");
	        url = "jdbc:mysql://173.194.110.143:3306/local?user=root";

	      }
	    } catch (Exception e) {
	      e.printStackTrace();
	      return;
	    }
	    

	    PrintWriter out = resp.getWriter();
	    
	    try {
		    	PreparedStatement insertTable2 = null;
		    	int result;
		    	Long id_dir1 = null;
		    	Long id_f = null;
		    	Connection conn = DriverManager.getConnection(url);
		    	ResultSet rs = null;

	      try {
	          conn.setAutoCommit(false);
	          /*Datos de direccion*/
	          String direccion_e= req.getParameter("direccion_e");
	          String ciudad_e= req.getParameter("ciudad_e");
	          String estado_e= req.getParameter("estado_e");
	          String cp_e= req.getParameter("cp_e");
	          String pais_e= req.getParameter("pais_e");
	          /*Datos de organizacion, contacto y fuente*/
	          String id_fuente = req.getParameter("nombre_fuente");
	          String id_organizacion = req.getParameter("nombre_organizacion");
	          String id_contacto = req.getParameter("asignado_a");
	          /*Datos de contacto*/
	          String nombre_contacto= req.getParameter("nombre_contacto");
	          String apellido 	= req.getParameter("apellido");
	          String telefono_oficina 	= req.getParameter("telefono_oficina");
	          String telefono_celular 	= req.getParameter("telefono_celular");
	          String puesto = req.getParameter("puesto");
	          String correo_primario = req.getParameter("correo_primario");
	          String comentario = req.getParameter("comentario");
	          String asignado_a = req.getParameter("asignado_a");
	          /*quey para fuente*/
	          PreparedStatement consultaFuente = conn.prepareStatement("SELECT nombre_fuente FROM fuente WHERE id_fuente = ?");
	          /*query para organizacion*/
	          PreparedStatement consultaOrganizacion = conn.prepareStatement("SELECT nombre_organizacion FROM organizacion WHERE id_organizacion = ?");
	          /*query para ReportarA, contacto*/
	          PreparedStatement consultaContacto = conn.prepareStatement("SELECT nombre_contacto FROM contacto WHERE id_contacto = ?");
	          /*query para AsigndoA, contacto*/
	          
	          PreparedStatement insertTable1 = conn.prepareStatement("INSERT INTO direccion( DIRECCION_E, CIUDAD_E, ESTADO_E, CP_E, PAIS_E) VALUES(? , ? , ? , ? , ? )",Statement.RETURN_GENERATED_KEYS);
	          // UN ? POR EL ID DE DIRECCION
		      insertTable2 = conn.prepareStatement("INSERT INTO contacto (id_direccion, id_fuente, id_organizacion, reportar_a , nombre_contacto, apellido, telefono_oficina, telefono_celular , puesto, correo_primario, comentario, asignado_a) VALUES( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ?)");
		          
		          
		          /*consulta fuente*/
		      	  consultaFuente.setString(1, id_fuente);
		          consultaFuente.executeQuery();
		          /*consulta organizacion*/
		          consultaOrganizacion.setString(1, id_organizacion);
		          consultaOrganizacion.executeQuery();
		          /*consulta contacto-asiganadoA*/
		          consultaContacto.setString(1, id_contacto);
		          consultaContacto.executeQuery();
		          
		          /*insert direccion*/
		          insertTable1.setString(1,direccion_e);
		          insertTable1.setString(2,ciudad_e);
		          insertTable1.setString(3,estado_e);
		          insertTable1.setString(4,cp_e);
		          insertTable1.setString(5,pais_e);
		          result = insertTable1.executeUpdate();
		          
		          rs = insertTable1.getGeneratedKeys();
		          if (rs.next()) {
		        	  id_dir1 = rs.getLong(1);
		          }
		          
		          /*insert contactos*/
		          insertTable2.setLong(1,id_dir1);
		          insertTable2.setString(2, id_fuente);
		          insertTable2.setString(3, id_organizacion);
		          insertTable2.setString(4, id_contacto);
		          insertTable2.setString(5,nombre_contacto);
		          insertTable2.setString(6, apellido);
		          insertTable2.setString(7, telefono_oficina);
		          insertTable2.setString(8, telefono_celular);
		          insertTable2.setString(9, puesto);
		          insertTable2.setString(10, correo_primario);
		          insertTable2.setString(11, comentario);
		          insertTable2.setString(12, asignado_a);
		          insertTable2.executeUpdate();
		          
		          conn.commit();
		          out.println(
		        		  "<html><head></head><body>"+"Se estan procesando sus datos, espero un momento por favor"+"<br></body></html>");
		        
	    
	     } finally {
	    	 conn.close();
	     }
	    } catch (SQLException e) {
	      e.printStackTrace();
	    }
	    resp.setHeader("Refresh", "20; url=/contactos.jsp");
	  }
        
}
