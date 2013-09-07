package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import com.shxt.dao.*;
import com.shxt.model.*;

public final class left_jsp extends org.apache.jasper.runtime.HttpJspBase
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
CarDAO cdao = (CarDAO)request.getSession().getAttribute("mycar");
BookInfoDAO bdao = new BookInfoDAO();
ArrayList<BookInfo> al = bdao.getTop10Book();
BookInfo binfo = new BookInfo();

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("<!--\r\n");
      out.write("#left .STYLE1 {\r\n");
      out.write("\tfont-size: 12px;\r\n");
      out.write("\tcolor: #666666;\r\n");
      out.write("}\r\n");
      out.write("#left .tbfont {\r\n");
      out.write("\tline-height: 20px;\r\n");
      out.write("\tpadding-top: 2px;\r\n");
      out.write("\tpadding-left: 5px;\r\n");
      out.write("}\r\n");
      out.write("#left .t1 {\r\n");
      out.write("\tborder: thin solid #99FFFF;\r\n");
      out.write("}\r\n");
      out.write("#left .backg {\r\n");
      out.write("\tbackground-image: url(images/kuang.png);\r\n");
      out.write("\tbackground-repeat: no-repeat;\r\n");
      out.write("}\r\n");
      out.write("#left .STYLE2 {\r\n");
      out.write("\tfont-size: 12px;\r\n");
      out.write("\tcolor: #0000FF;\r\n");
      out.write("\tline-height: 20px;\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("#left .STYLE3 {\r\n");
      out.write("\tfont-size: 12px;\r\n");
      out.write("\tcolor: black;\r\n");
      out.write("\tfont-weight: normal;\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("#left .t2 {\r\n");
      out.write("\tborder-bottom-width: thin;\r\n");
      out.write("\tborder-bottom-style: dashed;\r\n");
      out.write("\tborder-bottom-color: #CCCCCC;\r\n");
      out.write("}\r\n");
      out.write("#left .STYLE4 {color: #FF0000}\r\n");
      out.write("#left a{\r\n");
      out.write("\tcolor: black;\r\n");
      out.write("\tfont-weight: normal;\r\n");
      out.write("}\r\n");
      out.write("#left a:link {\r\n");
      out.write("\ttext-decoration: none;\r\n");
      out.write("\tcolor: #333333;\r\n");
      out.write("}\r\n");
      out.write("#left a:hover {\r\n");
      out.write("\ttext-decoration: none;\r\n");
      out.write("\tcolor: red;\r\n");
      out.write("}\r\n");
      out.write("#left .fontspace {\r\n");
      out.write("\tline-height: 20px;\r\n");
      out.write("\tleft: 10px;\r\n");
      out.write("\tpadding-left: 10px;\r\n");
      out.write("\tpadding-top: 10px;\r\n");
      out.write("}\r\n");
      out.write("#left body,td,th {\r\n");
      out.write("\tcolor: #333333;\r\n");
      out.write("}\r\n");
      out.write("#left .leftspace {\r\n");
      out.write("\tline-height: 16px;\r\n");
      out.write("\tpadding-left: 30px;\r\n");
      out.write("}\r\n");
      out.write("#left body {\r\n");
      out.write("\tmargin-left: 0px;\r\n");
      out.write("\tmargin-top: 0px;\r\n");
      out.write("\tmargin-right: 0px;\r\n");
      out.write("\tmargin-bottom: 0px;\r\n");
      out.write("\tbackground-color: #FFFFFF;\r\n");
      out.write("}\r\n");
      out.write(".txt{\r\n");
      out.write("\tcolor:#a5a5a5;\r\n");
      out.write("}\r\n");
      out.write("-->\r\n");
      out.write("</style>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\tfunction clear1(){\r\n");
      out.write("\t\tdocument.getElementById(\"searchname\").value=\"\";\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div id = \"left\">\r\n");
      out.write("<table width=\"200\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"white\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"115\" class=\"t1\"><table width=\"200\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#FEFEFE\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"32\" valign=\"top\"><img src=\"images/ECSHOP_03.jpg\" /></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"46\" align=\"left\" class=\"fontspace\"><span class=\"STYLE1\"><font size=\"2px\">欢迎光临酷星图书网，我们的宗旨：诚信经营，服务客户！</font></span></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"46\"><a href=\"contact.jsp\">\r\n");
      out.write("    \t<marquee scrolldelay=\"150\">\r\n");
      out.write("    \t<font color=\"red\" size=\"2px\">咨询电话：18943643561\r\n");
      out.write("    \t<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0349-7063721</font>\r\n");
      out.write("    \t</marquee>\r\n");
      out.write("    \r\n");
      out.write("    </a></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"4\"></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"78\" class=\"backg\"><table width=\"180\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td width=\"40\" rowspan=\"2\" align=\"center\"><img src=\"images/gowuche.png\" /></td>\r\n");
      out.write("    ");

    	if(cdao == null){
    		
      out.write("\r\n");
      out.write("    \t\t    <td><span class=\"STYLE2\"><a href=\"Gouwuche?type=showMyCar\">您的购物车中有0件商品，总计金额￥0.00元。</a></span></td>\r\n");
      out.write("    \t\t");

    	} else {
    		
      out.write("\r\n");
      out.write("    \t\t    <td><span class=\"STYLE2\"><a href=\"Gouwuche?type=showMyCar\">您的购物车中有 <font color=\"red\">");
      out.print(cdao.getNum() );
      out.write("</font> 件商品，总计金额 <font color=\"red\">￥");
      out.print(cdao.getUserAllPrice() );
      out.write("元。</font></a></span></td>\r\n");
      out.write("    \t\t");

    	}
    
      out.write("\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("    </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"4\">&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"300\" class=\"t1\"><table width=\"200\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n");
      out.write("  <tr> \r\n");
      out.write("    <td height=\"105\">\r\n");
      out.write("      <table width=\"200\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"30\" class=\"t2\"><img src=\"images/anniu.png\" hspace=\"10\" /><span class=\"STYLE3\">图书类型</span></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"20\" align=\"left\" valign=\"bottom\" class=\"leftspace\"><span class=\"STYLE3\"><a href=\"SearchBookInfo?type=jingji&name=types\"><font size = \"2px\">经济类</font></a></span></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("   <td align=\"left\" class=\"leftspace\"><span class=\"STYLE3\"><a href=\"SearchBookInfo?type=computer&name=types\"><font size = \"2px\">计算机类</font></a></span></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"left\" class=\"leftspace\"><span class=\"STYLE3\"><a href=\"SearchBookInfo?type=english&name=types\"><font size = \"2px\">英语类</font></a></span></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"left\" class=\"leftspace\"><span class=\"STYLE3\"><a href=\"SearchBookInfo?type=math&name=types\"><font size = \"2px\">数学类</font></a></span></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td><table width=\"200\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"30\" class=\"t2\"><img src=\"images/anniu.png\" hspace=\"10\" /><span class=\"STYLE3\">图书价格</span></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"20\" align=\"left\" valign=\"bottom\" class=\"leftspace\"><span class=\"STYLE3\"><a href=\"SearchBookInfo?type=san&name=jiage\"><font size = \"2px\">10-30元</font></a></span></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("   <td align=\"left\" class=\"leftspace\"><span class=\"STYLE3\"><a href=\"SearchBookInfo?type=wu&name=jiage\"><font size = \"2px\">31-50元</font></a></span></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"left\" class=\"leftspace\"><span class=\"STYLE3\"><a href=\"SearchBookInfo?type=qi&name=jiage\"><font size = \"2px\">51-70元</font></a></span></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"left\" class=\"leftspace\"><span class=\"STYLE3\"><a href=\"SearchBookInfo?type=dayuqi&name=jiage\"><font size = \"2px\">70元以上</font></a></span></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td><table width=\"200\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"30\" class=\"t2\"><img src=\"images/anniu.png\" hspace=\"10\" /><span class=\"STYLE3\">图书出版社</span></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"20\" align=\"left\" valign=\"bottom\" class=\"leftspace\"><span class=\"STYLE3\"><a href=\"SearchBookInfo?type=xindongfang&name=chubanshe\"><font size = \"2px\">新东方出版社</font></a></span></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("   <tr>\r\n");
      out.write("    <td height=\"20\" align=\"left\" valign=\"bottom\" class=\"leftspace\"><span class=\"STYLE3\"><a href=\"SearchBookInfo?type=beijing&name=chubanshe\"><font size = \"2px\">北京大学出版社</font></a></span></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("   <td align=\"left\" class=\"leftspace\"><span class=\"STYLE3\"><a href=\"SearchBookInfo?type=qinghua&name=chubanshe\"><font size=\"2px\">清华大学出版社</font></a></span></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"left\" class=\"leftspace\"><span class=\"STYLE3\"><a href=\"SearchBookInfo?type=tongji&name=chubanshe\"><font size = \"2px\">同济大学出版社</font></a></span></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td align=\"left\" class=\"leftspace\"><span class=\"STYLE3\"><a href=\"SearchBookInfo?type=jixie&name=chubanshe\"><font size = \"2px\">机械工业大学出版社</font></a></span></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write(" </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"4\"></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"488\" class=\"t1\"><table width=\"200\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"32\"><img src=\"images/paihang.png\" />&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  \r\n");
      out.write("  <!-- 从这开始TOP10 的填写 -->\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"45\"><img src=\"images/left-3_03.jpg\" width=\"15\" height=\"13\" hspace=\"5\" />\r\n");
      out.write("      <table width=\"165\" border=\"0\" align=\"right\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("        <tr>\r\n");
      out.write("        ");
binfo = al.get(0); 
      out.write("\r\n");
      out.write("          <td width=\"32\" height=\"40\" rowspan=\"2\" align=\"left\" valign=\"top\"><a href=\"BookJump?id=");
      out.print(binfo.getBook_id());
      out.write("\"><img src=\"images/");
      out.print(binfo.getBook_img() );
      out.write("\" width=\"27\" height=\"39\" border=\"0\" /></a></td>\r\n");
      out.write("          <td width=\"133\"><span class=\"STYLE3\"><a href=\"BookJump?id=");
      out.print(binfo.getBook_id());
      out.write("\"><font size = \"2px\">");
      out.print(binfo.getBook_name() );
      out.write("</font></a></span></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td><span class=\"STYLE3\"><font size = \"2px\">本店售价：<span class=\"STYLE4\">￥");
      out.print(binfo.getBook_user_price() );
      out.write("元</font></span></span></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </table></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"45\"><img src=\"images/left-3_06.jpg\" hspace=\"5\" />\r\n");
      out.write("      <table width=\"165\" border=\"0\" align=\"right\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("        <tr>\r\n");
      out.write("        ");
binfo = al.get(1); 
      out.write("\r\n");
      out.write("          <td width=\"32\" height=\"40\" rowspan=\"2\" align=\"left\" valign=\"top\"><a href=\"BookJump?id=");
      out.print(binfo.getBook_id());
      out.write("\"><img src=\"images/");
      out.print(binfo.getBook_img() );
      out.write("\" width=\"27\" height=\"38\" border=\"0\" /></a></td>\r\n");
      out.write("          <td width=\"133\"><span class=\"STYLE3\"><a href=\"BookJump?id=");
      out.print(binfo.getBook_id());
      out.write("\"><font size = \"2px\">");
      out.print(binfo.getBook_name() );
      out.write("</font></a></span></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td><span class=\"STYLE3\"><font size = \"2px\">本店售价：<span class=\"STYLE4\">￥");
      out.print(binfo.getBook_user_price() );
      out.write("元</font></span></span></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </table></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"45\"><img src=\"images/left-3_09.jpg\" hspace=\"5\" />\r\n");
      out.write("      <table width=\"165\" border=\"0\" align=\"right\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("        <tr>\r\n");
      out.write("        ");
binfo = al.get(2); 
      out.write("\r\n");
      out.write("          <td width=\"32\" height=\"40\" rowspan=\"2\" align=\"left\" valign=\"top\"><a href=\"BookJump?id=");
      out.print(binfo.getBook_id());
      out.write("\"><img src=\"images/");
      out.print(binfo.getBook_img() );
      out.write("\" width=\"26\" height=\"38\" border=\"0\" /></a></td>\r\n");
      out.write("          <td width=\"133\"><span class=\"STYLE3\"><a href=\"BookJump?id=");
      out.print(binfo.getBook_id());
      out.write("\"><font size = \"2px\">");
      out.print(binfo.getBook_name() );
      out.write("</font></a></span></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td><span class=\"STYLE3\"><font size = \"2px\">本店售价：<span class=\"STYLE4\">￥");
      out.print(binfo.getBook_user_price() );
      out.write("元</font></span></span></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </table></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  \r\n");
      out.write("  ");

  	for(int i=3;i<10;i++){
  		binfo = al.get(i);
  		
      out.write("\r\n");
      out.write("  \t\t<tr>\r\n");
      out.write("    \t<td height=\"45\"><img src=\"images/left-");
      out.print(i+1 );
      out.write(".jpg\" hspace=\"5\" />\r\n");
      out.write("\t      \t<table width=\"163\" border=\"0\" align=\"right\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t        <tr>\r\n");
      out.write("\t          <td><span class=\"STYLE3\"><a href=\"BookJump?id=");
      out.print(binfo.getBook_id());
      out.write("\"><font size = \"2px\">");
      out.print(binfo.getBook_name() );
      out.write("</font></a></span></td>\r\n");
      out.write("\t        </tr>\r\n");
      out.write("\t        <tr>\r\n");
      out.write("\t          <td><span class=\"STYLE3\"><font size = \"2px\">本店售价：<span class=\"STYLE4\">￥");
      out.print(binfo.getBook_user_price() );
      out.write("元</font></span></span></td>\r\n");
      out.write("\t        </tr>\r\n");
      out.write("\t     \t</table>\r\n");
      out.write("\t     \t</td>\r\n");
      out.write("  \t\t</tr>\r\n");
      out.write("  \t\t");

  	}
  
      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("   <tr>\r\n");
      out.write("    <td height=\"4\"></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td class=\"t1\">\r\n");
      out.write("    <form action=\"OrderForm\" method=\"post\">\r\n");
      out.write("    <table width=\"200\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"32\"><img src=\"images/dingdan.png\" />&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"40\" align=\"center\">\r\n");
      out.write("    <label>\r\n");
      out.write("      <input type=\"text\" name=\"searchName\" id=\"searchname\" onfocus=\"clear1()\"  class=\"txt\" value=\"请输入要查询的订单号\"/>\r\n");
      out.write("    </label>\r\n");
      out.write("    </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td height=\"35\" align=\"center\">\r\n");
      out.write("    <input type=\"image\" src=\"images/search.png\" width=\"120px\" height=\"25px\"/>\r\n");
      out.write("    </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</form>\r\n");
      out.write("</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
