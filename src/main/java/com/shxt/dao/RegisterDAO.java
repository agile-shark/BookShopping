package com.shxt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shxt.db.DBHelper;

public class RegisterDAO {
	Connection ct = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	//通过具体指定的id来得到具体的省市县
	public String getAddress(String sql) {
		String address = "";
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				address = rs.getString(1);
			}
		} catch (Exception e) {
			System.out.println("在注册控制器中，数据库抛出异常");
		} finally {
			this.close();
		}
		
		return address;
	}
	
	//插入语句执行
	public boolean insertSql(String sql) {
		boolean flag = false;
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			int n = ps.executeUpdate();
			if(n==1) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("在注册控制器中，数据库抛出异常");
		} finally {
			this.close();
		}
		
		return flag;
	}
	
	/**
	 * 关闭函数
	 */
	private void close(){
		try {
			if(rs!=null){
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(ps!=null){
				ps.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(ct!=null && !ct.isClosed()){
				ct.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
