package com.ms.gae.servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.google.appengine.api.utils.SystemProperty;
  
public class LoginDao {  
    public static boolean validate(String name, String pass) {          
        boolean status = false;  
        PreparedStatement pst = null;  
        ResultSet rs = null;  
  
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
        	Connection conn = DriverManager.getConnection(url);
        	pst = conn.prepareStatement("select * from user where nombre=? and password=?");  
            pst.setString(1, name);  
            pst.setString(2, pass);  
  
            rs = pst.executeQuery();  
            status = rs.next();  
  
        } catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (rs != null) {  
                try {  
                    rs.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
        }  
        return status;  
    }
    
    
    public static boolean validate(String pass) {          
        boolean status = false;  
        PreparedStatement pst = null;  
        ResultSet rs = null;  
  
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
        	Connection conn = DriverManager.getConnection(url);
        	pst = conn.prepareStatement("select * from user where password=?");  
            pst.setString(1, pass);  
  
            rs = pst.executeQuery();  
            status = rs.next();  
  
        } catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (rs != null) {  
                try {  
                    rs.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
        }  
        return status;  
    }
    
    
    
}  