package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.db.DBUtil;

public class GetCity extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/xml;charset=utf-8");
		PrintWriter out = response.getWriter();
		String citycode=request.getParameter("citycode");
		String sql="select * from dict where dictcode like '"+citycode.substring(0,2)+"__00' and dictcode <> '"+citycode+"'";
		DBUtil dbu=new DBUtil();
		List<Map<String,Object>> list=dbu.queryToList(sql);
		out.print("<root>");
		for(int i=0;i<list.size();i++){
			out.print("<city>");
			out.print("<city-code>"+list.get(i).get("DICTCODE")+"</city-code>");
			out.print("<city-value>"+list.get(i).get("DICTVALUE")+"</city-value>");
			out.print("</city>");
		}
		out.print("</root>");
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/xml;charset=utf-8");
		this.doGet(request, response);
	}
}
