package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.FavoriteDAO;

public class ShouCang extends HttpServlet {
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
		FavoriteDAO favdao = new FavoriteDAO();
		String bookid = request.getParameter("bookid");
		String userid = request.getParameter("userid");
		System.out.println(bookid+"     "+userid);
		//调用dao层进行添加数据（利用model层给dao层添加数据）
		boolean b = favdao.insertShouCang(bookid, userid);
		if(b == true) {
			out.println("<script>");
			out.println("alert('恭喜您，添加成功！')");
			out.println("window.open('index.jsp','_self');");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('对不起，不能对同一本书进行收藏！')");
			out.println("window.open('index.jsp','_self');");
			out.println("</script>");
		}
		out.flush();
		out.close();
	}

}
