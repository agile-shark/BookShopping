package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.UserDAO;
import com.shxt.model.UserInfo;

public class ChangeUserInfo extends HttpServlet {
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
		//得到处理的类型
		String type = request.getParameter("type");
		if(type.equals("change")) {
			request.getRequestDispatcher("changeUserInfo.jsp").forward(request, response);
		} else if(type.equals("ok")){
			//说明进入正式的修改页面
			String userid = request.getParameter("userid");
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String postcode = request.getParameter("postcode");
			String phone = request.getParameter("phone");
			String besttime = request.getParameter("besttime");
			
			//将有可能出现中文的进行转码
			address = new String(address.getBytes("ISO-8859-1"),"utf-8");
			besttime = new String(besttime.getBytes("ISO-8859-1"),"utf-8");
			
			//可能为空的数据
			String hothouse = request.getParameter("hothouse");
			hothouse = new String(hothouse.getBytes("ISO-8859-1"),"utf-8");
			
			System.out.println(username + "  " + email + "  " + address + "  " + postcode + "  " + "  " + phone + "  " + "  " + besttime + "  " + hothouse);
			//调用dao层的方法进行修改
			UserDAO udao = new UserDAO();
			boolean b = udao.updateUserInfo(userid,username,email,address,postcode,phone,besttime,hothouse);
			if(b == true) {
				UserInfo user = udao.getUserById(userid);
				//将更新后的信息重新放到session中
				request.getSession().setAttribute("user", user);
				out.println("<script>");
				out.println("alert('恭喜您，修改用户信息成功!')");
				out.println("window.open('Gouwuche?type=buy','_self');");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('修改失败!系统数据库正在维护中！')");
				out.println("window.open('Gouwuche?type=buy','_self');");
				out.println("</script>");
			}
		}
		out.flush();
		out.close();
	}
}
