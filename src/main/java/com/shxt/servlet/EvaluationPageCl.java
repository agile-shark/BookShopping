package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.EvaluationDAO;
import com.shxt.model.Evaluation;

public class EvaluationPageCl extends HttpServlet {
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
		String pageNows = request.getParameter("pageNow");
		String bookid = request.getParameter("bookid");
		int pagenow = Integer.parseInt(pageNows);
		EvaluationDAO evadao = new EvaluationDAO();
		//ArrayList<Evaluation> al = evadao.getEvaluatePage(bookid, pagenow, 5);
		request.setAttribute("pageNow", pageNows);
		//request.setAttribute("evaluationList", al);
		request.getRequestDispatcher("evaluationMain.jsp?bookid="+bookid).forward(request, response);
		out.flush();
		out.close();
	}

}
