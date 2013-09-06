<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户头像选择</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="face/face.css">
	<script type="text/javascript">
		function _opener(src) {
			//父窗口的值得到，可以改变父窗口的图片
			var faceimg = opener.document.getElementById("faceimg");
			faceimg.src = src;
			var face = opener.document.getElementById("face");
			face.value = src;
		}
	</script>
  </head>
  
  <body>
    <div id="face">
	<h3>选择头像</h3>
		<dl>
			<%
				for(int i = 1; i <= 9; i++ ){
			%>
			<dd><img src="face/m0<%=i %>.gif" alt="face/m0<%=i %>.gif" title="头像<%=i %>" onclick="_opener(this.alt)"/></dd>
			<%}%>
			
		</dl>
		<dl>
			<%
				for(int i = 10; i <= 66; i++ ){
			%>
			<dd><img src="face/m<%=i %>.gif" alt="face/m<%=i %>.gif" title="头像<%=i %>" onclick="_opener(this.alt)"/></dd>
			<%} %>
			
		</dl>
	</div>
    	
  </body>
</html>
