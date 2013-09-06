<%@ page language="java" import="java.util.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	
	ArrayList<Evaluation> al = (ArrayList<Evaluation>)request.getAttribute("eval");
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
			<caption><h1>评论列表</h1></caption>
			<tr>
				<th>评论编号</th>
				<th>评论书籍</th>
				<th>评论者</th>
				<th>评论主题</th>
				<th>评论内容</th>
				<th>评论时间</th>
				<th>评论等级</th>
				<th>操作</th>
		    </tr>

			<%
				for(Evaluation eva : al) {
			%>
			<tr onmouseover="this.bgColor='#E6EB00'; this.bgColor='white'">
				<th><%=eva.getEvaid()%></th>
				<th><%=eva.getBookid()%></th>
				<th><%=eva.getUsername()%></th>
				<th><%=eva.getEvatitle()%></th>
				<%
					String evacontent = eva.getEvacontent();
					if(evacontent.length()>46){
						evacontent = evacontent.substring(0,40);
						evacontent += ".....";
					}
				%>
				<th><%=evacontent%></th>
				<th><%=eva.getEvadate()%></th>
				<th><%=eva.getEvarank()%></th>
				<%if(al.size() == 1){
				%>
				<th><a href="<%=request.getContextPath()%>/GetEvaList?id=<%= eva.getEvaid()%>&pageNow=<%=pageNow - 1%>" onclick="return window.confirm('是否确定删除？')">删除</a></th>
				<%
				}else{
				%>
				<th><a href="<%=request.getContextPath()%>/GetEvaList?id=<%= eva.getEvaid()%>&pageNow=<%=pageNow %>" onclick="return window.confirm('是否确定删除？')">删除</a></th>
				<%
				} %>
			</tr>
			<%}%>
			<tr>
				<td colspan="7">
					共<%=pageCount %>页 第<%=pageNow %>页
    				 <%if(pageCount != 1){%>
    				 <a href="<%=request.getContextPath()%>/GetEvaList">首页</a>
    				 <%if(pageNow == 1){%>
    				<a href="<%=request.getContextPath()%>/GetEvaList?pageNow=<%=(pageNow + 1)%>">下一页</a>
    				<%}else if(pageNow == pageCount){%>
    				<a href="<%=request.getContextPath()%>/GetEvaList?<%=(pageNow - 1)%>">上一页</a>
    				<%}else{%>
    				<a href="<%=request.getContextPath()%>/GetEvaList?<%=(pageNow - 1)%>">上一页</a>
    				<a href="<%=request.getContextPath()%>/GetEvaList?pageNow=<%=(pageNow + 1)%>">下一页</a>
    				<%}%>
    				<a href="<%=request.getContextPath()%>/GetEvaList?pageNow=<%=pageCount %>">最后一页</a>
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
				<a href="<%=request.getContextPath()%>/GetEvaList?type=<%=pageNow %>&pageNow=<%=pageNow %>" onclick="return window.confirm('是否确定删除？')">删除本页</a>
				<%
				}
				 %></td>
			</tr>
		</table>
	</body>
</html>
