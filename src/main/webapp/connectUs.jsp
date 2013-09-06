<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<link href="css/connectUs.css" rel="stylesheet" type="text/css">
		<title>网上书城首页面</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<style>
#connTable {
	margin-left: 100px;
}
</style>
	</head>

	<body background="images/bg.bmp">
		<table width="962" border="0" align="center" cellpadding="2"
			cellspacing="2">
			<tr>
				<td colspan="3" align="center">
					<jsp:include page="top.jsp"></jsp:include>
				</td>
			</tr>
			<tr>
				<td width="750px" height="220" align="center">
					<div id="connTable">
						<div id="warp">
							<!-- container -->
							<div id="container">
								<div id="pright" style="width: 510px">
									<div class="center2" style="width: 500px">
										<table width="674" border="0" cellpadding="2" cellspacing="2"
											style="width: 480px" class="bg_none">
											<tr>
												<th class="bg_none" width="124">
													名称：
												</th>
												<td width="550">
													网上书店
												</td>
											</tr>
											<tr>
												<th class="bg_none">
													联系方式：
												</th>
												<td>
													电话：18744036178 QQ群：356979945
												</td>
											</tr>
											<tr>
												<th class="bg_none">
													其他联系方式：
												</th>
												<td>
													email:liangyongxing_mr@sina.cn
													博客：http://blog.sina.com.cn/u/273367467
												</td>
											</tr>

											<tr>
												<th class="bg_none">
													名称
												</th>
												<td>
													网上书店
												</td>
											</tr>
											<tr>
												<th class="bg_none">
													联系方式：
												</th>
												<td>
													电话：18943643561 QQ：515401829
												</td>
											</tr>
											<tr>
												<th class="bg_none">
													其他：
												</th>
												<td>
													email：356979945@qq.com QQ群（121082293）
												</td>
											</tr>
											<tr>
												<th class="bg_none">
													技术团队：
												</th>
												<td>
													梁永星(18943643561)
												</td>
											</tr>
											<tr>
												<th class="bg_none">
													老师信息反馈：
												</th>
												<td>
													电话：18943913325 QQ：512414414
												</td>
											</tr>
											<tr>
												<th class="bg_none">
													网站信息反馈：
												</th>
												<td>
													电话：18946562328 18943643561 QQ：356979945 515401829
												</td>
											</tr>

										</table>
									</div>
								</div>
							</div>
							<div id="nright">
								<div class="title">
									欢迎大家的意见和建议
								</div>
								<img src="images/line.gif">
								<div class="title">
									此处宝地 期待创新
								</div>
								<div class="scroll">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<img src="images/ren3.gif" />
										&nbsp;&nbsp;
										<img src="images/ren3.gif" />
									</table>
								</div>
								<div class="title">
									相关网站欣赏
								</div>
								<div class="scroll">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>
												<a
													href="http://www.amazon.cn/%E5%9B%BE%E4%B9%A6/b/ref=sa_menu_bo0?ie=UTF8&node=658390051">亚马逊</a>
											</td>
										</tr>
										<tr>
											<td>
												<a
													href="http://www.suning.com/emall/tcd_10052_22001_.html?utm_source=baidu&utm_medium=cpc&utm_term=%E7%BD%91%E4%B8%8A%E4%B9%A6%E5%9F%8E&utm_content=%E7%BD%91%E4%B8%8A%E4%B9%A6%E5%BA%97&utm_campaign=%E8%8B%8F%E5%AE%81%E6%98%93%E8%B4%AD%E8%B4%AD%E4%B9%A6%E9%80%9A%E7%94%A8.%E7%B2%BE%E7%A1%AE">苏宁易购</a>
											</td>
										</tr>
										<tr>
											<td>
												<a href = "http://www.99read.com/">99网上书城</a>
											</td>
										</tr>
										<tr>
											<td>
												<a href="http://book.dangdang.com/">当当 网</a>
											</td>
										</tr>
									</table>
								</div>
								<div class="title">
									会员人气排行
								</div>
								<table width="94%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="52" rowspan="2">
											<img src="images/rank.gif" alt="" />
										</td>
										<td height="24" colspan="4">
											虚位以待
										</td>
									</tr>
									<tr>
										<td width="39" height="24">
											人气值
										</td>
										<td width="105">
											<img src="images/rank1.gif" width="101" height="10" />
										</td>
										<td width="15">
											<img src="images/gesture.gif" alt="dfg" width="14"
												height="15" />
										</td>
										<td width="10">
											99
										</td>
									</tr>
									<tr>
										<td width="52" rowspan="2">
											<img src="images/rank.gif" alt="" />
										</td>
										<td height="24" colspan="4">
											虚位以待
										</td>
									</tr>
									<tr>
										<td width="39" height="24">
											人气值
										</td>
										<td width="105">
											<img src="images/rank1.gif" alt="" width="101" height="10" />
										</td>
										<td width="15">
											<img src="images/gesture.gif" alt="dfg" width="14"
												height="15" />
										</td>
										<td width="10">
											99
										</td>
									</tr>
									<tr>
										<td width="52" rowspan="2">
											<img src="images/rank.gif" alt="" />
										</td>
										<td height="24" colspan="4">
											虚位以待
										</td>
									</tr>
									<tr>
										<td width="39" height="24">
											人气值
										</td>
										<td width="105">
											<img src="images/rank1.gif" alt="der" width="101" height="10" />
										</td>
										<td width="15">
											<img src="images/gesture.gif" alt="dfg" width="14"
												height="15" />
										</td>
										<td width="10">
											99
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>

				</td>
				<td width="256">
				</td>
			</tr>
			<tr>
				<td colspan="2">

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
