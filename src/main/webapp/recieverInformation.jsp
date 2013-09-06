<%@ page language="java" import="java.util.*, com.shxt.dao.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link  href="css/recieverInformation.css" type="text/css" rel="Stylesheet"/>
</head>
<%
	UserInfo user =(UserInfo) session.getAttribute("user");
 %>

<body>
<div id="bigDiv">
   <div id="Div1"><b><span>收货人信息</span></b></div>
   <div id="Div2">
       <form action="PersonalHouTai?type=ziliao&userid=<%=user.getUserid() %>" method="post" name="theForm">
              <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
                <tr>
                  <td align="right" bgcolor="#ffffff">配送区域：</td>
                  <td colspan="3" align="left" bgcolor="#ffffff">
                     <%=user.getSendaddress() %>
                  </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#ffffff">收货人姓名：</td>
                  <td align="left" bgcolor="#ffffff"><input name="consignee" type="text" id="consignee_0" value="<%=user.getUsername() %>" />
                  (必填) </td>
                  <td align="right" bgcolor="#ffffff">电子邮件地址：</td>
                  <td align="left" bgcolor="#ffffff"><input name="email" type="text" id="email_0" value="<%=user.getUseremail() %>" />
                  (必填)</td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#ffffff">详细地址：</td>
                  <td align="left" bgcolor="#ffffff"><input name="address" type="text" id="address_0" value="<%=user.getSendaddress() %>" />
                  (必填)</td>
                  <td align="right" bgcolor="#ffffff">邮政编码：</td>
                  <td align="left" bgcolor="#ffffff"><input name="zipcode" type="text" id="zipcode_0" value="<%=user.getUserpostcode() %>" /></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#ffffff">QQ号码：</td>
                  <td align="left" bgcolor="#ffffff"><input name="tel" type="text" id="tel_0" value="<%=user.getUserqq() %>" />
                  (必填)</td>
                  <td align="right" bgcolor="#ffffff">手机：</td>
                  <td align="left" bgcolor="#ffffff"><input name="mobile" type="text" id="mobile_0" value="<%=user.getUserphone() %>" /></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#ffffff">标志建筑：</td>
                  <td align="left" bgcolor="#ffffff"><input name="sign_building" type="text" id="sign_building_0" value="<%=user.getUserhothouse()%>" /></td>
                  <td align="right" bgcolor="#ffffff">最佳送货时间：</td>
                  <td align="left" bgcolor="#ffffff"><input name="best_time" type="text" id="best_time_0" value="<%=user.getBestsendgoodstime()%>" /></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#ffffff">&nbsp;</td>
                  <td colspan="3" align="center" bgcolor="#ffffff"> 
                      <input type="image" src="image/personalxiugai.png" ></input>
                  </td>
                </tr>
              </table>
            </form>
   </div>
</div>
</body>
</html>
