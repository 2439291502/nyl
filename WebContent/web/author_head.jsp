<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="../css/author_css/author_deskwork.css"/>
 --></head>
<body>
	<div class="workdesk_head">
		<div class="head_top">
			<div class="workdesk_title">
				<c:if test="${sessionScope.user.typeId eq 10}">
				<h1>《期刊稿件在线处理系统》 ----作者后台管理</h1>
				</c:if>
				<c:if test="${sessionScope.user.typeId eq 20}">
				<h1>《期刊稿件在线处理系统》 ----专家后台管理</h1>
				</c:if>
				<c:if test="${sessionScope.user.typeId eq 30}">
				<h1>《期刊稿件在线处理系统》 ----主编后台管理</h1>
				</c:if>
				<c:if test="${sessionScope.user.typeId eq 31}">
				<h1>《期刊稿件在线处理系统》 ----副编后台管理</h1>
				</c:if>
			</div>
			<div class="workdesk_datetime">
				<span style="font-size: 14px;"></span>
			</div>
		</div>
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tbody>
				<tr valign="top" height="23">
					<td width="40%">您好， 
						<a href="#" title="${sessionScope.user.username}">${sessionScope.user.username}..</a>
						<c:if test="${not empty sessionScope.user.username}">
							【 <a title="点击退出系统" href="../user/exit.do">点击退出</a>
						</c:if>
						<c:if test="${empty sessionScope.user}">
				        	<a href="../user/showLogin.do" style="margin-left: 10px;">登录</a> 
				        	<a href="../user/showRegister.do">注册</a>
				     	</c:if>
						 | <a title="个人资料" href="../user/showUserInfo.do">个人资料</a> 】
					</td>
					<td class="info" align="right">
						<!-- <a title="点击进入收件箱">站内信息【<span id="emailCount">0</span> 条 / 共 
							   <span id="emailTitle">0</span>条】
						</a> 
						<a href="#" class="helpKey" title="显示帮助信息">帮助</a> -->
					</td>
					<td class="info" align="right">
						<c:if test="${sessionScope.user.typeId eq 10}">
						<a title="点击进入收件箱"> 当前身份【
							<span id="currenUser">作者</span> 
						 </a>
						 |
						<a title="切换身份" href="../professor/showLogin.do">更换</a>】
						</c:if>
						<c:if test="${sessionScope.user.typeId eq 20 ||sessionScope.user.typeId eq 21||sessionScope.user.typeId eq 22}">
						<a title="点击进入收件箱"> 当前身份【
							<span id="currenUser">专家</span> 
						 </a>
						 |
						<a title="切换身份" href="../user/showLogin.do">更换</a>】
						</c:if>
						<c:if test="${sessionScope.user.typeId eq 30 ||sessionScope.user.typeId eq 31}">
						 当前身份【
							<span id="currenUser">编辑管理员</span> 
						】
						</c:if>
					</td>
					<td>
					<c:if test="${sessionScope.user.typeId eq 10}">
						<a href="../lMessage/showLMessage.do" title="反馈意见" style="height: 23px; background: #E6B3AB;">反馈意见</a>
					</c:if>	
					<c:if test="${sessionScope.user.typeId eq 20 ||sessionScope.user.typeId eq 21||sessionScope.user.typeId eq 22}">
						<a href="../lMessage/showLMessage.do" title="反馈意见" style="height: 23px; background: #E6B3AB;">反馈意见</a>
					</c:if>	
					<c:if test="${sessionScope.user.typeId eq 30 ||sessionScope.user.typeId eq 31}">
						<a href="#" title="反馈意见" style="height: 23px; background: #E6B3AB;">反馈意见</a>
					</c:if>
					</td>
					 
					<td>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="desktop_nav">
	<c:if test="${sessionScope.user.typeId eq 10}">
		<a href="../essay/authorWorkDesk.do">工作空间</a> | <a href="../essay/paperCenter.do">后台信息管理中心</a>
	</c:if>
	<c:if test="${sessionScope.user.typeId eq 20}">
		<a href="../professor/professorWorkDesk.do">工作空间</a> | <a href="../professor/paperCenter.do">后台信息管理中心</a>
	</c:if>
	<c:if test="${sessionScope.user.typeId eq 30}">
		<a href="../editor/editorWorkdesk.do">工作空间</a> | <a href="../editor/paperCenter.do">后台信息管理中心</a>
	</c:if>
	</div>
</body>
</html>