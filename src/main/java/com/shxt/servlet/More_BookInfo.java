package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.model.BookInfo;
import com.shxt.util.Common;

public class More_BookInfo extends HttpServlet {
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
		PrintWriter out = response.getWriter();
		String type = (String)request.getParameter("type");
		if(type.equals("best")){
			type = "book_is_best";
		}else if(type.equals("new")){
			type = "book_is_new";
		} else if(type.equals("hot")){
			type = "book_is_hot";
		} else if(type.equals("computer")) {
			type = "计算机";
		}else {
			type = "1";
		}
		//BookInfoDAO bdao = new BookInfoDAO();
		Common common = new Common();
		List<BookInfo> list = new ArrayList<BookInfo>();
		//System.out.println(type);
		list = common.getPageBookList(type, 1);
		request.setAttribute("booklist", list);
		request.getRequestDispatcher("more_book.jsp?type="+type).forward(request, response);
		
		out.flush();
		out.close();
	}

}
