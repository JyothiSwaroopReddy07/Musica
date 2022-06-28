package com.musica.web.model;

public class Product {
	private String name ;
	private int price ;
	private String category ;
	private String descr ;
	private int pid;
	
	public Product(int pid, String name, int price,String category, String descr) {
		super();
		this.pid = pid;
		this.name = name;
		this.price = price;
		this.category = category;
		this.descr = descr;
	}
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
}
