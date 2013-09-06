package com.shxt.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.admin.dao.BookListDAO;
import com.shxt.model.BookInfo;

public class EditBookInfo extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		ArrayList<BookInfo> al = new ArrayList<BookInfo>();
		
		int pageNow = 1;
		int pageCount = 0;
		int pageSize = 0;
		
		String bookid = request.getParameter("bookid");
		
		String bookname = request.getParameter("bookname");
		bookname = new String(bookname.getBytes("ISO-8859-1"),"utf-8");
		
		String bookprice = request.getParameter("bookuserprice");
		float bookuserprice = Float.parseFloat(bookprice);
		
		String isxiaxian = request.getParameter("isxiaxian");
		int book_is_xiaxian = Integer.parseInt(isxiaxian);
		
		String isnew = request.getParameter("isnew");
		int book_is_new = Integer.parseInt(isnew);
		
		String isbest = request.getParameter("istuijian");
		int book_is_best = Integer.parseInt(isbest);
		
		String ishot = request.getParameter("ishot");
		int book_is_hot = Integer.parseInt(ishot);
		
		String isyouhui = request.getParameter("isyouhui");
		int book_is_youhui = Integer.parseInt(isyouhui);
		
		String istuangou = request.getParameter("istuangou");
		int book_is_tuangou = Integer.parseInt(istuangou);
		
		BookListDAO bld = new BookListDAO();
		boolean b = bld.updateBookInfo(bookid,bookname,bookuserprice,book_is_xiaxian,book_is_new,book_is_best,book_is_hot,book_is_youhui,book_is_tuangou);
		if(b == true) {
			//调用dao层将信息查询出来
			al = bld.getPageBookList(pageNow);
			request.setAttribute("booklist", al);
			//计算出总页数
			pageCount = bld.getPageCountByType(10);
			//计算出总记录数
			String sqls = "select count(*) from bookshopping";
			pageSize = bld.getPageSize(sqls);
			request.getRequestDispatcher("admin/booklist.jsp?pageCount="+pageCount+"&pageNow="+pageNow+"&pageSize="+pageSize).forward(request, response);
		} else {
			out.println("<script>");
			out.println("alert('系统数据库正在维护中，给您带来的不便敬请原谅！')");
			out.println("</script>");
			request.getRequestDispatcher("editbooklist.jsp?bookid="+bookid).forward(request, response);
		}
		out.flush();
		out.close();
	}

}
