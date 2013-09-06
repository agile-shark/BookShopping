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
import com.shxt.model.BookInfo;

public class Gouwuche extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		BookInfoDAO dao = new BookInfoDAO();
		
		CarDAO cdao = (CarDAO)request.getSession().getAttribute("mycar");
		if(cdao==null){
			cdao = new CarDAO();
			request.getSession().setAttribute("mycar", cdao);
		} 
		if(!type.equals("buy")) {
			if(type.equals("showCar")) {
				cdao.addBook(id, "1");
			} else if(type.equals("delete")) {
				cdao.delBook(id);
			} else if(type.equals("delAll")) {
				cdao.carClear();
			} else if(type.equals("update")){
				String bookid[] = request.getParameterValues("id");
				String newNum[] = request.getParameterValues("booknum");
				for(int i=0;i<bookid.length;i++){
					cdao.update(bookid[i], newNum[i]);
				}
			} else if(type.equals("showMyCar")) {
				
			}
			//得到指定图书的库存量
			String bookNums = request.getParameter("booknum");
			ArrayList<BookInfo> list = cdao.showCar();
			request.setAttribute("carList",list);
			request.getRequestDispatcher("car.jsp").forward(request, response);
		} else {
			ArrayList<BookInfo> list = cdao.showCar();
			request.setAttribute("carList",list);
			request.getRequestDispatcher("OrderDisplay.jsp").forward(request, response);
		}
	
		out.flush();
		out.close();
	}

}
