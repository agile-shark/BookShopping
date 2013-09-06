package com.shxt.model;

import java.util.List;
import java.util.Map;

public class PagingBean {

	private int pagenow;
	private int pagesize;
	private int pageall;
	private int rowstart;
	private int rowend;
	private int rowall;
	private List<Map<String,Object>> list;
	
	
	public int getPagenow() {
		return pagenow;
	}
	public void setPagenow(int pagenow) {
		this.pagenow = pagenow;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getPageall() {
		return pageall;
	}
	public void setPageall(int pageall) {
		this.pageall = pageall;
	}
	public int getRowstart() {
		return rowstart;
	}
	public void setRowstart(int rowstart) {
		this.rowstart = rowstart;
	}
	public int getRowend() {
		return rowend;
	}
	public void setRowend(int rowend) {
		this.rowend = rowend;
	}
	public int getRowall() {
		return rowall;
	}
	public void setRowall(int rowall) {
		this.rowall = rowall;
	}
	public List<Map<String, Object>> getList() {
		return list;
	}
	public void setList(List<Map<String, Object>> list) {
		this.list = list;
	}
	
}
