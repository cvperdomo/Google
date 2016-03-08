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

@SuppressWarnings("serial")
public class UpdateOrganizacion extends HttpServlet {
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
	    	Connection conn = DriverManager.getConnection(url);
	    	ResultSet rs = null;
	    	 int r,rd; 
	    	 int id_direccion;
	      try {
	    	  /*id_organizacion*/
	    	  r= Integer.parseInt(req.getParameter("id_org"));
	    	  String nombre = req.getParameter("nombre_organizacion");
	    	  String id_industria = req.getParameter("nombre_industria");
	          String id_tipo = req.getParameter("tipo_i");
	          String id_contacto =  req.getParameter("asiganado_a");
	    	  
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
	          
	          
	          PreparedStatement selectDir = conn.prepareStatement("Select id_direccion From organizacion where id_organizacion = ?");
	          selectDir.setInt(1, r);
	          selectDir.executeQuery();
	          id_direccion = rs.getInt(1);
	        		        
	        		        System.out.println("--"+id_direccion+"---");
	        		        PreparedStatement updateDir = conn.prepareStatement("UPDATE direccion SET DIRECCION_F = ? WHERE id_direccion = ?");
	        		        updateDir.setString(1, direccion_f);
	        		        updateDir.setInt(2, id_direccion);
	        		        updateDir.executeUpdate();
	          
	          
	    	  /*query delete*/
	           String statement = "UPDATE organizacion SET nombre_organizacion = ? , id_industria = ?, id_tipo = ?, id_contacto=?  WHERE id_organizacion = ?";
	           PreparedStatement stmt = conn.prepareStatement(statement);
	           stmt.setString(1, nombre);
	           stmt.setString(2, id_industria);
	           stmt.setString(3, id_tipo);
	           stmt.setString(4, id_contacto);
	           stmt.setInt(5, r);
	           stmt.executeUpdate();
	           conn.commit();
	          out.println(
	        		  "<html><head></head><body>"+"Espere un momento por favor, se esta precesando su solicitud"+"<br></body></html>");
	      } finally {
	        conn.close();
	      }
	    } catch (SQLException e) {
	      e.printStackTrace();
	    }
	    resp.setHeader("Refresh", "2; url=/informacion_organizacion.jsp");
	  }
        
}
