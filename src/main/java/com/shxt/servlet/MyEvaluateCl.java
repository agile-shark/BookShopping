package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.EvaluationDAO;

public class MyEvaluateCl extends HttpServlet {

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
		EvaluationDAO evadao = new EvaluationDAO();
		//得到要删除的id号
		String evaid = request.getParameter("evaid");
		System.out.println("从个人中心传过来的id值："+evaid);
		//调用dao层进行删除操作
		boolean flag = evadao.deleteEvaluationByEvaId(evaid);
		if(flag==true) {
			out.println("<script>");
			out.println("alert('删除成功!')");
			out.println("window.open('mypinglun.jsp','_self');");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('删除评论失败，系统数据库正在维护中!')");
			out.println("window.open('mypinglun.jsp','_self');");
			out.println("</script>");
		}

		out.flush();
		out.close();
	}

}
