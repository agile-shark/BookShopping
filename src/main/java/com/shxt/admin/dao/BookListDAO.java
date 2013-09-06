package com.shxt.admin.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shxt.db.AdminDBHelper;
import com.shxt.model.BookInfo;

public class BookListDAO {
	
	Connection ct = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	AdminDBHelper adminhelper = new AdminDBHelper();
	
	/**
	 * 用于获取书籍表的分页所有信息
	 * @return：返回分页后的书籍的列表
	 */
	public ArrayList<BookInfo> getPageBookList(int pageNow){
		int pageSize = pageNow*10;
		pageNow = (pageNow-1)*10;
		ArrayList<BookInfo> al = new ArrayList<BookInfo>();
		String sql = "select * from(select bf.*,rownum rn from (select * from bookshopping) bf where rownum<="+pageSize+") where rn>"+pageNow;
		
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
				bi.setType_id(rs.getString(23));
				bi.setBook_press_id(rs.getString(24));
				bi.setBook_is_tuangou(rs.getInt(25));
				bi.setBook_is_youhui(rs.getInt(26));
				
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
	 * 计算出所有书籍按照一定的显示格式的页数
	 * @param pageSize：每页显示的个数
	 * @return：返回页数
	 */
	public int getPageCountByType(int pageSize){
		String sql = "select count(*) from bookshopping";
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
	 * 删除指定sql语句的图书列表信息
	 * @param sql
	 * @return
	 */
	public boolean deleteBookList(String sql) {
		boolean b = false;
		
		try {
			ct = adminhelper.getConnection();
			ps = ct.prepareStatement(sql);
			int n = ps.executeUpdate();
			if(n != 0) {
				b = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return b;
	}
	
	//更新某条图书的信息
	public boolean updateBookInfo(String bookid,String bookname,float bookuserprice,int book_is_xiaxian,int book_is_new,int book_is_best,int book_is_hot,int book_is_youhui,int book_is_tuangou) {
		boolean b = false;
		String sql = "update bookshopping set book_name='"+bookname+"',book_user_price="+bookuserprice+",book_is_delete="+book_is_xiaxian+",book_is_new="+book_is_new+",book_is_best="+book_is_best+",book_is_hot="+book_is_hot+",book_is_youhui="+book_is_youhui+",book_is_tuangou="+book_is_tuangou+" where bookid="+bookid;
		
		try {
			ct = adminhelper.getConnection();
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
				bi.setType_id(rs.getString(23));
				bi.setBook_press_id(rs.getString(24));
				bi.setBook_is_youhui(rs.getInt(26));
				bi.setBook_is_tuangou(rs.getInt(25));
				
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
	 * 查询出指定id的书籍
	 * @param bookid：查询的bookid
	 * @return ： 返回得到结果的图书信息
	 */
	public BookInfo getBookInfo (String bookid) {
		String sql = "select * from bookshopping where bookid=" + bookid;
		BookInfo bi = new BookInfo();
		System.out.println(sql);
		try {
			ct = adminhelper.getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
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
				bi.setType_id(rs.getString(23));
				bi.setBook_press_id(rs.getString(24));
				bi.setBook_is_youhui(rs.getInt(26));
				bi.setBook_is_tuangou(rs.getInt(25));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		return bi;
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
	 * 计算某一类型的总记录数
	 * @param sql：传入的sql语句
	 * @return：返回总记录数
	 */
	public int getPageSize(String sql){
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
	 * 删除指定图书的信息
	 * @param bookid：传入的bookid号
	 * @return：返回整型变量
	 */
	public int deleteBookInfo(String bookid) {
		String sql = "delete bookshopping where bookid="+bookid;
		int n = -1;
		try {
			ct = adminhelper.getConnection();
			ps = ct.prepareStatement(sql);
			n = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		return n;
	}
	
	/**
	 * 添加图书信息
	 * @param book
	 * @return
	 */
	public boolean insertBookInfo(BookInfo book) {
		boolean b = false;
		
		try {
			ct = adminhelper.getConnection();
			ps = ct.prepareStatement("insert into bookshopping values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, book.getBook_id());
			ps.setString(2, book.getBook_name());
			ps.setString(3, book.getBook_author());
			ps.setString(4, book.getBook_press());
			ps.setDate(5, (Date) book.getBook_out_date());
			ps.setInt(6, book.getBook_num());
			ps.setString(7, book.getBook_introduce());
			ps.setString(8, book.getBook_type());
			ps.setString(9, book.getBook_isbn());
			ps.setInt(10, book.getBook_page());
			ps.setInt(11, book.getBook_text());
			ps.setString(12, book.getBook_zhuangding());
			ps.setInt(13, book.getBook_banci());
			ps.setFloat(14, book.getBook_weight());
			ps.setFloat(15, book.getBook_market_price());
			ps.setFloat(16, book.getBook_user_price());
			ps.setInt(17, book.getBook_buy_count());
			ps.setString(18, book.getBook_img());
			ps.setInt(19, book.getBook_is_delete());
			ps.setInt(20, book.getBook_is_best());
			ps.setInt(21, book.getBook_is_new());
			ps.setInt(22, book.getBook_is_hot());
			ps.setString(23, book.getType_id());
			ps.setString(24, book.getBook_press_id());
			ps.setInt(25, book.getBook_is_tuangou());
			ps.setInt(26, book.getBook_is_youhui());
			int n = ps.executeUpdate();
			if(n == 1) {
				b = true;
			}
		} catch (Exception e) {
			//e.printStackTrace();
			System.out.println("在管理员添加图书信息的时候出现错误了！");
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
