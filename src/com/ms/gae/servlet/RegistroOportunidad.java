package com.ms.gae.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.utils.SystemProperty;

@SuppressWarnings("serial")
public class RegistroOportunidad extends HttpServlet {
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
	        // Load the class that provides the new "jdbc:google:mysql://" prefix.
	        Class.forName("com.mysql.jdbc.GoogleDriver");
	        url = "jdbc:google:mysql://msapp-970:test-spring/local?user=root";
	      } else {
	        // Local MySQL instance to use during development.
	        Class.forName("com.mysql.jdbc.Driver");
	        url = "jdbc:mysql://173.194.110.143:3306/local?user=root";

	        // Alternatively, connect to a Google Cloud SQL instance using:
	        // jdbc:mysql://ip-address-of-google-cloud-sql-instance:3306/guestbook?user=root
	      }
	    } catch (Exception e) {
	      e.printStackTrace();
	      return;
	    }
	    

	    PrintWriter out = resp.getWriter();
	    try {
	    	PreparedStatement insertTable2 = null;
	    	Connection conn = DriverManager.getConnection(url);
	      try {
	    	  conn.setAutoCommit(false);
	    	  /*datos de oportunidad*/
	    	  String nombre_oportunidad= req.getParameter("nombre_oportunidad");
	    	  String organizacion = req.getParameter("organizacion");
	    	  String monto= req.getParameter("monto");
	          String fecha_cierre 	= req.getParameter("fecha_cierre");
	          String probabilidad = req.getParameter("probabilidad");
	          String monto_cast= req.getParameter("monto_cast");
	          String descripcion = req.getParameter("descripcion");
	          /*datos de fuente*/
	          String id_fuente = req.getParameter("fuente_oportunidad");
	          /*datos de tipo*/
	          String id_tipo = req.getParameter("tipo");
	          /*datos de contacto*/
	          String id_contacto = req.getParameter("asiganado_a");
	          
	          /*query select fuente*/
	          PreparedStatement consultaFuenete = conn.prepareStatement("SELECT nombre_fuente FROM fuente WHERE id_fuente = ?");

	          /*query select tipo*/
	          PreparedStatement consultaTip = conn.prepareStatement("SELECT nombre FROM tipo WHERE id_tipo = ? ");
	          
	          /*query select contacto*/
	          PreparedStatement consultaContacto = conn.prepareStatement("SELECT nombre_contacto FROM contacto WHERE id_contacto = ?");
	          
	          /*query insert oportunidad*/
	          insertTable2 = conn.prepareStatement("INSERT INTO oportunidad (id_fuente, id_tipo, id_contacto , nombre_oportunidad,organizacion, monto, fecha_cierre, probabilidad, monto_cast,  descripcion ) VALUES( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? )");
	          
	          
	          
	          /*select fuente*/
	          consultaFuenete.setString(1, id_fuente);
	          consultaFuenete.executeQuery();
	          /*select tipo*/
	          consultaTip.setString(1, id_tipo);
	          consultaTip.executeQuery();
	          /*select contacto*/
	          consultaContacto.setString(1, id_contacto);
	          consultaContacto.executeQuery();
	          
	          /*insert oportunidad*/
	          insertTable2.setString(1, id_fuente);
	          insertTable2.setString(2, id_tipo);
	          insertTable2.setString(3, id_contacto);
	          insertTable2.setString(4, nombre_oportunidad);
	          insertTable2.setString(5, organizacion);
	          insertTable2.setString(6, monto);
	          insertTable2.setString(7, fecha_cierre);
	          insertTable2.setString(8, probabilidad);
	          insertTable2.setString(9, monto_cast);
	          insertTable2.setString(10, descripcion);
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
	    resp.setHeader("Refresh", "13; url=/info_oportunidades.jsp");
	  }
        
}
