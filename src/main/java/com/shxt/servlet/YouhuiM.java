package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.YouhuiDAO;
import com.shxt.model.YouHuiBeanNew;

public class YouhuiM extends HttpServlet {
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
		String type = (String)request.getParameter("activity_type");
		YouhuiDAO youhuidao = new YouhuiDAO();
		if(type.equals("youhui")) {
			type = "youhui";
			ArrayList<YouHuiBeanNew> al = youhuidao.getYouhui(type);
			request.setAttribute("youhui",al);
			request.getRequestDispatcher("youhui.jsp?type="+type).forward(request, response);
			
		} else if(type.equals("tuangou")) {
			type = "tuangou";
			ArrayList<YouHuiBeanNew> al = youhuidao.getYouhui(type);
			System.out.println(al.size());
			request.setAttribute("tuangou", al);//获得YouhuiBean
			request.getRequestDispatcher("tuangou.jsp?type="+type).forward(request, response);
		}
		out.flush();
		out.close();
	}

}
