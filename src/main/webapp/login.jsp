<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String type = request.getParameter("type");
String id = request.getParameter("id");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录首页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<script type="text/javascript">
		//用于实现用户名和密码的验证
		function userValidate(){
			var username = document.getElementById("username").value;
			
			var rex = /[\u4e00-\u9fa5]/;
			if(username=="" || username==null){
				userText.innerHTML = "<font color='red'><img src='img/error.gif'>用户名不能为空！</img></font><br />";
				return false;
			} else if (rex.test(username)) {
				userText.innerHTML = "<font color='red'><img src='img/error.gif'>用户名不能有中文！</img></font><br />";
				return false;
			}
			else {
				userText.innerHTML = "<font color='green'><img src='img/success.gif'>账户可用！</img></font><br />";
				return true;
			}
		}
		function passValidate(){
			var password = document.getElementById("password").value;
			
			if(password=="" || password==null){
				pwdText.innerHTML = "<font color='red'><img src='img/error.gif'>密码不能为空!</img></font><br>";
				return false;
			}
			else{
				pwdText.innerHTML = "<font color='green'><img src='img/success.gif'>密码可用!</img></font><br>";
				return true;
			}
		}
		function yzValidate() {
			var text = document.getElementById("yzm").value;
			if(text.toString().length == 0) {
				yzText.innerHTML = "<font color='red'><img src='img/error.gif'>验证码不能为空!</img></font><br>";
				return false;
			} else if(text.toString().length != 4){
				yzText.innerHTML = "<font color='red'><img src='img/error.gif'>验证码位数只能为4位!</img></font><br>";
				return false;
			} else {
				yzText.innerHTML = "<font color='green'><img src='img/success.gif'>验证码可用!</img></font><br>";
				return true;
			}
		}
		function totalValidate(){
			return userValidate() && passValidate() && yzValidate();
		}
	</script>
	<style type="text/css">
		#code{
			position:relative;
			top:-5px;
			cursor:pointer;
		}
	</style>
</head>
<body>
	<table align="center">
		<tr>
		<jsp:include page="top.jsp"></jsp:include>
		</tr>
		<table width="960px" border="0" align="center">
		<tr><td width="60%"  class="table_2">
		<form action="LoginCl?type=<%=type %>&id=<%=id %>" method="post" onsubmit="return totalValidate()" name="login">
			<table>
			<tr><td width="20%"></td><td></td><td><img src="images/login.png"/></td></tr>
			<tr><td></td><td height="20px">用户名：</td><td><input type="text" name="username" id="username" onblur="userValidate()"/></td><td id="userText" width="35%"></td></tr>
			<tr><td></td><td height="20px">密&nbsp;   码:</td><td><input type="password" name="password" id="password" onblur="passValidate()"/></td><td id="pwdText"></td></tr>
			<tr><td></td><td height="20px">验证码：</td><td><input type="text" name="yanzhengma" id="yzm" onblur="yzValidate()" size="9"/>&nbsp;<img align="middle" src="Random.jsp" id="code" onclick="javascript:this.src='Random.jsp?tm='+Math.random()" /></td><td id="yzText"></td></tr>
			<tr><td></td><td></td><td><input type="image" src="images/loginbtu.png" style="cursor: pointer"></td></tr>
			<tr><td height="5px"></td><td></td><td></td></tr>
			<tr><td></td><td></td><td><a href="find_password.jsp"><font color="#9E9E9E" size="2px">密码问题找回密码？</font></a></td></tr>
			</table>
		</form>
		</td><td>
			<table class="zhuce" width="100%">
			<tr><td height="50px"></td></tr>
				<tr><td width="30%"></td><td><b>如果您不是会员，请注册</b></td></tr>
				<tr><td></td><td><font color="red">友情提示：</font></td></tr>
				<tr><td></td><td>不注册为会员也可以在本店买东西</td></tr>
				<tr><td></td><td>但注册之后您可以：</td></tr>
				<tr><td></td><td>1.保存您的个人资料</td></tr>
				<tr><td></td><td>2.收藏您关注的商品</td></tr>
				<tr><td></td><td>3.享受会员积分制度</td></tr>
				<tr><td></td><td>4.订阅本店商品信息</td></tr>
				<tr><td height="20px"></td></tr>
				<tr><td></td><td><img src="images/btn.jpg" onclick="window.location='GetProvince'" style="cursor:pointer;"/></td></tr>
				<tr><td height="40px"></td></tr>
			</table>
		</td></tr>
		
		<tr>
		<td height="8px"></td>
		</tr>
		
		<tr>
		<jsp:include page="footer.jsp"></jsp:include>
		</tr>
		
		</table>
	</table>
</body>
</html>
