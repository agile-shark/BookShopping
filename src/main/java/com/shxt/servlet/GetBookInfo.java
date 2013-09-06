package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.BookInfoDAO;

public class GetBookInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String bookcode = request.getParameter("bookcode");
		String sql = "select distinct " + bookcode + " from bookshopping";
		BookInfoDAO dbu = new BookInfoDAO();
		List<Map<String, Object>> list = dbu.queryToList(sql);
		out.print("<root>");
		for (int i = 0; i < list.size(); i++) {
			out.print("<book>");
			out.print("<book-code>" + list.get(i).values()	+ "</book-code>");
			out.print("<book-value>" + list.get(i).values()	+ "</book-value>");
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
