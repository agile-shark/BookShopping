<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link  href="css/message.css" type="text/css" rel="Stylesheet"/>
</head>
<body>
<div id="bigDiv">
   <div id="Div1"><b><span>我的留言</span></b></div>
   <div id="Div2">
      <form action="" method="post"  name="formMsg">
         <table width="100%" border="0" cellpadding="3">
            <tr>
               <td align="right">留言类型：</td>
               <td>
                    <input name="msg_type" type="radio" value="0" checked="checked" /> 留言
                    <input type="radio" name="msg_type" value="1" />投诉                        
                    <input type="radio" name="msg_type" value="2" />询问                        
                    <input type="radio" name="msg_type" value="3" />售后                        
                    <input type="radio" name="msg_type" value="4" />求购 
               </td>
            </tr>
            <tr>
                <td align="right">主题：</td>
                <td><input name="msg_title" type="text" size="30" /></td>
            </tr>
            <tr>
                <td align="right" valign="top">留言内容：</td>
                <td><textarea name="msg_content" cols="50" rows="4" class="B_blue"></textarea></td>
            </tr>
            <tr>
                <td align="right">上传文件：</td>
                <td><input type="file" name="message_img"  size="45" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <input type="submit" value="提 交" class="bnt_blue" />
                </td>
             </tr>
             <tr>
                 <td>&nbsp;</td>
                 <td>
                      <font color="red">小提示：</font><br />
                      您可以上传以下格式的文件：<br />gif、jpg、png、word、excel、txt、zip、ppt、pdf                      
                 </td>
             </tr>
         </table>         
      </form>
   </div>
</div>
</body>
</html>
