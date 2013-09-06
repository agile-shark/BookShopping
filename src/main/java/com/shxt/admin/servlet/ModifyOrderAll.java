package com.shxt.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.OrderDAO;

public class ModifyOrderAll extends HttpServlet {

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
		
		String sql = "";
		
		//得到处理的类型
		String type = request.getParameter("type");
		
		//得到选择的书籍所有编号
		String[]  checkboxs = request.getParameterValues("checkboxs");
		
		//将结果先打印出来
		//System.out.println("得到的类型为："+type);
		//for(int i = 0; i < checkboxs.length; i++) {
		//	System.out.println(checkboxs[i]);
		//}
		if(type.equals("confirm")) {
			sql = "update bookorder set isconfirmed=1 where orderid in(";
			for(int i = 0; i < checkboxs.length; i++) {
				sql += checkboxs[i]+",";
			}
			//截取字符串
			sql = sql.substring(0,sql.lastIndexOf(','))+")";
			System.out.println(sql);
			boolean b = order.changeOrder(sql);
			if(b == true) {
				out.println("<script>");
				out.println("alert('恭喜您,操作成功！')");
				out.println("window.open('admin/dingdanlist.jsp','_self');");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('对不起操作失败，系统处于维护状态！')");
				out.println("window.open('admin/dingdanlist.jsp','_self');");
				out.println("</script>");
			}
		} else if(type.equals("confirm2")) {
			sql = "update bookorder set isconfirmed=1 where orderid in(";
			for(int i = 0; i < checkboxs.length; i++) {
				sql += checkboxs[i]+",";
			}
			//截取字符串
			sql = sql.substring(0,sql.lastIndexOf(','))+")";
			System.out.println(sql);
			boolean b = order.changeOrder(sql);
			if(b == true) {
				out.println("<script>");
				out.println("alert('恭喜您,操作成功！')");
				out.println("window.open('admin/unconfirmorder.jsp','_self');");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('对不起操作失败，系统处于维护状态！')");
				out.println("window.open('admin/unconfirmorder.jsp','_self');");
				out.println("</script>");
			}
		} else if(type.equals("pay")) {
			sql = "update bookorder set ispayed=1 where orderid in(";
			for(int i = 0; i < checkboxs.length; i++) {
				sql += checkboxs[i]+",";
			}
			//截取字符串
			sql = sql.substring(0,sql.lastIndexOf(','))+")";
			System.out.println(sql);
			boolean b = order.changeOrder(sql);
			if(b == true) {
				out.println("<script>");
				out.println("alert('恭喜您,操作成功！')");
				out.println("window.open('admin/unpayedorder.jsp','_self');");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('对不起操作失败，系统处于维护状态！')");
				out.println("window.open('admin/unpayedorder.jsp','_self');");
				out.println("</script>");
			}
		} else {
			sql = "update bookorder set sendstaus=1 where orderid in(";
			for(int i = 0; i < checkboxs.length; i++) {
				sql += checkboxs[i]+",";
			}
			//截取字符串
			sql = sql.substring(0,sql.lastIndexOf(','))+")";
			System.out.println(sql);
			boolean b = order.changeOrder(sql);
			if(b == true) {
				out.println("<script>");
				out.println("alert('恭喜您,操作成功！')");
				out.println("window.open('admin/unoutgoodsorder.jsp','_self');");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('对不起操作失败，系统处于维护状态！')");
				out.println("window.open('admin/unoutgoodsorder.jsp','_self');");
				out.println("</script>");
			}
		}
		
		
		out.flush();
		out.close();
	}

}
