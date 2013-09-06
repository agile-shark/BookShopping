package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.db.DBHelper;

public class GetResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/xml");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String type = request.getParameter("type");
		String sql = "select distinct "+type+" from bookshopping";
		DBHelper dbu = new DBHelper();
		List<String> list = dbu.getType(sql);
		out.print("<root>");
		for (int i = 0; i < list.size(); i++) {
			out.print("<book>");
			out.print("<book-code>" + list.get(i)
					+ "</book-code>");
			out.print("<book-value>" + list.get(i)
					+ "</book-value>");
			out.print("</book>");
		}
		out.print("</root>");
		
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
