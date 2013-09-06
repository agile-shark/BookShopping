package com.shxt.model;

import java.util.Date;

public class BookOrder {
	private String orderid;
	private String userid;
	private Date orderdate;
	private float sendprice;//配送费用
	private float totalprice;//订单总价
	private String sendaddress;//订单发送的具体地址
	private String sendmode;//货物配送方式
	private String paymode;//货物支付方式
	private int isConfirmed;//是否确认
	private int ispayed;//是否付款
	private int sendstatus;//配送状态
	private int ispackage;//是否要包装
	private int iscard;//是否要贺卡
	
	public int getIspackage() {
		return ispackage;
	}
	public void setIspackage(int ispackage) {
		this.ispackage = ispackage;
	}
	public int getIscard() {
		return iscard;
	}
	public void setIscard(int iscard) {
		this.iscard = iscard;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public float getSendprice() {
		return sendprice;
	}
	public void setSendprice(float sendprice) {
		this.sendprice = sendprice;
	}
	public float getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(float totalprice) {
		this.totalprice = totalprice;
	}
	public String getSendaddress() {
		return sendaddress;
	}
	public void setSendaddress(String sendaddress) {
		this.sendaddress = sendaddress;
	}
	public String getSendmode() {
		return sendmode;
	}
	public void setSendmode(String sendmode) {
		this.sendmode = sendmode;
	}
	public String getPaymode() {
		return paymode;
	}
	public void setPaymode(String paymode) {
		this.paymode = paymode;
	}
	public int getIsConfirmed() {
		return isConfirmed;
	}
	public void setIsConfirmed(int isConfirmed) {
		this.isConfirmed = isConfirmed;
	}
	public int getIspayed() {
		return ispayed;
	}
	public void setIspayed(int ispayed) {
		this.ispayed = ispayed;
	}
	public int getSendstatus() {
		return sendstatus;
	}
	public void setSendstatus(int sendstatus) {
		this.sendstatus = sendstatus;
	}
	
}
