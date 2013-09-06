package com.shxt.model;

import java.util.Date;

public class Evaluation {
	private int evaid;
	private String bookid;
	private String userid;
	private String username;
	private String evacontent;
	private String evatitle;
	private Date evadate;
	private String evarank;
	private String evaimage;
	
	public int getEvaid() {
		return evaid;
	}
	public void setEvaid(int evaid) {
		this.evaid = evaid;
	}
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEvacontent() {
		return evacontent;
	}
	public void setEvacontent(String evacontent) {
		this.evacontent = evacontent;
	}
	public String getEvatitle() {
		return evatitle;
	}
	public void setEvatitle(String evatitle) {
		this.evatitle = evatitle;
	}
	public Date getEvadate() {
		return evadate;
	}
	public void setEvadate(Date evadate) {
		this.evadate = evadate;
	}
	public String getEvarank() {
		return evarank;
	}
	public void setEvarank(String evarank) {
		this.evarank = evarank;
	}
	public String getEvaimage() {
		return evaimage;
	}
	public void setEvaimage(String evaimage) {
		this.evaimage = evaimage;
	}
	
	
}
