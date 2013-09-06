package com.shxt.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shxt.db.DBHelper;
import com.shxt.model.BookInfo;
import com.shxt.model.UserInfo;

public class UserListDAO {

	Connection ct = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	/**
	 * 得到用户记录总数
	 */
	public int getPageCount(int size) {

		int count = 0;
		int num = 0;
		String sql = "select count(*) from bookuser";
		try {

			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
				num = count / size;
			}
			if (count % size != 0) {
				num++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return num;
	}
	
	/**
	 * 用于获取用户表的分页所有信息
	 * @return：返回分页后的用户表的列表
	 */
	public ArrayList<UserInfo> getPageUserList(int pageNow){
		int pageSize = pageNow*5;
		pageNow = (pageNow-1)*5;
		ArrayList<UserInfo> al = new ArrayList<UserInfo>();
		String sql = "select * from(select bf.*,rownum rn from (select * from bookuser) bf where rownum<="+pageSize+") where rn>" + pageNow;
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				UserInfo user = new UserInfo();
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
				al.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			this.close();
		}
		
		return al;
	}
	
	/**
	 * 通过Id删除用户信息
	 * @return：成功 与否
	 */
	public void delete(int id){
		String sql = "delete from bookuser where userid = " + id;
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			int i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
	}

	public void deleteAll(int pageNow){
		ArrayList<UserInfo> al = this.getPageUserList(pageNow);
		String sql = "delete from bookuser where userid = ?";
		
		try {
			ct = new DBHelper().getConnection();
			for (UserInfo userInfo : al) {
				ps = ct.prepareStatement(sql);
				ps.setInt(1, userInfo.getUserid());
				int j = ps.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
	}
	
	/**
	 * 关闭连接函数
	 */
	private void close() {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (ps != null) {
				ps.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (ct != null && !ct.isClosed()) {
				ct.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
//	/**
//	 * 得到全部的用户
//	 * 
//	 * @param
//	 * @return 返回得到结果的集合
//	 */
//	public List<UserInfo> getUserList() {
//
//		List<UserInfo> userInfo = new ArrayList<UserInfo>();
//		String sql = "select * from bookuser";
//		try {
//
//			ct = new DBHelper().getConnection();
//			ps = ct.prepareStatement(sql);
//			rs = ps.executeQuery();
//
//			while (rs.next()) {
//				UserInfo user = new UserInfo();
//				user.setUserid(rs.getInt(1));
//				user.setUsername(rs.getString(2));
//				user.setUserpass(rs.getString(3));
//				user.setUseremail(rs.getString(4));
//				user.setUserimage(rs.getString(5));
//				user.setUserphone(rs.getString(6));
//				user.setUserqq(rs.getString(7));
//				user.setRegistdate(rs.getDate(8));
//				user.setPassquestion(rs.getString(9));
//				user.setPassanswer(rs.getString(10));
//				user.setSendaddress(rs.getString(11));
//				user.setBestsendgoodstime(rs.getString(12));
//				user.setUserpostcode(rs.getString(13));
//				user.setUserhothouse(rs.getString(14));
//				user.setUser_integration(rs.getString(15));
//				userInfo.add(user);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			this.close();
//		}
//		return userInfo;
//	}

//	/**
//	 * 通过用户的id得到用户信息
//	 */
//	public UserInfo getUserById(String userid) {
//
//		UserInfo user = new UserInfo();
//		return user = new UserDAO().getUserById(userid);
//	}

//	public List<UserInfo> finaAll(int pageNow, int pageSize) {
//		// TODO Auto-generated method stub
//
//		List<UserInfo> userinfo = this.getUserList();
//		List<UserInfo> userinfos = new ArrayList<UserInfo>();
//		int j = (pageNow - 1) * pageSize;
//		for(int i = 0; i < pageSize; i++){
//			userinfos.add(userinfo.get(i + j));
//			if(userinfo.get(i + j + 1) == null){
//				break;
//			}
//		}
//		return userinfos;
//	}

}
