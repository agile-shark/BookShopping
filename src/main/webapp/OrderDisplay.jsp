<%@ page language="java" import="java.util.*,com.shxt.dao.*,com.shxt.model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<BookInfo> books = (ArrayList<BookInfo>)request.getAttribute("carList");
CarDAO cdao = (CarDAO)request.getSession().getAttribute("mycar");
BookInfoDAO binfo = new BookInfoDAO();
UserInfo userinfo = (UserInfo)request.getSession().getAttribute("user");

//为了在订单处理中将购买到的书的列表添加到数据库总，需要将carlist即books加入到session中
request.getSession().setAttribute("books",books);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单显示</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
	<!--
	body,td,th {
		font-family: 宋体;
		font-size: 12px;
		color: #414141;
	}
	body {
		background-color: #FFFFFF;
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	}
	.tableborder1 {
		border-top-width: 3px;
		border-right-width: 1px;
		border-bottom-width: 1px;
		border-left-width: 1px;
		border-top-style: solid;
		border-right-style: solid;
		border-bottom-style: solid;
		border-left-style: solid;
		border-top-color: #afcde5;
		border-right-color: #d7e3e3;
		border-bottom-color: #d7e3e3;
		border-left-color: #d7e3e3;
	}
	.tdcolor1 {
		background-color: #edf7ff;
		font-family: "宋体";
		font-size: 14px;
		font-weight: bold;
		color: #383d41;
		padding-left: 7px;
		padding-right: 7px;
	}
	.tableborder2 {
		border: 1px solid #dcdcdc;
		font-family: "宋体";
		font-size: 14px;
		font-weight: normal;
		color: #383d41;
	}
	
	.txt1 
	{
		border:1px solid #dcdcdc;
		font-family: "宋体";
		font-size: 14px;
		font-weight: bold;
		color: #383d41;
		padding-left: 5px;
	}
	.txt2 {
		border: 1px solid #dcdcdc;
		font-family: "宋体";
		font-size: 12px;
		font-weight: normal;
		color: #383d41;
		padding-left: 7px;
		padding-right: 7px;
	}
	.input1 {
		height: 50px;
		width: 600px;
	}
	.input2 {
		height: 20px;
		width: 200px;
	}
	.btn1 {
		height: 47px;
		width: 171px;
		border-top-style: none;
		border-right-style: none;
		border-bottom-style: none;
		border-left-style: none;
		background-image: url(images/btn1.jpg);
		background-repeat: no-repeat;
	}
	.txt3 {
		font-family: "宋体";
		font-size: 14px;
		font-weight: bold;
		color: #5b84b2;
	}
	.txt4 {
		font-family: "宋体";
		font-size: 13px;
		color: #FE596A;
	}
	.link1 {
		font-family: "宋体";
		font-size: 12px;
		color: #165485;
		text-decoration: none;
	}
	.footer {
		background-image: url(images/footerbg1.jpg);
		background-repeat: no-repeat;
		background-position: center bottom;
	}
	-->
	</style>
  </head>
  
<body>
  <table width="960" border="0" align="center">
	  <tr align="center">
	    <td>
			<jsp:include page="top.jsp"></jsp:include>
		</td>
	  </tr>
  <tr>
  <td>
  <table width="960px" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td height="164" align="center" valign="top"><table width="960px" border="1" align="center" cellpadding="0" cellspacing="0" class="tableborder1" bordercolor="red">
      <tr>
        <td width="550" height="30" align="left" valign="middle" class="tdcolor1">商品列表</td>
        <td width="600" align="right" valign="middle" class="tdcolor1"><a href="Gouwuche?type=showMyCar">修改</a></td>
      </tr>
      <tr>
        <td height="121" colspan="2" align="center" valign="middle"><table width="960" border="0" cellpadding="0" cellspacing="0" class="tableborder2">
            <tr>
              <td width="160" height="35" align="center" valign="middle" class="txt1">商品名称</td>
              <td width="160" align="center" valign="middle" class="txt1">商品类型</td>
              <td width="160" align="center" valign="middle" class="txt1">市场价</td>
              <td width="160" align="center" valign="middle" class="txt1">本店价</td>
              <td width="160" align="center" valign="middle" class="txt1">购买数量</td>
              <td width="160" align="center" valign="middle" class="txt1">小计</td>
            </tr>
            <%
            	for(int i=0;i<books.size();i++){
            		BookInfo bi = books.get(i);
            		%>
            		 <tr>
		              <td height="35" align="left" valign="middle" class="txt2">
		              <a href="Gouwuche?type=showMyCar"><%=bi.getBook_name() %></a></td>
		              <td align="left" valign="middle" class="txt2"><%=bi.getBook_type() %></td>
		              <td align="left" valign="middle" class="txt2">￥<%=bi.getBook_market_price() %>元</td>
		              <td align="left" valign="middle" class="txt2">￥<%=bi.getBook_user_price() %>元</td>
		              <td align="left" valign="middle" class="txt2"><%=cdao.getNumById(bi.getBook_id()+"") %></td>
		              <td align="left" valign="middle" class="txt2">￥<%=cdao.getOnePrice(bi.getBook_id()+"") %>元</td>
		            </tr>
            		<%
                 }
            %>
           
            <tr>
              <td height="35" colspan="6" align="left" valign="middle" class="txt2">购物金额小计 ￥<%=cdao.getUserAllPrice() %>元，比市场价 ￥<%=cdao.getMarketAllPrice() %>元节省了<%=cdao.getSavePrice() %>元（17%） </td>
            </tr>
        </table></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td height="195" align="center" valign="top">
    <table width="960" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder1">
      <tr>
        <td width="550" height="30" align="left" valign="middle" class="tdcolor1">收货人信息</td>
        <td width="600" align="right" valign="middle" class="tdcolor1"><a href="ChangeUserInfo?type=change">修改</a></td>
      </tr>
      <tr>
        <td height="155" colspan="2" align="center" valign="middle"><table width="960" border="0" cellpadding="0" cellspacing="0" class="tableborder2">

            <tr>
              <td width="240" height="34" align="left" valign="middle" class="txt2">收货人姓名：</td>
              <td width="240" align="left" valign="middle" class="txt2"><%=userinfo.getUsername() %></td>
              <td width="240" align="left" valign="middle" class="txt2">电子邮件地址：</td>
              <td width="240" align="left" valign="middle" class="txt2"><%=userinfo.getUseremail() %></td>
              </tr>
            <tr>
              <td height="34" align="left" valign="middle" class="txt2">详细地址：</td>
              <td align="left" valign="middle" class="txt2"><%=userinfo.getSendaddress() %></td>
              <td align="left" valign="middle" class="txt2">邮政编码：</td>
              <td align="left" valign="middle" class="txt2"><%=userinfo.getUserpostcode() %></td>
              </tr>
            <tr>
              <td height="34" align="left" valign="middle" class="txt2">用户注册时间：</td>
              <td align="left" valign="middle" class="txt2"><%=userinfo.getRegistdate() %></td>
              <td align="left" valign="middle" class="txt2">手机：</td>
              <td align="left" valign="middle" class="txt2"><%=userinfo.getUserphone() %></td>
              </tr>
            <tr>
              <td height="34" align="left" valign="middle" class="txt2">标志建筑：</td>
              <td align="left" valign="middle" class="txt2"><%=userinfo.getUserhothouse() %></td>
              <td align="left" valign="middle" class="txt2">最佳送货时间：</td>
              <td align="left" valign="middle" class="txt2"><%=userinfo.getBestsendgoodstime() %></td>
              </tr>

        </table></td>
      </tr>
    </table></td>
  </tr>
  <form action="OrderCl" method="post">
  <tr>
    <td height="280" align="center" valign="top">
    <table width="960" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder1">
      <tr>
        <td height="30" align="left" valign="middle" class="tdcolor1">配送信息</td>
        </tr>
      <tr>
        <td height="236" align="center" valign="middle"><table width="960" border="0" cellpadding="0" cellspacing="0" class="tableborder2">
            <tr>
              <td width="20" height="34" align="left" valign="middle" class="txt2">&nbsp;</td>
              <td width="180" align="center" valign="middle" class="txt1">名称</td>
              <td width="180" align="center" valign="middle" class="txt1">订购描述</td>
              <td width="180" align="center" valign="middle" class="txt1">费用</td>
              <td width="180" align="center" valign="middle" class="txt1">免费额度</td>
              <td width="180" align="center" valign="middle" class="txt1">保价</td>
            </tr>
            <tr>
              <td height="80" align="left" valign="middle" class="txt2">
              <input name="radiobutton" type="radio" value="申通快递" checked="checked" /></td>
              <td align="left" valign="middle" class="txt1">申通快递</td>
              <td align="left" valign="middle" class="txt2">江、浙、沪地区首重为15元/KG，其他地区18元/KG， 续重均为5-6元/KG， 云南地区为8元</td>
              <td align="left" valign="middle" class="txt2">￥15.00元</td>
              <td align="left" valign="middle" class="txt2">0.00元</td>
              <td align="left" valign="middle" class="txt2">不支持保价</td>
            </tr>
            <tr>
              <td height="34" align="left" valign="middle" class="txt2">
              <input type="radio" name="radiobutton" value="城际快递" /></td>
              <td align="left" valign="middle" class="txt1">城际快递</td>
              <td align="left" valign="middle" class="txt2">配送的运费是固定的，不因地区发生费用改变</td>
              <td align="left" valign="middle" class="txt2">￥10.00元</td>
              <td align="left" valign="middle" class="txt2">￥10000.00元</td>
              <td align="left" valign="middle" class="txt2">不支持保价</td>
            </tr>
            <tr>
              <td height="34" align="left" valign="middle" class="txt2">
              <input type="radio" name="radiobutton" value="邮局平邮" /></td>
              <td align="left" valign="middle" class="txt1">邮局平邮</td>
              <td align="left" valign="middle" class="txt2">邮局平邮的描述内容。</td>
              <td align="left" valign="middle" class="txt2">￥3.50元</td>
              <td align="left" valign="middle" class="txt2">￥5000.00元</td>
              <td align="left" valign="middle" class="txt2">不支持保价</td>
            </tr>
            <tr>
              <td height="34" align="left" valign="middle" class="txt2">&nbsp;</td>
              <td align="left" valign="middle" class="txt2">&nbsp;</td>
              <td align="left" valign="middle" class="txt2">&nbsp;</td>
              <td align="left" valign="middle" class="txt2">&nbsp;</td>
              <td align="left" valign="middle" class="txt2">&nbsp;</td>
              <td align="left" valign="middle" class="txt2">
              <input type="checkbox" name="checkbox" value="checkbox" />
                	配送是否需要保价</td>
            </tr>
        </table></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
  <td height="195" align="center" valign="top">
    <table width="960" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder1">
      <tr>
        <td height="30" align="left" valign="middle" class="tdcolor1">支付方式</td>
        </tr>
      <tr>
        <td height="155" align="center" valign="middle"><table width="960" border="0" cellpadding="0" cellspacing="0" class="tableborder2">
            <tr>
              <td width="20" height="34" align="center" valign="middle" class="txt2">&nbsp;</td>
              <td width="168" align="center" valign="middle" class="txt1">名称</td>
              <td width="735" align="center" valign="middle" class="txt1">订购描述</td>
              <td width="164" align="center" valign="middle" class="txt1">手续费</td>
            </tr>
            <tr>
              <td height="34" align="center" valign="middle" class="txt2">
              <input type="radio" name="radiobutton1" value="余额支付" /></td>
              <td align="left" valign="middle" class="txt1">余额支付</td>
              <td align="left" valign="middle" class="txt2">使用帐户余额支付。只有会员才能使用，通过设置信用额度，可以透支。</td>
              <td align="left" valign="middle" class="txt2">￥0.00元</td>
            </tr>
            <tr>
              <td height="34" align="center" valign="middle" class="txt2">
              <input name="radiobutton1" type="radio" value="银行汇款/转账" checked="checked" /></td>
              <td align="left" valign="middle" class="txt1">银行汇款/转账</td>
              <td align="left" valign="middle" class="txt2">银行名称 收款人信息：全称 ××× ；帐号或地址 ××× ；开户行 ×××。
				注意事项：办理电汇时，请在电汇单“汇款用途”一栏处注明您的订单号。</td>
              <td align="left" valign="middle" class="txt2">￥0.00元</td>
            </tr>
            <tr>
              <td height="34" align="center" valign="middle" class="txt2">
              <input type="radio" name="radiobutton1" value="货到付款" /></td>
              <td align="left" valign="middle" class="txt1">货到付款</td>
              <td align="left" valign="middle" class="txt2">开通城市：××× 货到付款区域：×××</td>
              <td align="left" valign="middle" class="txt2">￥0.00元</td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="162" align="center" valign="top"><table width="960" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder1">
      <tr>
        <td height="30" align="left" valign="middle" class="tdcolor1">商品包装</td>
        </tr>
      <tr>
        <td height="120" align="center" valign="middle"><table width="960" border="0" cellpadding="0" cellspacing="0" class="tableborder2">
            <tr>
              <td width="58" height="34" align="center" valign="middle" class="txt2">&nbsp;</td>
              <td width="168" align="center" valign="middle" class="txt1">名称</td>
              <td width="635" align="center" valign="middle" class="txt1">订购描述</td>
              <td width="164" align="center" valign="middle" class="txt1">手续费</td>
              <td width="135" align="center" valign="middle" class="txt1">图片</td>
            </tr>
            <tr>
              <td height="34" align="center" valign="middle" class="txt2">
              <input name="radiobutton2" type="radio" value="不要包装" checked="checked" /></td>
              <td align="left" valign="middle" class="txt1">不要包装</td>
              <td align="left" valign="middle" class="txt2">&nbsp;</td>
              <td align="left" valign="middle" class="txt2">&nbsp;</td>
              <td align="left" valign="middle" class="txt2">&nbsp;</td>
            </tr>
            <tr>
              <td height="34" align="center" valign="middle" class="txt2">
              <input name="radiobutton2" type="radio" value="精品包装" /></td>
              <td align="left" valign="middle" class="txt1">精品包装</td>
              <td align="right" valign="middle" class="txt2">￥5.00元</td>
              <td align="right" valign="middle" class="txt2">￥800.00元</td>
              <td align="center" valign="middle" class="txt2"><a href="#">查看</a></td>
            </tr>
            
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="220" align="center" valign="top"><table width="960" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder1">
      <tr>
        <td height="30" align="left" valign="middle" class="tdcolor1">祝福贺卡</td>
        </tr>
      <tr>
        <td height="180" align="center" valign="middle"><table width="960" border="0" cellpadding="0" cellspacing="0" class="tableborder2">
            <tr>
              <td width="58" height="34" align="center" valign="middle" class="txt2">&nbsp;</td>
              <td width="168" align="center" valign="middle" class="txt1">名称</td>
              <td width="635" align="center" valign="middle" class="txt1">订购描述</td>
              <td width="164" align="center" valign="middle" class="txt1">手续费</td>
              <td width="135" align="center" valign="middle" class="txt1">图片</td>
            </tr>
            <tr>
              <td height="34" align="center" valign="middle" class="txt2">
              <input name="radiobutton3" type="radio" value="不要贺卡" checked="checked" /></td>
              <td align="left" valign="middle" class="txt1">不要贺卡</td>
              <td align="left" valign="middle" class="txt2">&nbsp;</td>
              <td align="left" valign="middle" class="txt2">&nbsp;</td>
              <td align="left" valign="middle" class="txt2">&nbsp;</td>
            </tr>
            <tr>
              <td height="34" align="center" valign="middle" class="txt2">
              <input name="radiobutton3" type="radio" value="祝福贺卡" /></td>
              <td align="left" valign="middle" class="txt1">祝福贺卡</td>
              <td align="right" valign="middle" class="txt2">￥5.00元</td>
              <td align="right" valign="middle" class="txt2">￥800.00元</td>
              <td align="center" valign="middle" class="txt2"><a href="#">查看</a></td>
            </tr>
            <tr>
              <td height="64" align="center" valign="middle" class="txt2">&nbsp;</td>
              <td align="left" valign="middle" class="txt1">祝福语：</td>
              <td colspan="3" align="center" valign="middle" class="txt2">
              <textarea name="zhufuyu" class="input1"></textarea></td>
              </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="180" align="center" valign="top"><table width="960" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder1">
      <tr>
        <td height="30" align="left" valign="middle" class="tdcolor1">其他信息<a href="#"></a></td>
        </tr>
      <tr>
        <td height="140" align="center" valign="middle"><table width="960" border="0" cellpadding="0" cellspacing="0" class="tableborder2">
            <tr>
              <td width="158" height="34" align="center" valign="middle" class="txt2">使用红包：</td>
              <td align="left" valign="middle" class="txt2">选择已有红包
                <select name="select">
                  <option>请选择</option>
                </select>
                 	或者输入红包序列号 
                <input name="textfield2" type="text" class="input2" /></td>
              </tr>
            <tr>
              <td height="60" align="center" valign="middle" class="txt2">订单附言：</td>
              <td align="center" valign="middle" class="txt2">
              <textarea name="dingdanfuyan" class="input1"></textarea></td>
              </tr>
            <tr>
              <td height="34" align="center" valign="middle" class="txt2">缺货处理：</td>
              <td align="left" valign="middle" class="txt2">
              <input name="radiobutton4" type="radio" value="等待所有商品备齐后发货 " checked="checked" />
                	等待所有商品备齐后发货 
                <input type="radio" name="radiobutton4" value="取消订单 " /> 
                	取消订单 
                <input type="radio" name="radiobutton4" value="与店主协商" /> 
                	与店主协商</td>
              </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center" valign="top"><table width="960" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder1">
      <tr>
        <td height="30" align="left" valign="middle" class="tdcolor1">费用总计</td>
        </tr>
      <tr>
        <td height="180" align="center" valign="middle"><table width="960" border="0" cellpadding="0" cellspacing="0" class="tableborder2">
            <tr>
              <td height="34" align="right" valign="middle" class="txt2">该订单完成后，您将获得<span class="txt4"><font color="#FE596A"><%=cdao.getUserAllPrice() %></font></span> 积分，以及价值<span class="txt4"><font color="#FE596A">￥0.00元</font>  </span>的红包。</td>
              </tr>
            <tr>
              <td height="34" align="right" valign="middle" class="txt2">商品总价：<span class="txt4"><font color="#FE596A">￥<%=cdao.getUserAllPrice() %>元</font></span> + 配送费用：<span class="txt4"><font color="#FE596A">￥15.00元</font></span></td>
              </tr>
            <tr>
              <td height="34" align="right" valign="middle" class="txt2">应付款金额：<span class="txt4"><font color="#FE596A">￥<%=cdao.getUserAllPrice()+15.0 %>元</font></span></td>
              </tr>
            <tr>
              <td height="60" align="center" valign="middle"><table width="150" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="60" align="center" valign="middle">
                  	<input name="Submit" type="image" src="images/btn1.jpg" />
                  </td>
                </tr>
              </table></td>
            </tr>
        </table>
        </td>
      </tr>
    </table></td>
  </tr>
  </form>
  <tr>
    <td height="140" align="right" valign="bottom"><table width="960" border="0" cellpadding="0" cellspacing="0" class="tableborder2">
      <tr>
        <td height="132" align="right" valign="bottom"><table width="960" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="108" height="53" align="left" valign="middle" class="txt3">新手上路</td>
            <td width="162" align="left" valign="middle" class="txt3">手机常识</td>
            <td width="162" align="left" valign="middle" class="txt3">配送与支付</td>
            <td width="112" align="left" valign="middle" class="txt3">会员中心</td>
            <td width="133" align="left" valign="middle" class="txt3">服务保证</td>
            <td width="445" align="left" valign="middle" class="txt3">联系我们</td>
          </tr>
          <tr>
            <td height="22" align="left" valign="top" class="link1">售后流程</td>
            <td align="left" valign="top" class="link1"><a href="#" class="link1">如何分辨原装电池</a></td>
            <td align="left" valign="top" class="link1"><a href="#" class="link1">货到付款区域</a></td>
            <td align="left" valign="top" class="link1"><a href="#" class="link1">资金管理</a></td>
            <td align="left" valign="top" class="link1"><a href="#" class="link1">退换货原则</a></td>
            <td align="left" valign="top" class="link1"><a href="#" class="link1">网站故障报告</a></td>
          </tr>
          <tr>
            <td height="22" align="left" valign="top" class="link1">订购流程</td>
            <td align="left" valign="top" class="link1"><a href="#" class="link1">如何分辨水货手机</a></td>
            <td align="left" valign="top" class="link1"><a href="#" class="link1">配送支付只能查询</a></td>
            <td align="left" valign="top" class="link1"><a href="#" class="link1">我的收藏</a></td>
            <td align="left" valign="top" class="link1"><a href="#" class="link1">售后服务保证</a></td>
            <td align="left" valign="top" class="link1"><a href="#" class="link1">选机咨询</a></td>
          </tr>
          <tr>
            <td height="30" align="left" valign="top" class="link1">订购方式</td>
            <td align="left" valign="top" class="link1"><a href="#" class="link1">如何享受全国联保</a></td>
            <td align="left" valign="top" class="link1"><a href="#" class="link1">支付方式说明</a></td>
            <td align="left" valign="top" class="link1"><a href="#" class="link1">我的订单</a></td>
            <td align="left" valign="top" class="link1"><a href="#" class="link1">产品质量保证</a></td>
            <td align="left" valign="top" class="link1"><a href="#" class="link1">投诉与建议</a></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr class="footer">
    <td height="45" align="left" valign="middle"><table width="960" border="0" align="right" cellpadding="0" cellspacing="0">
        <tr>
          <td width="1000" height="25" align="left" valign="middle" class="link1"><a href="#" class="link1">免责条款</a> |<a href="#" class="link1"> 隐私保护</a> | <a href="#" class="link1">咨询热点</a> | <a href="#" class="link1">联系我们</a> | <a href="#" class="link1">公司简介</a> | <a href="#" class="link1">批发方案</a> | <a href="#" class="link1">配送方式</a></td>
          <td width="70" align="center" valign="middle"><img src="images/top1.jpg" alt="top" width="45" height="13" /></td>
          <td width="70" align="center" valign="middle"><img src="images/home.jpg" alt="home" width="56" height="13" /></td>
        </tr>
      </table></td>
  </tr>
</table>
    </td>
</tr>
  <tr align="center">
    <td>
    	<jsp:include page="footer.jsp"></jsp:include>
    </td>
  </tr>
</table>
  </body>
</html>
