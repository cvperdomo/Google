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
public class EliminarContacto extends HttpServlet {
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
	    	Connection conn = DriverManager.getConnection(url);
	    	 int r; 
	      try {
	    	  /*id_organizacion*/
	    	  r= Integer.parseInt(req.getParameter("id_organizacion"));
	    	  	
	    	  /*query delete*/
	           String statement = "DELETE FROM contacto WHERE id_contacto = ?";
	           PreparedStatement stmt = conn.prepareStatement(statement);
	           stmt.setInt(1, r);
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
	    resp.setHeader("Refresh", "1; url=/contactos.jsp");
	  }
        
}
