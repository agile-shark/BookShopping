package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.MessageDAO;
import com.shxt.test.DoFilter;

public class MessageCl extends HttpServlet {

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
		//得到要进行添加留言的信息
		String userid = request.getParameter("userid");
		String msgtype = request.getParameter("msg_type");
		msgtype = new String(msgtype.getBytes("ISO-8859-1"),"utf-8");
		String msgtitle = request.getParameter("msg_title");
		msgtitle = new String(msgtitle.getBytes("ISO-8859-1"),"utf-8");
		String msgcontent = request.getParameter("msg_content");
		msgcontent = new String(msgcontent.getBytes("ISO-8859-1"),"utf-8");
		
		//对文本信息进行过滤
		DoFilter filter = new DoFilter();
		msgtitle = filter.getStr(msgtitle);
		
		msgcontent = filter.getStr(msgcontent);
		
		System.out.println(userid+"  "+msgtype+"  "+msgtitle+"  "+msgcontent+"  ");
		//调用dao层的方法进行添加信息
		MessageDAO mdao = new MessageDAO();
		boolean b = mdao.insertMessage(userid,msgtype,msgtitle, msgcontent);
		if(b == true) {
			String type = request.getParameter("type");
			if(type!=null){
				request.getRequestDispatcher("liuyan2.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("liuyan.jsp").forward(request, response);
			}
		} else {
			out.println("<script>");
			out.println("alert('留言失败!由于系统升级，暂时对数据库进行维护，请过后再留言！')");
			out.println("window.open('liuyan.jsp','_self');");
			out.println("</script>");
		}
		out.flush();
		out.close();
	}
}
