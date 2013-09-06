<%@ page language="java" import="java.util.*,com.shxt.dao.*,com.shxt.model.AdminBean" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	
	ArrayList<AdminBean> al = (ArrayList<AdminBean>)request.getAttribute("adminbean");
	String s_pageNow = request.getAttribute("pageNow").toString();
	String s_pageCount = request.getAttribute("pageCount").toString();
	
	int pageNow = Integer.parseInt(s_pageNow);
	int pageCount = Integer.parseInt(s_pageCount);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		
		<base href="<%=basePath%>">
		<title>管理员管理</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/css/styles.css">
		<script type="text/javascript">
			function gotoNowPage(nowPage){
				var path="<%=request.getContextPath()%>/GetAdminList?pageNow=" + nowPage;
				window.location = path;
			}
		</script>
	</head>

	<body>
		<table>
			<caption><h1>管理员基本信息列表</h1></caption>
			<tr>
				<th>管理员编号</th>
				<th>用户名</th>
				<th>真实姓名</th>
				<th>注册时间</th>
			    <th>电子邮件</th>
				<th>联系电话</th>
				<th>上次登录地</th>
				<th>QQ号</th>				
				<th>操作</th>				
		    </tr>

			<%
				for (AdminBean ab : al) {
			%>
			<tr onmouseover="this.bgColor='#E6EB00'; this.bgColor='white'">
				<th><%= ab.getAdminid()%></th>
				<th><%= ab.getAdminname()%></th>
				<th><%= ab.getAdmintruename()%></th>
				<th><%= ab.getAdminregisterdate()%></th>
				<th><%= ab.getAdminemail()%></th>
				<th><%= ab.getAdminphone()%></th>
				<th><%= ab.getAdminlastip()%></th>
				<th><%= ab.getAdminqq()%></th>	
				<%if(al.size() == 1){
				%>
				<th><a href="<%=request.getContextPath()%>/GetAdminList?id=<%= ab.getAdminid()%>&pageNow=<%=pageNow - 1%>" onclick="return window.confirm('是否确定删除？')">删除</a></th>
				<%
				}else{
				%>
				<th><a href="<%=request.getContextPath()%>/GetAdminList?id=<%= ab.getAdminid()%>&pageNow=<%=pageNow %>" onclick="return window.confirm('是否确定删除？')">删除</a></th>
				<%
				} %>
			</tr>
			<%}%>

			<tr>
				<td colspan="8">
					共<%=pageCount %>页 第<%=pageNow %>页
    				 <%if(pageCount != 1){%>
    				 <a href="<%=request.getContextPath()%>/GetAdminList">首页</a>
    				 <%if(pageNow == 1){%>
    				<a href="<%=request.getContextPath()%>/GetAdminList?pageNow=<%=(pageNow + 1)%>">下一页</a>
    				<%}else if(pageNow == pageCount){%>
    				<a href="<%=request.getContextPath()%>/GetAdminList?<%=(pageNow - 1)%>">上一页</a>
    				<%}else{%>
    				<a href="<%=request.getContextPath()%>/GetAdminList?<%=(pageNow - 1)%>">上一页</a>
    				<a href="<%=request.getContextPath()%>/GetAdminList?pageNow=<%=(pageNow + 1)%>">下一页</a>
    				<%}%>
    				<a href="<%=request.getContextPath()%>/GetAdminList?pageNow=<%=pageCount %>">最后一页</a>
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
				<a href="<%=request.getContextPath()%>/GetAdminList?type=<%=pageNow%>&pageNow=<%=pageNow%>" onclick="return window.confirm('是否确定删除？')">删除本页</a>
				<%
				}
				 %></td>
			</tr>
		</table>
	</body>
</html>
