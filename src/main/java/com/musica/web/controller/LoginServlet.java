package com.musica.web.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.musica.db.dao.Userdbdao;
import com.musica.web.model.User;

@WebServlet("/views/login")

public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		HttpSession session = request.getSession();
		session.setAttribute("authStatus", "false");
		
		Userdbdao dao = new Userdbdao();
		User validuser = null;
		
		try {
			validuser = dao.validate(email, pwd); 
		
			if(validuser != null) {
				session.setAttribute("authStatus", "true");
				session.setAttribute("user-data", validuser);
				session.setAttribute("email", validuser.getEmail());
				
				response.sendRedirect("home.jsp");
			} else {
				response.sendRedirect("login.jsp");
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
