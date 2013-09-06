package com.shxt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shxt.db.DBHelper;

public class PersonalDAO {
	Connection ct = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	/**
	 * 通过用户的id号来获得改用的所以订单
	 * @param userid
	 * @return
	 */
	public int getPersonalBuyOrder(String userid) {
		int num = 0;
		String sql = "select count(*) from (select * from bookorder) where userid='"+userid+"'";
		System.out.println(sql);
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return num;
	}
	
	/**
	 * 修改用户配送地址
	 * @param address：传来的地址
	 * @param userid：用户的id
	 * @return
	 */
	public boolean updatePersonal(String address, String userid) {
		boolean b = false;
		String sql = "update bookuser set sendaddress='"+address+"' where userid='"+userid+"'";
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			int n = ps.executeUpdate();
			if(n == 1) {
				b = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return b;
	}
	
	/**
	 * 修改用户的密码
	 * @param password
	 * @param userid
	 * @return
	 */
	public boolean updatePersonalInforma(String password, String userid) {
		boolean b = false;
		String sql = "update bookuser set userpass='"+password+"' where userid='"+userid+"'";
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			int n = ps.executeUpdate();
			if(n == 1) {
				b = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return b;
	}
	
	/**
	 * 判断该密码是否存在
	 * @param password
	 * @return
	 */
	public boolean isHavePassword(String password) {
		boolean b = false;
		String sql = "select * from bookuser where userpass='"+password+"'";
		
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
