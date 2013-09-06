package com.shxt.test;

import java.util.ArrayList;

import com.shxt.dao.SensitiveDAO;

public class DoFilter{

	//过滤规则组
	private ArrayList<String> mes ;
	//新增过滤规则
	private String newMes;
	//待处理字段
	private String str;
	
	
	public String getStr(String str) {
		this.str = str;
		SensitiveDAO sdao = new SensitiveDAO();
		ArrayList<String> strs = sdao.getSensitiveString();
		this.mes = strs;
		return this.str = new FilterChain(mes, str).doFilters();
	}

	//增加过滤规则并存入数据库中
	public void setNewMes(String newMes) {
		this.newMes = newMes;
	}
}
