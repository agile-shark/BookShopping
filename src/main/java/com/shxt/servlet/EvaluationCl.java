package com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.dao.EvaluationDAO;
import com.shxt.test.DoFilter;

public class EvaluationCl extends HttpServlet {

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
		EvaluationDAO evadao = new EvaluationDAO();
		
		String bookid = request.getParameter("bookid");
		String userid = request.getParameter("userid");
		
		String username = request.getParameter("username");
		String evaTitle = request.getParameter("select");
		evaTitle = new String(evaTitle.getBytes("ISO-8859-1"),"utf-8");
		String evaRank = request.getParameter("radiobutton");
		String evaText = request.getParameter("content");
		evaText = new String(evaText.getBytes("ISO-8859-1"),"utf-8");
		
		//对文本信息进行过滤
		DoFilter filter = new DoFilter();
		evaText = filter.getStr(evaText);
		System.out.println(evaText);
		
		String random = request.getParameter("random");
		String image = request.getParameter("image");
		String random_wai = (String)request.getSession().getAttribute("random");
		if(random.equals(random_wai)){
			boolean flag = evadao.insertEvaluation(bookid, userid, username, evaTitle, evaRank, evaText,image);
			if(flag == true) {
				//evaluationMain.jsp?bookid=1&evaluateNum=5
				int num = evadao.getEvaluateNum(bookid);
				request.getRequestDispatcher("evaluationMain.jsp?bookid="+bookid+"&evaluateNum="+num).forward(request, response);
			} else {
				out.println("<script>");
				out.println("alert('评论失败，请重新评论！')");
				out.println("window.open('index.jsp','_self');");
				out.println("</script>");
			}
		} else {
			out.println("<script>");
			out.println("alert('输入的验证码错误,请不要进行恶意评论!')");
			out.println("window.open('index.jsp','_self');");
			out.println("</script>");
		}
		
		System.out.println(username + "   " + evaTitle + "   " + evaRank + "   " + evaText + "   " + random);
		
		out.flush();
		out.close();
	}

}
