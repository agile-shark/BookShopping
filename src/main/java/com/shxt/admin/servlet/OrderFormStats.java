package com.shxt.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.OrderDAO;

public class OrderFormStats extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	//这个处理的是订单统计
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		OrderDAO order = new OrderDAO();
		
		//得到所选择图形的类型编号
		String type = request.getParameter("type")==null?"1":(String)request.getParameter("type");
		
		ArrayList<String> al = new ArrayList<String>();
		String[] month = {"未确认","为付款","未发货","已确认","已付款","已成交"};
		//得到未确认的订单数
		String unconfirm = order.getNumOrdersByUnConfirmed()+"";
		//得到未付款的订单数量
		String unpay = order.getNumOrdersByUnPayed()+"";
		//得到未发货的订单数量
		String unout = order.getNumOrdersByUnOutGoods()+"";
		//得到已确认的订单数量
		String haveconfirm = unpay;
		//得到已付款的订单数量
		String havePay = unout;
		//得到已成交的订单数量
		String success = order.getNumOrdersBySuccess()+"";
		
		al.add(unconfirm);al.add(unpay);
		al.add(unout);al.add(haveconfirm);
		al.add(havePay);al.add(success);
		
		request.setAttribute("orderByNum", al);
		request.setAttribute("Imagetype", type);
		
		request.getRequestDispatcher("admin/orderFormDisplaies.jsp").forward(request, response);
		
		out.flush();
		out.close();
	}

}
