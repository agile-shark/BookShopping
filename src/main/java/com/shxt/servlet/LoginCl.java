package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.UserDAO;
import com.shxt.model.UserInfo;

public class LoginCl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		String yzm = request.getParameter("yanzhengma");
		String random = (String)request.getSession().getAttribute("random");
		if(yzm.equals(random)) {
			UserDAO ud = new UserDAO();
			boolean a = ud.checkUser(username, password);
			if(a == true) {
				UserInfo user = ud.getUser(username);
				request.getSession().setAttribute("user", user);
				if(type.equals("top")) {
					request.getRequestDispatcher("index.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("BookJump?id="+id).forward(request, response);
				}
			} else {
				out.println("<script>");
				out.println("alert('登录失败!用户名或密码输入有误！')");
				out.println("window.open('login.jsp?type=top','_self');");
				out.println("</script>");
				//request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} else {
			out.println("<script>");
			out.println("alert('输入的验证码错误！')");
			out.println("window.open('login.jsp?type=top','_self');");
			out.println("</script>");
			//request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		out.flush();
		out.close();

	}
}
