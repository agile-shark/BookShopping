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
	<script type="text/javascript">
		function numCheck() {
			var num = document.getElementById("num").value;
			if(isNaN(num)) {
				numText.innerHTML = "<font color='red'><img src='img/error.gif'>数量输入只能为数字！</img></font>";
				return false;
			} else if(num.toString().length==0) {
				numText.innerHTML = "<font color='red'><img src='img/error.gif'>数量输入不能为空！</img></font>";
				return false;
			} else {
				numText.innerHTML = "<font color='green'><img src='img/success.gif'>购买数量上限可用！</img></font>";
				return true;
			}
		}
		function nameCheck() {
			var name = document.getElementById("name").value;
			if(name.toString().length==0) {
				nameText.innerHTML = "<font color='red'><img src='img/error.gif'>团购活动名称不能为空！</img></font>";
				return false;
			} else {
				nameText.innerHTML = "<font color='green'><img src='img/success.gif'>团购活动名称可用！</img></font>";
				return true;
			}
		}
		function jifenCheck() {
			var num = document.getElementById("jifen").value;
			if(isNaN(num)) {
				jifenText.innerHTML = "<font color='red'><img src='img/error.gif'>积分输入只能为数字！</img></font>";
				return false;
			} else if(num.toString().length==0) {
				jifenText.innerHTML = "<font color='red'><img src='img/error.gif'>积分输入不能为空！</img></font>";
				return false;
			} else {
				jifenText.innerHTML = "<font color='green'><img src='img/success.gif'>积分可用！</img></font>";
				return true;
			}
		}
			
		function returnValidate() {
			return numCheck() && nameCheck() && jifenCheck();
		}
	</script>
	<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
  </head>
  
  <body>
    <table width="1120" border="10" cellspacing="0" cellpadding="0" bordercolor="#DDEEF2">
  <tr>
    <td height="40px" bgcolor="#F4FAFB">&nbsp;<b><font size="+1">酷星书城 管理中心</font> ——<font color="#9CACAF" size="+1">添加优惠活动</font></b></td>
  </tr>
  <tr>
    <td>
    <form action="AdminTuangouCl?type=modify&youhuiid=<%=youhui.getActivityid() %>" method="post">
    <table width="1136" border="0" cellspacing="0" cellpadding="0">
      <tr class="ziti">
        <td colspan="2" height="26px">&nbsp;</td>
        </tr>
      <tr class="ziti">
        <td width="438" align="right" height="40px"><b>团购活动名称：</b></td>
        <td width="692">
        <input name="activityname" type="text" id="name" size="50" height="20px" value="<%=youhui.getActivity_title() %>"/>
        </td>
        <td><div id="name"></div></td>
      </tr>
      <tr class="ziti">
        <td align="right" height="40px"><b>团购开始时间：</b></td>
        <td>
        <input name="activity_start_time" type="text" id="textfield2" size="30" height="20px" class="Wdate"  onClick="WdatePicker()" value=<%=youhui.getActivity_startdate() %>/>
        </td>
      </tr>
      <tr class="ziti">
        <td align="right" height="40px"><b>团购结束时间：</b></td>
        <td><input name="activity_stop_time" type="text" id="textfield3" size="30" height="20px" class="Wdate"  onClick="WdatePicker()" value="<%=youhui.getActivity_stopdate() %>"/></td>
      </tr>
      <tr class="ziti">
        <td align="right" height="40px"><b>赠送积分数：</b></td>
        <td><input type="text" value="100" size="20" height="20" maxlength="5" id="jifen"/></td>
        <td><div id="jifenText"></div></td>
      </tr>
      <tr class="ziti">
        <td align="right" height="40px"><b>限购数量：</b></td>
        <td><input name="num" type="text" id="num" size="30" height="20px" value="<%=youhui.getTuangou_number() %>"/></td>
        <td><div id="numText"></div></td>
      </tr>
      <tr class="ziti">
        <td align="right" height="40px"><b>价格阶梯：</b></td>
        <td>
        	数量达到:<input type="text" size="10px" height="20px" value="10"/> &nbsp;&nbsp;享受折购：<input type="text" size="10px" height="20px" value="9"/>折
        </td>
      </tr>
      <tr class="ziti">
        <td align="right" height="40px"></td>
        <td>
        	数量达到:<input type="text" size="10px" height="20px" value="30"/> &nbsp;&nbsp;享受折购：<input type="text" size="10px" height="20px" value="8"/>折
        </td>
      </tr>
      <tr class="ziti">
        <td align="right" height="40px"><b>团购图书名称：</b></td>
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
