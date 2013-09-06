package com.shxt.dao;

import com.shxt.db.DBUtil;
import com.shxt.model.PagingBean;

public class PageDAO {

	public PagingBean getPage(String sql,int pagenow,int pagesize){
		
		PagingBean pb = new PagingBean();
		DBUtil db = new DBUtil();
		pb.setPagenow(pagenow);
		pb.setPagesize(pagesize);
		pb.setRowall(db.queryToList(sql).size());
		pb.setRowstart((pagenow-1)*pagesize+1);
		pb.setRowend(pb.getRowstart()+pagesize-1);
		pb.setPageall(pb.getRowall()%pb.getPagesize()==0?pb.getRowall()/pb.getPagesize():pb.getRowall()/pb.getPagesize()+1);
		sql="select * from (select t.*,rownum as rowindex from ("+sql+")t where rownum<="+pb.getRowend()+") where rowindex>="+pb.getRowstart();
		pb.setList(db.queryToList(sql));
		return pb;
	}
}
