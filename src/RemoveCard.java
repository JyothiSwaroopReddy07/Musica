package com.musica.web.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.musica.db.dao.Paymentsdbdao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/views/removecard")
public class RemoveCard extends HttpServlet {
	

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		
		Paymentsdbdao carddb = new Paymentsdbdao();
		try {
			boolean removeItem = carddb.removeCard(email);
			if(removeItem) {
				session.setAttribute("removedcard", "true");
				response.sendRedirect("./views/payment.jsp");
			}else System.out.println("error removing the card details ");
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
