package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class addadmin_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n");
      out.write("<html>\r\n");
      out.write("  <head>\r\n");
      out.write("    <base href=\"");
      out.print(basePath);
      out.write("\">\r\n");
      out.write("    <title>My JSP 'addadmin.jsp' starting page</title>\r\n");
      out.write("\t<meta http-equiv=\"pragma\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"cache-control\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"expires\" content=\"0\">    \r\n");
      out.write("\t<meta http-equiv=\"keywords\" content=\"keyword1,keyword2,keyword3\">\r\n");
      out.write("\t<meta http-equiv=\"description\" content=\"This is my page\">\r\n");
      out.write("\t<style type=\"text/css\">\r\n");
      out.write("\t\t.ziti{\r\n");
      out.write("\t\t\tfont-size: 13px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t</style>\r\n");
      out.write("\t\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\tfunction userValidate() {\r\n");
      out.write("\t\t\tvar username = document.getElementById(\"username\").value;\r\n");
      out.write("\t\t\tif(username==\"\" || username==null){\r\n");
      out.write("\t\t\t\tuserText.innerHTML=\"<img src='admin/img/error.gif'/><font color='red'><b>用户名不能为空!</b></font>\";\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t} else{\r\n");
      out.write("\t\t\t\tuserText.innerHTML=\"<img src='admin/img/success.gif'/><font color='green'><b>用户名可用!</b></font>\";\r\n");
      out.write("\t\t\t\treturn true;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tfunction truenameValidate() {\r\n");
      out.write("\t\t\tvar truename = document.getElementById(\"truename\").value;\r\n");
      out.write("\t\t\tif(truename==\"\" || truename==null){\r\n");
      out.write("\t\t\t\ttruenameText.innerHTML=\"<img src='admin/img/error.gif'/><font color='red'><b>真实姓名不能为空!</b></font>\";\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t} else{\r\n");
      out.write("\t\t\t\ttruenameText.innerHTML=\"<img src='admin/img/success.gif'/><font color='green'><b>真实姓名可用!</b></font>\";\r\n");
      out.write("\t\t\t\treturn true;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tfunction passValidate() {\r\n");
      out.write("\t\t\tvar password = document.getElementById(\"password\").value;\r\n");
      out.write("\t\t\tif(password==\"\" || password==null){\r\n");
      out.write("\t\t\t\tpasswordText.innerHTML=\"<img src='admin/img/error.gif'/><font color='red'><b>密码不能为空!</b></font>\";\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t} else{\r\n");
      out.write("\t\t\t\tpasswordText.innerHTML=\"<img src='admin/img/success.gif'/><font color='green'><b>密码可用!</b></font>\";\r\n");
      out.write("\t\t\t\treturn true;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tfunction repassValidate() {\r\n");
      out.write("\t\t\tvar password = document.getElementById(\"password\").value;\r\n");
      out.write("\t\t\tvar repassword = document.getElementById(\"repassword\").value;\r\n");
      out.write("\t\t\t//alert(password+\"   \"+repassword);\r\n");
      out.write("\t\t\tif(repassword==\"\" || repassword==null){\r\n");
      out.write("\t\t\t\trepasswordText.innerHTML=\"<img src='admin/img/error.gif'/><font color='red'><b>重复密码不能为空!</b></font>\";\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t} else if(repassword != password){\r\n");
      out.write("\t\t\t\trepasswordText.innerHTML=\"<img src='admin/img/error.gif'/><font color='red'><b>输入的密码和刚才输入的不一致!</b></font>\";\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\trepasswordText.innerHTML=\"<img src='admin/img/success.gif'/><font color='green'><b>重复密码输入正确!</b></font>\";\r\n");
      out.write("\t\t\t\treturn true;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tfunction phoneValidate() {\r\n");
      out.write("\t\t\tvar phone = document.getElementById(\"phone\").value;\r\n");
      out.write("\t\t\tif(phone==\"\" || phone==null){\r\n");
      out.write("\t\t\t\tphoneText.innerHTML=\"<img src='admin/img/error.gif'/><font color='red'><b>电话号码不能为空!</b></font>\";\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t} else if(phone.toString().length<11){\r\n");
      out.write("\t\t\t\tphoneText.innerHTML=\"<img src='admin/img/error.gif'/><font color='red'><b>电话号码格式输入有误!</b></font>\";\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\tphoneText.innerHTML=\"<img src='admin/img/success.gif'/><font color='green'><b>电话号码输入正确!</b></font>\";\r\n");
      out.write("\t\t\t\treturn true;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tfunction emailValidate() {\r\n");
      out.write("\t\t\tvar email = document.getElementById(\"email\").value;\r\n");
      out.write("\t\t\tvar patrn = /\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*/;\r\n");
      out.write("\t\t\tif(email==\"\" || email==null){\r\n");
      out.write("\t\t\t\temailText.innerHTML=\"<img src='admin/img/error.gif'/><font color='red'><b>电子邮件地址不能为空!</b></font>\";\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t} else if(!patrn.exec(email)){\r\n");
      out.write("\t\t\t\temailText.innerHTML=\"<img src='admin/img/error.gif'/><font color='red'><b>电子邮件地址格式输入有误!</b></font>\";\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\temailText.innerHTML=\"<img src='admin/img/success.gif'/><font color='green'><b>电子邮件地址输入正确!</b></font>\";\r\n");
      out.write("\t\t\t\treturn true;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tfunction qqValidate() {\r\n");
      out.write("\t\t\tvar qq = document.getElementById(\"qq\").value;\r\n");
      out.write("\t\t\tif(qq==\"\" || qq==null){\r\n");
      out.write("\t\t\t\tqqText.innerHTML=\"<img src='admin/img/error.gif'/><font color='red'><b>QQ号码不能为空!</b></font>\";\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t} else if(qq.toString().length<5){\r\n");
      out.write("\t\t\t\tqqText.innerHTML=\"<img src='admin/img/error.gif'/><font color='red'><b>QQ号码格式输入有误!</b></font>\";\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t} else if(isNaN(qq)) {\r\n");
      out.write("\t\t\t\tqqText.innerHTML=\"<img src='admin/img/error.gif'/><font color='red'><b>QQ号码只能是数字!</b></font>\";\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\tqqText.innerHTML=\"<img src='admin/img/success.gif'/><font color='green'><b>QQ号码输入正确!</b></font>\";\r\n");
      out.write("\t\t\t\treturn true;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tfunction validateTotal() {\r\n");
      out.write("\t\t\treturn userValidate() && truenameValidate() && passValidate() && repassValidate() && phoneValidate() && emailValidate() && qqValidate();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t</script>\r\n");
      out.write("\r\n");
      out.write("  </head>\r\n");
      out.write("  <body>\r\n");
      out.write("  <table width=\"1140\" border=\"10\" bordercolor=\"#DDEEF2\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" class=\"ziti\">\r\n");
      out.write("  <tr>\r\n");
      out.write("  \t<td>\r\n");
      out.write("  \t<form action=\"");
      out.print(request.getContextPath() );
      out.write("/AddAdmin\" name=\"form\" method=\"post\" onsubmit=\"return validateTotal();\">\r\n");
      out.write("  \t<table width=\"1130\" border=\"0\" class=\"ziti\" align=\"center\">\r\n");
      out.write("  \t<tr>\r\n");
      out.write("    \t<td align=\"left\" height=\"50px\" colspan=\"3\">&nbsp; <font size=\"4\"><b>酷星网管理系统</b></font>——<font color=\"#9CACAF\" size=\"4\"><b>增加管理员</b></font></td>\r\n");
      out.write("  \t</tr>\r\n");
      out.write("\t  <tr>\r\n");
      out.write("\t    <td align=\"right\" width=\"20%\">登录名：</td>\r\n");
      out.write("\t    <td align=\"left\" width=\"23%\"> &nbsp;<input type=\"text\" name=\"name\" size=\"30\" id=\"username\" onblur=\"userValidate()\"/> <font color=\"red\">*</font>&nbsp;</td>\r\n");
      out.write("\t    <td align=\"left\"  width=\"57%\"><div id=\"userText\"></div></td>\r\n");
      out.write("\t  </tr>\r\n");
      out.write("\t  <tr>\r\n");
      out.write("\t    <td align=\"right\">真实姓名：</td>\r\n");
      out.write("\t    <td align=\"left\"> &nbsp;<input type=\"text\" name=\"truename\" id=\"truename\"  size=\"30\" onblur=\"truenameValidate()\"/> <font color=\"red\">*</font>&nbsp;</td>\r\n");
      out.write("\t    <td><div id=\"truenameText\"></div></td>\r\n");
      out.write("\t  </tr>\r\n");
      out.write("\t  <tr>\r\n");
      out.write("\t    <td align=\"right\">密码：</td>\r\n");
      out.write("\t    <td align=\"left\"> &nbsp;<input type=\"password\" name=\"password\" id=\"password\"  size=\"30\" onblur=\"passValidate()\"/> <font color=\"red\">*</font>&nbsp;</td>\r\n");
      out.write("\t    <td><div id=\"passwordText\"></div></td>\r\n");
      out.write("\t  </tr>\r\n");
      out.write("\t   <tr>\r\n");
      out.write("\t    <td align=\"right\">确认密码：</td>\r\n");
      out.write("\t    <td align=\"left\"> &nbsp;<input type=\"password\" name=\"rpassword\" id=\"repassword\"  size=\"30\" onblur=\"repassValidate()\"/> <font color=\"red\">*</font>&nbsp;</td>\r\n");
      out.write("\t    <td><div id=\"repasswordText\"></div></td>\r\n");
      out.write("\t  </tr>\r\n");
      out.write("\t  <tr>\r\n");
      out.write("\t    <td align=\"right\">联系电话：</td>\r\n");
      out.write("\t    <td align=\"left\"> &nbsp;<input type=\"text\" name=\"phone\" id=\"phone\"  size=\"30\" maxlength=\"11\" onblur=\"phoneValidate()\"/> <font color=\"red\">*</font>&nbsp;</td>\r\n");
      out.write("\t    <td><div id=\"phoneText\"></div></td>\r\n");
      out.write("\t  </tr>\r\n");
      out.write("\t  <tr>\r\n");
      out.write("\t    <td align=\"right\">电子邮件：</td>\r\n");
      out.write("\t    <td align=\"left\"> &nbsp;<input type=\"text\" name=\"email\" id=\"email\"  size=\"30\" onblur=\"emailValidate()\"/> <font color=\"red\">*</font>&nbsp;</td>\r\n");
      out.write("\t    <td><div id=\"emailText\"></div></td>\r\n");
      out.write("\t  </tr>\r\n");
      out.write("\t  <tr>\r\n");
      out.write("\t    <td align=\"right\">QQ号码：</td>\r\n");
      out.write("\t    <td align=\"left\"> &nbsp;<input type=\"text\" name=\"qq\" id=\"qq\" maxlength=\"10\" size=\"30\" onblur=\"qqValidate()\"/> <font color=\"red\">*</font>&nbsp;</td>\r\n");
      out.write("\t    <td><div id=\"qqText\"></div></td>\r\n");
      out.write("\t  </tr>\r\n");
      out.write("\t   <tr align=\"center\">\r\n");
      out.write("\t    <td align=\"right\">\r\n");
      out.write("\t    <input type=\"submit\" name=\"submit\" id=\"button\" value=\"提 交\"/>&nbsp;\r\n");
      out.write("\t    </td>\r\n");
      out.write("\t    <td  align=\"left\"> &nbsp;&nbsp;&nbsp;&nbsp;<input type=\"reset\" name=\"reset\" id=\"button2\" value=\"重 置\" /></td>\r\n");
      out.write("\t  </tr>\r\n");
      out.write("   </table>\r\n");
      out.write("   </form>\r\n");
      out.write("  </td>\r\n");
      out.write(" </tr>\r\n");
      out.write("</table>\r\n");
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
