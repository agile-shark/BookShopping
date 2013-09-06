package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.BookInfoDAO;
import com.shxt.model.BookInfo;

public class BookJump extends HttpServlet {

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
		String id = request.getParameter("id");
		//如果有优惠或是团购的话，在这里得到它的折购价
		String zhegou = request.getParameter("zhegou");
		String cheap = null;
		if(zhegou!=null) {
			if(zhegou.equals("tuangou")) {
				cheap = "tuangou";
			} else {
				cheap = "youhui";
			}
		}
		BookInfoDAO dao = new BookInfoDAO();
		BookInfo bi = dao.getBookInfo(id);
		request.setAttribute("bookinfo", bi);
		request.getRequestDispatcher("BookInfoDisplay.jsp?zhegou="+cheap).forward(request, response);
		out.flush();
		out.close();
	}

}
