<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>网上书城首页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body background="images/bg.bmp">
<table width="962" border="0" align="center" cellpadding="2" cellspacing="2">
  <tr>
    <td colspan="3" align="center">
    	<jsp:include page="top.jsp"></jsp:include>
    </td>
  </tr>
  <tr>
    <td rowspan="2" valign="top">
    	<jsp:include page="left.jsp"></jsp:include>
    </td>
    <td width="500" height="220" align="center">
    
    	<script type=text/javascript>
			var swf_width=540;/*修改flash宽，图片广告需要适应此宽度*/
			var swf_height=220;/*修改flash高，图片广告需要适应此高度*/
			var src="";
			var files=src+'images/flash1.jpg'+'|'+src+'images/flash2.jpg'+'|'+src+'images/flash3.jpg';/*替换banner.gif等更换显示图片*/
			var links='#|#|#';/*修改按钮链接,注意链接中的&要用%26替换*/
			var texts='';
			
			document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'">');
			document.write('<param name="movie" value="flash/bcastr3.swf"><param name="quality" value="high">');
			document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
			document.write('<param name="FlashVars" value="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'">');
			document.write('<embed src="flash/bcastr3.swf" wmode="opaque" FlashVars="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'& menu="false" quality="high" width="'+ swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); document.write('</object>'); 

		</script>  
    
    </td>
    <td width="256">
    	<jsp:include page="right1.jsp"></jsp:include>
    </td>
  </tr>
  <tr>
    <td colspan="2">
    	<jsp:include page="right.jsp"></jsp:include>
    </td>
  </tr>
  <tr>
    <td colspan="3" align="center">
    	<jsp:include page="footer.jsp"></jsp:include>
    </td>
  </tr>
</table>
</body>
</html>
