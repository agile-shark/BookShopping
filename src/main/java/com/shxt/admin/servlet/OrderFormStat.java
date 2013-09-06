package com.shxt.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.OrderDAO;

public class OrderFormStat extends HttpServlet {

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
		OrderDAO order = new OrderDAO();
		
		//得到所选择图形的类型编号
		String type = request.getParameter("type")==null?"1":(String)request.getParameter("type");
		
		String sql = "select * from bookorder where orderdate between to_date('2011-01-01','yyyy-mm-dd') and to_date('2011-12-31','yyyy-mm-dd')";
		
		String haveSelect = "2011";
		
		String select = request.getParameter("select");
		if(select!=null) {
			if(select.equals("2012")) {
				sql = "select * from bookorder where orderdate between to_date('2012-01-01','yyyy-mm-dd') and to_date(sysdate,'yyyy-mm-dd')";
				haveSelect = "2012";
			} else {
				sql = "select * from bookorder where orderdate between to_date('2011-01-01','yyyy-mm-dd') and to_date('2011-12-31','yyyy-mm-dd')";
				haveSelect = "2011";
			}
		}
		
		ArrayList<String> al = order.getOrderPrice(sql);
		request.setAttribute("orderPrice", al);
		
		request.setAttribute("Imagetype", type);
		request.getRequestDispatcher("admin/orderFormDisplay.jsp?havaSelect="+haveSelect).forward(request, response);
		out.flush();
		out.close();
	}

}
