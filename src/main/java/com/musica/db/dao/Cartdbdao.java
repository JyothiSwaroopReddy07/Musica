package com.musica.db.dao;

import java.sql.*;
import java.util.ArrayList;

import com.musica.web.model.Product;


public class Cartdbdao {
	
	public ArrayList<Product> getCartItems(String email) throws ClassNotFoundException, SQLException {
		String pidQuery = "SELECT PID FROM CARTDATA WHERE EMAIL = ?";
		String productQuery = "SELECT * FROM PRODUCTSDATA WHERE PID = ?";
		
		
		ArrayList<Product> cartItems = new ArrayList<Product>();
		
		Userdbdao db = new Userdbdao();
		Connection con = db.getConnection();
		PreparedStatement ps = con.prepareStatement(pidQuery);
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			int pid = rs.getInt(1);
			PreparedStatement prs = con.prepareStatement(productQuery);
			prs.setInt(1, pid);
			ResultSet r = prs.executeQuery();
			
			if(r.next()) {
				String name = r.getString(2);
				int price = r.getInt(3);
				String category = r.getString(4);
				String desc = r.getString(5);
				
				Product p = new Product(pid, name, price, category, desc);
				cartItems.add(p);
			}
		}
		return cartItems;
	}
	
	public boolean inCart(String email, int pid) throws ClassNotFoundException, SQLException {
		String query = "SELECT * FROM CARTDATA WHERE PID = ? AND EMAIL = ?";
		
		Userdbdao db = new Userdbdao();
		Connection con = db.getConnection();
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1, pid);
		ps.setString(2, email);
		ResultSet r = ps.executeQuery(); 
		
		return r.next();
	}
	
	public boolean addCartItem(String email, int pid,int quantity) throws ClassNotFoundException, SQLException {
		
		String query = "INSERT INTO CARTDATA VALUES (?, ?, ?); ";
		
		Userdbdao db = new Userdbdao();
		Connection con = db.getConnection();
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(2, pid);
		ps.setString(1, email);
		ps.setInt(3, quantity);
		int r = ps.executeUpdate(); 
		
		return r>0;
	}
	
	public boolean removeCartItem(String email, int pid) throws ClassNotFoundException, SQLException {
			
		String query = "DELETE FROM CARTDATA WHERE EMAIL = ? AND PID = ? ; ";
		
		Userdbdao db = new Userdbdao();
		Connection con = db.getConnection();
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(2, pid);
		ps.setString(1, email);
		int r = ps.executeUpdate(); 
		
		return r>0;
	}
	
	public boolean removeCartItems(String email) throws ClassNotFoundException, SQLException {
		
		String query = "DELETE FROM CARTDATA WHERE EMAIL = ?; ";
		
		Userdbdao db = new Userdbdao();
		Connection con = db.getConnection();
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, email);
		int r = ps.executeUpdate(); 
		
		return r>0;
	}
}
