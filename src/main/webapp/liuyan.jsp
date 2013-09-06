<%@ page language="java" import="java.util.*,com.shxt.model.*,com.shxt.dao.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//获得登录后的user信息
UserInfo user = (UserInfo)request.getSession().getAttribute("user");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'message.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link  href="css/liuyan.css" type="text/css" rel="Stylesheet"/>
	<style type="text/css">
		.ziti{
			color: #404040;
		}
	</style>
</head>
  <body>
		  <table width="960" border="0" align="center">
		  <tr>
		    <td colspan="2">
		    	<jsp:include page="top.jsp"></jsp:include>
		    </td>
		  </tr>
		  <tr>
		    <td>
		    	<jsp:include page="left1.jsp"></jsp:include>
		    </td>
				<td width="321" valign="top">
				
				<!-- 如果没有登录的话是不可以进行留言的 -->
				<%
					if(user==null){
						%>
						 <div class="Div1"><b><span>留言板</span></b></div>
						   <div id="Div2">
						   	<br/><br/><br/><br/>
							<font color="red" size="4" style="font-weight: bold">您好，必须进行登录之后才能看到您以前的留言和可以进行新的留言。</font>
							<br/><br/><br/>
							<font size="3">
							<p align="center"><a href="login.jsp?type=top">跳转到登录界面</a>或是<a href="GetProvince">进行新用户的注册</a></p>
							</font>
						   </div>
						<%
					} else {
						MessageDAO mdao = new MessageDAO();
						ArrayList<Message> messages = mdao.getMessageByUserId(user.getUserid());
						%>
						<div id="bigDiv">
						<div class="Div1"><b><span>留言板</span></b></div>
						<%
						if(messages!=null){
							for(int i = 0; i < messages.size(); i++){
							Message message = messages.get(i);
							%>
							<div id="Div2">
						     <p>
						      <b>[<%=message.getMessage_type() %>]</b> <%=user.getUsername() %>:进行了<%=message.getMessage_type() %> （<%=message.getMessage_date() %> 19:20:36）<br />
						      <b>[主题]</b> <%=message.getMessage_title() %><br />
						      <b>[内容]</b> <%=message.getMessage_context() %><br />
						      <%
						      	if(message.getMessage_answer()!=null){
						      		%>
						      		 <b>管理员回复：</b><br />
						    		 <%=message.getMessage_answer() %>
						      		<%
						      	}
						      %>
						     </p><img  src="image/dongdei.gif"/>
						   </div>
						   <%} %>
						   <div id="Div3"><span>总计<strong><%=mdao.getNumMessageByUserId(user.getUserid()) %></strong>个记录</span></div>
							<%
						}
						%>
						
				   		<div class="Div1"><b><span>我要留言</span></b></div>
						  <div id="Div4">
						      <form action="MessageCl" method="post"  name="formMsg">
						         <table width="100%" border="0" cellpadding="3" class="ziti">  
						             <tr>
						                <td colspan="2" align="center"></td>
						            </tr>
						            <tr>
						                <td align="right">用户名</td>
						                <td><%=user.getUsername() %>
						                	<input type="hidden" name="userid" value="<%=user.getUserid() %>"/>
						                </td>
						            </tr>
						             <tr>
						               <td align="right">留言类型：</td>
						               <td>
						                    <input name="msg_type" type="radio" value="留言" checked="checked" /> 留言
						                    <input type="radio" name="msg_type" value="投诉" />投诉                        
						                    <input type="radio" name="msg_type" value="询问 " />询问                        
						                    <input type="radio" name="msg_type" value="求购" />求购            
						               </td>
						            </tr>
						            <tr>
						                <td align="right">主题：</td>
						                <td><input name="msg_title" type="text" size="30" maxlength="25"/></td>
						            </tr>
						            
						            <tr>
						                <td align="right" valign="top">留言内容：</td>
						                <td><textarea name="msg_content" cols="50" rows="4" class="B_blue"></textarea></td>
						            </tr>
						            <tr>
						                <td>&nbsp;</td>
						                <td><input type="image" src="image/liuyan.png"/></td>
						            </tr>
						         </table>         
						      </form>
						  </div>
						</div>
						<%
					}
				%>
				</td>
			</tr>
		  <tr>
		  	<td colspan="2">
		  		<jsp:include page="xinshoushanglu.jsp"></jsp:include>
		  		<jsp:include page="footer.jsp"></jsp:include>
		  	</td>
		  </tr>
		</table>
		
</body>
</html>
