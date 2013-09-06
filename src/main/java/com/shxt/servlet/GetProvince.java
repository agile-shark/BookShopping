package com.shxt.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.db.DBUtil;

public class GetProvince extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		String sql="select * from dict where dictcode like '__0000'";
		DBUtil dbu=new DBUtil();
		List<Map<String,Object>> list=dbu.queryToList(sql);
		request.setAttribute("list", list);
		request.getRequestDispatcher("register.jsp").forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		this.doGet(request, response);
	}
}
