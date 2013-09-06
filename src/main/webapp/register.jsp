<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String photoimg = (String)request.getSession().getAttribute("photo");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		function clickImg() {
			var faceimg = document.getElementById('faceimg');
			faceimg.onclick = function () {
				window.open('face.jsp','face','width=400,height=400,top=100,left=100,scrollbars=1');
			}
		}
	</script>
	<style type="text/css">
	<!--
	body,td,th {
		font-family: 宋体;
		font-size: 12px;
		color: #333333;
	}
	body {
		background-color: #FFFFFF;
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	}
	.border1 {
		background-image: url(images/border.jpg);
		background-repeat: no-repeat;
		background-position: left top;
		border-top-width: 20px;
		border-top-style: solid;
		border-top-color: #f2f2f2;
	}
	.input1 {
		height: 20px;
		width: 183px;
		border: 1px solid #b3b3b3;
	}
	.btn1 {
		height: 24px;
		width: 182px;
	}
	-->
	</style>

	<script type="text/javascript">
	var xmlhttp;
	function createXmlHttpRequest() {
		if (window.XMLHttpRequest) {// code for all new browsers
			xmlhttp = new XMLHttpRequest();
		} else if (window.ActiveXObject) {//code for IE5 and IE6
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		return xmlhttp;
	}
	function getCity() {
		createXmlHttpRequest();
		xmlhttp.onreadystatechange = onready;
		var proSelect = document.getElementById("proSelect");
		xmlhttp.open("get", "GetCity?citycode=" + proSelect.value, false);
		xmlhttp.send(null);
		getCountry();
		
	}
	function onready() {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				var myxml = xmlhttp.responseXML;
				var cities = myxml.getElementsByTagName("city");
				var citySelect = document.getElementById("citySelect");
				citySelect.length=0;
				for ( var i = 0; i < cities.length; i++) {
					var citycode = cities[i].firstChild.firstChild.data;
					var cityvalue = cities[i].lastChild.firstChild.data;
					var option = document.createElement("option");
					option.value = citycode;
					option.text = cityvalue;
					try {
						citySelect.add(option, null); // standards compliant
					} catch (ex) {
						citySelect.add(option); // IE only
					}
				}
			}
		}
	}
	function getCountry(){
		createXmlHttpRequest();
		xmlhttp.onreadystatechange = onready2;
		var citySelect = document.getElementById("citySelect");
		xmlhttp.open("get", "GetCountry?countrycode=" + citySelect.value, true);
		xmlhttp.send(null);
	}
	function onready2(){
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				var myxml = xmlhttp.responseXML;
				var coutries = myxml.getElementsByTagName("country");
				var countrySelect = document.getElementById("countrySelect");
				countrySelect.length=0;
				for ( var i = 0; i < coutries.length; i++) {
					var countrycode = coutries[i].firstChild.firstChild.data;
					var countryvalue = coutries[i].lastChild.firstChild.data;
					var option = document.createElement("option");
					option.value = countrycode;
					option.text = countryvalue;
					try {
						countrySelect.add(option, null); // standards compliant
					} catch (ex) {
						countrySelect.add(option); // IE only
					}
	
				}
			}
		}
	}
	
	</script>

<script type="text/javascript">
	function checkUser() {
		var username = document.getElementById("username").value;
		var patrn=/[\u4e00-\u9fa5]/;;
		if(patrn.exec(username)){
			userText.innerHTML = "<font color='red'><img src='img/error.gif'>用户名不能有中文！</img></font>";
			return false;
		}
		if(username.toString().length<3 || username.toString().length>20) {
			userText.innerHTML = "<font color='red'><img src='img/error.gif'>长度在3-20个字符之间!</img></font>";
			return false;
		}
		if(username.toString()=="liangyongxing" || username.toString()=="zhanghanbin"|| username.toString()=="admin"|| username.toString()=="renjunting"){
			userText.innerHTML = "<font color='red'><img src='img/error.gif'>用户名已经存在</img></font>";
			return false;
		}
		else {
			userText.innerHTML = "<font color='green'><img src='img/success.gif'>该用户名可用!</img></font>";
			return true;
		}
	}
	
	function checkEmail() {
		var email = document.getElementById("email").value;
		var patrn = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
		if (email.toString().length<1) {
			emailText.innerHTML = "<font color='red'><img src='img/error.gif'>邮箱不可以为空</img></font>";
			return false;
		}
		if(!patrn.exec(email)) {
			emailText.innerHTML = "<font color='red'><img src='img/error.gif'>该邮箱格式 不正确</img></font>";
			return false;
		}
		
		else {
			emailText.innerHTML = "<font color='green'><img src='img/success.gif'>该邮箱可用</img></font>";
			return true;
		}
	}

	function checkPass() {
		var password = document.getElementById("password").value;
		if (password.toString().length<1) {
			passText.innerHTML = "<font color='red'><img src='img/error.gif'>密码不能为空！</img></font>";
			return false;
		}
		if(password.toString().length<3 || password.toString().length>20) {
			passText.innerHTML = "<font color='red'><img src='img/error.gif'>密码长度在3到20个字符之间!</img></font>";
			return false;
		}
		else {
			passText.innerHTML = "<font color='green'><img src='img/success.gif'>密码可用</img></font>";
			return true;
		}
	}
	function checkRepass() {
		var password = document.getElementById("password").value;
		var repassword = document.getElementById("repassword").value;
		if (password.toString().length<1) {
			passText.innerHTML = "<font color='red'><img src='img/error.gif'>亲,你的密码好像还没填哦！</img></font>";
			return false;
		}
		if(password!=repassword) {
			repassText.innerHTML = "<font color='red'><img src='img/error.gif'>两次密码输入不一致,请重新输入！</img></font>";
			return false;
		} 
		else {
			repassText.innerHTML = "<font color='green'><img src='img/success.gif'>成功匹配</img></font>";
			return true;
		}
	}
	function checkQq() {
		var qq = document.getElementById("qq").value;
		if(isNaN(qq)) {
			qqText.innerHTML = "<font color='red'><img src='img/error.gif'>qq输入不正确,请重新输入！</img></font>";
			return false;
		} 
		if(qq.toString().length<5) {
			qqText.innerHTML = "<font color='red'><img src='img/error.gif'>QQ号码最少位数为5</img></font>";
			return false;
		}
		else {
			qqText.innerHTML = "<font color='green'><img src='img/success.gif'>亲,你的QQ可用！</img></font>";
			return true;
		}
		
	}
	function checkPhone() {
		var phone = document.getElementById("phone").value;
		var pattern = /^[1]/;
		if(phone.toString().length!=11) {
			phoneText.innerHTML = "<font color='red'><img src='img/error.gif'>电话号码位数不对,请核对后再输入!</img></font>";
			return false;
		} else if(!pattern.exec(phone)) {
			phoneText.innerHTML = "<font color='red'><img src='img/error.gif'>不存在该电话号码,请核对后再输入!</img></font>";
			return false;
		} else {
			phoneText.innerHTML = "<font color='green'><img src='img/success.gif'>电话号码可用!</img></font>";
			return true;
		}
	}
	function checkAnswer() {
		var answer = document.getElementById("answer").value;
		if(answer.toString().length==0) {
			answerText.innerHTML = "<font color='red'><img src='img/error.gif'>密码提示不能为空！</img></font>";
			return false;
		} else {
			answerText.innerHTML = "<font color='green'><img src='img/success.gif'>密码提示可用!</img></font>";
			return true;
		}
	}
	function validateTotal() {
		return checkUser() && checkEmail() && checkPass() && checkRepass() && checkQq() && checkPhone() && checkAnswer();
	}
</script>

<script type="text/javascript">
	function getFullPath(photo){ 
		if(photo){ 
			photo.select(); 
			var path=document.selection.createRange().text; 
			document.getElementById("face").value=path;
		} 
	} 
</script>
</head>

<body onload="getCity()">
<table width="960" border="0" align="center">
  <tr>
    <td align="center">
    	<jsp:include page="top.jsp"></jsp:include>
    </td>
  </tr>
  <tr>
    <td align="center">
    
  <form action="RegisterCl" name="register" method="post" onsubmit="return validateTotal()">
  <table width="960" height="802" border="0" align="center" cellpadding="0" cellspacing="0" class="border1">
  <tr>
    <td height="760" align="right" valign="bottom"><table width="908" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="51" align="left" valign="middle"><img src="images/top.jpg" alt="top" width="158" height="33" /></td>
      </tr>
      <tr>
        <td height="650" align="left" valign="bottom">
        <table width="630" border="0" cellspacing="0" cellpadding="0" height="723" style="width: 630px; height: 723px;">
          <tr>
            <td width="113" height="44" align="right" valign="middle">用户名</td>
            <td width="300" align="center" valign="middle"><input id="username" name="username" type="text" class="input1" maxlength="15" onblur="checkUser()"/>
			&nbsp;&nbsp;<font size="1px" color="red">*</font></td>
			<td width="220"><div id="userText"></div></td>
          </tr>
          <tr>
          	<td width="113" height="44" align="right" valign="middle">用户头像</td>
          	 <td width="300" align="center" valign="middle">
          	 	<%
          	 		if(photoimg != null) {
          	 			%>
          	 			<input type="hidden" name="face" value="face/<%=photoimg %>" id="face"/>
          	 			<img alt="个人头像" src="face/<%=photoimg %>" width="50px" height="50px" id="faceimg" onclick="clickImg()" style="cursor: pointer;"/>
          	 			<%
          	 		} else {
          	 			%>
          	 			<input type="hidden" name="face" value="face/m66.gif" id="face"/>
          	 			<img alt="个人头像" src="face/m66.gif" width="50px" height="50px" id="faceimg" onclick="clickImg()" style="cursor: pointer;"/>
          	 			<%
          	 		}
          	 	%>
          	 	
          	 	&nbsp;&nbsp;<a href="photo.jsp"><font color="red" size="2"><b>或本地上传</b></font></a><br/>
          	 </td>
          </tr>
          <tr>
            <td height="44" align="right" valign="middle">email</td>
            <td align="center" valign="middle"><input id="email" name="email" type="text" class="input1" onblur="checkEmail()"/>
			&nbsp;&nbsp;<font size="1px" color="red">*</font>
			</td>
			<td width="220"><div id="emailText"></div></td>
          </tr>
          <tr>
            <td height="44" align="right" valign="middle">密码</td>
            <td align="center" valign="middle"><input id="password" name="password" type="password" class="input1" maxlength="20" onblur="checkPass()"/>
			&nbsp;&nbsp;<font size="1px" color="red">*</font>
			</td>
			<td width="220"><div id="passText"></div></td>
          </tr>

          <tr>
            <td height="44" align="right" valign="middle">确认密码</td>
            <td align="center" valign="middle"><input id="repassword" name="repassword" type="password" class="input1" maxlength="20" onblur="checkRepass()"/>
			&nbsp;&nbsp;<font size="1px" color="red">*</font>
			</td>
			<td width="220"><div id="repassText"></div></td>
          </tr>
          <tr>
            <td height="44" align="right" valign="middle">ＱＱ</td>
            <td align="center" valign="middle"><input id="qq" name="qq" type="text" class="input1" maxlength="10" onblur="checkQq()"/>
            &nbsp;&nbsp;&nbsp;
			</td>
			<td width="220"><div id="qqText"></div></td>
          </tr>
          <tr>
            <td height="44" align="right" valign="middle">手机</td>
            <td align="center" valign="middle"><input id="phone" name="phone" type="text" class="input1" maxlength="11" onblur="checkPhone()"/>
			&nbsp;&nbsp;<font size="1px" color="red">*</font>
			</td>
			<td width="220"><div id="phoneText"></div></td>
          </tr>
          <tr>
            <td height="44" align="right" valign="middle">货物配送地址</td>
            <td align="left" valign="middle">
            <%
				List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("list");
			%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select name="select1" id="proSelect" onchange="getCity()">
				<%
					for (int i = 0; i < list.size(); i++) {
				%>
				<option value="<%=list.get(i).get("DICTCODE")%>"><%=list.get(i).get("DICTVALUE")%></option>
				<%
					}
				%>
			</select><br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select name="select2" id="citySelect" onchange="getCountry()"></select><br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select name="select3" id="countrySelect"></select><br/>
			</td>
          </tr>
          <tr>
            <td height="44" align="right" valign="middle">密码提示问题</td>
            <td align="left" valign="middle">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <select name="select">
             <option value="0">请选择密码提示问题</option>
             <option value="你父亲的生日？">你父亲的生日？</option>
             <option value="你母亲的生日？">你母亲的生日？</option>
             <option value="我最好朋友的生日？">我最好朋友的生日？</option>
             <option value="我儿时居住地的地址？">我儿时居住地的地址？</option>
             <option value="我的座右铭是？">我的座右铭是？</option>
             <option value="我最喜爱的电影？">我最喜爱的电影？</option>
             <option value="我最喜爱的歌曲？">我最喜爱的歌曲？</option>
             <option value="我最喜爱的狗的名字？">我最喜爱的狗的名字？</option>
             <option value="我最大的爱好？">我最大的爱好？</option>
             <option value="我最喜欢的小说？">我最喜欢的小说？</option>
             <option value="我最喜欢的运动队？">我最喜欢的运动队？</option>
            </select>            
           </td>
          </tr>
          <tr>
            <td height="44" align="right" valign="middle">密码问题答案</td>
            <td align="center" valign="middle"><input id="answer" name="answer" type="text" class="input1" maxlength="15" onblur="checkAnswer()"/>
			&nbsp;&nbsp;<font size="1px" color="red">*</font>
			</td>
			<td width="220px"><div id="answerText"></div></td>
          </tr>
          <tr>
            <td height="55">&nbsp;</td>
            <td align="center" valign="middle"><input name="checkbox" type="checkbox" value="checkbox" checked="checked" />
                               我已看过并接受<a href="">《用户协议》</a></td>
          </tr>
          <tr>
            <td height="76">&nbsp;</td>
            <td align="center" valign="middle"><input type="image" src="images/btn.jpg" alt="btn" width="135" height="47" style="cursor:pointer;"/></td>
          </tr>
          <tr>
            <td height="150">&nbsp;</td>
            <td align="left" valign="top"><p><a href="login.jsp?type=top"><img src="images/zhixiang.png"/>我已有账号，我要登录。</a></p>
              <p><a href="find_password.jsp"><img src="images/zhixiang.png"/>您忘记密码了吗？</a></p></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
    </td>
  </tr>
  <tr>
    <td align="center">
    	<jsp:include page="footer.jsp"></jsp:include>
    </td>
  </tr>
</table>

</body>
	
</html>
