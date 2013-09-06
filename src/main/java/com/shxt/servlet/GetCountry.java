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

public class GetCountry extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/xml;charset=utf-8");
		PrintWriter out = response.getWriter();
		String countrycode = request.getParameter("countrycode");
		String sql = "select * from dict where dictcode like '"
				+ countrycode.substring(0, 4) + "__' and dictcode <> '"
				+ countrycode + "'";
		DBUtil dbu = new DBUtil();
		List<Map<String, Object>> list = dbu.queryToList(sql);
		out.print("<root>");
		for (int i = 0; i < list.size(); i++) {
			out.print("<country>");
			out.print("<country-code>" + list.get(i).get("DICTCODE")
					+ "</country-code>");
			out.print("<country-value>" + list.get(i).get("DICTVALUE")
					+ "</country-value>");
			out.print("</country>");
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
