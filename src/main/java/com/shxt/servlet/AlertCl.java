package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.AlertDAO;
import com.shxt.model.AlertBean;

public class AlertCl extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		this.doPost(request, response);
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		AlertDAO alertDAO = new AlertDAO();
		System.out.println(id);
		AlertBean bean = (AlertBean) alertDAO.getContentList(id);
		request.setAttribute("alertinfo", bean);
		request.getRequestDispatcher("Alert.jsp").forward(request, response);
		out.flush();
		out.close();
	}

}
