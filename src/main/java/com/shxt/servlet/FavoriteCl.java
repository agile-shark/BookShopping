package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.FavoriteDAO;

public class FavoriteCl extends HttpServlet {
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
		//得到处理的bookid
		String bookid = request.getParameter("bookid");
		
		FavoriteDAO fadao = new FavoriteDAO();
		if(type.equals("delete")) {
			//调用dao层进行删除
			boolean b = fadao.deleteFavoriteByBookId(bookid);
			if(b == true) {
				request.getRequestDispatcher("collection.jsp").forward(request, response);
			} else {
				out.println("<script>");
				out.println("alert('删除失败!由于系统升级，暂时对数据库进行维护，请过后再删除！')");
				out.println("window.open('collection.jsp','_self');");
				out.println("</script>");
			}
		} else {
			//request.getRequestDispatcher("Gouwuche?type=showCar&id="+bookid).forward(request, response);
			out.println("<script>");
			out.println("window.open('Gouwuche?type=showCar&id="+bookid+"','_blank');");
			out.println("</script>");
		}
		out.flush();
		out.close();
	}

}
