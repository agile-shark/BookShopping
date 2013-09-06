package com.shxt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import com.shxt.model.BookInfo;
import com.shxt.db.*;

/**
 * 用来处理购物车的信息
 * 
 * @author ZhangTuring
 * 
 */
public class CarDAO {
	HashMap<String, String> hash = new HashMap<String, String>();
	private Connection conn = null;
	private PreparedStatement ptstm = null;
	private ResultSet rs = null;
	private float market_allPrice = 0.0f;
	private float user_allPrice = 0.0f;
	//得到购物车中共有的货物数
	private int num;
	
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	//返回总价的函数
	public float getUserAllPrice() {
		return this.user_allPrice;
	}
	
	//返回市场总价的函数
	public float getMarketAllPrice() {
		return this.market_allPrice;
	}
	
	//当购物车被清空的时候，可以将其总价设置为0
	public void setUserAllPrice(float a) {
		this.user_allPrice = a;
		this.market_allPrice = a;
	}
	
	//计算购物车中更新后的价格
	public float getOnePrice(String id) {
		int num = Integer.parseInt(this.getNumById(id));
		float price = this.getOneBookPrice(id);
		System.out.println(num+"   " + price);
		return num*price;
	}
	
	//得到vip价格比市场价格省的钱
	public float getSavePrice() {
		return market_allPrice - user_allPrice;
	}

	//通过id得到该书的VIP价格
	public float getOneBookPrice(String id) {
		float price = 0.0f;
		String sql = "select book_user_price from bookshopping where bookid=" + id;
		try {
			conn = new DBHelper().getConnection();
			ptstm = conn.prepareStatement(sql);
			rs = ptstm.executeQuery();
			while(rs.next()) {
				price = rs.getFloat(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return price;
	}
	
	// 添加操作
	public void addBook(String bookid, String book_num) {
		hash.put(bookid, book_num);
	}

	// 删除操作
	public void delBook(String bookid) {
		hash.remove(bookid);
	}

	// 清空购物车ﳵ
	public void carClear() {
		hash.clear();
	}

	// 更新购物车ﳵ
	public void update(String id,  String num) {
		hash.put(id, num);
	}

	// 显示购物车ﳵ
	public ArrayList<BookInfo> showCar() {
		ArrayList<BookInfo> al = new ArrayList<BookInfo>();
		try {

			String sql = "select * from bookshopping where bookid in";

			// 从hashmap中去得id
			Iterator inter = hash.keySet().iterator();
			String sub = "(";
			// 取出id
			while (inter.hasNext()) {
				String bookid = (String) inter.next();
				System.out.println(bookid );
				if (inter.hasNext()) {
					sub += bookid + ",";
				} else {
					sub += bookid;
				}

			}
			sub += ")";
			
			sql += sub;
			//System.out.println(sql);
			conn = new DBHelper().getConnection();
			ptstm = conn.prepareStatement(sql);
			rs = ptstm.executeQuery();
			this.market_allPrice = 0.0f;
			this.user_allPrice = 0.0f;
			while (rs.next()) {
				BookInfo bi = new BookInfo();
				
				int bookid = rs.getInt(1);
				bi.setBook_id(bookid);
				
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
				
				float market_price = rs.getFloat(15);
				bi.setBook_market_price(market_price);
				float user_price = rs.getFloat(16);
				bi.setBook_user_price(user_price);
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
				//计算市场总价
				this.market_allPrice += market_price * Integer.parseInt(this.getNumById(bi.getBook_id()+"")) ;
				//计算vip总价
				this.user_allPrice += user_price * Integer.parseInt(this.getNumById(bi.getBook_id()+"")) ;
			}
		} catch (Exception e) {
			System.out.println("购物车中没有可以显示的图书！");
		}
		num = al.size();
		return al;
	}
	
	//编写一个通过goodsId来得到goodsNum的函数
	public String getNumById(String goodsId){
		return hash.get(goodsId);
	}
}
