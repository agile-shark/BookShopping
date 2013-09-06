<%@ page language="java" import="java.util.*,com.shxt.dao.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//将各种情况下的订单个数按照上面的给定的顺序加入到list中
ArrayList<String> listValue = (ArrayList<String>)request.getAttribute("bookName");
ArrayList<String> listNum = (ArrayList<String>)request.getAttribute("bookNum");

String ImageType =(String)request.getAttribute("Imagetype");
String group = "Column3D";
if(ImageType.equals("2")){
	group = "Pie3D";
}else if(ImageType.equals("3")){
	group = "Line";
}else if(ImageType.equals("4")){
	group = "Pyramid";
}else if(ImageType.equals("5")){
	group = "Bar2D";
}

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addyouhuibook.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		.ziti{
			font-size: 13px;
		}
	</style>
	<script language="JavaScript" src="Includes/js/FusionCharts.js"></script>
	
	<script type="text/javascript">
		function jump(){
			var type = document.getElementById("selectImage").value;
			var myform=document.getElementById("ImageType");
			if(type == 1){
				myform.action="OrderFormPaiHangStats?type=1";
			}else if(type == 2){
				myform.action="OrderFormPaiHangStats?type=2";
			}else if(type == 3){
				myform.action="OrderFormPaiHangStats?type=3";
			}else if(type == 4){
				myform.action="OrderFormPaiHangStats?type=4";
			}else if(type == 5){
				myform.action="OrderFormPaiHangStats?type=5";
			}
			myform.method="post";
			myform.submit();
		}
	</script>
		
  </head>
  
  <body>
    <table width="1120" border="10" cellspacing="0" cellpadding="0" bordercolor="#DDEEF2">
  <tr>
    <td height="40px" bgcolor="#F4FAFB"> <b><font size="+1">酷星书城 管理中心</font> ——<font color="#9CACAF" size="+1">统计订单状态个数</font></b></td>
  </tr>
  <tr class="ziti">
    <td bgcolor="#F4FAFB" height="40px" align="center">
    <form id="ImageType">
     <select name="selectImage" id="selectImage" onchange="jump()">
		    <option value=0 >--图形类型--</option>
            <option value=1 >柱状图</option>
			<option value=2 >饼状图</option>
			<option value=3 >线状图</option>
			<option value=4 >塔状图</option>
			<option value=5 >斜状图</option>
		   </select>
     </form>
    </td>
  </tr>
  <tr>
  	<td>
    <div>
  		<center>
  			<%
  			StringBuffer strBuf = new StringBuffer();
  			strBuf.append("<chart caption='销售排行概况' showNames='1' decimalPrecision='0'>");
  			%>
  			<%
  			for(int i = 0; i < listValue.size(); i++){
  				strBuf.append("<set label='"+listValue.get(i)+"' value='" + listNum.get(i) + "' />");
  			}
  			strBuf.append("</chart>");	
  			String graphType = path + "/Includes/swf/" + group + ".swf";
  	%>
    	<jsp:include page="Includes/jsp/FusionChartsHTMLRenderer.jsp" flush="true">
					    	<jsp:param name="chartSWF" value="<%=graphType %>"/>
							<jsp:param name="strURL" value="" /> 
							<jsp:param name="strXML" value="<%=strBuf.toString() %>" /> 
							<jsp:param name="chartId" value="accounts_code" /> 
							<jsp:param name="chartWidth" value="820" /> 
							<jsp:param name="chartHeight" value="287" /> 
							<jsp:param name="debugMode" value="false" /> 	 
		</jsp:include>
	</center>
</div>
</td>
  </tr>
</table>
  </body>
</html>
