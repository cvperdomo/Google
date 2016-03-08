package com.ms.gae.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.utils.SystemProperty;
import com.google.cloud.sql.jdbc.Statement;

@SuppressWarnings("serial")
public class UpdateUsuario extends HttpServlet {
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
	    	PreparedStatement statement = null;
	    	Connection conn = DriverManager.getConnection(url);
	    	ResultSet rs = null;
	    	 int r,rd; 
	    	 int id_direccion;
	    	 String password = null;
	      try {
	    	  /*id_organizacion*/
	    	  conn.setAutoCommit(false);
	    	  String nombre = req.getParameter("confirmar_password");
	    	  String password_actual = req.getParameter("password_actual");
	          String nuevo_password = req.getParameter("nuevo_password");
	    	  
	          if(LoginDao.validate( password_actual)){    
	        	  PreparedStatement selectPassword = conn.prepareStatement("SELECT password FROM user WHERE password = ?",Statement.RETURN_GENERATED_KEYS);
	        	  statement = conn.prepareStatement( "UPDATE user SET password= ? where password = ? ");
	        	  
	        	  selectPassword.setString(1, password_actual);
	        	  selectPassword.executeQuery();
	        	  rs = selectPassword.getGeneratedKeys();
	        	  if (rs.next()) {
	        		  password = rs.getString(1);
	        	  }
	        	  
	        	  /*query delete*/
	        	  statement.setString(1, nuevo_password);
	        	  statement.setString(2, password_actual);
	        	  statement.executeUpdate();
	        	  conn.commit();
	        	  out.print("<p style=\"color:red\">Se estan procesando sus datos, espero un momento por favor"+"</p>");
	        	  HttpSession session = req.getSession();
	        	  session.invalidate();
	        	  resp.sendRedirect("index.jsp");
	          }else{
	        	  out.print("<p style=\"color:red\">El password proporcionado no coincide con el registrado,\n" +"Favor de verificar su informacion.</p>");    
	              RequestDispatcher rdd=req.getRequestDispatcher("informacion_user.jsp");    
//	              rdd.include(req,resp);    
	          }
	         
	          
	          
	      } finally {
	        conn.close();
	      }
	    } catch (SQLException e) {
	      e.printStackTrace();
	    }
	    resp.setHeader("Refresh", "3; url=/informacion_user.jsp");
	  }
        
}
