<%@ page language="java" import="java.util.*,com.shxt.model.*,com.shxt.dao.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
AlertDAO cdao = new AlertDAO();
AlertBean alertBean = (AlertBean)request.getAttribute("alertinfo");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type = "text/css">
		#alert{
			border:1px solid #C5E4FF;
		}
	
	</style>
  </head>
  
  <body>
  	
  	
	    <table width="960" border="0" align="center">
	  		<tr align="center">
			    <td colspan="2">
			    	<jsp:include page="top.jsp"></jsp:include>
			    </td>
	  		</tr>
	  		<tr valign="top">
			    <td valign="top">
			    	<jsp:include page="left1.jsp"></jsp:include>
			    </td>
			    
			    
	    		<td width="750" align="center" valign="top">
	    			<div id = "alert">
		    			<table  width = " 750" border = "2" height="640"  bordercolor=#FCF8F7>
				    		<tr>
				    			<td valign="bottom"   align = "center" height = "50"  >
				    				<font size="5px"><%=alertBean.getConentTitle() %></font>
				    				
				    			</td>
		    				</tr>
		    				<tr>
		    					<td height="30" align = "center"><%=alertBean.getContentAuthor() %>/<%=alertBean.getCreateDate() %></td>
		    				</tr>
		    		<tr >
		    			<td align = "left" height ="40">
		    				<font size = "3px">
		    					<%=alertBean.getConentTitle() %>
		    				</font>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td align = "center" height="500"  valign="top">
		    				
		    			<br>
		    			<%=alertBean.getMainContent() %></td>
		    			
		    		</tr>
		    	</table>
	    	</div>
   	 	 </td>
	  </tr>
	  <tr align="center">
	    <td colspan="2">
	    	<jsp:include page="footer.jsp"></jsp:include>
	    </td>
	  </tr>
	</table>
	
	
  </body>
</html>
