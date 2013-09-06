<%@ page language="java" import="java.util.*, com.shxt.dao.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
UserInfo userinfo = (UserInfo)request.getSession().getAttribute("user");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link  href="css/personinformation.css" type="text/css" rel="Stylesheet"/>
    <style type="text/css">
    	.ziti{
    		font-size: 13px;
    	}
    </style>
    <script type="text/javaScript">
    	function checkPass() {
    		var newpass = document.getElementById("newpass").value;
    		var confirpass = document.getElementById("confirpass").value;
    		if(newpass!=confirpass){
    			alert("两次密码输入的不一致，请重新输入!");
    			window.formPassword.comfirm_password.value = "";
    			return false;
    		}
    	}
    	function validatePass(){
    		return checkPass();
    	}
    </script>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
</head>
<%
	UserInfo user =(UserInfo) session.getAttribute("user");
 %>

<body>
<div id="bigDiv">
   <div id="Div1"><b><span>个人资料</span></b></div>
   <div id="Div2">
     <form name="formEdit" action="PersonalHouTai?type=ziliao&userid=<%=user.getUserid() %>" method="post">
       <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd" class="ziti">
         <tr>
           <td width="28%" align="right" bgcolor="#FFFFFF">用户出生日期： </td>
           <td width="72%" align="left" bgcolor="#FFFFFF">
               <input class="Wdate" type="text" onClick="WdatePicker()" />
           </td>
           </tr>
           <tr>
              <td width="28%" align="right" bgcolor="#FFFFFF">性　别： </td>
              <td width="72%" align="left" bgcolor="#FFFFFF">
              	<%
              		String sex = user.getUsersex();
              		if(sex.equals("男")) {
              			%>
              			<input type="radio" name="sex" value="0" />保密&nbsp;&nbsp;
		                 <input type="radio" name="sex" value="1" checked="checked" />男&nbsp;&nbsp;
		                 <input type="radio" name="sex" value="2"  />女&nbsp;&nbsp; 
              			<%
              		} else if(sex.equals("女")){
              			%>
              			<input type="radio" name="sex" value="0" />保密&nbsp;&nbsp;
		                 <input type="radio" name="sex" value="1"/>男&nbsp;&nbsp;
		                 <input type="radio" name="sex" value="2"  checked="checked"  />女&nbsp;&nbsp; 
              			<%
              		} else {
              			 %>
              			<input type="radio" name="sex" value="0" checked="checked"/>保密&nbsp;&nbsp;
		                 <input type="radio" name="sex" value="1"/>男&nbsp;&nbsp;
		                 <input type="radio" name="sex" value="2"/>女&nbsp;&nbsp; 
              			<%
              		}
              	%>
              </td>
            </tr>
            <tr>
               <td width="28%" align="right" bgcolor="#FFFFFF">电子邮件地址： </td>
               <td width="72%" align="left" bgcolor="#FFFFFF">
               <input name="email" type="text" value="<%=user.getUseremail() %>" size="25"/><span style="color:#FF0000"> *</span>
               </td>
            </tr>
		    <tr>
			    <td width="28%" align="right" bgcolor="#FFFFFF" id="extend_field1i">注册时间：</td>
			    <td width="72%" align="left" bgcolor="#FFFFFF">
			    <input name="extend_field1" type="text" value="<%=user.getRegistdate() %>"/><span style="color:#FF0000"> *</span>	
                </td>
		    </tr>
		    <tr>
			    <td width="28%" align="right" bgcolor="#FFFFFF" id="extend_field2i">QQ：</td>
			    <td width="72%" align="left" bgcolor="#FFFFFF">
			    <input name="extend_field2" type="text" value="<%=user.getUserqq() %>"/><span style="color:#FF0000"> *</span>			            </td>
		    </tr>
		    <tr>
			    <td width="28%" align="right" bgcolor="#FFFFFF" id="extend_field3i">配送地址：</td>
			    <td width="72%" align="left" bgcolor="#FFFFFF">
			     <input name="adress" type="text" value="<%=user.getSendaddress() %>"/><span style="color:#FF0000"> *</span>			
                </td>
		    </tr>
		    <tr>
			    <td width="28%" align="right" bgcolor="#FFFFFF" id="extend_field4i">配送最佳时间：</td>
			    <td width="72%" align="left" bgcolor="#FFFFFF">
			    <input name="extend_field4" type="text" value="<%=user.getBestsendgoodstime() %>"/><span style="color:#FF0000"> *</span>			
                </td>
		    </tr>
		    <tr>
			    <td width="28%" align="right" bgcolor="#FFFFFF" id="extend_field5i">手机号码：</td>
			    <td width="72%" align="left" bgcolor="#FFFFFF">
			    <input name="extend_field5" type="text" class="inputBg" value="<%=user.getUserphone() %>"/><span style="color:#FF0000"> *</span>			
            </td>
		    </tr>
		    <tr>
			    <td width="28%" align="right" bgcolor="#FFFFFF" id="extend_field5i">标志性建筑：</td>
			    <td width="72%" align="left" bgcolor="#FFFFFF">
			    <input name="extend_field5" type="text" class="inputBg" value="<%=user.getUserhothouse() %>"/><span style="color:#FF0000"> *</span>			
            </td>
		    </tr>
		    <tr>
		      <td width="28%" align="right" bgcolor="#FFFFFF">密码提示问题：</td>
		      <td width="72%" align="left" bgcolor="#FFFFFF">
		      <select name='sel_question'>
		         <option value='0'><%=user.getPassquestion() %></option>
		         <option value="friend_birthday">我最好朋友的生日？</option>
                 <option value="old_address">我儿时居住地的地址？</option>
                 <option value="motto">我的座右铭是？</option>
                 <option value="favorite_movie">我最喜爱的电影？</option>
                 <option value="favorite_song">我最喜爱的歌曲？</option>
                 <option value="favorite_food">我最喜爱的食物？</option>
                 <option value="interest">我最大的爱好？</option>
                 <option value="favorite_novel">我最喜欢的小说？</option>
                 <option value="favorite_equipe">我最喜欢的运动队？</option>		  
              </select>
		      </td>
		    </tr>
		    <tr>
		      <td width="28%" align="right" bgcolor="#FFFFFF" id="passwd_quesetion">密码问题答案：</td>
		      <td width="72%" align="left" bgcolor="#FFFFFF">
		      <input name="passwd_answer" type="text" size="25" value="<%=user.getPassanswer() %>"/><span style="color:#FF0000"> *</span></td>
		    </tr>
		    <tr>
               <td colspan="2" align="center" bgcolor="#FFFFFF">
               <input type="image" src="image/personalxiugai.png"/>
               </td>
            </tr>
           </table>
         </form>
         <form name="formPassword" action="PersonalHouTai?type=user&userid=<%=user.getUserid() %>" method="post" onsubmit="return validatePass()">
         <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd" class="ziti">
            <tr>
              <td width="28%" align="right" bgcolor="#FFFFFF">原密码：</td>
              <td width="76%" align="left" bgcolor="#FFFFFF"><input name="old_password" type="password" size="25" value=""/></td>
            </tr>
            <tr>
              <td width="28%" align="right" bgcolor="#FFFFFF">新密码：</td>
              <td align="left" bgcolor="#FFFFFF"><input name="new_password" type="password" size="25" id="newpass"/></td>
            </tr>
            <tr>
              <td width="28%" align="right" bgcolor="#FFFFFF">确认密码：</td>
              <td align="left" bgcolor="#FFFFFF"><input name="comfirm_password" type="password" size="25" id="confirpass" onblur="checkPass();"/></td>
            </tr>
            <tr>
              <td colspan="2" align="center" bgcolor="#FFFFFF">
              <input type="image" src="image/personalxiugai.png"/>
              </td>
            </tr>
        </table>
    </form>
   </div>
</div>
</body>
</html>
