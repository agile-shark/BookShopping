package com.shxt.model;

import java.util.Date;

public class AlertBean {
	private String contentID;
	private String conentTitle;
	private String newTitile;
	private String mainContent;
	private String contentAuthor;
	private String rank;
	private Date createDate;
	
	public String getContentID() {
		return contentID;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public void setContentID(String contentID) {
		this.contentID = contentID;
	}
	public String getConentTitle() {
		return conentTitle;
	}
	public String getContentAuthor() {
		return contentAuthor;
	}
	public void setContentAuthor(String contentAuthor) {
		this.contentAuthor = contentAuthor;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public void setConentTitle(String conentTitle) {
		this.conentTitle = conentTitle;
	}
	public String getNewTitile() {
		return newTitile;
	}
	public void setNewTitile(String newTitile) {
		this.newTitile = newTitile;
	}
	public String getMainContent() {
		return mainContent;
	}
	public void setMainContent(String mainContent) {
		this.mainContent = mainContent;
	}
	
}
