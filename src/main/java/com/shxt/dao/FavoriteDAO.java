package com.shxt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shxt.db.AdminDBHelper;
import com.shxt.db.DBHelper;
import com.shxt.model.Favorite;

public class FavoriteDAO {
	Connection ct = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	AdminDBHelper adminhelper = new AdminDBHelper();
	
	/**
	 * 添加到自己的收藏夹中
	 * @param bookid：图书id号
	 * @param userid：用户id号
	 * @return：返回布尔型
	 */
	public boolean insertShouCang(String bookid,String userid) {
		boolean b = false;
		String favoriteid = this.get_favoriteId();
		int favid = Integer.parseInt(favoriteid) + 1;
		String sql = "insert into favorite values("+favid+",'"+bookid+"','"+userid+"')";
		try {
			boolean flag = this.is_have_bookid(bookid);
			if(flag) {
				b = false;
			} else {
				ct = adminhelper.getConnection();
				ps = ct.prepareStatement(sql);
				int n = ps.executeUpdate();
				if(n==1) {
					b = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return b;
	}
	
	/**
	 * 判断是否已经添加入收藏夹中
	 * @param bookid：图书id号
	 * @return：返回布尔型
	 */
	public boolean is_have_bookid(String bookid) {
		boolean b = false;
		String sql = "select * from favorite where bookid=" + bookid;
		
		try {
			ct = adminhelper.getConnection();
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
	 * 产生下一个添加入数据库中的id号
	 * @return：返回插入的收藏夹编号
	 */
	public String get_favoriteId(){
		String max_favoriteId = "";
		try {
			ct = adminhelper.getConnection();
			ps = ct.prepareStatement("select max(favoriteid) from favorite");
			rs = ps.executeQuery();
			
			
			if(rs.next()){
				max_favoriteId = rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return max_favoriteId;
		
	}
	
	/**
	 * 查询出某一个用户的收藏夹里的所有收藏
	 * @param userid：用户id
	 * @return：返回收藏列表
	 */
	public ArrayList<Favorite> getFavoriteByUserId(String userid) {
		ArrayList<Favorite> al = new ArrayList<Favorite>();
		String sql = "select * from favorite where userid="+userid;
		System.out.println("在FavoriteDAO中查询所有收藏的列表的sql语句："+sql);
		try {
			ct = adminhelper.getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Favorite fa = new Favorite();
				fa.setFavoriteid(rs.getString(1));
				fa.setBookid(rs.getString(2));
				fa.setUserid(rs.getString(3));
				al.add(fa);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return al;
	}
	
	/**
	 * 得到某用户收藏夹中收藏的数量
	 * @param userid：用户的id
	 * @return：返回收藏量
	 */
	public int getNumFavoriteByUserId(String userid) {
		int n = 0;
		String sql = "select count(*) from favorite where userid='"+userid+"'";
		System.out.println("在FavoriteDAO中结算收藏记录数的sql语句："+sql);
		try {
			ct = adminhelper.getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				n = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		System.out.println("在DAO中的数量为："+n);
		return n;
	}
	
	/**
	 * 删除指定的收藏夹
	 * @param bookid：图书编号
	 * @return：返回布尔型
	 */
	public boolean deleteFavoriteByBookId(String bookid) {
		boolean b = false;
		String sql = "delete favorite where bookid='"+bookid+"'";
		
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
