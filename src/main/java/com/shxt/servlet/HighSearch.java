package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.PageDAO;
import com.shxt.model.PagingBean;

public class HighSearch extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		this.doPost(request, response);
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		
		String attr = request.getParameter("attr");
		String bookpress = request.getParameter("bookpress");
		String ser_text = request.getParameter("ser_text");
		if(ser_text!=null&&"".equals(ser_text))
			ser_text = ser_text.toUpperCase();
		String type = request.getParameter("type");
		String min_price = request.getParameter("min_price");
		String max_price = request.getParameter("max_price");
		//System.out.println(attr+"+"+bookpress+"+"+ser_text+"+"+type+"+"+min_price+"+"+max_price);
		String sql = "select * from bookshopping where '1'='1'";
		if(ser_text!=null&&!"".equals(ser_text)){
			sql = sql+" and upper("+attr+") like '%"+ser_text+"%'";
		}
		if(bookpress!=null&&!"".equals(bookpress)){
			sql = sql+" and book_press ='"+bookpress+"'";
		}
		if(type!=null&&!"".equals(type)){
			sql = sql+" and book_type ='"+type+"'";
		}
		if(max_price!=null&&!"".equals(max_price)){
			sql = sql+" and book_user_price<='"+max_price+"'";
		}
		if(min_price!=null&&!"".equals(min_price)){
			sql = "select * from ("+sql+") where book_user_price>='"+min_price+"'";
		}
		
		//System.out.println("sql语句："+sql);
		PageDAO pd = new PageDAO();
		PagingBean pb = pd.getPage(sql, 1, 10);
//		System.out.println("list的大小："+list.size());
//		for(int i = 0;i<list.size();i++){
//			System.out.println(list.get(i).get("BOOKID")+"  "+list.get(i).get("BOOK_NAME"));
//		}
		request.setAttribute("pb", pb);
		request.setAttribute("mysql", sql);
		request.getRequestDispatcher("more_search.jsp").forward(request, response);
		
		out.flush();
		out.close();
	}

	
}
