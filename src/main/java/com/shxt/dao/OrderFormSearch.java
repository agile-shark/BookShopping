package com.shxt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.shxt.db.DBHelper;

public class OrderFormSearch {
	private Connection ct = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	/**
	 * 给一个orderid判断是否存在
	 * @param orderid：传入的orderid号
	 * @return：如果存在则返回true，否则返回false
	 */
	public boolean getOrderIdBySearch(String orderid) {
		boolean b = false;
		String sql = "select * from bookorder where orderid=" + orderid;
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				b = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return b;
	}
	
	
	//关闭函数
	public void close(){
		try{
				
			if(rs!=null){
				rs.close();
				rs = null;
			}
			
			if(ps!=null){
				ps.close();
				ps = null;
			}
			
			if(ct!=null){
				ct.close();
				ct = null;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
