package com.shxt.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.OrderDAO;

public class ModifyOrder extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		OrderDAO order = new OrderDAO();
		
		//得到处理的订单的编号
		String orderid = request.getParameter("orderid");
		
		//得到处理掉类型
		String type = request.getParameter("type");
		
		String sql = "";
		
		boolean b = false;
		
		if(type.equals("confirm")) {
			sql = "update bookorder set isconfirmed=1 where orderid='"+orderid+"'";
			//调用dao层的方法进行操作数据库
			b = order.changeOrder(sql);
			
		} else if(type.equals("pay")) {
			sql = "update bookorder set ispayed=1 where orderid='"+orderid+"'";
			//调用dao层的方法进行操作数据库
			b = order.changeOrder(sql);
		} else {
			sql = "update bookorder set sendstaus=1 where orderid='"+orderid+"'";
			//调用dao层的方法进行操作数据库
			b = order.changeOrder(sql);
		}
		
		if(b == true) {
			out.println("<script>");
			out.println("alert('恭喜您,操作成功！')");
			out.println("window.open('admin/findOrderInfo.jsp?orderid="+orderid+"','_self');");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('对不起操作失败，系统处于维护状态！')");
			out.println("window.open('admin/findOrderInfo.jsp?orderid="+orderid+"','_self');");
			out.println("</script>");
		}
		
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
