package com.musica.web.model;

public class Card {
	private String card_number;
	private int cvv;
	private int exp_month;
	private int exp_yr;
	
	public Card(String card_number, int cvv, int exp_month, int exp_yr) {
		super();
		this.card_number = card_number;
		this.cvv = cvv;
		this.exp_month = exp_month;
		this.exp_yr = exp_yr;
	}
	
	public int getExp_month() {
		return exp_month;
	}

	public void setExp_month(int exp_month) {
		this.exp_month = exp_month;
	}

	public int getExp_yr() {
		return exp_yr;
	}

	public void setExp_yr(int exp_yr) {
		this.exp_yr = exp_yr;
	}

	public String getCard_number() {
		return card_number;
	}
	
	public void setCard_number(String card_number) {
		this.card_number = card_number;
	}
	
	public int getCvv() {
		return cvv;
	}
	
	public void setCvv(int cvv) {
		this.cvv = cvv;
	}
	
}
