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

public class GetBookList extends HttpServlet {

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
		
		ArrayList<BookInfo> al = new ArrayList<BookInfo>();
		BookListDAO bld = new BookListDAO();
		
		//处理图书信息的删除请求
		String bookid = request.getParameter("bookid");
		//调用dao层的方法进行删除操作
		int deleteN = bld.deleteBookInfo(bookid);
		if(deleteN == -1) {
			out.println("<script>");
			out.println("alert('在进行删除指定图书信息的时候数据库出错了！')");
			out.println("</script>");
		}
		
		
		//默认情况下当前页为第一页
		int pageNow = 1;
		String s_pageNow = request.getParameter("pageNow");
		if(s_pageNow==null) {
			pageNow = 1;
		} else {
			pageNow = Integer.parseInt(s_pageNow);
		}
		
		int pageCount = 0;
		
		//得到是从哪个处理方面的程序
		String type = request.getParameter("type");
		String sql = "";
		String pageSql = "";
		int pageSize = 0;
		if(type!=null) {
			if(type.equals("search")) {
				//得到搜索的信息
				String booktype = request.getParameter("booktype");//得到图书的类型
				String bookpress = request.getParameter("bookpress");//得到图书的出版社
				String bookbuy = request.getParameter("bookbuy");//得到图书的购买类型
				if(booktype != null) {
					booktype = new String(booktype.getBytes("ISO-8859-1"),"utf-8");
					bookpress = new String(bookpress.getBytes("ISO-8859-1"),"utf-8");
					bookbuy = new String(bookbuy.getBytes("ISO-8859-1"),"utf-8");
					//System.out.println(booktype + "  " + bookpress + "   " + bookbuy);
					if(bookbuy.equals("0")){
						if(booktype.equals("0")) {
							if(bookpress.equals("0")) {
								sql = "select * from bookshopping";
								pageSql = "select count(*) from bookshopping";
							} else {
								sql = "select * from bookshopping where book_press in('"+bookpress+"')";
								pageSql = "select count(*) from bookshopping where book_press in('"+bookpress+"')";
							}
						} else {
							if(bookpress.equals("0")){
								sql = "select * from bookshopping where book_type in('"+booktype+"')";
								pageSql = "select count(*) from bookshopping where book_type in('"+booktype+"')";
							} else {
								sql = "select * from bookshopping where book_type in('"+booktype+"') and book_press in('"+bookpress+"')";
								pageSql = "select count(*) from bookshopping where book_type in('"+booktype+"') and book_press in('"+bookpress+"')";
							}
						}
					} else {
						if(booktype.equals("0") && bookpress.equals("0")) {
							sql = "select * from bookshopping where "+bookbuy+"=1";
							pageSql = "select count(*) from bookshopping where "+bookbuy+"=1";
						} else if(booktype.equals("0") && !bookpress.equals("0")) {
							sql = "select * from bookshopping where "+bookbuy+"=1 and book_type in('"+booktype+"')";
							pageSql = "select count(*) from bookshopping where "+bookbuy+"=1 and book_type in('"+booktype+"')";
						} else if(!booktype.equals("0") && bookpress.equals("0")) {
							sql = "select * from bookshopping where "+bookbuy+"=1 and book_press in('"+bookpress+"')";
							pageSql = "select count(*) from bookshopping where "+bookbuy+"=1 and book_press in('"+bookpress+"')";
						} else {
							sql = "select * from bookshopping where book_type in('"+booktype+"') and book_press in('"+bookpress+"') and "+bookbuy+" in(1)";
							pageSql = "select count(*) from bookshopping where book_type in('"+booktype+"') and book_press in('"+bookpress+"') and "+bookbuy+" in(1)";
						}
					} 
					System.out.println("真正进行查询的sql语句："+sql);
					al = (ArrayList<BookInfo>) bld.getBookList(sql);
					request.setAttribute("booklist", al);
				}
				//计算出总页数
				pageCount = bld.getPageCountByType(10, pageSql);
				//计算出总记录数
				pageSize = bld.getPageSize(pageSql);
			}else {
				String[] bookisbn = request.getParameterValues("booksisbn");
				String sqls = "update bookshopping set book_is_delete=1 where book_isbn in(";
				for(int i = 0; i < bookisbn.length; i++) {
					//System.out.println(bookisbn[i]);
					sqls += bookisbn[i]+",";
				}
				int n = sqls.lastIndexOf(",");
				sqls = sqls.substring(0,n) + ")";
				System.out.println("拼接好的sql语句为：" + sqls);
				//调用dao层的方法进行删除操作
				boolean b = bld.deleteBookList(sqls);
				//boolean b = true;
				
				
				//调用dao层将信息查询出来
				al = bld.getPageBookList(pageNow);
				request.setAttribute("booklist", al);
				//计算出总页数
				pageCount = bld.getPageCountByType(10);
				//计算出总记录数
				String sqls1 = "select count(*) from bookshopping";
				pageSize = bld.getPageSize(sqls1);
				if(b == true) {
					request.getRequestDispatcher("admin/booklist.jsp?pageCount="+pageCount+"&pageNow="+pageNow+"&pageSize="+pageSize).forward(request, response);
				} else {
					out.println("<script>");
					out.println("alert('系统数据库正在维护中，给您带来的不便敬请原谅！')");
					out.println("</script>");
					request.getRequestDispatcher("admin/booklist.jsp?pageCount="+pageCount+"&pageNow="+pageNow+"&pageSize="+pageSize).forward(request, response);
				}
			} 
		}else {
			//调用dao层将信息查询出来
			al = bld.getPageBookList(pageNow);
			request.setAttribute("booklist", al);
			//计算出总页数
			pageCount = bld.getPageCountByType(10);
			//计算出总记录数
			String sqls = "select count(*) from bookshopping";
			pageSize = bld.getPageSize(sqls);
		}
		
		request.getRequestDispatcher("admin/booklist.jsp?pageCount="+pageCount+"&pageNow="+pageNow+"&pageSize="+pageSize).forward(request, response);
		out.flush();
		out.close();
	}

}
