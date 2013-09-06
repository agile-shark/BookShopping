package com.shxt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shxt.db.DBHelper;
import com.shxt.model.YouHuiBeanNew;

public class YouhuiDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	/**
	 * 得到优惠或团购图书信息
	 * @param activity_type：指定是优惠还是团购类型
	 * @return：图书信息
	 */
	public ArrayList<YouHuiBeanNew> getYouhui(String activity_type) {
		ArrayList<YouHuiBeanNew> al = new ArrayList<YouHuiBeanNew>();
		String sql = "select * from activity where activity_type='" + activity_type + "'";
		try {
			conn = new DBHelper().getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				YouHuiBeanNew youhui = new YouHuiBeanNew();
				youhui.setActivityid(rs.getString(1));
				youhui.setActivity_startdate(rs.getString(2));
				youhui.setActivity_stopdate(rs.getString(3));
				youhui.setYouhui_number(rs.getInt(4));
				youhui.setTuangou_number(rs.getInt(5));
				youhui.setActivity_type(rs.getString(6));
				youhui.setBookid(rs.getString(7));
				youhui.setActivity_title(rs.getString(8));
				al.add(youhui);
			}
		} catch (Exception e) {
			System.out.println("YouhuiDAO加载数据库出错");
		} finally {
			this.close();
		}
		
		return al;
	}
	
	/**
	 * 得到指定优惠id的图书信息
	 * @param activityid：指定优惠图书的id号
	 * @return：图书信息
	 */
	public YouHuiBeanNew getYouhuiInfo(String activityid) {
		String sql = "select * from activity where activityid='" + activityid + "'";
		YouHuiBeanNew youhui = new YouHuiBeanNew();
		try {
			conn = new DBHelper().getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				youhui.setActivityid(rs.getString(1));
				youhui.setActivity_startdate(rs.getString(2));
				youhui.setActivity_stopdate(rs.getString(3));
				youhui.setYouhui_number(rs.getInt(4));
				youhui.setTuangou_number(rs.getInt(5));
				youhui.setActivity_type(rs.getString(6));
				youhui.setBookid(rs.getString(7));
				youhui.setActivity_title(rs.getString(8));
			}
		} catch (Exception e) {
			System.out.println("YouhuiDAO加载数据库出错");
		} finally {
			this.close();
		}
		
		return youhui;
	}
	
	/**
	 * 得到指定图书id的优惠信息
	 * @param bookid：指定图书的id号
	 * @return：优惠图书信息
	 */
	public YouHuiBeanNew getYouhuiInfoByBookid(String bookid) {
		String sql = "select * from activity where bookid='" + bookid + "'";
		YouHuiBeanNew youhui = new YouHuiBeanNew();
		try {
			conn = new DBHelper().getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				youhui.setActivityid(rs.getString(1));
				youhui.setActivity_startdate(rs.getString(2));
				youhui.setActivity_stopdate(rs.getString(3));
				youhui.setYouhui_number(rs.getInt(4));
				youhui.setTuangou_number(rs.getInt(5));
				youhui.setActivity_type(rs.getString(6));
				youhui.setBookid(rs.getString(7));
				youhui.setActivity_title(rs.getString(8));
			}
		} catch (Exception e) {
			System.out.println("YouhuiDAO加载数据库出错");
		} finally {
			this.close();
		}
		
		return youhui;
	}
	
	
	/**
	 * 得到团购图书的总记录数
	 * @return
	 */
	public int getTuangouPage() {
		int num = 0;
		String sql = "select count(*) from activity where activity_type='tuangou'";
		
		try {
			conn = new DBHelper().getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1);
			}
		}catch (Exception e) {
			System.out.println("YouhuiDAO加载数据库出错");
		} finally {
			this.close();
		}
		
		return num;
	}
	
	/**
	 * 得到优惠图书的总记录数
	 * @return
	 */
	public int getYouhuiPage() {
		int num = 0;
		String sql = "select count(*) from activity where activity_type='youhui'";
		
		try {
			conn = new DBHelper().getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1);
			}
		}catch (Exception e) {
			System.out.println("YouhuiDAO加载数据库出错");
		} finally {
			this.close();
		}
		
		return num;
	}
	
	/**
	 * 进行一系列的删除操作
	 * @param sql
	 * @return
	 */
	public boolean deleteActivity(String sql) {
		boolean b = false;
		
		try {
			conn = new DBHelper().getConnection();
			ps = conn.prepareStatement(sql);
			int n = ps.executeUpdate();
			if(n!=0) {
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
	 * 插入时候的下一个id号
	 * @return
	 */
	public String getNextActivityId() {
		String sql = "select count(*) from activity";
		int num = 0;
		String nums = "";
		int trueNextId = 0;
		
		try {
			conn = new DBHelper().getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				nums = rs.getString(1);
			}
			if(nums!=null) {
				num = Integer.parseInt(nums);
				trueNextId = num+1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return "10"+trueNextId;
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
			if(conn!=null && !conn.isClosed()){
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
