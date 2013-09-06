package com.shxt.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.admin.dao.MessageListDAO;
import com.shxt.model.Message;

public class GetMessageList extends HttpServlet {

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
		MessageListDAO messageDao = new MessageListDAO();
		
		//处理回复内容的信息
		String messageid = request.getParameter("messageid");
		if(messageid != null) {
			//说明就是进了回复留言状态了.;得到回复的内容
			String messageContext = request.getParameter("messagecontext");
			messageContext = new String(messageContext.getBytes("ISO-8859-1"),"utf-8");
			//调用dao层进行更新留言信息
			boolean b = messageDao.updateMessageInfo(messageid,messageContext);
			if(b == true) {
				out.println("<script>");
				out.println("alert('恭喜您管理员，回复留言成功!')");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('对不起，回复留言失败!')");
				out.println("window.open('admin/answerMessage.jsp?message_id='"+messageid+"','_self');");
				out.println("</script>");
			}
		}
		
		
		
		String id = request.getParameter("id");
		if(id != null){
			messageDao.delete(Integer.parseInt(id));
		}
		
		int pageNow = 1;
		String pagenow = request.getParameter("pageNow");
		if(pagenow != null){
			pageNow = Integer.parseInt(pagenow);
		}
		int pageCount = messageDao.getPageCount(5);
		String type = request.getParameter("type");
		if(type != null){
			messageDao.deleteAll(pageNow);
		}
		
		List<Message> message = new ArrayList<Message>();
		if(type == null){
			message = messageDao.getPageMessageList(pageNow);
		}else{
				if(pageNow == pageCount){
					message = messageDao.getPageMessageList(pageNow - 1);
				}else{
					message = messageDao.getPageMessageList(pageNow + 1);
				}
		}
		request.setAttribute("message", message);
		request.setAttribute("pageNow", pageNow);
		request.setAttribute("pageCount", pageCount);
		
		request.getRequestDispatcher("admin/message.jsp").forward(request,response);
		out.flush();
		out.close();
	}

}
