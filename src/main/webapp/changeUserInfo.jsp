<%@ page language="java" import="java.util.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
UserInfo userinfo = (UserInfo)request.getSession().getAttribute("user");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改用户信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
	<!--
	body,td,th {
		font-family: 宋体;
		font-size: 12px;
		color: #414141;
	}
	body {
		background-color: #FFFFFF;
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	}
	.tableborder1 {
		border-top-width: 3px;
		border-right-width: 1px;
		border-bottom-width: 1px;
		border-left-width: 1px;
		border-top-style: solid;
		border-right-style: solid;
		border-bottom-style: solid;
		border-left-style: solid;
		border-top-color: #afcde5;
		border-right-color: #d7e3e3;
		border-bottom-color: #d7e3e3;
		border-left-color: #d7e3e3;
	}
	.tdcolor1 {
		background-color: #edf7ff;
		font-family: "宋体";
		font-size: 14px;
		font-weight: bold;
		color: #383d41;
		padding-left: 7px;
		padding-right: 7px;
	}
	.tableborder2 {
		border: 1px solid #dcdcdc;
		font-family: "宋体";
		font-size: 14px;
		font-weight: normal;
		color: #383d41;
	}
	
	.txt1 
	{
		border:1px solid #dcdcdc;
		font-family: "宋体";
		font-size: 14px;
		font-weight: bold;
		color: #383d41;
		padding-left: 5px;
	}
	.txt2 {
		border: 1px solid #dcdcdc;
		font-family: "宋体";
		font-size: 12px;
		font-weight: normal;
		color: #383d41;
		padding-left: 7px;
		padding-right: 7px;
	}
	.input1 {
		height: 50px;
		width: 600px;
	}
	.input2 {
		height: 20px;
		width: 200px;
	}
	.btn1 {
		height: 47px;
		width: 171px;
		border-top-style: none;
		border-right-style: none;
		border-bottom-style: none;
		border-left-style: none;
		background-image: url(images/btn1.jpg);
		background-repeat: no-repeat;
	}
	.txt3 {
		font-family: "宋体";
		font-size: 14px;
		font-weight: bold;
		color: #5b84b2;
	}
	.txt4 {
		font-family: "宋体";
		font-size: 13px;
		color: #FE596A;
	}
	.link1 {
		font-family: "宋体";
		font-size: 12px;
		color: #165485;
		text-decoration: none;
	}
	.footer {
		background-image: url(images/footerbg1.jpg);
		background-repeat: no-repeat;
		background-position: center bottom;
	}
	-->
	</style>
	<script type="text/javascript">
		function validateUsername() {
			var username = document.getElementById("username").value;
			if(username=="" || username==null) {
				alert("用户名不能为空！");
				return false;
			} 
		}
		function validateEmail() {
			var email = document.getElementById("email").value;
			if(email=="" || email==null) {
				alert("电子邮箱不能为空！");
				return false;
			} 
		}
		function validateAddress() {
			var address = document.getElementById("address").value;
			if(address=="" || address==null) {
				alert("配送地址不能为空！");
				return false;
			} 
		} 
		function validatePostcode() {
			var postcode = document.getElementById("postcode").value;
			if(postcode=="" || postcode==null) {
				alert("邮政编码不能为空！");
				return false;
			} 
		}
		function validatePhone() {
			var phone = document.getElementById("phone").value;
			if(phone=="" || phone==null) {
				alert("邮政编码不能为空！");
				return false;
			} 
		}
		function validateTotal() {
			return validateUsername() && validateEmail() && validateAddress() && validatePostcode() && validatePhone();
		}
	</script>
  </head>
  
  <body>
    <table width="960" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder1">
    <tr>
    	<td><jsp:include page="top.jsp"></jsp:include>
    	</td>
    </tr>
      <tr>
        <td width="550" height="30" align="left" valign="middle" class="tdcolor1">收货人信息</td>
      </tr>
      <tr>
        <td height="155" colspan="2" align="center" valign="middle">
        <table width="960" border="0" cellpadding="0" cellspacing="0" class="tableborder2">

            <tr>
              <td width="240" height="34" align="left" valign="middle" class="txt2">收货人姓名：</td>
              <td width="240" align="left" valign="middle" class="txt2"><%=userinfo.getUsername() %></td>
              <td width="240" align="left" valign="middle" class="txt2">电子邮件地址：</td>
              <td width="240" align="left" valign="middle" class="txt2"><%=userinfo.getUseremail() %></td>
              </tr>
            <tr>
              <td height="34" align="left" valign="middle" class="txt2">配送地址：</td>
              <td align="left" valign="middle" class="txt2"><%=userinfo.getSendaddress() %></td>
              <td align="left" valign="middle" class="txt2">邮政编码：</td>
              <td align="left" valign="middle" class="txt2"><%=userinfo.getUserpostcode() %></td>
              </tr>
            <tr>
              <td height="34" align="left" valign="middle" class="txt2">用户注册时间：</td>
              <td align="left" valign="middle" class="txt2"><%=userinfo.getRegistdate() %></td>
              <td align="left" valign="middle" class="txt2">手机：</td>
              <td align="left" valign="middle" class="txt2"><%=userinfo.getUserphone() %></td>
              </tr>
            <tr>
              <td height="34" align="left" valign="middle" class="txt2">标志建筑：</td>
              <td align="left" valign="middle" class="txt2"><%=userinfo.getUserhothouse() %></td>
              <td align="left" valign="middle" class="txt2">最佳送货时间：</td>
              <td align="left" valign="middle" class="txt2"><%=userinfo.getBestsendgoodstime() %></td>
              </tr>
        </table>
        </td>
      </tr>
      	<form action="ChangeUserInfo?type=ok" method="post" onsubmit="return validateTotal();">
     	 <table width="960" border="0" cellpadding="0" cellspacing="0" class="tableborder2" align="center">
			<tr>
       		 <td width="550" height="30" align="left" valign="middle" class="tdcolor1" colspan="4">修改收货人信息</td>
      		</tr>
            <tr>
              <td width="240" height="34" align="left" valign="middle" class="txt2">收货人姓名：</td>
              <td width="240" align="left" valign="middle" class="txt2">
              	<input type="hidden" value="<%=userinfo.getUserid() %>" name="userid"/>
              	<input name="username" type="text" size="30px" maxlength="20" id="username" onblur="validateUsername()"/> <font color="red">*</font>
              </td>
              <td width="240" align="left" valign="middle" class="txt2">电子邮件地址：</td>
              <td width="240" align="left" valign="middle" class="txt2">
              	<input name="email" type="text" size="30px" maxlength="30" id="email" onblur="validateEmail()"/> <font color="red">*</font>
              </td>
              </tr>
            <tr>
              <td height="34" align="left" valign="middle" class="txt2">配送地址：</td>
              <td align="left" valign="middle" class="txt2">
              	<input name="address" type="text" size="30" maxlength="30"  id="address" onblur="validateAddress()"/> <font color="red">*</font>
              </td>
              <td align="left" valign="middle" class="txt2">邮政编码：</td>
              <td align="left" valign="middle" class="txt2">
              	<input name="postcode" type="text" size="30" maxlength="6" id="postcode" onblur="validatePostcode()"/> <font color="red">*</font>
              </td>
              </tr>
            <tr>
              <td height="34" align="left" valign="middle" class="txt2">用户注册时间：</td>
              <td align="left" valign="middle" class="txt2"><%=userinfo.getRegistdate() %></td>
              <td align="left" valign="middle" class="txt2">手机：</td>
              <td align="left" valign="middle" class="txt2">
              	<input name="phone" type="text" size="30" maxlength="11" id="phone" onblur="validatePhone()"/> <font color="red">*</font>
              </td>
              </tr>
            <tr>
              <td height="34" align="left" valign="middle" class="txt2">标志建筑：</td>
              <td align="left" valign="middle" class="txt2">
              	<input name="hothouse" type="text" size="30" maxlength="30" />
              </td>
              <td align="left" valign="middle" class="txt2">最佳送货时间：</td>
              <td align="left" valign="middle" class="txt2">
              	<select name="besttime">
              		<option value="除周六和周日">除周六和周日</option>
              		<option value="任何时候都可以">任何时候都可以</option>
              		<option value="单日">单日</option>
              		<option value="双日">双日</option>
              	</select>
              </td>
              </tr>
              <tr>
              	<td colspan="4" align="center" height="36px">
              		<input type="image" src="image/peisong.png"/>
              	</td>
              </tr>
        </table>
      </form>
      <tr>
      <jsp:include page="xinshoushanglu.jsp"></jsp:include>
      </tr>
      <tr>
      <jsp:include page="footer.jsp"></jsp:include>
      </tr>
    </table>
  </body>
</html>
