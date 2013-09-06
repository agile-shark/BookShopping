package com.shxt.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.shxt.dao.UserDAO;
import com.shxt.db.DBHelper;
import com.shxt.model.Evaluation;
import com.shxt.model.UserInfo;

public class EvaluationListDAO {

	Connection ct = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	/**
	 * 得到评论记录总数
	 */
	public int getPageCount(int size) {

		int count = 0;
		int num = 0;
		String sql = "select count(*) from bookevaluation";
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
	 * 用于获取评论表的分页所有信息
	 * @return：返回分页后的评论表的列表
	 */
	public ArrayList<Evaluation> getPageEvaList(int pageNow){
		int pageSize = pageNow*5;
		pageNow = (pageNow-1)*5;
		ArrayList<Evaluation> al = new ArrayList<Evaluation>();
		String sql = "select * from(select bf.*,rownum rn from (select * from bookevaluation) bf where rownum<="+pageSize+") where rn>" + pageNow;
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Evaluation eva = new Evaluation();
				eva.setEvaid(rs.getInt(1));
				eva.setBookid(rs.getString(2));
				eva.setUserid(rs.getString(3));
				eva.setUsername(rs.getString(4));
				eva.setEvacontent(rs.getString(5));
				eva.setEvatitle(rs.getString(6));
				eva.setEvadate(rs.getDate(7));
				eva.setEvarank(rs.getString(8));
				eva.setEvaimage(rs.getString(9));
				al.add(eva);
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
		String sql = "delete from bookevaluation where evaid = " + id;
		boolean flag = false;
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
		ArrayList<Evaluation> al = this.getPageEvaList(pageNow);
		String sql = "delete from bookevaluation where evaid = ?";
		
		try {
			ct = new DBHelper().getConnection();
			for (Evaluation eva : al) {
				ps = ct.prepareStatement(sql);
				ps.setInt(1, eva.getEvaid());
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
}
