package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.OrderDAO;

public class PersonalDingDanCl extends HttpServlet {
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
		//得到orderid
		String orderid = request.getParameter("orderid");
		//通过orderid来进行删除操作
		OrderDAO odao = new OrderDAO();
		boolean b = odao.deleteOrderByOrderId(orderid);
		if(b == true) {
			out.println("<script>");
			out.println("alert('订单取消成功！')");
			out.println("window.open('dingdan.jsp','_self');");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('取消订单失败!由于系统升级，暂时对数据库进行维护，不可操作！')");
			out.println("window.open('dingdan.jsp','_self');");
			out.println("</script>");
		}
		out.flush();
		out.close();
	}

}
