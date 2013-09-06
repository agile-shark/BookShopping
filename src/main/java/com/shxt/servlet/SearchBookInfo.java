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

public class SearchBookInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		Common common = new Common();
		
		//得到每种类型共有的总页数
		int num = 1;
		//得到每种类型共有的记录数
		int all = 0;
		//用于在页面上显示以何种方式进行的显示
		String name = "leixing";
		//公用的sql语句
		String sql = request.getParameter("sql");
		if(sql == null) {
			//得到搜索图书检索的方式
			String type = request.getParameter("name");
			//得到要搜索的关键字
			String sqlname = request.getParameter("type");
			if(type.equals("types")){
				//图书类型检索
				String booktype = "计算机";
				if(sqlname.equals("jingji")) {
					booktype = "经融管理";
				} else if(sqlname.equals("english")) {
					booktype = "英语";
				} else if(sqlname.equals("math")) {
					booktype = "数学";
				} else {
					booktype = "计算机";
				}
				sql = "select * from bookshopping where book_type='" + booktype + "'";
				String sqls = "select count(*) from bookshopping where book_type='" + booktype + "'";
				num = common.getPageCountByType(10, sqls);
				all = common.getBookCountByAll(sqls);
				name = "leixing";
			} else if(type.equals("jiage")) {
				//图书价格检索
				String sqls = "";
				int price = 10;
				if(sqlname.equals("san")) {
					price = 10;
				} else if(sqlname.equals("wu")) {
					price = 30;
				} else if(sqlname.equals("qi")) {
					price = 50;
				} else {
					price = 70;
				}
				if(price == 70) {
					sql = "select * from bookshopping where book_market_price>"+price;
					sqls = "select count(*) from bookshopping where book_market_price>"+price;
				} else {
					sql = "select * from (select * from bookshopping where book_market_price>"+price+") where book_market_price<" +(price+20);
					sqls = "select count(*) from (select * from bookshopping where book_market_price>"+price+") where book_market_price<" +(price+20);
				}
				
				num = common.getPageCountByType(10, sqls);
				all = common.getBookCountByAll(sqls);
				name = "jiage";
			} else if (type.equals("chubanshe")) {
				//图书出版社检索
				String press = "北京大学出版社";
				if(sqlname.equals("xindongfang")){
					press = "北京大学出版社";
				} else if(sqlname.equals("qinghua")) {
					press = "清华大学出版社";
				} else if(sqlname.equals("tongji")) {
					press = "同济大学出版社";
				} else if(sqlname.equals("jixie")) {
					press = "机械工业大学出版社";
				} else {
					press = "北京大学出版社";
				}
				name = "chubanshe";
				sql = "select * from bookshopping where book_press='"+press+"'";
				String sqls = "select count(*) from bookshopping where book_press='"+press+"'";
				num = common.getPageCountByType(10, sqls);
				all = common.getBookCountByAll(sqls);
			}
		} else {
			sql = request.getParameter("sql");
			sql = new String(sql.getBytes("ISO-8859-1"),"utf-8");
		}
		//将得到的sql语句利用jdbc进行处理并将结果返回
		
		List<BookInfo> list = new ArrayList<BookInfo>();
		//得到从more_type.jsp页面中传过来的totalSize的值ֵ
		String totalSize = request.getParameter("totalSize");
		if(totalSize != null) {
			all = Integer.parseInt(totalSize);
		}
		//得到总共该项共有的页数
		String pageCount = request.getParameter("pageCount");
		if(pageCount != null) {
			num = Integer.parseInt(pageCount);
		}
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
		request.setAttribute("pageNow", pageNow);
		request.getRequestDispatcher("more_type_combine.jsp?type="+name+"&pageCount="+num+"&allSize="+all).forward(request, response);
		out.flush();
		out.close();
	}

}
