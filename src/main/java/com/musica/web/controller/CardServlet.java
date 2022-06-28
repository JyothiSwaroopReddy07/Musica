package com.musica.web.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.musica.db.dao.Paymentsdbdao;
import com.musica.web.model.Card;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/views/addcard")

public class CardServlet extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String card_number = request.getParameter("card_num");
		int cvv = Integer.parseInt(request.getParameter("cvv"));
		int exp_month = Integer.parseInt(request.getParameter("exp_month"));
		int exp_yr = Integer.parseInt(request.getParameter("exp_yr"));
		
		Card c = new Card(card_number, cvv, exp_month, exp_yr); 
		
		Paymentsdbdao cards = new Paymentsdbdao();
		
		try {
			boolean addcard = cards.addCard(c, email);
			if(addcard) {
				response.sendRedirect("./payment_successful.jsp");
				session.setAttribute("addcard", "true");
			}else {
				System.out.println("error adding card");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

}
