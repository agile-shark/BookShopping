<%@ page language="java" import="java.util.*,com.shxt.model.*,com.shxt.dao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//通过session获得用户信息
UserInfo user = (UserInfo)request.getSession().getAttribute("user");
//得到个人的收藏夹列表 
FavoriteDAO fadao = new FavoriteDAO();
ArrayList<Favorite> al = fadao.getFavoriteByUserId(user.getUserid()+"");
//得到个人收藏夹的数量 
System.out.println("jsp页面中得到的userid为："+user.getUserid());
int num = fadao.getNumFavoriteByUserId(user.getUserid()+"");
BookInfoDAO book = new BookInfoDAO();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link  href="css/collection.css" type="text/css" rel="Stylesheet"/>
    <style type="text/css">
    	.ziti{
    		font-size: 13px;
    	}
    </style>
</head>
<body>
<div id="bigDiv">
   <div class="Div1"><b><span>我的收藏</span></b></div>
      <table width="724px" border="1" cellpadding="0" cellspacing="0" align="center" class="ziti" bordercolor="#DDDDDD">
        <tr align="center">
            <th width="35%" bgcolor="#ffffff" height="30px">商品名称</th>
            <th width="30%" bgcolor="#ffffff">价格</th>
            <th width="35%" bgcolor="#ffffff">操作</th>
        </tr>
        
        <%
        	for(int i = 0; i < al.size(); i++) {
        		Favorite fa = al.get(i);
        		String bookname = book.getBookInfo(fa.getBookid()).getBook_name();
        		%>
        		<tr align="center">
		        	<td><a href="#"><%=bookname %></a></td>
		        	<td height="25px">本店售价：￥<%=book.getBookInfo(fa.getBookid()).getBook_user_price() %>元</td>
		        	<td>
		        	<a href="collection.jsp" onclick="window.open('Gouwuche?type=showCar&id=<%=fa.getBookid() %>','购物车','scrollbars=1,toolbar=no,location=0,resizable=0,directories=0,status=0');"">加入购物车</a>
		        	<a href="FavoriteCl?type=delete&bookid=<%=fa.getBookid() %>" onclick="return window.confirm('您确认要删除该收藏吗？')">删 除</a>
		        	</td>
		        </tr>
        		<%
        	}
        %>
        
        
        <tr>
        	<td colspan="3" align="right" height="25px">
        	总计 <b><%=num %></b> 个记录 &nbsp;&nbsp;&nbsp;&nbsp;
        	</td>
        </tr>
      </table>
  
   <div id="Div3"></div>
   <div class="Div1"><b><span>我的推荐</span></b></div>
   <div id="Div4">
     <form name="theForm" method="post" action="">
        <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
         <tr>
          <td align="right" bgcolor="#ffffff">是否显示商品图片：</td>
          <td bgcolor="#ffffff">
            <select name="need_image" id="need_image">
              <option value="true" selected="selected">显示</option>
              <option value="false">不显示</option>
            </select>
          </td>
        </tr>
        <tr>
          <td align="right" bgcolor="#ffffff">显示商品数量：</td>
          <td bgcolor="#ffffff"><input name="goods_num" type="text" id="goods_num" value="6"/></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#ffffff">选择商品排列方式：</td>
          <td bgcolor="#ffffff"><select name="arrange" id="arrange">
            <option value="h" selected="selected">横排</option>
            <option value="v">竖排</option>
          </select></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#ffffff">排列显示条目数：</td>
          <td bgcolor="#ffffff"><input name="rows_num" type="text" id="rows_num" value="1"/></td>
        </tr>
        <tr>
          <td align="right" bgcolor="#ffffff">选择编码：</td>
          <td bgcolor="#ffffff">
             <select name="charset" id="charset">
               <option value="UTF8">国际化编码（utf8）</option>
               <option value="GB2312">简体中文</option>
               <option value="BIG5">繁体中文</option>      
             </select></td>
        </tr>
        <tr>
          <td colspan="2" align="center" bgcolor="#ffffff">
             <input type="button" name="gen_code" value="生成代码" class="bnt_blue" />
	      </td>
      </tr>
        <tr>
          <td colspan="2" align="center" bgcolor="#ffffff">
             <textarea name="code" cols="80" rows="5" id="code" class="B_blue"></textarea>
          </td>
      </tr>
     </table>
   </form>
  </div>
</div>
</body>
</html>

