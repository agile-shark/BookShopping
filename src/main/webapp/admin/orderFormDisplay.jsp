<%@ page language="java" import="java.util.*,com.shxt.dao.*,com.shxt.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String[] month = {"一月份","二月份","三月份","四月份","五月份","六月份","七月份","八月份","九月份","十月份","十一月份","十二月份"};
//String[] month = {"一月份","二月份","三月份","四月份","五月份"};
ArrayList<String> listValue = (ArrayList<String>)request.getAttribute("orderPrice");
System.out.println(listValue.get(0));
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

//得到选择的年份
String haveSelect = request.getParameter("havaSelect");
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
	<%
		if(haveSelect.equals("2011")) {
			%>
			<script type="text/javascript">
				function jump(){
					var type = document.getElementById("selectImage").value;
					var myform=document.getElementById("ImageType");
					if(type == 1){
						myform.action="OrderFormStat?type=1&select=2011";
					}else if(type == 2){
						myform.action="OrderFormStat?type=2&select=2011";
					}else if(type == 3){
						myform.action="OrderFormStat?type=3&select=2011";
					}else if(type == 4){
						myform.action="OrderFormStat?type=4&select=2011";
					}else if(type == 5){
						myform.action="OrderFormStat?type=5&select=2011";
					}
					myform.method="post";
					myform.submit();
				}
			</script>
			<%
		} else {
			%>
			<script type="text/javascript">
				function jump(){
					var type = document.getElementById("selectImage").value;
					var myform=document.getElementById("ImageType");
					if(type == 1){
						myform.action="OrderFormStat?type=1&select=2012";
					}else if(type == 2){
						myform.action="OrderFormStat?type=2&select=2012";
					}else if(type == 3){
						myform.action="OrderFormStat?type=3&select=2012";
					}else if(type == 4){
						myform.action="OrderFormStat?type=4&select=2012";
					}else if(type == 5){
						myform.action="OrderFormStat?type=5&select=2012";
					}
					myform.method="post";
					myform.submit();
				}
			</script>
			<%
		}
	%>
	<script type="text/javascript">
			
		function otherJump(){
			var select = document.getElementById("select").value;
			var myform=document.getElementById("year");
			if(select == "2011"){
				myform.action="OrderFormStat?select=2011";
			}else if(select == "2012"){
				myform.action="OrderFormStat?select=2012";
			}
			myform.method="post";
			myform.submit();
		}
	</script>
	
	
	
  </head>
  
  <body>
    <table width="1120" border="10" cellspacing="0" cellpadding="0" bordercolor="#DDEEF2">
  <tr>
    <td height="40px" bgcolor="#F4FAFB"> <b><font size="+1">酷星书城 管理中心</font> ——<font color="#9CACAF" size="+1">统计图书销售量</font></b></td>
  </tr>
  <tr class="ziti">
    <td bgcolor="#F4FAFB" height="40px"> &nbsp;
    <form id="year">
    <img src="admin/img/search.png" width="25" height="21" />
    	&nbsp;订单年份：
        <select name="select" id="select" onchange="otherJump()">
        	<%
        		if(haveSelect.equals("2011")) {
        			%>
        			<option value="2011">2011</option>
        			<option value="2012">2012</option>
        			<%
        		} else {
        			%>
        			<option value="2012">2012</option>
        			<option value="2011">2011</option>
        			<%
        		}
        	%>
       		
    	</select>
    </form>
    <form id="ImageType">
     &nbsp;&nbsp;&nbsp;&nbsp;<font color="#9CACAF">搜索要统计图书销售量的年份</font>
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
  			strBuf.append("<chart caption='订单季度销售概况' showNames='1' decimalPrecision='0'>");
  			%>
  			<%
  			for(int i = 0; i < listValue.size(); i++){
  				strBuf.append("<set label='"+month[i]+"' value='" + listValue.get(i) + "' />");
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
