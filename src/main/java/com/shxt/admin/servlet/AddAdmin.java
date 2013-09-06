package com.shxt.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.admin.dao.AdminBeanDAO;
import com.shxt.model.AdminBean;

public class AddAdmin extends HttpServlet {

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
		AdminBean ab = new AdminBean();
		AdminBeanDAO abd = new AdminBeanDAO();
		//String adminid = request.getParameter("id");
		//得到管理员的编号最大值
		String adminid = abd.getNextAdminId();
		
		String adminname = request.getParameter("name");
		adminname = new String(adminname.getBytes("ISO-8859-1"),"utf-8");
		String adminpassword = request.getParameter("password");
		String adminphone = request.getParameter("phone");
		String adminqq = request.getParameter("qq");
		String admintruename = request.getParameter("truename");
		admintruename = new String(admintruename.getBytes("ISO-**59-1"),"utf-8");
		
		String adminemail = request.getParameter("email");
		ab.setAdminid(adminid);
		ab.setAdminname(adminname);
		ab.setAdminpassword(adminpassword);
		ab.setAdminphone(adminphone);
		ab.setAdminqq(adminqq);
		ab.setAdmintruename(admintruename);
		ab.setAdminemail(adminemail);
		
		int n = abd.addAdmin(ab);
		if(n==1) {
			out.println("<script>");
			out.println("alert('恭喜超级管理员，添加管理员成功!')");
			out.println("window.open('admin/addadmin.jsp','_self');");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('添加管理员失败!')");
			out.println("window.open('admin/addadmin.jsp','_self');");
			out.println("</script>");
		}
		out.flush();
		out.close();
	}

}
