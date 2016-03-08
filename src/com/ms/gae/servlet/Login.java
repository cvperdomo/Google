package com.ms.gae.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
  
@SuppressWarnings("serial")
public class Login extends HttpServlet{  
  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)    
            throws ServletException, IOException {    
  
        response.setContentType("text/html");    
        PrintWriter out = response.getWriter();    
          
        String n=request.getParameter("username");    
        String p=request.getParameter("userpass");   
          
        HttpSession session = request.getSession(false);  
        if(session!=null)  
        session.setAttribute("name", n);  
  
        if(LoginDao.validate(n, p)){    
            RequestDispatcher rd=request.getRequestDispatcher("informacion_organizacion.jsp");    
            rd.forward(request,response);    
        }    
        else{    
            out.print("<p style=\"color:red\">Nombre de usuario o password son incorrectos,\n" +"Favor de verificar su informacion.</p>");    
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");    
            rd.include(request,response);    
        }    
  
        out.close();    
    }    
}   