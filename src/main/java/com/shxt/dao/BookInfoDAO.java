package com.shxt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.shxt.db.DBHelper;
import com.shxt.model.BookInfo;

public class BookInfoDAO {
	Connection ct = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	/**
	 * 查询出指定范畴的书籍
	 * @param bookCategory：书的范畴，即是最新的还是最畅销的
	 * @return ： 返回得到结果的集合
	 */
	public List<BookInfo> getBookList (String bookCategory) {
		List<BookInfo> bookList = new ArrayList<BookInfo>();
		String sql = "select * from bookshopping where " + bookCategory + "=1";
		try {
			ct = new DBHelper().getConnection();
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
				bi.setBook_is_tuangou(rs.getInt(25));
				bi.setBook_is_youhui(rs.getInt(26));
				
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
	 * 通过指定的id号得到指定的书籍
	 * @param id：书的id号
	 * @return：返回BookInfo
	 */
	public BookInfo getBookInfo(String id) {
		String sql = "select * from bookshopping where  bookid=" + id;
		BookInfo bi = new BookInfo();
		try {
			ct = new DBHelper().getConnection();
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
				bi.setBook_is_tuangou(rs.getInt(25));
				bi.setBook_is_youhui(rs.getInt(26));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		return bi;
	}
	

	/**
	 * 截取图书名称，使其规格化
	 * @param bookname：得到书的名称
	 * @return：返回字符串的位数
	 */
	public String getBookName(String bookname,int n) {
		String str = null;
		int m = 0;
		StringBuffer s = new StringBuffer();
		if(n>7){
			char[] name = bookname.toCharArray();
			//int length = name.length;
			for(int i = 0; i < name.length; i++) {
				char c = name[i];
				if((c>'a' && c<'z') || (c>'A' && c<'Z')){
					str = name[i]+"" + name[i+1]+"";
					i++;
					m++;
				}
				s.append(str);
			}
			str = s.toString();
			str = str.substring(0, 7+m);
		}
		return str;
	}
	
	/**
	 * 截取图书名称，使其规格化
	 * @param bookname：得到书的名称
	 * @return：返回字符串的位数
	 */
	public int getBookNameLength(String bookname) {
		int n = 0;
		char[] name = bookname.toCharArray();
		for(int i = 0; i < name.length; i++) {
			char c = name[i];
			if((c>'a' && c<'z') || (c>'A' && c<'Z')){
				i++;
				n++;
			} else {
				n++;
			}
		}
		return n;
	}
	
	/**
	 * 返回图书信息的图书类型
	 * @return
	 */
	public List<String> getBookType() {
		String book_type = null;
		List<String> list = new ArrayList<String>();
		String sql = "select distinct book_type from bookshopping";
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				book_type = rs.getString(1);
				list.add(book_type);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		return list;
	}
	
	
	/**
	 * 返回图书信息的出版社
	 * @return
	 */
	public List<String> getBookPress() {
		String book_press = null;
		List<String> list = new ArrayList<String>();
		String sql = "select distinct book_press from bookshopping";
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				book_press = rs.getString(1);
				list.add(book_press);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		return list;
	}
	
	/**
	 * 查询指定sql语句的图书信息
	 * @param sql
	 * @return
	 */
	public ArrayList<BookInfo> queryBookList(String sql) {
		ArrayList<BookInfo> al = new ArrayList<BookInfo>();
		
		try {
			ct = new DBHelper().getConnection();
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
		} finally {
			this.close();
		}
		
		return al;
	}
	
	
	/**
	 * 查询指定sql语句的图书个数
	 * @param sql
	 * @return
	 */
	public int queryBookListByNum(String sql) {
		int n = 0;
		try {
			ct = new DBHelper().getConnection();
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
		
		return n;
	}
	
	public List<Map<String,Object>> queryToList(String sql){
		List<Map<String,Object>> list=new LinkedList<Map<String,Object>>();
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			ResultSetMetaData rsmd=rs.getMetaData();
			while(rs.next()){
				Map<String,Object> map=new HashMap<String,Object>();
				for(int i=1;i<=rsmd.getColumnCount();i++){
					map.put(rsmd.getColumnName(i),rs.getObject(i));
				}
				list.add(map);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return list;
	}
	
	
	//通过bookid得到该书的库存量
	public int getBookNum(String id) {
		int num = 0;
		String sql = "select book_num from bookshopping where bookid="+id;
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
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
	 * 按照图书销售量从高到低取出排名在前10位
	 * @return：图书信息的ArrayList
	 */
	public ArrayList<BookInfo> getTop10Book(){
		ArrayList<BookInfo> al = new ArrayList<BookInfo>();
		String sql = "select al.*,rownum from (select * from bookshopping order by book_buy_count desc) al where rownum<=10";
		
		try {
			ct = new DBHelper().getConnection();
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
			System.out.println("在BookInfoDAO中得到书籍排行前10的函数时，数据库加载出错!");
		} finally {
			this.close();
		}
		
		return al;
	}
	
	/**
	 * 获取订单表中最大的订单号，以便产生下一个订单号
	 * @return：返回下一个订单号
	 */
	public String get_nextBookId(){
		String nextbookid = "";
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement("select max(bookid) from bookshopping");
			rs = ps.executeQuery();
			
			String max_bookId = "";
			if(rs.next()){
				max_bookId = rs.getString(1);
			}
			
			if(max_bookId != null){
				int id = Integer.parseInt(max_bookId);
				id = id + 1;
				nextbookid = id+"";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}finally{
			this.close();
		}
		return nextbookid;
	}
	
	/**
	 * 进行书籍信息的更新
	 * @param sql
	 * @return
	 */
	public boolean updateBookInfo(String sql) {
		boolean b = false;
		
		try {
			ct = new DBHelper().getConnection();
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
