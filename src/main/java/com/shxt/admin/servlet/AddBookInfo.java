package com.shxt.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.admin.dao.BookListDAO;
import com.shxt.dao.BookInfoDAO;
import com.shxt.model.BookInfo;

public class AddBookInfo extends HttpServlet {

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
		BookInfoDAO binfo = new BookInfoDAO();
		
		ArrayList<BookInfo> al = new ArrayList<BookInfo>();
		BookListDAO bld = new BookListDAO();
		
		int pageNow = 1;
		int pageCount = 0;
		int pageSize = 0;
		
		//得到要处理的值
		String bookname = request.getParameter("bookname");
		bookname = new String(bookname.getBytes("ISO-8859-1"),"utf-8");
		
		//String bookid = request.getParameter("bookid");
		//得到下一个添加的图书编号
		String bookid = binfo.get_nextBookId();
		
		//通过session得到上传的图片名称
		String bookimage = (String)request.getSession().getAttribute("images");
		
		String bookauthor = request.getParameter("bookauthor");
		bookauthor = new String(bookauthor.getBytes("ISO-8859-1"),"utf-8");
		
		String bookpress = request.getParameter("bookpress");
		bookpress = new String(bookpress.getBytes("ISO-8859-1"),"utf-8");
		
		String bookoutdate = request.getParameter("bookoutdate");
		
		String booknum = request.getParameter("booknum");
		String booktype = request.getParameter("booktype");
		booktype = new String(booktype.getBytes("ISO-8859-1"),"utf-8");
		
		String bookpage = request.getParameter("bookpage");
		String booktext = request.getParameter("booktext");
		String zhuangding = request.getParameter("zhuangding");
		zhuangding = new String(zhuangding.getBytes("ISO-8859-1"),"utf-8");
		
		String bookbanci = request.getParameter("bookbanci");
		String weight = request.getParameter("weight");
		String bookmarketprice = request.getParameter("bookmarketprice");
		String bookuserprice = request.getParameter("bookuserprice");
		String isxiaxian = request.getParameter("isxiaxian");
		//这个有三种类型，故要用数组来接受
		String[] tuijian = request.getParameterValues("tuijian");
		int book_is_new = 1;
		int book_is_best = 0;
		int book_is_hot = 0;
		for(int i=0;i<tuijian.length;i++) {
			tuijian[i] = new String(tuijian[i].getBytes("ISO-8859-1"),"utf-8");
		}
		if(tuijian.length == 3) {
			book_is_best = 1;
			book_is_hot = 1;
		} else if(tuijian.length == 2) {
			if(tuijian[1].equals("精 品")) {
				book_is_best = 1;
				book_is_hot = 0;
			} else {
				book_is_best = 0;
				book_is_hot = 1;
			}
		}
		
		String istuangou = request.getParameter("istuangou");
		int book_is_tuangou = 0;
		if(istuangou.equals("1")) {
			book_is_tuangou = 1;
		} else {
			book_is_tuangou = 0;
		}
		
		String isyouhui = request.getParameter("isyouhui");
		int book_is_youhui = 0;
		if(isyouhui.equals("1")) {
			book_is_youhui = 1;
		} else {
			book_is_youhui = 0;
		}
		
		String textarea = request.getParameter("textarea");
		textarea = new String(textarea.getBytes("ISO-8859-1"),"utf-8");
		
		System.out.println("图书简介："+textarea+"  | 是否是优惠："+book_is_youhui+"  | 图书团购"+book_is_tuangou+"  | 图书是优惠："+book_is_youhui
				+"  | 图书是否畅销："+book_is_hot + "  |图书是否推荐："+book_is_best+"  | 图书是否新书："+book_is_new+"  | 图书是否下线："+isxiaxian
				+"  | 图书会员价："+bookuserprice+"  | 图书市场价："+bookmarketprice+"  | 图书重量："+weight+"  | 图书版次："+bookbanci+"  | 图书字数："+booktext
				+"  | 图书页数："+bookpage+"  | 图书库存量："+booknum+"  | 图书出版日期："+bookoutdate+"  | 图书作者："+bookauthor+"  | 图书出版社："+bookpress
				+"  | 图书id："+bookid+"  | 图书名称："+bookname+"  | 图书图片名称："+bookimage);
		//调用dao层的方法进行插入数据
		BookInfo book = new BookInfo();
		book.setBook_id(Integer.parseInt(bookid));
		book.setBook_name(bookname);
		book.setBook_author(bookauthor);
		book.setBook_press(bookpress);
		book.setBook_out_date(new Date(System.currentTimeMillis()));
		book.setBook_num(Integer.parseInt(booknum));
		book.setBook_introduce(textarea);
		book.setBook_type(booktype);
		book.setBook_isbn("ITNB10"+bookid);
		book.setBook_page(Integer.parseInt(bookpage));
		book.setBook_text(Integer.parseInt(booktext));
		book.setBook_zhuangding(zhuangding);
		book.setBook_banci(Integer.parseInt(bookbanci));
		book.setBook_weight(Integer.parseInt(weight));
		book.setBook_market_price(Integer.parseInt(bookmarketprice));
		book.setBook_user_price(Integer.parseInt(bookuserprice));
		book.setBook_buy_count(1);
		book.setBook_img(bookimage);
		book.setBook_is_delete(Integer.parseInt(isxiaxian));
		book.setBook_is_best(book_is_best);
		book.setBook_is_new(book_is_new);
		book.setBook_is_hot(book_is_hot);
		book.setBook_is_tuangou(book_is_tuangou);
		book.setBook_is_youhui(book_is_youhui);
		book.setType_id("222");
		book.setBook_press_id("222");
		boolean b = bld.insertBookInfo(book);
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
		}else {
			out.println("<script>");
			out.println("alert('系统数据库正在维护中，给您带来的不便敬请原谅！')");
			out.println("window.open('http://localhost:8080/BookShopping/admin/addbooklist.jsp','_self');");
			out.println("</script>");
		}
		out.flush();
		out.close();
	}

}
