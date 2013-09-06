package com.shxt.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shxt.db.AdminDBHelper;
import com.shxt.db.DBHelper;
import com.shxt.model.AdminBean;
import com.shxt.model.UserInfo;

public class AdminBeanDAO {
	Connection ct = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	AdminDBHelper adminhelper = new AdminDBHelper();
	
	/**
	 *检查用户登录是否合法
	 * @param adminname：传入的用户名
	 * @param adminpassword：传入的密码
	 * @return：布尔型，并且采用了防止密码注入漏洞
	 */
	public boolean checkAdminUser(String adminname,String adminpassword) {
		boolean b = false;
		String sql = "select adminpassword from bookadmin where adminname='"+adminname+"'";
		try {
			ct = adminhelper.getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				String pass = rs.getString(1);
				if(adminpassword.equals(pass)) {
					b = true;
				}
			}
		} catch (Exception e) {
			System.out.println("在进行验证用户是否合法的时候出现错误!");
		} finally {
			this.close();
		}
		
		return b;
	}
	
	/**
	 * 通过用户名得到用户的详细信息
	 * @param adminname：用户名
	 * @return：返回用户bean
	 */
	public AdminBean getAdminBeanByName(String adminname) {
		AdminBean ab = new AdminBean();
		String sql = "select * from bookadmin where adminname='"+adminname+"'";
		
		try {
			ct = adminhelper.getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				ab.setAdminid(rs.getString(1));
				ab.setAdminname(rs.getString(2));
				ab.setAdmintruename(rs.getString(3));
				ab.setAdminpassword(rs.getString(4));
				ab.setAdminregisterdate(rs.getDate(5));
				ab.setAdminphone(rs.getString(6));
				ab.setAdminemail(rs.getString(7));
				ab.setAdminlastip(rs.getString(8));
				ab.setAdminqq(rs.getString(9));
			}
		} catch (Exception e) {
			System.out.println("通过管理员姓名得到其有关详细信息时数据库出错!");
		} finally {
			this.close();
		}
		
		return ab;
	}
	
	
	/**
	 * 得到管理员记录总数
	 */
	public int getPageCount(int size) {

		int count = 0;
		int num = 0;
		String sql = "select count(*) from bookadmin";
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
	
	public ArrayList<AdminBean> getPageAdminList(int pageNow){
		int pageSize = pageNow*5;
		pageNow = (pageNow-1)*5;
		ArrayList<AdminBean> al = new ArrayList<AdminBean>();
		String sql = "select * from(select bf.*,rownum rn from (select * from bookadmin) bf where rownum<="+pageSize+") where rn>" + pageNow;
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				AdminBean ab = new AdminBean();
				ab.setAdminid(rs.getString(1));
				ab.setAdminname(rs.getString(2));
				ab.setAdmintruename(rs.getString(3));
				ab.setAdminpassword(rs.getString(4));
				ab.setAdminregisterdate(rs.getDate(5));
				ab.setAdminphone(rs.getString(6));
				ab.setAdminemail(rs.getString(7));
				ab.setAdminlastip(rs.getString(8));
				ab.setAdminqq(rs.getString(9));
				al.add(ab);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			this.close();
		}
		
		return al;
	}

	public void delete(int id){
		String sql = "delete from bookadmin where adminid = " + id;
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
		ArrayList<AdminBean> al = this.getPageAdminList(pageNow);
		String sql = "delete from bookadmin where adminid = ?";
		
		try {
			ct = new DBHelper().getConnection();
			for (AdminBean ab : al) {
				ps = ct.prepareStatement(sql);
				ps.setString(1, ab.getAdminid());
				int j = ps.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
	}
	
	
	public String getNextAdminId() {
		String sql = "select * from(select adminid from bookadmin order by adminid desc) where rownum<=1";
		String adminid="";
		int nextAdminId = 0;
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				adminid = rs.getString(1);
				nextAdminId = Integer.parseInt(adminid);
				adminid = (nextAdminId+1)+"";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return adminid;
	}
	
	
	public int addAdmin(AdminBean ab){
		int i = 0;
		String sql = "insert into bookadmin(adminid, adminname, admintruename, adminpassword, adminphone, adminemail, adminqq) values(?, ?, ?, ?, ?, ?, ?)";
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			ps.setString(1, ab.getAdminid());	
			ps.setString(2, ab.getAdminname());
			ps.setString(3, ab.getAdmintruename());
			ps.setString(4, ab.getAdminpassword());
			ps.setString(5, ab.getAdminphone());
			ps.setString(6, ab.getAdminemail());
			ps.setString(7, ab.getAdminqq());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return i;
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
