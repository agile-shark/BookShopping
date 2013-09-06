package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.db.DBUtil;

public class GetUserinfo extends HttpServlet {

	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String username=request.getParameter("username");
		username = new String(username.getBytes("ISO-8859-1"),"utf-8");
		System.out.println(username);
		
		String sql="select * from bookuser where username='"+username+"'";
		System.out.println(sql);
		DBUtil dbu=new DBUtil();
		List<Map<String,Object>> list=dbu.queryToList(sql);
		if(list.size()==1){
			out.print("1");
		}else{
			out.print("0");
		}
		out.flush();
		out.close();
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		this.doGet(request, response);
		
	}

}
