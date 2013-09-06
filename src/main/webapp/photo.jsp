<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>本地上传图片</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		function goBack() {
			window.open("GetProvince","_self");
		}
	</script>
  </head>
  
  <body>
   	<table width="960" border="0" align="center">
  <tr>
    <td align="center">
    	<jsp:include page="top.jsp"></jsp:include>
    </td>
  </tr>
  <tr>
    <td align="center">
    <table width="960" border="1" cellpadding="0" cellspacing="0" bordercolor="#56A5EE">
      <tr>
        <td align="center"><img src="img/uploadimg.png" width="960" height="33" /></td>
      </tr>
      <tr>
        <td align="center"><p>&nbsp;</p>
         <form action="Upload" method="post" enctype="multipart/form-data" >
          <p><input type="file" name="photo"/></p>
          <input type="submit" value="上  传"/>&nbsp;&nbsp;&nbsp;<input type="button" value="返  回" onclick="goBack();">
          <p>&nbsp;</p>
         </form>
        </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center">&nbsp; 
    	<jsp:include page="footer.jsp"></jsp:include>
    </td>
  </tr>
</table>
  </body>
</html>
