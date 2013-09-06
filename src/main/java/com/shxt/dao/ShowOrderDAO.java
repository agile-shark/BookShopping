package com.shxt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.shxt.db.DBHelper;
import com.shxt.model.BookCar;
import com.shxt.model.BookOrder;

public class ShowOrderDAO {
	private Connection ct = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	public BookOrder getBookOrderById(String orderid) {
		BookOrder bo = new BookOrder();
		
		String sql = "select * from bookorder where orderid=" + orderid;
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				bo.setOrderid(rs.getString(1));
				bo.setUserid(rs.getString(2));
				bo.setOrderdate(rs.getDate(3));
				bo.setSendprice(rs.getFloat(4));
				bo.setTotalprice(rs.getFloat(5));
				bo.setSendaddress(rs.getString(6));
				bo.setSendmode(rs.getString(7));
				bo.setPaymode(rs.getString(8));
				bo.setIsConfirmed(rs.getInt(9));
				bo.setIspayed(rs.getInt(10));
				bo.setSendstatus(rs.getInt(11));
				bo.setIspackage(rs.getInt(12));
				bo.setIscard(rs.getInt(13));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		return bo;
	}
	
	public ArrayList<BookCar> getBookCar(String orderid) {
		ArrayList<BookCar> al = new ArrayList<BookCar>();
		
		String sql = "select * from bookcar where orderid=" + orderid;
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				BookCar bc = new BookCar();
				bc.setOrderid(rs.getString(1));
				bc.setBookid(rs.getString(2));
				bc.setBookbuynum(rs.getInt(3));
				bc.setBooktotalprice(rs.getFloat(4));
				bc.setBooktype(rs.getString(5));
				bc.setBookname(rs.getString(6));
				al.add(bc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return al;
	}
	
	
	//关闭函数
	public void close(){
		try{
				
			if(rs!=null){
				rs.close();
				rs = null;
			}
			
			if(ps!=null){
				ps.close();
				ps = null;
			}
			
			if(ct!=null){
				ct.close();
				ct = null;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
