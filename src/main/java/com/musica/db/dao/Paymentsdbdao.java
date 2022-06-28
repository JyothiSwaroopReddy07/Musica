package com.musica.db.dao;

import java.sql.*;
import java.util.ArrayList;

import com.musica.web.model.Card;


public class Paymentsdbdao {
	
	public ArrayList<Card> getAllCards(String email) throws ClassNotFoundException, SQLException {
		
		String query = "SELECT * FROM CARDDATA WHERE EMAIL = ?";
		
		
		ArrayList<Card> cards = new ArrayList<Card>();
		
		Userdbdao db = new Userdbdao();
		Connection con = db.getConnection();
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
				String name = rs.getString(2);
				int cvv = rs.getInt(3);
				int exp_month = rs.getInt(4);
				int exp_yr = rs.getInt(5);
				
				Card c = new Card(name, cvv, exp_month, exp_yr);
				cards.add(c);
		}
		return cards;
	}
	
	public boolean HadCard(String email) throws ClassNotFoundException, SQLException {
		
		String query = "SELECT * FROM CARDDATA WHERE EMAIL = ?";
				
		Userdbdao db = new Userdbdao();
		Connection con = db.getConnection();
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		
		return rs.next();
	}
	
	
	public Card getCard(String email) throws ClassNotFoundException, SQLException {
		
		String query = "SELECT * FROM CARDDATA WHERE EMAIL = ?";
		
		
		Userdbdao db = new Userdbdao();
		Connection con = db.getConnection();
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		String num = rs.getString(2);
		int cvv = rs.getInt(3);
		int exp_month = rs.getInt(4);
		int exp_yr = rs.getInt(5);
		
		Card c = new Card(num, cvv, exp_month, exp_yr);
		return c;
		
	}
	
	
	public boolean addCard(Card c, String email) throws ClassNotFoundException, SQLException {
		
		String query = "INSERT INTO CARDDATA VALUES (?, ?, ?, ?, ?); ";
		
		Userdbdao db = new Userdbdao();
		Connection con = db.getConnection();
		PreparedStatement ps = con.prepareStatement(query);
		
		ps.setString(1, email);
		ps.setString(2, c.getCard_number());
		ps.setInt(3, c.getCvv());
		ps.setInt(4, c.getExp_month());
		ps.setInt(5, c.getExp_yr());
		
		int r = ps.executeUpdate(); 
		
		return r>0;
	}
	
	public boolean removeCard(String email) throws ClassNotFoundException, SQLException {
			
		String query = "DELETE FROM CARDDATA WHERE EMAIL = ?";
		
		Userdbdao db = new Userdbdao();
		Connection con = db.getConnection();
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, email);
		
		int r = ps.executeUpdate(); 
		
		return r>0;
	}
	
}
