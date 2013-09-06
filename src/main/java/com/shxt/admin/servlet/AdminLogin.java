package com.shxt.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.admin.dao.AdminBeanDAO;
import com.shxt.model.AdminBean;

public class AdminLogin extends HttpServlet {
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
		//得到从登陆界面中传过来的值进行验证
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String verifycode = request.getParameter("verifycode");
		//从session中得到验证码此时的值
		String random = (String)request.getSession().getAttribute("random");
		if(verifycode.equals(random)) {
			AdminBeanDAO adao = new AdminBeanDAO();
			boolean b = adao.checkAdminUser(username, password);
			if(b == true) {
				//将用户信息放入到session中并传入到首页面
				AdminBean ab = adao.getAdminBeanByName(username);
				request.getSession().setAttribute("admin", ab);
				request.getRequestDispatcher("admin/main.jsp").forward(request, response);
			} else {
				out.println("<script>");
				out.println("alert('登录失败!用户名或密码输入有误！')");
				out.println("window.open('http://localhost:8080/BookShopping/admin/index.jsp','_self');");
				out.println("</script>");
			}
		} else {
			out.println("<script>");
			out.println("alert('输入的验证码错误！')");
			out.println("window.open('http://localhost:8080/BookShopping/admin/index.jsp','_self');");
			out.println("</script>");
		}
		
		
		
		//response.sendRedirect("index.jsp");
    	
		out.flush();
		out.close();
	}

}
