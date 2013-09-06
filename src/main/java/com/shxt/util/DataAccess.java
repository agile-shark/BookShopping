package com.shxt.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DataAccess {
	 public DataAccess(){
		 try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	}
	 
	static Connection con=null;
	static Statement st=null;
	static ResultSet rs=null;
	static PreparedStatement ps=null;
	public static Connection getConnection() {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "liang";
		String password = "liang";
		try {
			con = DriverManager.getConnection(url, user, password);
			return con;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ResultSet Select(String sql)
	{	
		getConnection();
		try {		
			st=con.createStatement();
			return st.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public int Update(String sql)
	{		
			getConnection();
		try {
			 st=con.createStatement();		
			return st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public void Close()
	{
		try {
			if(rs!=null)
			{
				rs.close();
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally
		{
			try {
				if(st!=null)
				{
					st.close();
				}				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally
			{
				try {
					if(con!=null)
					{
						con.close();
					}	
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
