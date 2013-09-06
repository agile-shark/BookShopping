package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.OrderFormSearch;

public class OrderForm extends HttpServlet {

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
		
		String orderid = request.getParameter("searchName");
		//System.out.println(orderid);
		OrderFormSearch ofs = new OrderFormSearch();
		boolean b = ofs.getOrderIdBySearch(orderid);
		if(b) {
			request.getRequestDispatcher("showOrders.jsp?orderid="+orderid).forward(request, response);
		} else {
			out.println("<script>");
			out.println("alert('不存在该订单号！')");
			out.println("window.open('index.jsp','_self');");
			out.println("</script>");
		}
		out.flush();
		out.close();
	}

}
