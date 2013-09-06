package com.shxt.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.util.ResourceToExcel;

public class SearchOrderType extends HttpServlet {
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
		//得到分页的信息
		int pageNow = 1;
		
		//得到搜索的类型
		String type = request.getParameter("select");
		
		String dayin = request.getParameter("type");
		if(dayin != null) {
			type = "0";
			//执行打印程序
			ResourceToExcel.ToExcel();
		}
		if(type.equals("0")) {
			
			String pagenow = request.getParameter("pageNow");
			if(pagenow!=null) {
				pageNow = Integer.parseInt(pagenow);
			}
			if(dayin!=null) {
				out.println("<script>");
				out.println("alert('恭喜您，打印订单成功！已存放在D盘下的test.xls文件里，请注意查收。')");
				out.println("window.open('admin/dingdanlist.jsp?pageNow="+pageNow+"','_self');");
				out.println("</script>");
			} else {
				request.getRequestDispatcher("admin/dingdanlist.jsp?pageNow="+pageNow).forward(request, response);
			}
			
		} else if(type.equals("confirmed")) {
			String pagenow = request.getParameter("pageNow");
			if(pagenow!=null) {
				pageNow = Integer.parseInt(pagenow);
			}
			request.getRequestDispatcher("admin/unconfirmorder.jsp?pageNow="+pageNow).forward(request, response);  
		} else if(type.equals("payed")) {
			//得到分页的信息
			String pagenow = request.getParameter("pageNow");
			if(pagenow!=null) {
				pageNow = Integer.parseInt(pagenow);
			}
			request.getRequestDispatcher("admin/unpayedorder.jsp?pageNow="+pageNow).forward(request, response);
		} else if(type.equals("out")) {
			//得到分页的信息
			String pagenow = request.getParameter("pageNow");
			if(pagenow!=null) {
				pageNow = Integer.parseInt(pagenow);
			}
			request.getRequestDispatcher("admin/unoutgoodsorder.jsp?pageNow="+pageNow).forward(request, response);
		} else {
			//得到分页的信息
			String pagenow = request.getParameter("pageNow");
			if(pagenow!=null) {
				pageNow = Integer.parseInt(pagenow);
			}
			request.getRequestDispatcher("admin/successorder.jsp?pageNow="+pageNow).forward(request, response);
		}
		out.flush();
		out.close();
	}

}
