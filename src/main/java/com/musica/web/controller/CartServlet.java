package com.musica.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.musica.db.dao.Cartdbdao;
import com.musica.web.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/views/addtocart")
public class CartServlet extends HttpServlet {
    

		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			PrintWriter out = response.getWriter();
			
			if(session.getAttribute("user-data") == null) {
				response.sendRedirect("./unauth-shop.jsp");
				session.setAttribute("addtocart", "login");
			}else {
				String email = (String) session.getAttribute("email");
				int pid = Integer.parseInt(request.getParameter("productid").toString());
				Cartdbdao cartdb = new Cartdbdao();
				
				try {
					boolean addtocart = cartdb.addCartItem(email,pid,1); 
					if(addtocart) {
						response.sendRedirect("./shop.jsp");
						session.setAttribute("addedtocart", "true");
					}else out.println("error while adding to cart");
					
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
			}
		}
	
}
