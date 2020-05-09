<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/author_css/author_deskwork.css"/>
</head>
<body>
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
					<td width="40%">您好， 
						<a href="#" title="Nie YuLing">${sessionScope.user.username}..</a> 
						【 <a title="点击退出系统" href="../user/exit.do">点击退出</a> | <a title="个人资料">个人资料</a> 】
					</td>
					<td class="info" align="right">
						<a title="点击进入收件箱">站内信息【<span id="emailCount">0</span> 条 / 共 
							   <span id="emailTitle">0</span>条】
						</a> 
						<a href="#" class="helpKey" title="显示帮助信息">帮助</a>
					</td>
					<td class="info" align="right">
						<a title="点击进入收件箱"> 当前身份【
							<span id="currenUser">作者</span> 
						 </a>
						 |
						<a title="切换身份" href="#">更换</a>】
					</td>
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
		<a href="../essay/authorWorkDesk.do">工作空间</a> | <a href="../essay/paperCenter.do">稿件中心</a>
	</div>
</body>
</html>