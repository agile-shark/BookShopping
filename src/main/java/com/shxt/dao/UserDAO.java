package com.shxt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shxt.db.DBHelper;
import com.shxt.model.UserInfo;

public class UserDAO {
	
	Connection ct = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	/**
	 * 检查用户登录是否正确
	 * @param username：输入的用户名
	 * @param password：输入的密码
	 * @return：返回布尔型
	 */
	public boolean checkUser(String username,String password) {
		boolean b = false;
		String sql = "select * from bookuser where username='"+username+"' and userpass='"+password+"'";
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				b = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return b;
	}
	
	/**
	 * 检查给用户名是否存在
	 * @param username：用户输入的用户名
	 * @return：布尔型
	 */
	public boolean checkUserByUsername(String username) {
		boolean b = false;
		String sql = "select * from bookuser where username='"+username+"'";
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				b = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return b;
	}
	
	/**
	 * 通过用户名得到用户信息
	 */
	public UserInfo getUser(String username) {
		UserInfo user = new UserInfo();
		
		String sql = "select * from bookuser where username='"+username+"'";
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				user.setUserid(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setUserpass(rs.getString(3));
				user.setUseremail(rs.getString(4));
				user.setUserimage(rs.getString(5));
				user.setUserphone(rs.getString(6));
				user.setUserqq(rs.getString(7));
				user.setRegistdate(rs.getDate(8));
				user.setPassquestion(rs.getString(9));
				user.setPassanswer(rs.getString(10));
				user.setSendaddress(rs.getString(11));
				user.setBestsendgoodstime(rs.getString(12));
				user.setUserpostcode(rs.getString(13));
				user.setUserhothouse(rs.getString(14));
				user.setUser_integration(rs.getString(15));
				user.setUsersex(rs.getString(16));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		
		return user;
	}
	
	/**
	 * 通过用户的id得到用户信息
	 */
	public UserInfo getUserById(String userid) {
		UserInfo user = new UserInfo();
		
		String sql = "select * from bookuser where userid='"+userid+"'";
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				user.setUserid(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setUserpass(rs.getString(3));
				user.setUseremail(rs.getString(4));
				user.setUserimage(rs.getString(5));
				user.setUserphone(rs.getString(6));
				user.setUserqq(rs.getString(7));
				user.setRegistdate(rs.getDate(8));
				user.setPassquestion(rs.getString(9));
				user.setPassanswer(rs.getString(10));
				user.setSendaddress(rs.getString(11));
				user.setBestsendgoodstime(rs.getString(12));
				user.setUserpostcode(rs.getString(13));
				user.setUserhothouse(rs.getString(14));
				user.setUser_integration(rs.getString(15));
				user.setUsersex(rs.getString(15));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		
		return user;
	}
	
	/**
	 * 进行更新用户信息
	 * @param userid
	 * @param username
	 * @param email
	 * @param address
	 * @param postcode
	 * @param phone
	 * @param besttime
	 * @param hothouse
	 * @return
	 */
	public boolean updateUserInfo(String userid,String username,String email,String address,String postcode,String phone,String besttime,String hothouse) {
		 boolean b = false;
		 String sql = "";
		 if(hothouse!="") {
			 sql = "update bookuser set username='"+username+"',useremail='"+email+"',userphone='"+phone+"',sendaddress='"+address+"',bestsendgoodstime='"+besttime+"',userpostcode='"+postcode+"',userhothouse='"+hothouse+"' where userid='"+userid+"'";
		 } else {
			 sql = "update bookuser set username='"+username+"',useremail='"+email+"',userphone='"+phone+"',sendaddress='"+address+"',bestsendgoodstime='"+besttime+"',userpostcode='"+postcode+"' where userid='"+userid+"'";
		 }
		 try {
			 ct = new DBHelper().getConnection();
			 ps = ct.prepareStatement(sql);
			 int n = ps.executeUpdate();
			 if(n==1) {
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
	 * 得到会员的总数
	 * @return
	 */
	public int getUserNum() {
		int num = 0;
		String sql = "select count(*) from bookuser";
		
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
	 * 得到有订单的会员的总数
	 * @return
	 */
	public int getOrderUserNum() {
		int num = 0;
		String sql = "select count(*) from(select distinct userid from bookorder)";
		
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
