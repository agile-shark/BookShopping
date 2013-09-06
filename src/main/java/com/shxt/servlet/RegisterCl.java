package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.RegisterDAO;
import com.shxt.dao.UserDAO;
import com.shxt.model.UserInfo;

public class RegisterCl extends HttpServlet {
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
		RegisterDAO rdao = new RegisterDAO();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String imgsrc = request.getParameter("face");
		String qq = request.getParameter("qq");
		String phone = request.getParameter("phone");
		String address3 = request.getParameter("select3");
		String passwordQuestion = request.getParameter("select");
		String passwordAnswer = request.getParameter("answer");
		passwordQuestion = new String(passwordQuestion.getBytes("ISO-8859-1"),"utf-8");
		passwordAnswer = new String(passwordAnswer.getBytes("ISO-8859-1"),"utf-8");
		
		
		//通过查询数据库得到相应的省市县
		String sql3 = "select dictvalue from dict where dictcode=" + address3;
		String adress = rdao.getAddress(sql3);
		String insertSql = "insert into bookuser(userid, username, userpass, useremail, userimage, userphone, userqq, passquestion, passanswer, sendaddress, bestsendgoodstime, userhothouse) values(seq_bookuser.nextval,'"+username+"','"+password+"','"+email+
		"','"+imgsrc+"','"+phone+"','"+qq+"','"+passwordQuestion+"','"+passwordAnswer+"','"+adress+"','除周六之日外','长春大学')";
		boolean b = rdao.insertSql(insertSql);
		UserDAO ud = new UserDAO();
		if(b==true) {
			UserInfo user = ud.getUser(username);
			request.getSession().setAttribute("user",user);
			request.getRequestDispatcher("registerSuccess.jsp?username="+username).forward(request, response);
		} else {
			out.println("<script>");
	  		out.println("alert('对不起!您的注册失败！');");
	  		out.println("</script>");
	  		request.getRequestDispatcher("GetProvince").forward(request, response);
		}
		
		out.flush();
		out.close();
	}

}
