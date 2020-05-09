<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>作者工作空间</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_deskwork.css"/>
</head>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
			<div class="workdesk_head">
				<div class="head_top">
					<div class="workdesk_title">
						<h1>《稿件处理系统》 ----作者工作中心</h1>
					</div>
					<div class="workdesk_datetime">
						<span style="font-size: 14px;">2019/11/19</span>
					</div>

				</div>

				<table width="100%" cellspacing="0" cellpadding="0" border="0">
					<tbody>
						<tr valign="top" height="23">
							<td width="40%">您好， <a href="#" title="Nie YuLing">${sessionScope.user.username}
									..</a> 【 <a title="点击退出系统">点击退出</a> | <a title="个人资料">个人资料</a> 】
							</td>
							<td class="info" align="right"><a title="点击进入收件箱"> 站内信息【
									<span id="emailCount">0</span> 条 / 共 <span id="emailTitle">0</span>
									条】
							</a> <a href="#" class="helpKey" title="显示帮助信息">帮助</a></td>
							<td class="info" align="right"><a title="点击进入收件箱"> 当前身份【
									<span id="currenUser">作者</span> | <a id="changeUser"
									title="切换身份">更换</a> 】
							</a></td>
							<td><a href="#" title="反馈意见"
								style="height: 23px; background: #8A9CA5;">反馈意见</a></td>
							<td>
								<!--<a href="#" title="反馈意见">反馈意见</a>-->
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="desktop_nav">
				<a>工作空间</a> | <a>稿件中心</a>
			</div>
			<div class="desk_content">
				<div class="left_content left">
					<div class="desk_left">
						<div class="userInfoList">
							<div class="userInfoList_gaojianchuli">
								<div class="userInfoList_gaojianchuli_tt left"></div>
								<ul>
									<li class="deepBackground">
										<table width="488" cellspacing="0" cellpadding="0" border="0">
											<tbody>
												<tr>
													<td width="135"></td>
													<td width="51"></td>
													<td width="53"></td>
													<td width="82"></td>
													<td width="71"></td>
													<td width="64"></td>
													<td width="41" align="right">合计</td>
												</tr>
											</tbody>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick=""
												style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">待修理稿件</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="64"></td>
												<td width="41" align="right"><a
													class="gjx_gaojianshuliang">0篇</a></td>
											</tr>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick=""
												style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">已投稿件</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="64"></td>
												<td width="41" align="right"><a
													class="gjx_gaojianshuliang">0篇</a></td>
											</tr>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick=""
												style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">草稿</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="64"></td>
												<td width="41" align="right"><a
													class="gjx_gaojianshuliang">0篇</a></td>
											</tr>
										</table>
									</li>

								</ul>
							</div>
							<div class="userInfoList_yuegaochuli">
								<div class="userInfoList_yuegaochuli_tt left"></div>
								<ul>
									<!--<li class="deepBackground">
										<table width="488" cellspacing="0" cellpadding="0" border="0">
											<tbody>
												<tr>
													<td width="135"></td>
													<td width="51"></td>
													<td width="53"></td>
													<td width="82"></td>
													<td width="71"></td>
													<td width="64"></td>
													<td width="41" align="right">合计</td>
												</tr>
											</tbody>
										</table>
									</li>-->
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick=""
												style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">我为通讯作者的投稿</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="64"></td>
												<td width="60" align="right"><a
													class="gjx_gaojianshuliang">0篇</a></td>
											</tr>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick=""
												style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">待我提交的约稿稿件</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="64"></td>
												<td width="41" align="right"><a
													class="gjx_gaojianshuliang">0篇</a></td>
											</tr>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick=""
												style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">已完成约稿稿件</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="64"></td>
												<td width="41" align="right"><a
													class="gjx_gaojianshuliang">0篇</a></td>
											</tr>
										</table>
									</li>
									<!--<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick="" style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">我为通讯作者的投稿</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="64"></td>
												<td width="41" align="right">
													<a class="gjx_gaojianshuliang">0篇</a>
												</td>
											</tr>
										</table>
									</li>-->

								</ul>
							</div>
							<div class="userInfoList_yuegaochuli">
								<div class="userInfoList_feiyongguanli_tt left"></div>
								<ul>
									<!--<li class="deepBackground">
										<table width="488" cellspacing="0" cellpadding="0" border="0">
											<tbody>
												<tr>
													<td width="135"></td>
													<td width="51"></td>
													<td width="53"></td>
													<td width="82"></td>
													<td width="71"></td>
													<td width="64"></td>
													<td width="41" align="right">合计</td>
												</tr>
											</tbody>
										</table>
									</li>-->
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr
												style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">审稿费</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="64"></td>
												<td width="41" align="right"><a
													class="gjx_gaojianshuliang">0篇</a></td>
											</tr>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr
												style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">版面费</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="64"></td>
												<td width="41" align="right"><a
													class="gjx_gaojianshuliang">0篇</a></td>
											</tr>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr
												style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">作者费</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="64"></td>
												<td width="41" align="right"><a
													class="gjx_gaojianshuliang">0篇</a></td>
											</tr>
										</table>
									</li>

								</ul>
							</div>

						</div>
					</div>

				</div>

				<div class="desk_right left">
					<div class="desktopAuthorArea">
						<div class="desktopAuthorAreaTitle"></div>
						<a href="#">导航式投稿（推荐）</a> <a href="#">一步式投稿</a>

					</div>
					<div class="author_contribute"></div>
				</div>
			</div>

		</div>
		<div class="foot">
			<div class="footCtrl">
				<a href="#">投稿须知</a>| <a href="#">版权协议</a>| <a href="#">稿件模板</a>| <a
					href="#">联系我们</a>| <a href="#">首页</a>
			</div>
			<div class="copy">
				本系统由中国知网提供技术支持 当前版本：v9.01 <a>使用帮助</a> 技术支持 <a
					href="mailto:cb@cnki.net">cb@cnki.net</a> <a
					href="http://find.cb.cnki.net">http://find.cb.cnki.net</a> 建议采用IE
				6.0以上版本，1024*768分辨率浏览本页

			</div>
		</div>

	</div>
</body>

</html>