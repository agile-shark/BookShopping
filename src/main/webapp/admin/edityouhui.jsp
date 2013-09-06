<%@ page language="java" import="java.util.*,com.shxt.dao.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
BookInfoDAO book = new BookInfoDAO();
YouhuiDAO yhd = new YouhuiDAO();
//得到优惠id号
String id = request.getParameter("id");
//将该对应的id的优惠信息查询出来
YouHuiBeanNew youhui = yhd.getYouhuiInfo(id);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addyouhui.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		.ziti{
			font-size:13px;
		}
	</style>
	<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
  </head>
  
  <body>
    <table width="1120" border="10" cellspacing="0" cellpadding="0" bordercolor="#DDEEF2">
  <tr>
    <td height="40px" bgcolor="#F4FAFB">&nbsp;<b><font size="+1">酷星书城 管理中心</font> ——<font color="#9CACAF" size="+1">添加优惠活动</font></b></td>
  </tr>
  <tr>
    <td>
    <form action="AdminYouhuiCl?type=modify&youhuiid=<%=youhui.getActivityid() %>" method="post">
    <table width="1136" border="0" cellspacing="0" cellpadding="0">
      <tr class="ziti">
        <td colspan="2" height="26px">&nbsp;</td>
        </tr>
      <tr class="ziti">
        <td width="438" align="right" height="40px"><b>优惠活动名称：</b></td>
        <td width="692">
        <input name="activityname" type="text" id="textfield" size="50" height="20px" value="<%=youhui.getActivity_title() %>"/>
        </td>
      </tr>
      <tr class="ziti">
        <td align="right" height="40px"><b>优惠开始时间：</b></td>
        <td>
        <input name="activity_start_time" type="text" id="textfield2" size="30" height="20px" class="Wdate"  onClick="WdatePicker()" value=<%=youhui.getActivity_startdate() %>/>
        </td>
      </tr>
      <tr class="ziti">
        <td align="right" height="40px"><b>优惠结束时间：</b></td>
        <td><input name="activity_stop_time" type="text" id="textfield3" size="30" height="20px" class="Wdate"  onClick="WdatePicker()" value="<%=youhui.getActivity_stopdate() %>"/></td>
      </tr>
      <tr class="ziti">
        <td align="right" height="40px"><b>享受优惠的会员等级：</b></td>
        <td><input type="checkbox" name="checkbox" id="checkbox" />
          非会员 
            &nbsp;<input type="checkbox" name="checkbox2" id="checkbox2" checked/>
            注册用户</td>
      </tr>
      <tr class="ziti">
        <td align="right" height="40px"><b>购买数量上限：</b></td>
        <td><input name="num" type="text" id="textfield5" size="30" height="20px" value="<%=youhui.getYouhui_number() %>"/></td>
      </tr>
      <tr class="ziti">
        <td align="right" height="40px"><b>优惠方式：</b></td>
        <td><select name="select" id="select">
          <option value="zengping">享受价格折购</option>
          <option value="zengping">享受赠品（特惠品）</option>
          <option value="zengping2">享受现金减免</option>
        </select></td>
      </tr>
      <tr class="ziti">
        <td align="right" height="40px"><b>优惠图书名称：</b></td>
        <td>
        	<input name="bookname" type="text" value="<%=book.getBookInfo(youhui.getBookid()).getBook_name() %>" readonly/>
        </td>
      </tr>
      <tr class="ziti">
        <td align="right" height="36px"><input type="submit" name="button" id="button" value="确 定" /> &nbsp;&nbsp;&nbsp;</td>
        <td> &nbsp;&nbsp;&nbsp;<input type="reset" name="button2" id="button2" value="重 置" /></td>
      </tr>
    </table>
    </form>
    </td>
  </tr>
</table>
  </body>
</html>
