package com.shxt.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.admin.dao.EvaluationListDAO;
import com.shxt.model.Evaluation;

public class GetEvaList extends HttpServlet {

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
		EvaluationListDAO evaDao = new EvaluationListDAO();
		String id = request.getParameter("id");
		if(id != null){
			evaDao.delete(Integer.parseInt(id));
		}
		
		int pageNow = 1;
		String pagenow = request.getParameter("pageNow");
		if(pagenow != null){
			pageNow = Integer.parseInt(pagenow);
		}
		int pageCount = evaDao.getPageCount(5);
		String type = request.getParameter("type");
		if(type != null){
			evaDao.deleteAll(pageNow);
		}
		
		List<Evaluation> eval = new ArrayList<Evaluation>();
		if(type == null){
			eval = evaDao.getPageEvaList(pageNow);
		}else{
				if(pageNow == pageCount){
					eval = evaDao.getPageEvaList(pageNow - 1);
				}else{
					eval = evaDao.getPageEvaList(pageNow + 1);
				}
		}
		
		request.setAttribute("eval", eval);
		request.setAttribute("pageNow", pageNow);
		request.setAttribute("pageCount", pageCount);
		
		request.getRequestDispatcher("admin/evalist.jsp").forward(request,response);
		out.flush();
		out.close();
	}

}
