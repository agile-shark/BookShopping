package com.shxt.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.BookInfoDAO;
import com.shxt.dao.OrderDAO;
import com.shxt.model.BookInfo;

public class OrderFormPaiHangStats extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	//这个处理的是销售排行统计
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		OrderDAO order = new OrderDAO();
		
		//得到所选择图形的类型编号
		String type = request.getParameter("type")==null?"1":(String)request.getParameter("type");
		
		ArrayList<String> bookName = new ArrayList<String>();
		ArrayList<String> buyNum = new ArrayList<String>();
		//得到排行榜的前十位
		BookInfoDAO book = new BookInfoDAO();
		ArrayList<BookInfo> bookInfo = book.getTop10Book();
		for(int i=0;i<10;i++) {
			bookName.add(bookInfo.get(i).getBook_name());
			//System.out.println(bookInfo.get(i).getBook_name());
			buyNum.add(bookInfo.get(i).getBook_buy_count()+"");
			//System.out.println(bookInfo.get(i).getBook_buy_count());
		}
		request.setAttribute("bookName", bookName);
		request.setAttribute("bookNum", buyNum);
		request.setAttribute("Imagetype", type);
		
		request.getRequestDispatcher("admin/orderFormPaiHangDisplaies.jsp").forward(request, response);
		
		out.flush();
		out.close();
	}

}
