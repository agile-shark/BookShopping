package com.shxt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shxt.db.DBHelper;
import com.shxt.model.AlertBean;

public class AlertDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public AlertBean getContentList(String contentID) {
		String sql = "select * from alert where contentid=" + contentID;
		System.out.println(sql);
		AlertBean alert = new AlertBean();
		try {
			conn = new DBHelper().getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				alert.setContentID(rs.getString(1));
				alert.setConentTitle(rs.getString(2));
				alert.setNewTitile(rs.getString(3));
				alert.setMainContent(rs.getString(4));
				alert.setContentAuthor(rs.getString(5));
				alert.setRank(rs.getString(6));
				alert.setCreateDate(rs.getDate(7));
			}
		} catch (Exception e) {
			System.out.println("AlertDAO数据库出问题了!");
		} finally {
			try {
				conn.close();
				ps.close();
				rs.close();
			} catch (SQLException e2) {
				// TODO: handle exception
				e2.printStackTrace();
				System.out.println("Alert关闭出问题了!");
			}
		}
		return alert;
	}

	public ArrayList<AlertBean> getContentList() {
		String sql = "select * from alert order by contentid asc";
		ArrayList<AlertBean> al = new ArrayList<AlertBean>();
		try {
			conn = new DBHelper().getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				AlertBean alert = new AlertBean();
				alert.setContentID(rs.getString(1));
				alert.setConentTitle(rs.getString(2));
				alert.setNewTitile(rs.getString(3));
				alert.setMainContent(rs.getString(4));
				alert.setContentAuthor(rs.getString(5));
				alert.setRank(rs.getString(6));
				alert.setCreateDate(rs.getDate(7));
				al.add(alert);
			}
		} catch (Exception e) {
			System.out.println("AlertDAO数据库出问题了!");
		} finally {
			try {
				conn.close();
				ps.close();
				rs.close();
			} catch (SQLException e2) {
				// TODO: handle exception
				e2.printStackTrace();
				System.out.println("Alert关闭数据库出问题了!");
			}
		}
		return al;
	}
	
}
