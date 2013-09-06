package com.shxt.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shxt.db.AdminDBHelper;
import com.shxt.model.BookInfo;

public class Common {
	
	Connection ct = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	AdminDBHelper adminhelper = new AdminDBHelper();
	
	/**
	 * 查询出指定sql语句的书籍
	 * @param sql：查询的sql语句
	 * @return ： 返回得到结果的集合
	 */
	public List<BookInfo> getBookList (String sql) {
		List<BookInfo> bookList = new ArrayList<BookInfo>();
		System.out.println(sql);
		try {
			ct = adminhelper.getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				BookInfo bi = new BookInfo();
				
				bi.setBook_id(rs.getInt(1));
				bi.setBook_name(rs.getString(2));
				bi.setBook_author(rs.getString(3));
				bi.setBook_press(rs.getString(4));
				bi.setBook_out_date(rs.getDate(5));
				bi.setBook_num(rs.getInt(6));
				bi.setBook_introduce(rs.getString(7));
				bi.setBook_type(rs.getString(8));
				bi.setBook_isbn(rs.getString(9));
				bi.setBook_page(rs.getInt(10));
				bi.setBook_text(rs.getInt(11));
				bi.setBook_zhuangding(rs.getString(12));
				bi.setBook_banci(rs.getInt(13));
				bi.setBook_weight(rs.getFloat(14));
				bi.setBook_market_price(rs.getFloat(15));
				bi.setBook_user_price(rs.getFloat(16));
				bi.setBook_buy_count(rs.getInt(17));
				bi.setBook_img(rs.getString(18));
				bi.setBook_is_delete(rs.getInt(19));
				bi.setBook_is_best(rs.getInt(20));
				bi.setBook_is_new(rs.getInt(21));
				bi.setBook_is_hot(rs.getInt(22));
				
				bookList.add(bi);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return bookList;
	}
	
	/**
	 * 得到书的总个数
	 * @return：返回总数
	 */
	public int getBookCount(){
		String sql = "select count(*) from bookshopping";
		int n = 0;
		try {
			ct = adminhelper.getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				n = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			this.close();
		}
		
		return n;
	}
	
	
	/**
	 * 得到某一类书的总个数
	 * @return：返回总数
	 */
	public int getBookCount(String category){
		String sql = "select count(*) from bookshopping where " + category + "=1";
		int n = 0;
		try {
			ct = adminhelper.getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				n = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			this.close();
		}
		
		return n;
	}
	
	/**
	 * 得到某一类书的总个数
	 * @return：返回总数
	 */
	public int getBookCountByAll(String sql){
		int n = 0;
		try {
			ct = adminhelper.getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				n = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			this.close();
		}
		
		return n;
	}
	
	/**
	 * 通过哪种（畅销还是热卖）类型得到每种书籍的页数
	 * @param pageSize：每页显示的个数
	 * @param category：畅销还是热卖或是新书
	 * @return：返回记录数
	 */
	public int getPageCount(int pageSize,String category){
		String sql = "select count(*) from bookshopping where "+category + "=1";
		int pageCount = 0;
		int n = 0;
		try {
			ct = adminhelper.getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				n = rs.getInt(1);
			}
			if(n%pageSize==0){
				pageCount = n/pageSize;
			}else {
				pageCount = n/pageSize + 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			this.close();
		}
		
		return pageCount;
		
	}
	
	
	/**
	 * 通过哪种方式得到每种书籍的页数
	 * @param pageSize：每页显示的个数
	 * @param category：畅销还是热卖或是新书
	 * @return：返回类型页数
	 */
	public int getPageCountByType(int pageSize,String sql){
		int pageCount = 0;
		int n = 0;
		try {
			ct = adminhelper.getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				n = rs.getInt(1);
			}
			if(n%pageSize==0){
				pageCount = n/pageSize;
			}else {
				pageCount = n/pageSize + 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			this.close();
		}
		
		return pageCount;
		
	}
	
	
	
	/**
	 * 用于获取书籍表的分页所有信息
	 * @return：返回分页后的书籍的列表
	 */
	public ArrayList<BookInfo> getPageBookList(String category , int pageNow){
		int pageSize = pageNow*10;
		pageNow = (pageNow-1)*10;
		ArrayList<BookInfo> al = new ArrayList<BookInfo>();
		String sql = "select * from(select bf.*,rownum rn from (select * from bookshopping where "+category+"=1) bf where rownum<="+pageSize+") where rn>"+pageNow;
		
		System.out.println(sql);
		
		try {
			ct = adminhelper.getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				BookInfo bi = new BookInfo();
				
				bi.setBook_id(rs.getInt(1));
				bi.setBook_name(rs.getString(2));
				bi.setBook_author(rs.getString(3));
				bi.setBook_press(rs.getString(4));
				bi.setBook_out_date(rs.getDate(5));
				bi.setBook_num(rs.getInt(6));
				bi.setBook_introduce(rs.getString(7));
				bi.setBook_type(rs.getString(8));
				bi.setBook_isbn(rs.getString(9));
				bi.setBook_page(rs.getInt(10));
				bi.setBook_text(rs.getInt(11));
				bi.setBook_zhuangding(rs.getString(12));
				bi.setBook_banci(rs.getInt(13));
				bi.setBook_weight(rs.getFloat(14));
				bi.setBook_market_price(rs.getFloat(15));
				bi.setBook_user_price(rs.getFloat(16));
				bi.setBook_buy_count(rs.getInt(17));
				bi.setBook_img(rs.getString(18));
				bi.setBook_is_delete(rs.getInt(19));
				bi.setBook_is_best(rs.getInt(20));
				bi.setBook_is_new(rs.getInt(21));
				bi.setBook_is_hot(rs.getInt(22));
				
				al.add(bi);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			this.close();
		}
		
		return al;
	}
	
	/**
	 * 用于获取书籍表的分页所有信息
	 * @return：返回分页后的书籍的列表
	 */
	public ArrayList<BookInfo> getPageByTypeBookList(String sql , int pageNow){
		int pageSize = pageNow*10;
		pageNow = (pageNow-1)*10;
		ArrayList<BookInfo> al = new ArrayList<BookInfo>();
		String sqls = "select * from(select bf.*,rownum rn from ("+sql+") bf where rownum<="+pageSize+") where rn>"+pageNow;
		
		System.out.println(sqls);
		
		try {
			ct = adminhelper.getConnection();
			ps = ct.prepareStatement(sqls);
			rs = ps.executeQuery();
			while(rs.next()) {
				BookInfo bi = new BookInfo();
				
				bi.setBook_id(rs.getInt(1));
				bi.setBook_name(rs.getString(2));
				bi.setBook_author(rs.getString(3));
				bi.setBook_press(rs.getString(4));
				bi.setBook_out_date(rs.getDate(5));
				bi.setBook_num(rs.getInt(6));
				bi.setBook_introduce(rs.getString(7));
				bi.setBook_type(rs.getString(8));
				bi.setBook_isbn(rs.getString(9));
				bi.setBook_page(rs.getInt(10));
				bi.setBook_text(rs.getInt(11));
				bi.setBook_zhuangding(rs.getString(12));
				bi.setBook_banci(rs.getInt(13));
				bi.setBook_weight(rs.getFloat(14));
				bi.setBook_market_price(rs.getFloat(15));
				bi.setBook_user_price(rs.getFloat(16));
				bi.setBook_buy_count(rs.getInt(17));
				bi.setBook_img(rs.getString(18));
				bi.setBook_is_delete(rs.getInt(19));
				bi.setBook_is_best(rs.getInt(20));
				bi.setBook_is_new(rs.getInt(21));
				bi.setBook_is_hot(rs.getInt(22));
				
				al.add(bi);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			this.close();
		}
		
		return al;
	}
	

	/**
	 * 关闭连接函数
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
