<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'addadmin.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		.ziti{
			font-size: 13px;
		}
	</style>
	
	<script type="text/javascript">
		function userValidate() {
			var username = document.getElementById("username").value;
			if(username=="" || username==null){
				userText.innerHTML="<img src='admin/img/error.gif'/><font color='red'><b>用户名不能为空!</b></font>";
				return false;
			} else{
				userText.innerHTML="<img src='admin/img/success.gif'/><font color='green'><b>用户名可用!</b></font>";
				return true;
			}
		}
		function truenameValidate() {
			var truename = document.getElementById("truename").value;
			if(truename=="" || truename==null){
				truenameText.innerHTML="<img src='admin/img/error.gif'/><font color='red'><b>真实姓名不能为空!</b></font>";
				return false;
			} else{
				truenameText.innerHTML="<img src='admin/img/success.gif'/><font color='green'><b>真实姓名可用!</b></font>";
				return true;
			}
		}
		function passValidate() {
			var password = document.getElementById("password").value;
			if(password=="" || password==null){
				passwordText.innerHTML="<img src='admin/img/error.gif'/><font color='red'><b>密码不能为空!</b></font>";
				return false;
			} else{
				passwordText.innerHTML="<img src='admin/img/success.gif'/><font color='green'><b>密码可用!</b></font>";
				return true;
			}
		}
		function repassValidate() {
			var password = document.getElementById("password").value;
			var repassword = document.getElementById("repassword").value;
			//alert(password+"   "+repassword);
			if(repassword=="" || repassword==null){
				repasswordText.innerHTML="<img src='admin/img/error.gif'/><font color='red'><b>重复密码不能为空!</b></font>";
				return false;
			} else if(repassword != password){
				repasswordText.innerHTML="<img src='admin/img/error.gif'/><font color='red'><b>输入的密码和刚才输入的不一致!</b></font>";
				return false;
			} else {
				repasswordText.innerHTML="<img src='admin/img/success.gif'/><font color='green'><b>重复密码输入正确!</b></font>";
				return true;
			}
		}
		function phoneValidate() {
			var phone = document.getElementById("phone").value;
			if(phone=="" || phone==null){
				phoneText.innerHTML="<img src='admin/img/error.gif'/><font color='red'><b>电话号码不能为空!</b></font>";
				return false;
			} else if(phone.toString().length<11){
				phoneText.innerHTML="<img src='admin/img/error.gif'/><font color='red'><b>电话号码格式输入有误!</b></font>";
				return false;
			} else {
				phoneText.innerHTML="<img src='admin/img/success.gif'/><font color='green'><b>电话号码输入正确!</b></font>";
				return true;
			}
		}
		function emailValidate() {
			var email = document.getElementById("email").value;
			var patrn = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
			if(email=="" || email==null){
				emailText.innerHTML="<img src='admin/img/error.gif'/><font color='red'><b>电子邮件地址不能为空!</b></font>";
				return false;
			} else if(!patrn.exec(email)){
				emailText.innerHTML="<img src='admin/img/error.gif'/><font color='red'><b>电子邮件地址格式输入有误!</b></font>";
				return false;
			} else {
				emailText.innerHTML="<img src='admin/img/success.gif'/><font color='green'><b>电子邮件地址输入正确!</b></font>";
				return true;
			}
		}
		function qqValidate() {
			var qq = document.getElementById("qq").value;
			if(qq=="" || qq==null){
				qqText.innerHTML="<img src='admin/img/error.gif'/><font color='red'><b>QQ号码不能为空!</b></font>";
				return false;
			} else if(qq.toString().length<5){
				qqText.innerHTML="<img src='admin/img/error.gif'/><font color='red'><b>QQ号码格式输入有误!</b></font>";
				return false;
			} else if(isNaN(qq)) {
				qqText.innerHTML="<img src='admin/img/error.gif'/><font color='red'><b>QQ号码只能是数字!</b></font>";
				return false;
			} else {
				qqText.innerHTML="<img src='admin/img/success.gif'/><font color='green'><b>QQ号码输入正确!</b></font>";
				return true;
			}
		}
		function validateTotal() {
			return userValidate() && truenameValidate() && passValidate() && repassValidate() && phoneValidate() && emailValidate() && qqValidate();
		}
	</script>

  </head>
  <body>
  <table width="1140" border="10" bordercolor="#DDEEF2" align="left" cellpadding="0" cellspacing="0" class="ziti">
  <tr>
  	<td>
  	<form action="<%=request.getContextPath() %>/AddAdmin" name="form" method="post" onsubmit="return validateTotal();">
  	<table width="1130" border="0" class="ziti" align="center">
  	<tr>
    	<td align="left" height="50px" colspan="3">&nbsp; <font size="4"><b>酷星网管理系统</b></font>——<font color="#9CACAF" size="4"><b>增加管理员</b></font></td>
  	</tr>
	  <tr>
	    <td align="right" width="20%">登录名：</td>
	    <td align="left" width="23%"> &nbsp;<input type="text" name="name" size="30" id="username" onblur="userValidate()"/> <font color="red">*</font>&nbsp;</td>
	    <td align="left"  width="57%"><div id="userText"></div></td>
	  </tr>
	  <tr>
	    <td align="right">真实姓名：</td>
	    <td align="left"> &nbsp;<input type="text" name="truename" id="truename"  size="30" onblur="truenameValidate()"/> <font color="red">*</font>&nbsp;</td>
	    <td><div id="truenameText"></div></td>
	  </tr>
	  <tr>
	    <td align="right">密码：</td>
	    <td align="left"> &nbsp;<input type="password" name="password" id="password"  size="30" onblur="passValidate()"/> <font color="red">*</font>&nbsp;</td>
	    <td><div id="passwordText"></div></td>
	  </tr>
	   <tr>
	    <td align="right">确认密码：</td>
	    <td align="left"> &nbsp;<input type="password" name="rpassword" id="repassword"  size="30" onblur="repassValidate()"/> <font color="red">*</font>&nbsp;</td>
	    <td><div id="repasswordText"></div></td>
	  </tr>
	  <tr>
	    <td align="right">联系电话：</td>
	    <td align="left"> &nbsp;<input type="text" name="phone" id="phone"  size="30" maxlength="11" onblur="phoneValidate()"/> <font color="red">*</font>&nbsp;</td>
	    <td><div id="phoneText"></div></td>
	  </tr>
	  <tr>
	    <td align="right">电子邮件：</td>
	    <td align="left"> &nbsp;<input type="text" name="email" id="email"  size="30" onblur="emailValidate()"/> <font color="red">*</font>&nbsp;</td>
	    <td><div id="emailText"></div></td>
	  </tr>
	  <tr>
	    <td align="right">QQ号码：</td>
	    <td align="left"> &nbsp;<input type="text" name="qq" id="qq" maxlength="10" size="30" onblur="qqValidate()"/> <font color="red">*</font>&nbsp;</td>
	    <td><div id="qqText"></div></td>
	  </tr>
	   <tr align="center">
	    <td align="right">
	    <input type="submit" name="submit" id="button" value="提 交"/>&nbsp;
	    </td>
	    <td  align="left"> &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset" id="button2" value="重 置" /></td>
	  </tr>
   </table>
   </form>
  </td>
 </tr>
</table>
</body>
</html>