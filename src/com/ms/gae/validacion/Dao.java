package com.ms.gae.validacion;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.google.appengine.api.utils.SystemProperty;

public class Dao {
    String url = null;
//    ResultSet rs = null;
    
    //Conectar a la Base de datos
    public void conectar() throws SQLException,ClassNotFoundException{
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
    }
    //Connection conn = DriverManager.getConnection(url);
    
    //Metodo para consultar si un email y contraseñan pertenecen a una cuenta registrada
    public boolean isAcountExists(String correo, String password) throws SQLException{
    	this.url = null;
    	Connection conn = DriverManager.getConnection(url);
    	PreparedStatement sql = conn.prepareStatement( "SELECT * FROM usuario WHERE correo='"+correo+"' AND password='"+password+"'");
    	ResultSet rs = sql.executeQuery();
        return rs.next();
    }
    
    //Metodo para consultar si el email recibido ya esta registrado
    public boolean isEmailRegistered(String correo) throws SQLException{
    	try {
	    	Connection conn = DriverManager.getConnection(url);
	    	ResultSet rs = null;
	    	try{
			    	this.url = null;
			    	PreparedStatement sql = conn.prepareStatement("SELECT * FROM usuario WHERE email='"+correo+"'");
			        rs = sql.executeQuery();
			        return rs.next();
	    	 } finally {
		    	 conn.close();
		     }
		    } catch (SQLException e) {
		      e.printStackTrace();
		    }
    	return true;
    	
		  }
    
    
    //Metodo para registrar una cuenta
//    public void registerUser(String correo, String password, String nombre) throws SQLException{
//        String sql = "INSERT INTO `usuarios`(`email`,`password`,`name`) VALUES ('"+email+"','"+password+"','"+name+"')";
//        PreparedStatement ps = conexion.prepareStatement(sql);
//        ps.executeUpdate();
//    }
    

    
}