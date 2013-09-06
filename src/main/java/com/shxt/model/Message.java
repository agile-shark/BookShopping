package com.shxt.model;

import java.util.Date;

public class Message {
	private String user_id;
	private String message_id;
	private String message_title;
	private String message_context;
	private Date message_date;
	private String message_type;
	private String message_answer;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String userId) {
		user_id = userId;
	}
	public String getMessage_id() {
		return message_id;
	}
	public void setMessage_id(String messageId) {
		message_id = messageId;
	}
	public String getMessage_title() {
		return message_title;
	}
	public void setMessage_title(String messageTitle) {
		message_title = messageTitle;
	}
	public String getMessage_context() {
		return message_context;
	}
	public void setMessage_context(String messageContext) {
		message_context = messageContext;
	}
	public Date getMessage_date() {
		return message_date;
	}
	public void setMessage_date(Date messageDate) {
		message_date = messageDate;
	}
	public String getMessage_type() {
		return message_type;
	}
	public void setMessage_type(String messageType) {
		message_type = messageType;
	}
	public String getMessage_answer() {
		return message_answer;
	}
	public void setMessage_answer(String messageAnswer) {
		message_answer = messageAnswer;
	}
	
}
