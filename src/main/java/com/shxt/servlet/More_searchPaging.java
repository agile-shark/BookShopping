package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.PageDAO;
import com.shxt.model.PagingBean;

public class More_searchPaging extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		int pagenow = 0;
		String mysql = (String)request.getAttribute("mysql");
		System.out.println(mysql+"++++++++++++++++");
		//int pagenow = Integer.parseInt(request.getParameter("pagenow"));
		String pagenow2 = request.getParameter("pagenow");
		if(pagenow2==null||"".equals(pagenow2)){
			pagenow=1;
		}else{
			pagenow = Integer.parseInt(pagenow2);
		}
		String sql = (String) request.getParameter("sql");
		System.out.println("sql语句："+sql);
		sql= new String(sql.getBytes("ISO-8859-1"),"utf-8");
		
		System.out.println(pagenow+" mypagenow");
		PageDAO pd = new PageDAO();
		PagingBean pb = pd.getPage(sql, pagenow, 10);
		request.setAttribute("pb", pb);
		request.setAttribute("mysql", sql);
		request.getRequestDispatcher("more_search.jsp").forward(request, response);
		out.flush();
		out.close();
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		this.doGet(request, response);
		out.flush();
		out.close();
	}

	
}
