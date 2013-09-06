package com.shxt.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.BookInfoDAO;
import com.shxt.dao.YouhuiDAO;
import com.shxt.model.BookInfo;

public class AdminTuangouCl extends HttpServlet {

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
		YouhuiDAO youhui = new YouhuiDAO();
		BookInfoDAO bid = new BookInfoDAO();
		
		//初始化操作的sql语句
		String sql = "";
		String sqlbook = "";
		
		//得到处理的类型
		String type = request.getParameter("type");
		if(type.equals("deleteOne")) {
			//得到要删除的id号
			String id = request.getParameter("youhuiid");
			sql = "delete activity where activityid='" + id + "'";
			//得到要修改的bookid号
			String bookid = request.getParameter("bookid");
			sqlbook = "update bookshopping set book_is_tuangou=0 where bookid='" +bookid+ "'";
			//调用dao层的方法进行删除操作
			boolean b = youhui.deleteActivity(sql);
			if(b == true) {
				//执行图书信息表的更新操作
				bid.updateBookInfo(sqlbook);
				out.println("<script>");
				out.println("alert('恭喜您,删除成功！')");
				out.println("window.open('admin/tuangou.jsp','_self');");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('对不起,删除失败！')");
				out.println("window.open('admin/tuangou.jsp','_self');");
				out.println("</script>");
			}
		} else if(type.equals("deleteAll")) {
			
			sql = "delete activity where activityid in(";
			sqlbook = "update bookshopping set book_is_youhui=0 where bookid in(";
			
			String[] activityid = request.getParameterValues("checkbox");
			for(int i=0;i<activityid.length;i++) {
				sql += activityid[i] + ",";
			}
			sql = sql.substring(0,sql.lastIndexOf(','))+")";
			
			String[] bookid = request.getParameterValues("booksid");
			for(int i=0;i<bookid.length;i++){
				sqlbook += bookid[i]+",";
			}
			sqlbook = sqlbook.substring(0,sqlbook.lastIndexOf(','))+")";
			
			System.out.println(sql);
			System.out.println(sqlbook);
			
			boolean b = youhui.deleteActivity(sql);
			if(b == true) {
				bid.updateBookInfo(sqlbook);
				out.println("<script>");
				out.println("alert('恭喜您,删除成功！')");
				out.println("window.open('admin/tuangou.jsp','_self');");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('对不起,删除失败！')");
				out.println("window.open('admin/tuangou.jsp','_self');");
				out.println("</script>");
			}
		} else if(type.equals("modify")) {
			//得到有修改的优惠信息id号
			String id = request.getParameter("youhuiid");
			
			String name = request.getParameter("activityname");
			name = new String(name.getBytes("ISO-8859-1"),"utf-8");
			String start_time = request.getParameter("activity_start_time");
			String stop_time = request.getParameter("activity_stop_time");
			String num = request.getParameter("num");
			
			System.out.println("开始时间：" + start_time + "结束时间：" + stop_time);
			
			sql = "update activity set activity_startdate='"+start_time+"',activity_stopdate='"+stop_time+"',tuangou_number="+num+",activity_title='"+name+"' where activityid='"+id+"'";
			boolean b = youhui.deleteActivity(sql);
			if(b == true) {
				out.println("<script>");
				out.println("alert('恭喜您,更新成功！')");
				out.println("window.open('admin/tuangou.jsp','_self');");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('对不起,更新失败！')");
				out.println("window.open('admin/tuangou.jsp','_self');");
				out.println("</script>");
			}
		} else if(type.equals("search")) {
			//得到要搜索的类型名称
			String select = request.getParameter("select");
			select = new String(select.getBytes("ISO-8859-1"),"utf-8");
			sql = "select * from bookshopping where book_type='" +select+ "'";
			ArrayList<BookInfo> al = bid.queryBookList(sql);
			String sqls = "select count(*) from bookshopping where book_type='" +select+ "'";
			int n = bid.queryBookListByNum(sqls);
			request.setAttribute("bookInfo", al);
			request.getRequestDispatcher("admin/addtuangoubook.jsp?num="+n).forward(request, response);
		} else if(type.equals("addAll")){
			//得到所要添加优惠的图书所要编号
			String[] bookid = request.getParameterValues("checkboxs");
			if(bookid==null) {
				out.println("<script>");
				out.println("alert('对不起,不能提交空的书籍，请选择后再进行提交！')");
				out.println("window.open('admin/addtuangoubook.jsp','_self');");
				out.println("</script>");
			} else {
				ArrayList<String> bookname = new ArrayList<String>();
				for(int i=0;i<bookid.length;i++) {
					System.out.println(bookid[i]);
					bookname.add(bid.getBookInfo(bookid[i]).getBook_name());
					System.out.println(bookname.get(i));
				}
				request.getSession().setAttribute("booksid", bookid);
				request.setAttribute("booksname", bookname);
				request.getRequestDispatcher("admin/addtuangou.jsp").forward(request, response);
			}
		} else {
			//进行真正的添加优惠图书信息
			String activityname = request.getParameter("activityname");
			activityname = new String(activityname.getBytes("ISO-8859-1"),"utf-8");
			String start_time = request.getParameter("start_time");
			String stop_time = request.getParameter("stop_time");
			String booknum = request.getParameter("activitynum");
			int num = Integer.parseInt(booknum);
			//调用session得到要修改的图书id号
			String[] bookid = (String[])request.getSession().getAttribute("booksid");
			for(int i = 0; i < bookid.length; i++) {
				sql = "insert into activity values('"+youhui.getNextActivityId()+"','"+start_time+"','"+stop_time+"',5,"+num+",'tuangou','"+bookid[i]+"','"+activityname+"')";
				System.out.println(sql);
				//更新图书信息表
				sqlbook = "update bookshopping set book_is_tuangou=1 where bookid in("+bookid[i]+",";
				youhui.deleteActivity(sql);
			}
			sqlbook = sqlbook.substring(0,sqlbook.lastIndexOf(',')) + ")";
			System.out.println(sqlbook);
			//进行更新图书信息表
			boolean b = bid.updateBookInfo(sqlbook);
			if(b == true) {
				out.println("<script>");
				out.println("alert('恭喜您,添加成功！')");
				out.println("window.open('admin/tuangou.jsp','_self');");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('对不起,添加失败！')");
				out.println("window.open('admin/tuangou.jsp','_self');");
				out.println("</script>");
			}
		}
		out.flush();
		out.close();
	}

}
