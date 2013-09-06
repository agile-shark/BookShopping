package com.shxt.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class DBUtil {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pst;
	private ResultSet rs;
	public String url="jdbc:oracle:thin:@localhost:1521:orcl";
	
	static{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection(){
		try {
			return DriverManager.getConnection(url,"liang","liang");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//���������¼����
	public int update(String sql){
		int row=-1;
		try {
			conn=getConnection();
			stmt=conn.createStatement();
			row=stmt.executeUpdate(sql);	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return row;
	}
	
	//Ԥ�������¼����
	public int update(String sql,Object ...obj) {
		int row = -1;
		
		try {
			conn = getConnection();
			pst = conn.prepareStatement(sql);
			for(int i = 0; i < obj.length; i++) {
				pst.setObject(i+1, obj[i]);
			}
			row = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	
	//�����Ĵ����¼��ѯ����
	public List<Map<String,Object>> queryToList(String sql){
		List<Map<String,Object>> list=new LinkedList<Map<String,Object>>();
		try {
			conn=getConnection();
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
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
	
	//����Ԥ�����������¼��ѯ�ĺ���
	public List<Map<String,Object>> queryToList(String sql,Object ...obj){
		List<Map<String,Object>> list=new LinkedList<Map<String,Object>>();
		try {
			conn=getConnection();
			pst = conn.prepareStatement(sql);
			for(int i = 0; i < obj.length; i++) {
				pst.setObject(i+1, obj[i]);
			}
			rs = pst.executeQuery();
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
		}finally{
			close();
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
