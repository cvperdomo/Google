package com.ms.gae.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;


@SuppressWarnings("serial")
public class GoogleLoginServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
		HttpSession session = request.getSession();
		
		Object attribute = session.getAttribute("userSession");
		//System.out.println("attribute: " + attribute);
		if (attribute != null) {
			response.sendRedirect("successLogin.jsp");
		} else {
		
			response.setContentType("text/html");
			response.getWriter().println("<h2>GAE - Integrating Google user account</h2>");
	 
			if (user != null) {
				session.setAttribute("userSession", user.getEmail());
				response.getWriter().println("Welcome, " + user.getNickname());
				response.getWriter().println(
					"<a href='"
						+ userService.createLogoutURL(request.getRequestURI())
						+ "'> LogOut </a>");
	 
			} else {
	 
				response.getWriter().println(
					"Please <a href='"
						+ userService.createLoginURL(request.getRequestURI())
						+ "'> LogIn </a>"
						+ "<br/><a href=/login>Default Login</a>");
	 
			}
		}
	}
}
