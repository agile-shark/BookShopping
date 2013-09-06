<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'order.jsp' starting page</title>
    
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
	color: #FF0000;
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
<table width="960px" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="164" align="center" valign="top"><table width="1150" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder1">
      <tr>
        <td width="550" height="30" align="left" valign="middle" class="tdcolor1">商品列表</td>
        <td width="600" align="right" valign="middle" class="tdcolor1"><a href="#">修改</a></td>
      </tr>
      <tr>
        <td height="121" colspan="2" align="center" valign="middle"><table width="1137" border="0" cellpadding="0" cellspacing="0" class="tableborder2">
            <tr>
              <td width="177" height="35" align="center" valign="middle" class="txt1">商品名称</td>
              <td width="175" align="center" valign="middle" class="txt1">属性</td>
              <td width="205" align="center" valign="middle" class="txt1">市场价</td>
              <td width="211" align="center" valign="middle" class="txt1">本店价</td>
              <td width="161" align="center" valign="middle" class="txt1">购买数量</td>
              <td width="208" align="center" valign="middle" class="txt1">小计</td>
            </tr>
            <tr>
              <td height="35" align="left" valign="middle" class="txt2"><a href="#"> 诺基亚</a></td>
              <td align="left" valign="middle" class="txt2">颜色：黑色</td>
              <td align="left" valign="middle" class="txt2">￥4440.00元</td>
              <td align="left" valign="middle" class="txt2">￥3700.00元</td>
              <td align="left" valign="middle" class="txt2">1</td>
              <td align="left" valign="middle" class="txt2">￥3700元</td>
            </tr>
            <tr>
              <td height="35" colspan="6" align="left" valign="middle" class="txt2">购物金额小计 ￥6888元，比市场价 ￥4440.00元节省了740.00元（17%） </td>
            </tr>
        </table></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td height="195" align="center" valign="top"><table width="1150" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder1">
      <tr>
        <td width="550" height="30" align="left" valign="middle" class="tdcolor1">收货人信息</td>
        <td width="600" align="right" valign="middle" class="tdcolor1"><a href="#">修改</a></td>
      </tr>
      <tr>
        <td height="155" colspan="2" align="center" valign="middle"><table width="1137" border="0" cellpadding="0" cellspacing="0" class="tableborder2">

            <tr>
              <td width="213" height="34" align="left" valign="middle" class="txt2">收货人姓名：</td>
              <td width="379" align="left" valign="middle" class="txt2">梁永星</td>
              <td width="246" align="left" valign="middle" class="txt2">电子邮件地址：</td>
              <td width="290" align="left" valign="middle" class="txt2">254556322215@qq.com</td>
              </tr>
            <tr>
              <td height="34" align="left" valign="middle" class="txt2">详细地址：</td>
              <td align="left" valign="middle" class="txt2">山西省</td>
              <td align="left" valign="middle" class="txt2">邮政编码：</td>
              <td align="left" valign="middle" class="txt2">2545476532</td>
              </tr>
            <tr>
              <td height="34" align="left" valign="middle" class="txt2">电话：</td>
              <td align="left" valign="middle" class="txt2">2558623148563</td>
              <td align="left" valign="middle" class="txt2">手机：</td>
              <td align="left" valign="middle" class="txt2">158563235663</td>
              </tr>
            <tr>
              <td height="34" align="left" valign="middle" class="txt2">标志建筑：</td>
              <td align="left" valign="middle" class="txt2">山阴县政府</td>
              <td align="left" valign="middle" class="txt2">最佳送货时间：</td>
              <td align="left" valign="middle" class="txt2">1145232</td>
              </tr>

        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="280" align="center" valign="top"><table width="1150" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder1">
      <tr>
        <td height="30" align="left" valign="middle" class="tdcolor1">配送信息<a href="#"></a></td>
        </tr>
      <tr>
        <td height="236" align="center" valign="middle"><table width="1137" border="0" cellpadding="0" cellspacing="0" class="tableborder2">
            <tr>
              <td width="56" height="34" align="left" valign="middle" class="txt2">&nbsp;</td>
              <td width="283" align="center" valign="middle" class="txt1">名称</td>
              <td width="285" align="center" valign="middle" class="txt1">订购描述</td>
              <td width="169" align="center" valign="middle" class="txt1">费用</td>
              <td width="172" align="center" valign="middle" class="txt1">免费额度</td>
              <td width="169" align="center" valign="middle" class="txt1">保价</td>
            </tr>
            <tr>
              <td height="80" align="left" valign="middle" class="txt2"><input name="radiobutton" type="radio" value="radiobutton" checked="checked" /></td>
              <td align="left" valign="middle" class="txt1">申通快递</td>
              <td align="left" valign="middle" class="txt2">江浙沪地区首重15元</td>
              <td align="left" valign="middle" class="txt2">￥15.00元</td>
              <td align="left" valign="middle" class="txt2">0.00元</td>
              <td align="left" valign="middle" class="txt2">不支持保价</td>
            </tr>
            <tr>
              <td height="34" align="left" valign="middle" class="txt2"><input type="radio" name="radiobutton" value="radiobutton" /></td>
              <td align="left" valign="middle" class="txt1">城际快递</td>
              <td align="left" valign="middle" class="txt2">运费固定</td>
              <td align="left" valign="middle" class="txt2">￥10.00元</td>
              <td align="left" valign="middle" class="txt2">￥10000.00元</td>
              <td align="left" valign="middle" class="txt2">不支持保价</td>
            </tr>
            <tr>
              <td height="34" align="left" valign="middle" class="txt2"><input type="radio" name="radiobutton" value="radiobutton" /></td>
              <td align="left" valign="middle" class="txt1">邮局平邮</td>
              <td align="left" valign="middle" class="txt2">邮局平邮的描述</td>
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
              <td align="left" valign="middle" class="txt2"><input type="checkbox" name="checkbox" value="checkbox" />
                配送是否需要保价</td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="195" align="center" valign="top"><table width="1150" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder1">
      <tr>
        <td height="30" align="left" valign="middle" class="tdcolor1">支付方式<a href="#"></a></td>
        </tr>
      <tr>
        <td height="155" align="center" valign="middle"><table width="1137" border="0" cellpadding="0" cellspacing="0" class="tableborder2">
            <tr>
              <td width="58" height="34" align="center" valign="middle" class="txt2">&nbsp;</td>
              <td width="168" align="center" valign="middle" class="txt1">名称</td>
              <td width="735" align="center" valign="middle" class="txt1">订购描述</td>
              <td width="164" align="center" valign="middle" class="txt1">手续费</td>
            </tr>
            <tr>
              <td height="34" align="center" valign="middle" class="txt2"><input type="radio" name="radiobutton1" value="radiobutton" /></td>
              <td align="left" valign="middle" class="txt1">余额支付</td>
              <td align="left" valign="middle" class="txt2">使用账户余额支付。</td>
              <td align="left" valign="middle" class="txt2">￥0.00元</td>
            </tr>
            <tr>
              <td height="34" align="center" valign="middle" class="txt2"><input name="radiobutton1" type="radio" value="radiobutton" checked="checked" /></td>
              <td align="left" valign="middle" class="txt1">银行汇款/转账</td>
              <td align="left" valign="middle" class="txt2">银行名称 收款人信息：全称###；账号或地址###；开户行###。注意事项：办理电汇时，请在电汇单“汇款用途”一栏注明您的订单号</td>
              <td align="left" valign="middle" class="txt2">￥0.00元</td>
            </tr>
            <tr>
              <td height="34" align="center" valign="middle" class="txt2"><input type="radio" name="radiobutton1" value="radiobutton" /></td>
              <td align="left" valign="middle" class="txt1">山阴县政府</td>
              <td align="left" valign="middle" class="txt2">最佳送货时间：</td>
              <td align="left" valign="middle" class="txt2">￥0.00元</td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="162" align="center" valign="top"><table width="1150" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder1">
      <tr>
        <td height="30" align="left" valign="middle" class="tdcolor1">商品包装<a href="#"></a></td>
        </tr>
      <tr>
        <td height="120" align="center" valign="middle"><table width="1137" border="0" cellpadding="0" cellspacing="0" class="tableborder2">
            <tr>
              <td width="58" height="34" align="center" valign="middle" class="txt2">&nbsp;</td>
              <td width="168" align="center" valign="middle" class="txt1">名称</td>
              <td width="635" align="center" valign="middle" class="txt1">订购描述</td>
              <td width="164" align="center" valign="middle" class="txt1">手续费</td>
              <td width="135" align="center" valign="middle" class="txt1">图片</td>
            </tr>
            <tr>
              <td height="34" align="center" valign="middle" class="txt2"><input name="radiobutton2" type="radio" value="radiobutton" checked="checked" /></td>
              <td align="left" valign="middle" class="txt1">不要包装</td>
              <td align="left" valign="middle" class="txt2">&nbsp;</td>
              <td align="left" valign="middle" class="txt2">&nbsp;</td>
              <td align="left" valign="middle" class="txt2">&nbsp;</td>
            </tr>
            <tr>
              <td height="34" align="center" valign="middle" class="txt2"><input name="radiobutton2" type="radio" value="radiobutton" /></td>
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
    <td height="220" align="center" valign="top"><table width="1150" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder1">
      <tr>
        <td height="30" align="left" valign="middle" class="tdcolor1">祝福贺卡<a href="#"></a></td>
        </tr>
      <tr>
        <td height="180" align="center" valign="middle"><table width="1137" border="0" cellpadding="0" cellspacing="0" class="tableborder2">
            <tr>
              <td width="58" height="34" align="center" valign="middle" class="txt2">&nbsp;</td>
              <td width="168" align="center" valign="middle" class="txt1">名称</td>
              <td width="635" align="center" valign="middle" class="txt1">订购描述</td>
              <td width="164" align="center" valign="middle" class="txt1">手续费</td>
              <td width="135" align="center" valign="middle" class="txt1">图片</td>
            </tr>
            <tr>
              <td height="34" align="center" valign="middle" class="txt2"><input name="radiobutton3" type="radio" value="radiobutton" checked="checked" /></td>
              <td align="left" valign="middle" class="txt1">不要贺卡</td>
              <td align="left" valign="middle" class="txt2">&nbsp;</td>
              <td align="left" valign="middle" class="txt2">&nbsp;</td>
              <td align="left" valign="middle" class="txt2">&nbsp;</td>
            </tr>
            <tr>
              <td height="34" align="center" valign="middle" class="txt2"><input name="radiobutton3" type="radio" value="radiobutton" /></td>
              <td align="left" valign="middle" class="txt1">祝福贺卡</td>
              <td align="right" valign="middle" class="txt2">￥5.00元</td>
              <td align="right" valign="middle" class="txt2">￥800.00元</td>
              <td align="center" valign="middle" class="txt2"><a href="#">查看</a></td>
            </tr>
            <tr>
              <td height="64" align="center" valign="middle" class="txt2">&nbsp;</td>
              <td align="left" valign="middle" class="txt1">祝福语：</td>
              <td colspan="3" align="center" valign="middle" class="txt2"><textarea name="textfield" class="input1"></textarea></td>
              </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="180" align="center" valign="top"><table width="1150" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder1">
      <tr>
        <td height="30" align="left" valign="middle" class="tdcolor1">其他信息<a href="#"></a></td>
        </tr>
      <tr>
        <td height="140" align="center" valign="middle"><table width="1137" border="0" cellpadding="0" cellspacing="0" class="tableborder2">
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
              <td align="center" valign="middle" class="txt2"><textarea name="textfield3" class="input1"></textarea></td>
              </tr>
            <tr>
              <td height="34" align="center" valign="middle" class="txt2">缺货处理：</td>
              <td align="left" valign="middle" class="txt2"><input name="radiobutton4" type="radio" value="radiobutton" checked="checked" />
                等待所有商品备齐后发货 
                <input type="radio" name="radiobutton4" value="radiobutton" /> 
                取消订单 
                <input type="radio" name="radiobutton4" value="radiobutton" /> 
                与店主协商</td>
              </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center" valign="top"><table width="1150" border="0" align="center" cellpadding="0" cellspacing="0" class="tableborder1">
      <tr>
        <td height="30" align="left" valign="middle" class="tdcolor1">费用总计<a href="#"></a></td>
        </tr>
      <tr>
        <td height="180" align="center" valign="middle"><table width="1137" border="0" cellpadding="0" cellspacing="0" class="tableborder2">
            <tr>
              <td height="34" align="right" valign="middle" class="txt2">该订单完成后，您将获得<span class="txt4">3700</span>积分，以及价值<span class="txt4">￥0.00元</span>的红包。</td>
              </tr>
            <tr>
              <td height="34" align="right" valign="middle" class="txt2">商品总价：<span class="txt4">￥3700元</span>+配送费用：<span class="txt4">￥15.00</span>元</td>
              </tr>
            <tr>
              <td height="34" align="right" valign="middle" class="txt2">应付款金额：<span class="txt4">￥3715.00</span>元</td>
              </tr>
            <tr>
              <td height="60" align="center" valign="middle"><table width="150" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="60" align="center" valign="middle"><input name="Submit" type="submit" class="btn1" value=" " /></td>
                </tr>
              </table></td>
            </tr>
        </table>          </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="140" align="right" valign="bottom"><table width="1150" border="0" cellpadding="0" cellspacing="0" class="tableborder2">
      <tr>
        <td height="132" align="right" valign="bottom"><table width="1122" border="0" cellpadding="0" cellspacing="0">
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
    <td height="45" align="left" valign="middle"><table width="1140" border="0" align="right" cellpadding="0" cellspacing="0">
        <tr>
          <td width="1000" height="25" align="left" valign="middle" class="link1"><a href="#" class="link1">免责条款</a> |<a href="#" class="link1"> 隐私保护</a> | <a href="#" class="link1">咨询热点</a> | <a href="#" class="link1">联系我们</a> | <a href="#" class="link1">公司简介</a> | <a href="#" class="link1">批发方案</a> | <a href="#" class="link1">配送方式</a></td>
          <td width="70" align="center" valign="middle"><img src="images/top1.jpg" alt="top" width="45" height="13" /></td>
          <td width="70" align="center" valign="middle"><img src="images/home.jpg" alt="home" width="56" height="13" /></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
