package com.musica.db.dao;

import java.sql.*;

import com.musica.web.model.User;

public class Userdbdao {
	
	private String DBUSERNAME = "root";
	private String DBPWD = "mysql@07";
	private String DBURL = "jdbc:mysql://localhost:3306/musicadb";
	private String DBDRIVER = "com.mysql.cj.jdbc.Driver";
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName(DBDRIVER);
		Connection con = DriverManager.getConnection(DBURL, DBUSERNAME, DBPWD);
		return con;
	}
	
		
	public User validate(String email, String pwd) throws ClassNotFoundException, SQLException {
		
		String query = "SELECT * FROM USERDATA WHERE EMAIL = ? AND PWD = ? ;";
		
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, email);
		ps.setString(2, pwd);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			String dbemail = rs.getString(1);
			String dbpwd = rs.getString(2);
			String dbfn = rs.getString(3);
			String dbln = rs.getString(4);
			String dbdob = rs.getString(5);
			String dbgender = rs.getString(6);
			User validuser = new User(dbfn, dbln, dbemail, dbpwd, dbgender, dbdob);
			return validuser;
		}
			
		return null;
	}
	
	public boolean alreadyAUser(String email) throws ClassNotFoundException, SQLException{
		String query = "SELECT * FROM USERDATA WHERE EMAIL = ?" ;
		
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		
		return rs.next();
	}
	
	
	public boolean registerUser(User user) throws ClassNotFoundException, SQLException {
		
		String query = "INSERT INTO USERDATA (EMAIL, PWD, FIRST_NAME, LAST_NAME, DOB, GENDER) VALUES (?, ?, ?, ?, ?, ?) ;" ;
		
		String email = user.getEmail();
		String pwd = user.getPwd();
		String first_name = user.getFirst_name();
		String last_name = user.getLast_name();
		String dob = user.getDob();
		String gender = user.getGender();
		
		if(alreadyAUser(email)) return false;
		else {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, pwd);
			ps.setString(3, first_name);
			ps.setString(4, last_name);
			ps.setString(5, dob);
			ps.setString(6, gender);
			
			int ra = ps.executeUpdate();
			
			return ra>0 ;
		}
		
	}

	
}
