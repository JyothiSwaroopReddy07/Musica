package com.musica.web.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.musica.db.dao.Cartdbdao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/views/remove")
public class RemoveACartItem extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		int pid = Integer.parseInt(request.getParameter("pid"));
		HttpSession session = request.getSession();
		
		Cartdbdao cart = new Cartdbdao();
		try {
			boolean removeItem = cart.removeCartItem(email, pid);
			if(removeItem) {
				session.setAttribute("removedfromcart", "true");
				response.sendRedirect("cart.jsp");
			}else System.out.println("error removing the pid "+ pid);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
