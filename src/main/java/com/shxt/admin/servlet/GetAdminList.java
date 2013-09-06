package com.shxt.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.admin.dao.AdminBeanDAO;
import com.shxt.model.AdminBean;

public class GetAdminList extends HttpServlet {

	
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
		AdminBeanDAO abd = new AdminBeanDAO();
		String id = request.getParameter("id");
		if(id != null){
			abd.delete(Integer.parseInt(id));
		}
		int pageNow = 1;
		String pagenow = request.getParameter("pageNow");
		if(pagenow != null){
			pageNow = Integer.parseInt(pagenow);
		}
		int pageCount = abd.getPageCount(5);
		List<AdminBean> adminbean = new ArrayList<AdminBean>();

		String type = request.getParameter("type");
		if(type != null){
			abd.deleteAll(pageNow);
		}
		if(type == null){
			adminbean = abd.getPageAdminList(pageNow);
		}else{
				if(pageNow == pageCount){
					adminbean = abd.getPageAdminList(pageNow - 1);
				}else{
					adminbean = abd.getPageAdminList(pageNow + 1);
				}
		}
		request.setAttribute("adminbean", adminbean);
		request.setAttribute("pageNow", pageNow);
		request.setAttribute("pageCount", pageCount);
		
		request.getRequestDispatcher("admin/adminlist.jsp").forward(request,response);
		out.flush();
		out.close();
	}

}
