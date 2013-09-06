package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.model.BookInfo;
import com.shxt.util.Common;

public class top_search extends HttpServlet {
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
		
		//得到从头页面中搜索跳转过来的条件
		String type = request.getParameter("category");
		String search_type = request.getParameter("searchType");
		search_type = new String(search_type.getBytes("ISO-8859-1"),"utf-8");
		String sql = "select * from bookshopping where " + type + "='" + search_type + "'";
		System.out.println("从头页面中过来之后拼接的sql语句为:" + sql);
		
		Common common = new Common();
		
		//得到每种类型共有的总页数
		int num = 1;
		//得到每种类型共有的记录数
		int all = 0;
		//用于在页面上显示以何种方式进行的显示
		String name = "leixing";
		//计算记录数的sql语句
		String sqls = "select count(*) from bookshopping where " + type + "='" + search_type + "'";
		num = common.getPageCountByType(10, sqls);
		all = common.getBookCountByAll(sqls);
		if(type.equals("book_type")) {
			name = "leixing";
		} else {
			name = "chubanshe";
		}
		
		
		List<BookInfo> list = new ArrayList<BookInfo>();
		//得到当前页
		int pageNow = 1;
		String page = request.getParameter("pageNow");
		if(page == null) {
			pageNow = 1;
		} else {
			pageNow = Integer.parseInt(page);
		}
		
		list = common.getPageByTypeBookList(sql, pageNow);
		request.setAttribute("booklist", list);
		request.setAttribute("sql", sql);
		request.getRequestDispatcher("more_type_combine.jsp?type="+name+"&pageCount="+num+"&allSize="+all).forward(request, response);

		out.flush();
		out.close();
	}

}
