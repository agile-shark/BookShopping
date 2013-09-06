package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.UserDAO;
import com.shxt.model.UserInfo;

public class FindPassword extends HttpServlet {
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
		//得到提交的类型
		String type = request.getParameter("type");
		//这是从find_username.jsp页面中跳转过来的
		if(type.equals("username")) {
			//得到用户输入的用户名
			String username = request.getParameter("username");
			//检查是否存在该用户名
			UserDAO udao = new UserDAO();
			boolean b = udao.checkUserByUsername(username);
			if(b == true) {
				//存在该用户名，则需要得到该用户的信息，将其通过request传到下一个页面中
				UserInfo user = udao.getUser(username);
				request.getSession().setAttribute("answer",user);
				request.getRequestDispatcher("findPassByQuestion.jsp").forward(request, response);
			} else {
				out.println("<script>");
				out.println("alert('不存在您输入的用户名，请核对后重新输入！')");
				out.println("window.open('find_password.jsp','_self');");
				out.println("</script>");
			}
		} else if(type.equals("answer")){
			//得到用户输入的密码提示答案
			String answer = request.getParameter("answer");
			answer = new String(answer.getBytes("ISO-8859-1"),"utf-8");
			//得到用户信息
			UserInfo userinfo = (UserInfo)request.getSession().getAttribute("answer");
			//进行判断，看用户填写的信息和标准的对不对
			if(answer.equals(userinfo.getPassanswer())) {
				request.getRequestDispatcher("find_pass_success.jsp").forward(request, response);
			} else {
				out.println("<script>");
				out.println("alert('输入的密码提示答案不匹配，请重新输入！')");
				out.println("window.open('findPassByQuestion.jsp','_self');");
				out.println("</script>");
			}
		} else {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		out.flush();
		out.close();
	}

}
