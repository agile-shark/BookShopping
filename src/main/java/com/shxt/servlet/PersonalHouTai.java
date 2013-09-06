package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.PersonalDAO;

public class PersonalHouTai extends HttpServlet {

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
		
		//得到穿过来到userid
		String userid = request.getParameter("userid");
		//判断用户是点击的那个修改按钮
		String type = request.getParameter("type");
		//修改的dao层
		PersonalDAO per = new PersonalDAO();
		if(type.equals("ziliao")) {
			String address = request.getParameter("address");
			address = new String(address.getBytes("ISO-8859-1"),"utf-8");
			//调用user的dao层进行修改数据
			boolean b = per.updatePersonal(address, userid);
			if(b == true) {
				out.println("<script>");
				out.println("alert('恭喜您，信息修改成功！')");
				out.println("window.open('personInformation.jsp','_self');");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('修改失败!系统维护中！')");
				out.println("window.open('personInformation.jsp','_self');");
				out.println("</script>");
			}
		} else {
			//首先要判断原始密码是否正确
			String oldpass = request.getParameter("old_password");
			boolean flag = per.isHavePassword(oldpass);
			if(flag==true) {
				//调用user的dao层进行修改数据
				String password = request.getParameter("new_password");
				boolean b = per.updatePersonalInforma(password, userid);
				if(b == true) {
					out.println("<script>");
					out.println("alert('恭喜您，用户名密码修改成功！')");
					out.println("window.open('personInformation.jsp','_self');");
					out.println("</script>");
				} else {
					out.println("<script>");
					out.println("alert('修改失败!系统维护中！')");
					out.println("window.open('personInformation.jsp','_self');");
					out.println("</script>");
				}
			} else {
				out.println("<script>");
				out.println("alert('对不起修改失败，您输入的原始密码错误！')");
				out.println("window.open('personInformation.jsp','_self');");
				out.println("</script>");
			}
		}
		
		
		out.flush();
		out.close();
	}

}
