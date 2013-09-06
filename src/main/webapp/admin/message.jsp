<%@ page language="java" import="java.util.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	
	ArrayList<Message> al = (ArrayList<Message>)request.getAttribute("message");
	String s_pageNow = request.getAttribute("pageNow").toString();
	String s_pageCount = request.getAttribute("pageCount").toString();
	
	int pageNow = Integer.parseInt(s_pageNow);
	int pageCount = Integer.parseInt(s_pageCount);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>评论管理</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/css/styles.css">

		<script type="text/javascript">
			function gotoNowPage(nowPage){
				var path="<%=request.getContextPath()%>/GetEvaList?pageNow=" + nowPage;
				window.location = path;
			}
		</script>
	</head>

	<body>
		<table>
			<caption><h1>留言列表</h1></caption>
			<tr>
				<th>留言编号</th>
				<th>用户编号</th>
				<th>留言标题</th>
				<th>留言内容</th>
				<th>留言类型</th>
				<th>留言时间</th>
				<th>管理员回复</th>
				<th>操作</th>
		    </tr>

			<%
				for(Message message : al) {
			%>
			<tr onmouseover="this.bgColor='#E6EB00'; this.bgColor='white'">
				<th><%=message.getMessage_id() %></th>
				<th><%=message.getUser_id()  %></th>
				<th><%=message.getMessage_title() %></th>
				<%
					String messageContent = message.getMessage_context();
					if(messageContent.length()>26){
						messageContent = messageContent.substring(0,21);
						messageContent += ".....";
					}
				%>
				<th><%=messageContent %></th>
				<th><%=message.getMessage_type() %></th>
				<th><%=message.getMessage_date() %></th>
				<%
					String answer = message.getMessage_answer();
					if(answer != null){
						if(answer.length()>26){
							answer = answer.substring(0,21);
							answer += ".....";
						}
					} else {
						answer = "【无回复】";
					}
				%>
				<th><%=answer %></th>
				<%
					if(al.size() == 1){
				%>
				<th>
				<%
					if(answer.equals("【无回复】")) {
						%>
						<a href="admin/answerMessage.jsp?message_id=<%=message.getMessage_id() %>">回 复</a> &nbsp;
						<%
					}
				%>
				<a href="<%=request.getContextPath()%>/GetMessageList?id=<%=message.getMessage_id() %>&pageNow=<%=pageNow - 1%>" onclick="return window.confirm('是否确定删除？')">删 除</a>
				</th>
				<%
				}else{
				%>
				<th>
				<%
					if(answer.equals("【无回复】")) {
						%>
						<a href="admin/answerMessage.jsp?message_id=<%=message.getMessage_id() %>">回 复</a> &nbsp;
						<%
					}
				%>
				<a href="<%=request.getContextPath()%>/GetMessageList?id=<%=message.getMessage_id() %>&pageNow=<%=pageNow %>" onclick="return window.confirm('是否确定删除？')">删 除</a></th>
				<%
				} %>
			</tr>
			<%}%>
			<tr>
				<td colspan="7">
					共<%=pageCount %>页 第<%=pageNow %>页
    				 <%if(pageCount != 1){%>
    				 <a href="<%=request.getContextPath()%>/GetMessageList">首页</a>
    				 <%if(pageNow == 1){%>
    				<a href="<%=request.getContextPath()%>/GetMessageList?pageNow=<%=(pageNow + 1)%>">下一页</a>
    				<%}else if(pageNow == pageCount){%>
    				<a href="<%=request.getContextPath()%>/GetMessageList?<%=(pageNow - 1)%>">上一页</a>
    				<%}else{%>
    				<a href="<%=request.getContextPath()%>/GetMessageList?<%=(pageNow - 1)%>">上一页</a>
    				<a href="<%=request.getContextPath()%>/GetMessageList?pageNow=<%=(pageNow + 1)%>">下一页</a>
    				<%}%>
    				<a href="<%=request.getContextPath()%>/GetMessageList?pageNow=<%=pageCount %>">最后一页</a>
    				<select id="selectNowPage" onchange="gotoNowPage(this.value)">
    				<%
    				for(int i = 1; i <= pageCount; i++){
    				%>
    					<option value="<%=i %>" <% 
    						if(i == pageNow){%>
    							selected
    						<%}
    					%> >第<%=i %>页</option>
    				<%}
    				 %>
    				</select>
    				<%
    				}
    				 %>
				</td>
			
				<td>	<%
				if(pageCount != 1){
				%>
				<a href="<%=request.getContextPath()%>/GetMessageList?type=<%=pageNow %>&pageNow=<%=pageNow %>" onclick="return window.confirm('是否确定删除？')">删除本页</a>
				<%
				}
				 %></td>
			</tr>
		</table>
	</body>
</html>
