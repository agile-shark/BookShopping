<%@ page language="java" import="java.util.*,com.shxt.model.*,com.shxt.dao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
YouhuiDAO youhui = new YouhuiDAO();
ArrayList<YouHuiBeanNew> al = youhui.getYouhui("youhui");
int num = youhui.getYouhuiPage();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'youhui.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		.ziti{
			font-size: 13px;
		}
		.weizhi{
			margin-left:650px;
		}
	</style>
	
	<script type="text/javascript">
		function selectAll() {
			var select = document.getElementById("select");
			var checkboxs = document.getElementsByName("checkbox");
			for(var i=0;i<checkboxs.length;i++) {
				checkboxs[i].checked = select.checked;
			}
		}
	</script>
  </head>
  
  <body>
    <table width="1120" border="10" cellspacing="0" cellpadding="0" bordercolor="#DDEEF2">
  <tr>
    <td height="40px" bgcolor="#F4FAFB"> <b><font size="+1">酷星书城 管理中心</font> ——<font color="#9CACAF" size="+1">优惠活动列表</font></b>
    <span class="weizhi"><a href="admin/addyouhuibook.jsp"><img src="admin/img/addyouhui.png" style="cursor:pointer;"/></a></span>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
    
    <form action="AdminYouhuiCl?type=deleteAll" method="post">
    <table width="1136" border="1" cellspacing="0" cellpadding="0" bordercolor="#EEF8F9">
      <tr class="ziti">
        <td height="36px" align="center" bgcolor="#BBDDE5">
            <input type="checkbox" id="select"  onclick="selectAll()"/> 编 号
		</td>
        <td align="center" bgcolor="#BBDDE5">优惠活动名称</td>
        <td align="center" bgcolor="#BBDDE5">开始时间</td>
        <td align="center" bgcolor="#BBDDE5">结束时间</td>
        <td align="center" bgcolor="#BBDDE5">数量上限</td>
        <td align="center" bgcolor="#BBDDE5">操 作</td>
      </tr>
      <%
      	for(int i = 0; i < al.size(); i++) {
      		YouHuiBeanNew yhb = al.get(i);
      		%>
      		<tr class="ziti">
		        <td align="center">
		        <input type="checkbox" name="checkbox" value="<%=yhb.getActivityid() %>"/>
		        <input type="hidden" name="booksid" value="<%=yhb.getBookid() %>"/>
		          <%=yhb.getActivityid() %>
		        </td>
		        <td align="center" height="30px"><%=yhb.getActivity_title() %></td>
		        <td align="center"><%=yhb.getActivity_startdate() %></td>
		        <td align="center"><%=yhb.getActivity_stopdate() %></td>
		        <td align="center"><%=yhb.getYouhui_number() %></td>
		        <td align="center">
		       <a href="admin/edityouhui.jsp?id=<%=yhb.getActivityid() %>"><img src="<%=basePath %>admin/images/imageedit.gif" width="16" height="16" style="cursor:pointer;"/></a>&nbsp;
		        <a href="admin/addyouhuibook.jsp"><img src="<%=basePath %>admin/images/image_(add)6.gif" width="16" height="16" style="cursor:pointer;"/></a>&nbsp;
		        <a href="AdminYouhuiCl?type=deleteOne&youhuiid=<%=yhb.getActivityid() %>&bookid=<%=yhb.getBookid() %>">
		        <img src="<%=basePath %>admin/images/imagedelete.gif" width="16" height="16" style="cursor:pointer;" onclick="return window.confirm('是否真的要将此优惠商品删除？')" />
		        </a></td>
		      </tr>
      		<%
      	}
      %>
      
      <tr class="ziti">
        <td align="center" height="30px"><input type="submit" name="button" id="button" value="删 除" onclick="return window.confirm('是否真的要进行删除操作？')"/></td>
        <td colspan="6" align="right"> 总计<%=num %>个记录 分为1页 当前为第1页 | 首 页 下一页 末 页&nbsp;&nbsp;&nbsp;</td>
        </tr>
    </table>
    </form>
    </td>
  </tr>
</table>
  </body>
</html>
