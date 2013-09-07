package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import com.shxt.dao.*;
import com.shxt.model.*;

public final class top_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	BookInfoDAO bdao = new BookInfoDAO();
	List<String> book_type = bdao.getBookType();
	List<String> book_press = bdao.getBookPress();
	UserInfo user = (UserInfo)request.getSession().getAttribute("user");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n");
      out.write("<html>\r\n");
      out.write("  <head>\r\n");
      out.write("\t<link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\tvar xmlhttps;\r\n");
      out.write("\t\tfunction createXmlHttpRequest3() {\r\n");
      out.write("\t\t\tif (window.XMLHttpRequest) {// code for all new browsers\r\n");
      out.write("\t\t\t\txmlhttps = new XMLHttpRequest();\r\n");
      out.write("\t\t\t} else if (window.ActiveXObject) {//code for IE5 and IE6\r\n");
      out.write("\t\t\t\txmlhttps = new ActiveXObject(\"Microsoft.XMLHTTP\");\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\treturn xmlhttps;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tfunction getType() {\r\n");
      out.write("\t\t\tcreateXmlHttpRequest3();\r\n");
      out.write("\t\t\txmlhttps.onreadystatechange = onready3;\r\n");
      out.write("\t\t\tvar search = document.getElementById(\"searchSelect\");\r\n");
      out.write("\t\t\txmlhttps.open(\"get\", \"GetResult?type=\" + search.value, false);\r\n");
      out.write("\t\t\txmlhttps.send(null);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tfunction onready3() {\r\n");
      out.write("\t\t\tif (xmlhttps.readyState == 4) {\r\n");
      out.write("\t\t\t\tif (xmlhttps.status == 200) {\r\n");
      out.write("\t\t\t\t\tvar myxml = xmlhttps.responseXML;\r\n");
      out.write("\t\t\t\t\tvar books = myxml.getElementsByTagName(\"book\");\r\n");
      out.write("\t\t\t\t\tvar result = document.getElementById(\"result\");\r\n");
      out.write("\t\t\t\t\tresult.length=0;\r\n");
      out.write("\t\t\t\t\tfor ( var i = 0; i < books.length; i++) {\r\n");
      out.write("\t\t\t\t\t\tvar bookcode = books[i].firstChild.firstChild.data;\r\n");
      out.write("\t\t\t\t\t\tvar bookvalue = books[i].lastChild.firstChild.data;\r\n");
      out.write("\t\t\t\t\t\tvar option = document.createElement(\"option\");\r\n");
      out.write("\t\t\t\t\t\toption.value = bookcode;\r\n");
      out.write("\t\t\t\t\t\toption.text = bookvalue;\r\n");
      out.write("\t\t\t\t\t\ttry {\r\n");
      out.write("\t\t\t\t\t\t\tresult.add(option, null); // standards compliant\r\n");
      out.write("\t\t\t\t\t\t} catch (ex) {\r\n");
      out.write("\t\t\t\t\t\t\tresult.add(option); // IE only\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t</script>\r\n");
      out.write("  </head>\r\n");
      out.write("  \r\n");
      out.write("  <body>\r\n");
      out.write("<div class=\"block clearfix\">\r\n");
      out.write(" <div class=\"f_l\"><a href=\"index.jsp\"><img src = \"img/logo.png\"></a></div>\r\n");
      out.write(" <div class=\"f_r log\">\r\n");
      out.write("   <ul>\r\n");
      out.write("   <li class=\"userInfo\">\r\n");
      out.write("   <script type=\"text/javascript\" src=\"js/transport.js\"></script><script type=\"text/javascript\" src=\"js/utils.js\"></script>   <font size=\"2px\">\r\n");
      out.write("   ");

   		if(user != null) {
   			
      out.write("\r\n");
      out.write("   \t\t\t\t您好,<font color=\"red\">\r\n");
      out.write("   \t\t\t");
      out.print(user.getUsername() );
      out.write("\r\n");
      out.write("   \t\t\t</font>,欢迎您的回来！\r\n");
      out.write("   \t\t\t");

   			
   		} else {
   			
      out.write("\r\n");
      out.write("   \t\t\t 欢迎光临酷星书店&nbsp;&nbsp;&nbsp;\r\n");
      out.write("   \t\t\t <a href=\"login.jsp?type=top\"><img src = \"img/bnt_log.gif\"></a>\r\n");
      out.write(" \t\t\t<a href=\"GetProvince\"><img src = \"img/bnt_reg.gif\"></a>\r\n");
      out.write("   \t\t\t");

   		}
   
      out.write("\r\n");
      out.write(" </font>\r\n");
      out.write("   </li>\r\n");
      out.write("      <li id=\"topNav\" class=\"clearfix\">\r\n");
      out.write("      \t\t\t");

      				if(request.getSession().getAttribute("user")!=null) {
      					
      out.write("\r\n");
      out.write("      \t\t\t\t\t<a href=\"Gouwuche?type=showMyCar\" target=\"parent\">查看购物车</a>\r\n");
      out.write("      \t\t\t\t\t|\r\n");
      out.write("                            \r\n");
      out.write("                            <a href=\"Frameset.jsp\">个人中心</a>\r\n");
      out.write("                         |\r\n");
      out.write("                            <a href=\"ZhuXiao\">系统注销</a>\r\n");
      out.write("      \t\t\t\t\t");

      				} else {
      					
      out.write("\r\n");
      out.write("      \t\t\t\t\t查看购物车\r\n");
      out.write("      \t\t\t\t\t|\r\n");
      out.write("                            \t个人中心\r\n");
      out.write("                         |\r\n");
      out.write("                            \t系统注销\r\n");
      out.write("      \t\t\t\t\t");

      				}
      			
      out.write("\r\n");
      out.write("      \t\t\t|\r\n");
      out.write("                            <a href=\"Youhui?activity_type=tuangou\">团购中心</a>\r\n");
      out.write("                \r\n");
      out.write("   <div class=\"topNavR\"></div>\r\n");
      out.write("   </li>\r\n");
      out.write("   </ul>\r\n");
      out.write(" </div>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"blank\"></div>\r\n");
      out.write("<div id=\"mainNav\" class=\"clearfix\">\r\n");
      out.write("  <a href=\"index.jsp\" class=\"cur\">酷星首页<span></span></a>\r\n");
      out.write("    <a href=\"More_BookInfo?type=best\">精品书籍<span></span></a>\r\n");
      out.write("   <a href=\"More_BookInfo?type=hot\">畅销书籍<span></span></a>\r\n");
      out.write("   <a href=\"More_BookInfo?type=new\">新书推荐<span></span></a>\r\n");
      out.write("   <a href=\"More_BookInfo?type=1\">所有图书<span></span></a>\r\n");
      out.write("   <a href=\"YouhuiM?activity_type=tuangou\">团购图书<span></span></a>\r\n");
      out.write("   <a href=\"YouhuiM?type=youhui&activity_type=youhui\">优惠活动<span></span></a>\r\n");
      out.write("   <a href=\"liuyan.jsp\">酷星留言板<span></span></a>\r\n");
      out.write("   <a href=\"contact.jsp\">联系我们<span></span></a>\r\n");
      out.write("   <a href=\"admin/index.jsp\" target=\"_blank\">进入后台<span></span></a>\r\n");
      out.write(" </div>\r\n");
      out.write("<div id=\"search\" class=\"clearfix\">\r\n");
      out.write("  <form id=\"searchForm\" name=\"searchForm\" method=\"get\" action=\"top_search\"  class=\"f_r\" style=\"_position:relative; top:5px;\">\r\n");
      out.write("    <select name=\"category\" id=\"searchSelect\" class=\"B_input\" onchange=\"getType()\">\r\n");
      out.write("    \t<option value=\"1\">选择查询类型</option>\r\n");
      out.write("    \t<option value=\"book_type\">按图书类型查询</option>\r\n");
      out.write("    \t<option value=\"book_press\">按图书出版社查询</option>\r\n");
      out.write("    </select>\r\n");
      out.write("    <select id=\"result\" name=\"searchType\">\r\n");
      out.write("    \t<option value=\"1\">选择你要选择的查询对象</option>\r\n");
      out.write("    </select>\r\n");
      out.write("   \r\n");
      out.write("   <input name=\"imageField\" type=\"submit\" value=\"\" class=\"go\" style=\"cursor:pointer;\">\r\n");
      out.write("   <a href=\"highSearch.jsp\"><font size=\"2px\">高级搜索</font></a>\r\n");
      out.write("   </form>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
