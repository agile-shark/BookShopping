<%@ page language="java" import="java.util.*,com.shxt.model.*,com.shxt.dao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

//从display.jsp页面总得到传过来的id号
String bookid = request.getParameter("bookid");

int pageNow = 1;
String s_pageNow = (String)request.getAttribute("pageNow");
if(s_pageNow!=null) {
	pageNow = Integer.parseInt(s_pageNow);
}

EvaluationDAO evadao = new EvaluationDAO();
//得到该指定图书id号的所有信息
ArrayList<Evaluation> al = evadao.getEvaluationList(bookid);
//得到指定图书id号的分页信息
System.out.println("图书id为："+bookid+"   pageNow为："+pageNow);
ArrayList<Evaluation> pages = evadao.getEvaluatePage(bookid,pageNow,5);
System.out.println("得到指定图书的分页信息的长度为："+pages.size());
//得到指定图书的评论信息页数
int pageCount = evadao.getPageWithEvaluate(5,bookid);

//通过session得到user的信息
UserInfo user = (UserInfo)request.getSession().getAttribute("user");
String username = null;
String userid = null;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书评论界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
	
		function yzValidate() {
			var text = document.getElementById("random").value;
			if(text.toString().length != 4){
				alert("请正确输入验证码，不要恶意评论，谢谢合作!");
				window.login.random.value="";
				window.login.random.focus();
				return false;
			}
			return true;
		}
		function totalValidate(){
			return yzValidate();
		}
	
	</script>
	
	<style type="text/css">
<!--
body,td,th {
	font-family: 宋体;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="style/main.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE2 {
	color: #ff6666;
	font-size: 11px;
}
-->
</style>
</head>

<body>
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0" class="border">
  <tr>
    <td height="33" align="left" valign="top"><table width="750" border="0" cellspacing="0" cellpadding="0">
      <tr class="topbg">
        <td width="26" height="33" align="left" valign="top">&nbsp;<img src="img/top_1.jpg" alt="top_1" width="4" height="17" class="top_1" /></td>
        <td width="10" height="33">&nbsp;</td>
        <td width="640" height="33" align="left" valign="middle" class="ziti">用户评论</td>
        <td width="74" align="left" valign="middle"><span class="name_2">(共</span><span class="STYLE2"><%=al.size() %></span><span class="ziti_2">条评价）</span></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="110" align="left" valign="top">
    <table width="750" height="110" border="0" cellpadding="0" cellspacing="0">
    	<%
    		if(al.size() == 0){
    			%>
    			<tr><td>
    			暂时还没有任何用户评论！
    			</td>
    			</tr>
    			<%
    		} else {
    			for(int i=0;i<pages.size();i++){
    				Evaluation eva = al.get(i);
    				%>
    				<tr>
    				<td width="40" height="36" align="right" valign="middle"><img alt="用户头像" src="<%=eva.getEvaimage() %>" width="30" height="30"></td>
			        <td width="163" height="36" align="left" valign="top" class="LYziti"> &nbsp;<%=eva.getUsername() %> </td>
			       
			        <td width="325" height="36" align="left" class="time">(<%=eva.getEvadate() %>) </td>
			       </tr>
			       <tr>
			        <td height="21" colspan="2" align="left" valign="top" class="good">评论标题 ： <%=eva.getEvatitle() %></td>
			         <%int n = Integer.parseInt(eva.getEvarank()); %>
			        <td  align="right" valign="middle"><img src="style/rank<%=n %>.png" alt="good" width="88" height="22" />
			        </td>
			        </tr>
			     	<tr>
			        <td height="21" colspan="3" align="left" valign="top" class="good">评论内容 ：<%=eva.getEvacontent() %></td>
			        </tr>
			        <tr>
				      <td height="12" colspan="3" align="left" valign="top"><img src="img/line.jpg" alt="line" width="727" height="2" class="line" /></td>
				    </tr>
				     
    				<%
    			}
    		}
    	%>
       <tr>
       <td height="20" colspan="3" align="left" valign="top"><span class="page">总计<%=al.size() %>个记录，共 <%=pageCount %> 页。</span>
       <span class="page2">
       <a href="EvaluationPageCl?pageNow=<%=1 %>&bookid=<%=bookid %>">首 页</a>&nbsp;
       <%
       	if(pageNow > 1){
       		%>
       		 <a href="EvaluationPageCl?pageNow=<%=pageNow-1 %>&bookid=<%=bookid %>">上一页</a>&nbsp; 
       		<%
       	}
       %>
       <%
       	if(pageNow < pageCount) {
       		%>
       		<a href="EvaluationPageCl?pageNow=<%=pageNow+1 %>&bookid=<%=bookid %>">下一页</a>&nbsp; 
       		<%
       	}
       %>
       <a href="EvaluationPageCl?pageNow=<%=pageCount %>&bookid=<%=bookid %>">末页</a>
       </span>
       </td>
       </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td align="center" valign="top">
    <%
    	if(null == user) {
    		%>
    		 <p><font color="red"> 如果用户没有登录，不可以进行评论! </font></p>
    		<%
    	} else {
    		username = user.getUsername();
    		userid = user.getUserid()+"";
    	}
    %>
   <form action="EvaluationCl?username=<%=username %>&bookid=<%=bookid %>&userid=<%=userid %>" method="post" name="login" onsubmit="return totalValidate()">
    <table width="750" height="560px" border="0" cellpadding="0" cellspacing="0" class="tbbg">
      <tr>
      	<%
	    	if(null == user) {
	    		%>
	    		 <td width="85" height="40" align="left" valign="top" class="name">用户名：</td>
       			 <td colspan="5" align="left" valign="top" class="name_2">匿名用户</td>
	    		<%
	    	} else {
	    		%>
	    		<td width="85" height="40" align="left" valign="top" class="name">用户名：</td>
       	 		<td colspan="5" align="left" valign="top" class="name_2"><%=user.getUsername() %>
       	 		<input type="hidden" name="image" value="<%=user.getUserimage() %>" /></td>
	    		<%
	    	}
   		 %>
      </tr>
      <tr>
        <td width="85" height="28" align="left" valign="top" class="email">评论标题：</td>
        <td colspan="5" align="left">
        	<select name="select">
        		<option value="书的价值">书的价值</option>
        		<option value="书的内容">书的内容</option>
        		<option value="书的外观">书的外观</option>
        	</select>
        </td>
        </tr>
      <tr>
        <td width="85" height="25" align="left" valign="top" class="dengji">评价等级：</td>
        <td width="116" height="25" align="left">
        <input name="radiobutton" type="radio" value="1" checked="checked" />
        <img src="img/good.jpg" alt="good2" width="14" height="15" /><img src="img/good2.jpg" alt="goodh" width="14" height="15" /><img src="img/good2.jpg" alt="goodh_@" width="14" height="15" /><img src="img/good2.jpg" alt="good_3" width="14" height="15" /><img src="img/good2.jpg" alt="gooed_4" width="14" height="15" /></td>
        
        <td width="111" align="left">
        <input type="radio" name="radiobutton" value="2" />
        <img src="img/good.jpg" alt="g1" width="14" height="15" /><img src="img/good.jpg" alt="g2" width="14" height="15" /><img src="img/good2.jpg" alt="g3" width="14" height="15" /><img src="img/good2.jpg" alt="g4" width="14" height="15" /><img src="img/good2.jpg" alt="g5" width="14" height="15" /></td>
        
        <td width="111" align="left"><label>
        <input type="radio" name="radiobutton" value="3" />
        <img src="img/good.jpg" alt="g_1" width="14" height="15" /><img src="img/good.jpg" alt="g_2" width="14" height="15" /><img src="img/good.jpg" alt="g_3" width="14" height="15" /><img src="img/good2.jpg" alt="g_4" width="14" height="15" /><img src="img/good2.jpg" alt="g_5" width="14" height="15" /></label></td>
        
        <td width="111" align="left">
        <input type="radio" name="radiobutton" value="4" />
        <img src="img/good.jpg" alt="g_21" width="14" height="15" /><img src="img/good.jpg" alt="g_22" width="14" height="15" /><img src="img/good.jpg" alt="g_23" width="14" height="15" /><img src="img/good.jpg" alt="g_24" width="14" height="15" /><img src="img/good2.jpg" alt="g_25" width="14" height="15" /></td>
        
        <td width="197" align="left">
        <input type="radio" name="radiobutton" value="5" />
        <img src="img/good.jpg" alt="g_31" width="14" height="15" /><img src="img/good.jpg" alt="g_32" width="14" height="15" /><img src="img/good.jpg" alt="g_33" width="14" height="15" /><img src="img/good.jpg" alt="g_34" width="14" height="15" /><img src="img/good.jpg" alt="g_35" width="14" height="15" /></td>
      </tr>
      <tr>
        <td width="85" height="66" align="left" valign="top" class="dengji">谈论内容：</td>
        <td colspan="5" align="left" valign="top">
        <textarea class="ckeditor" name="content" id="textarea" cols="67" rows="1"></textarea>
        </td>
        </tr>
      <tr>
        <td height="37" align="left" valign="top" class="email">验证码：</td>
        <td colspan="5" align="left" valign="top">
        <input name="random" id="random" type="text" class="ytxt" onblur="yzValidate()"/>
          <img src="Random.jsp" alt="yanzhengma " width="60px" height="20" onclick="javascript:this.src='Random.jsp?tm='+Math.random()" style="cursor:pointer" />
          <%
          	if(user == null) {
          		%>
          		<input name="Submit" type="button" class="btn" value="提交评论" /></td>
          		<%
          	} else {
          		%>
          		<input name="Submit" type="submit" class="btn" value="提交评论" /></td>
          		<%
          	}
          %>
        </tr>
    </table>
    </form>
    </td>
  </tr>
</table>

</body>
</html>
