package com.shxt.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shxt.db.DBHelper;
import com.shxt.model.Message;

public class MessageListDAO {
	
	Connection ct = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	/**
	 * 得到评论记录总数
	 */
	public int getPageCount(int size) {

		int count = 0;
		int num = 0;
		String sql = "select count(*) from message";
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
	public ArrayList<Message> getPageMessageList(int pageNow){
		int pageSize = pageNow*5;
		pageNow = (pageNow-1)*5;
		ArrayList<Message> al = new ArrayList<Message>();
		String sql = "select * from(select bf.*,rownum rn from (select * from message) bf where rownum<="+pageSize+") where rn>" + pageNow;
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
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
		} finally{
			this.close();
		}
		
		return al;
	}
	
	/**
	 * 通过指定的留言id号得到具体的留言信息
	 * @param messageid：留言id号
	 * @return：返回留言Bean
	 */
	public Message getMessageById(String messageid) {
		Message message = new Message();
		String sql = "select * from message where message_id='"+messageid+"'";
		
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				message.setMessage_id(rs.getString(1));
				message.setUser_id(rs.getString(2));
				message.setMessage_title(rs.getString(3));
				message.setMessage_context(rs.getString(4));
				message.setMessage_date(rs.getDate(5));
				message.setMessage_type(rs.getString(6));
				message.setMessage_answer(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return message;
	}
	
	/**
	 * 修改某一条指定的留言回复信息
	 * @param messageid
	 * @param messageContext
	 * @return
	 */
	public boolean updateMessageInfo(String messageid,String messageContext) {
		boolean b = false;
		String sql = "update message set message_answer='" +messageContext+ "' where message_id='" +messageid+ "'";
		int  n = 0;
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			n = ps.executeUpdate();
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
	 * 通过Id删除用户信息
	 * @return：成功 与否
	 */
	public void delete(int id){
		String sql = "delete from message where message_id = " + id;
		boolean flag = false;
		try {
			ct = new DBHelper().getConnection();
			ps = ct.prepareStatement(sql);
			int i = ps.executeUpdate();
			if(i == 1) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
	}

	public void deleteAll(int pageNow){
		ArrayList<Message> al = this.getPageMessageList(pageNow);
		String sql = "delete from message where message_id = ?";
		
		try {
			ct = new DBHelper().getConnection();
			for (Message eva : al) {
				ps = ct.prepareStatement(sql);
				ps.setString(1, eva.getMessage_id());
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
