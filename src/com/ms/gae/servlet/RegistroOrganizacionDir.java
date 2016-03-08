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
public class RegistroOrganizacionDir extends HttpServlet {
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
		    	Connection conn = DriverManager.getConnection(url);
		    	ResultSet rs = null;

	      try {
	          conn.setAutoCommit(false);
	          /*Datos de direccion*/
	          String direccion_f= req.getParameter("direccion_f");
	          String ciudad_f= req.getParameter("ciudad_f");
	          String estado_f= req.getParameter("estado_f");
	          String cp_f= req.getParameter("cp_f");
	          String pais_f= req.getParameter("pais_f");
	          String direccion_e= req.getParameter("direccion_e");
	          String ciudad_e= req.getParameter("ciudad_e");
	          String estado_e= req.getParameter("estado_e");
	          String cp_e= req.getParameter("cp_e");
	          String pais_e= req.getParameter("pais_e");
	          /*Datos de Industria y Contacto*/
	          String id_industria = req.getParameter("nombre_industria");
	          String id_tipo = req.getParameter("tipo_i");
	          String id_contacto =  req.getParameter("asiganado_a");
	          /*Datos de organizacion*/
	          String nombre_organizacion= req.getParameter("nombre_organizacion");
	          String sitio_web 	= req.getParameter("sitio_web");
	          String telefono 	= req.getParameter("telefono");
	          String empleado = req.getParameter("empleado");
	          String correo_p = req.getParameter("correo_p");
	          String correo_s = req.getParameter("correo_s");
	          String ingreso_anual = req.getParameter("ingreso_anual");
	          String descripcion = req.getParameter("descripcion");
	          
	          /*query para industria*/
	          PreparedStatement consultaIndustria = conn.prepareStatement("SELECT nombre FROM industria WHERE id_industria = ? ");
	          /*query para tipo*/
	          PreparedStatement consultaTipo = conn.prepareStatement("SELECT nombre FROM tipo WHERE id_tipo = ?");
	          /*query para asigandoA-contacto*/
	          PreparedStatement consultaContacto = conn.prepareStatement("SELECT nombre_contacto FROM contacto WHERE id_contacto = ?");
	          /*query insert organizacion*/
	          PreparedStatement insertTable1 = conn.prepareStatement("INSERT INTO direccion(DIRECCION_F , CIUDAD_F, ESTADO_F, CP_F, PAIS, DIRECCION_E, CIUDAD_E, ESTADO_E, CP_E, PAIS_E) VALUES(? , ? , ? , ? , ? , ? , ? , ? , ? , ?)",Statement.RETURN_GENERATED_KEYS);
	          		// UN PARAMETRO POR EL ID DE DIRECCION
		          insertTable2 = conn.prepareStatement("INSERT INTO organizacion (ID_DIRECCION, id_industria, id_tipo, id_contacto, nombre_organizacion, sitio_web, telefono, empleado , correo_p, correo_s, ingreso_anual, descripcion) VALUES( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ?)");
		          
		          
		          
		          /*consulta industria*/
		      	  consultaIndustria.setString(1, id_industria);
		          consultaIndustria.executeQuery();
		          /*consulta tipo*/
		          consultaTipo.setString(1, id_tipo);
		          consultaTipo.executeQuery();
		          /*consulta contacto*/
		          consultaContacto.setString(1, id_contacto);
		          consultaContacto.executeQuery();
		          
		          /*inser direccion*/
		          insertTable1.setString(1,direccion_f);
		          insertTable1.setString(2,ciudad_f);
		          insertTable1.setString(3,estado_f);
		          insertTable1.setString(4,cp_f);
		          insertTable1.setString(5,pais_f);
		          insertTable1.setString(6,direccion_e);
		          insertTable1.setString(7,ciudad_e);
		          insertTable1.setString(8,estado_e);
		          insertTable1.setString(9,cp_e);
		          insertTable1.setString(10,pais_e);
		          result = insertTable1.executeUpdate();
		          
		          rs = insertTable1.getGeneratedKeys();
		          if (rs.next()) {
		        	  id_dir1 = rs.getLong(1);
		          }
		          
		          /*insert organizacion*/
		          insertTable2.setLong(1,id_dir1);
		          insertTable2.setString(2, id_industria);
		          insertTable2.setString(3, id_tipo);
		          insertTable2.setString(4, id_contacto);
		          insertTable2.setString(5,nombre_organizacion);
		          insertTable2.setString(6, sitio_web);
		          insertTable2.setString(7, telefono);
		          insertTable2.setString(8, empleado);
		          insertTable2.setString(9, correo_p);
		          insertTable2.setString(10, correo_s);
		          insertTable2.setString(11, ingreso_anual);
		          insertTable2.setString(12, descripcion);
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
	    resp.setHeader("Refresh", "25; url=/informacion_organizacion.jsp");
	  }
        
}
