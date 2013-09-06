package com.shxt.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDBHelper {
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	public String url="jdbc:oracle:thin:@localhost:1521:orcl";
	
	//调用的时候直接加载进来
	static{
		try {
			Class.forName("org.logicalcobwebs.proxool.ProxoolDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//得到链接
	public Connection getConnection(){
		try {
			long time1=System.currentTimeMillis();
			conn=DriverManager.getConnection("proxool.shxt");
			long time2=System.currentTimeMillis();
			System.out.println("建立连接花费的时间为："+(time2-time1)+"ms");
			return conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//根据指定的sql语句进行更新
	public int update(String sql){
		int row = -1;
		try {
			conn = getConnection();
			pst = conn.prepareStatement(sql);
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return row;
	}
	
	//关闭函数
	private void close(){
		try {
			if(rs!=null){
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(pst!=null){
				pst.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(conn!=null && !conn.isClosed()){
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
