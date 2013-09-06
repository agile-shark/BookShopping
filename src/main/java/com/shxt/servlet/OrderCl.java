package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.BookInfoDAO;
import com.shxt.dao.CarDAO;
import com.shxt.dao.OrderDAO;
import com.shxt.model.BookInfo;
import com.shxt.model.UserInfo;

public class OrderCl extends HttpServlet {
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
		//送货方式
		String  sendMode = request.getParameter("radiobutton");
		//付款方式
		String payMode = request.getParameter("radiobutton1");
		//是否要包装
		String isPackage = request.getParameter("radiobutton2");
		//是否要祝福贺卡
		String haveCard = request.getParameter("radiobutton3");
		//缺货处理请求
		String bookNotHave = request.getParameter("radiobutton4");
		
		sendMode = new String(sendMode.getBytes("ISO-8859-1"),"utf-8");
		payMode = new String(payMode.getBytes("ISO-8859-1"),"utf-8");
		isPackage = new String(isPackage.getBytes("ISO-8859-1"),"utf-8");
		haveCard = new String(haveCard.getBytes("ISO-8859-1"),"utf-8");
		bookNotHave = new String(bookNotHave.getBytes("ISO-8859-1"),"utf-8");
		System.out.println(sendMode + "   " + payMode + isPackage + "   " + haveCard + bookNotHave);
		
		//得到购物车的car，将car中的信息取出，并将car从session中去掉
		CarDAO cdao = (CarDAO)request.getSession().getAttribute("mycar");
		float userAllPrice = cdao.getUserAllPrice();
		System.out.println("第一次总价为："+userAllPrice);
		float sendPrice = 0.0f;
		
		int isHavePack = 0;
		int isHaveCard = 0;
		
		if(sendMode.equals("申通快递")) {
			sendPrice = 15.0f;
		} else if(sendMode.equals("城际快递")) {
			sendPrice = 10.0f;
		} else {
			sendPrice = 3.5f;
		}
		float packagePrice = 0.0f;
		if(isPackage.equals("精品包装")) {
			packagePrice = 5.0f;
			isHavePack = 1;
		} else {
			packagePrice = 0.0f;
			isHavePack = 0;
		}
		float cardPrice = 0.0f;
		if(haveCard.equals("祝福贺卡")) {
			cardPrice = 5.0f;
			isHaveCard = 1;
		} else {
			cardPrice = 0.0f;
			isHaveCard = 0;
		}
		userAllPrice += sendPrice+packagePrice+cardPrice;
		float sendAllPrice = sendPrice+packagePrice+cardPrice;
		//System.out.println("第二次的总价："+userAllPrice);
		//System.out.println("配送总价为："+ sendAllPrice);
		UserInfo userinfo = (UserInfo)request.getSession().getAttribute("user");
		//得到购物车中的书籍列表
		//ArrayList<BookInfo> books = (ArrayList<BookInfo>)request.getSession().getAttribute("books");
		//得到userid   下一个是orderdate（添加系统时间）userinfo.getUserid();
		//得到邮费的价格sendAllPrice
		//得到购物车的总价（包含邮费等）userAllPrice
		//得到发货的详细地址
		//System.out.println(userinfo.getSendaddress());
		//得到配货方式
		//sendMode
		//得到付款方式
		//payMode
		//是否确认、是否发货、发货状态  添加的时候为默认的
		//得到是否有包装、是否有贺卡
		//isHavaPack  isHaveCard 
		OrderDAO odao = new OrderDAO();
		boolean b = odao.addOrder(cdao, userinfo.getUserid()+"", sendAllPrice, userAllPrice, userinfo.getSendaddress(), sendMode, payMode, isHavePack, isHaveCard);
		
		if(b == true) {
			request.getRequestDispatcher("showOrders.jsp").forward(request, response);
		} else {
			out.println("<script>");
			out.println("alert('系统数据库正在维护中，给您带来的不便敬请原谅！')");
			out.println("</script>");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		out.flush();
		out.close();
	}

}
