package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.model.BookInfo;
import com.shxt.util.Common;

public class Page_GetBook extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		int pageNow = Integer.parseInt(request.getParameter("pageNow"));
		String type = request.getParameter("type");
		request.setAttribute("pageNow", pageNow+"");
		Common common = new Common();
		List<BookInfo> list = common.getPageBookList(type,pageNow);
		request.setAttribute("booklist", list);
		request.getRequestDispatcher("more_book.jsp?type="+type).forward(request, response);
		out.flush();
		out.close();
	}

}
