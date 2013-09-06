package com.shxt.model;

public class BookCar {
	private String orderid;
	private String bookid;
	private String bookname;
	private int bookbuynum;
	private float booktotalprice;
	private String booktype;
	
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getBooktype() {
		return booktype;
	}
	public void setBooktype(String booktype) {
		this.booktype = booktype;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public int getBookbuynum() {
		return bookbuynum;
	}
	public void setBookbuynum(int bookbuynum) {
		this.bookbuynum = bookbuynum;
	}
	public float getBooktotalprice() {
		return booktotalprice;
	}
	public void setBooktotalprice(float booktotalprice) {
		this.booktotalprice = booktotalprice;
	}
	
}
