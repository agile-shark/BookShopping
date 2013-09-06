package com.shxt.model;

import java.util.Date;

public class UserInfo {
	private int userid;
	private String username;
	private String userpass;
	private String useremail;
	private String userimage;
	private String userphone;
	private String userqq;
	private Date registdate;
	private String passquestion;
	private String passanswer;
	private String sendaddress;
	private String bestsendgoodstime;
	private String userpostcode;
	private String userhothouse;
	private String user_integration;
	private String usersex;
	
	public void setRegistdate(Date registdate) {
		this.registdate = registdate;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String password) {
		this.userpass = password;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getUserimage() {
		return userimage;
	}
	public void setUserimage(String userimage) {
		this.userimage = userimage;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public Date getRegistdate() {
		return registdate;
	}
	public String getPassquestion() {
		return passquestion;
	}
	public void setPassquestion(String passquestion) {
		this.passquestion = passquestion;
	}
	public String getPassanswer() {
		return passanswer;
	}
	public void setPassanswer(String passanswer) {
		this.passanswer = passanswer;
	}
	public String getSendaddress() {
		return sendaddress;
	}
	public void setSendaddress(String sendaddress) {
		this.sendaddress = sendaddress;
	}
	public String getBestsendgoodstime() {
		return bestsendgoodstime;
	}
	public void setBestsendgoodstime(String bestsendgoodstime) {
		this.bestsendgoodstime = bestsendgoodstime;
	}
	public String getUserpostcode() {
		return userpostcode;
	}
	public void setUserpostcode(String userpostcode) {
		this.userpostcode = userpostcode;
	}
	public String getUserhothouse() {
		return userhothouse;
	}
	public void setUserhothouse(String userhothouse) {
		this.userhothouse = userhothouse;
	}
	public void setUserqq(String userqq) {
		this.userqq = userqq;
	}
	public String getUserqq() {
		return userqq;
	}
	public String getUser_integration() {
		return user_integration;
	}
	public void setUser_integration(String userIntegration) {
		user_integration = userIntegration;
	}
	public String getUsersex() {
		return usersex;
	}
	public void setUsersex(String usersex) {
		this.usersex = usersex;
	}
	
}
