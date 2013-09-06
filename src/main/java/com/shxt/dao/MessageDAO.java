package com.shxt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shxt.db.DBHelper;
import com.shxt.model.Message;

public class MessageDAO {
	Connection ct = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	
	/**
	 * 得到指定用户的留言信息
	 */
	public ArrayList<Message> getMessageByUserId(int userid) {
		ArrayList<Message> al = new ArrayList<Message>();
		
		String sql = "select * from message where user_id='"+userid+"'";
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				Message message = new Message();
				message.setMessage_id(rs.getString(1));
				message.setUser_id(rs.getString(2));
				message.setMessage_title(rs.getString(3));
				message.setMessage_context(rs.getString(4));
				message.setMessage_date(rs.getDate(5));
				message.setMessage_type(rs.getString(6));
				message.setMessage_answer(rs.getString(7));
				al.add(message);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		
		return al;
	}
	
	/**
	 * 通过指定的用户id得到该用户所留言的记录数
	 * @param userid：用户的id
	 * @return：返回整型记录数
	 */
	public int getNumMessageByUserId(int userid) {
		int num = 0;
		String sql = "select count(*) from message where user_id='" + userid + "'";
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
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
	 * 进行留言信息的添加
	 * @return:返回添加成功还是失败，以布尔型代替
	 */
	public boolean insertMessage(String userid,String msgtype,String msgtitle,String msgcontent) {
		boolean b = false;
		
		//String sql = "insert into message(message_id, user_id, message_title, message_context, message_type) values(?,?,?,?,?)";
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement("insert into message(message_id, user_id, message_title, message_context, message_type) " +
					"values('"+this.getNextMessageId()+"','"+userid+"','"+msgtitle+"','"+msgcontent+"','"+msgtype+"')");
			int n = ps.executeUpdate();
			if(n==1) {
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
	 * 得到插入下一条记录的留言信息的id号
	 * @return：返回下一条记录的id号
	 */
	public String getNextMessageId() {
		String num = "";
		String sql = "select count(*) from message";
		int n = 0;
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				n = rs.getInt(1);
				num = (n+1)+"";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return num;
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
