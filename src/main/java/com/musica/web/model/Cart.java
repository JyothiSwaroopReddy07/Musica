package com.musica.web.model;

public class Cart {
	private String email;
	private int pid;
	private int quantity;
	
	public Cart(String email, int pid,int quantity) {
		super();
		this.email = email;
		this.pid = pid;
		this.quantity = quantity;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
