package com.shxt.model;

import java.util.List;

public class PageBean {
	private int pageSize;//分页单位
	private int pageNow;//当前页
	private int rowStart;//起始行
	private int rowEnd;//结束行
	private int pageAll;//总页数
	private int rows;//总行数
	private List<BookInfo> list;
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	public int getRowStart() {
		return rowStart;
	}
	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}
	public int getRowEnd() {
		return rowEnd;
	}
	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}
	public int getPageAll() {
		return pageAll;
	}
	public void setPageAll(int pageAll) {
		this.pageAll = pageAll;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public List<BookInfo> getList() {
		return list;
	}
	public void setList(List<BookInfo> list) {
		this.list = list;
	}
	
	
}
