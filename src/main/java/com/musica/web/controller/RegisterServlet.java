package com.musica.web.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.musica.db.dao.Userdbdao;
import com.musica.web.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/views/register")

public class RegisterServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String first_name = request.getParameter("fname");
		String last_name = request.getParameter("lname");
		String gender = request.getParameter("gender");
		String dob = request.getParameter("dob");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		
		User user = new User(first_name, last_name, email, pwd, gender, dob);
		
		Userdbdao dao = new Userdbdao();
		
		try {
			if(dao.registerUser(user)) {
				response.sendRedirect("register_success.jsp");
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("user-exists", true);
				response.sendRedirect("register.jsp");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
