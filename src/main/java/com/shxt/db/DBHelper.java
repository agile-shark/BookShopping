package com.shxt.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBHelper {
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	private ResultSet rs = null;
	private Connection conn;
	private Statement stmt;
	
	public DBHelper(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	/**
	 * 进行连接函数
	 * @return：返回连接
	 */
	public Connection getConnection() {
		try {
			return DriverManager.getConnection(url,"liang","liang");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<String> getType(String sql){
		List<String> list=new ArrayList<String>();
		try {
			conn=getConnection();
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				list.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		return list;
	}
	
	private void close(){
		try {
			if(rs!=null){
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(stmt!=null){
				stmt.close();
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

