package com.shxt.test;

import java.util.ArrayList;

public class FilterChain {

	//过滤规则组
	private ArrayList<String> mes ;
	//待处理字段
	private String str;

	public FilterChain(ArrayList<String> mes, String str){
		this.mes = mes;
		this.str = str;
	}

	public String doFilters(){
		for (String s : mes) {
			this.str = this.str.replace(s, "***");
		}
		return this.str;
	}	
}
