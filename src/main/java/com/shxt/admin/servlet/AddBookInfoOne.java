package com.shxt.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddBookInfoOne extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		//得到传过来的bookid
		String bookid = request.getParameter("bookid");
		//得到要添加的类型还是出版社
		String type = request.getParameter("type");
		if(type.equals("press")) {
			//说明添加的是出版社
			String press = request.getParameter("press");
			//String sql = 
		} else {
			//说明添加的是类型
			String style = request.getParameter("type");
		}
		out.flush();
		out.close();
	}

}
