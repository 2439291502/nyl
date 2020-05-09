<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工作空间左边栏</title>
</head>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>

<body>
<div class="map left">
	<div class="mapContainer">
		<div class="map_tt">
			<div class="map_zone selectZone">
				<strong>后台信息管理中心</strong>
			</div>
			<div class="zoneCont" style="display: block;">
				<p class="map_up map_down">
					<a href="#">系统用户管理中心</a>
				</p>
				<ul style="display: block;">
					<li>
						<a href="../editor/selectState.do?state=0&pageCode=1">审核激活用户</a>
					</li>
					<li>
						<a href="../editor/selectAllUsers.do?pageCode=1">所有用户</a>
					</li>
				</ul>
				<p class="map_up">
					<a>稿件信息管理中心</a>
				</p>
				<ul style="display: block;">
 					<li>
						<a href="../editor/selectNContribute.do?statusId=61&pageCode=1">待分配稿件</a>
					</li>
					<li>
						<a href="../editor/selectContributeEssay.do?pageCode=1">已分配稿件</a>
					</li>
					<!-- <li>
						<a href="../editor/selectEssayComment.do?pageCode=1">复审稿件</a>
					</li> -->
					
					<li>
						<a href="../editor/selectProduce.do?statusId=66&pageCode=1">已通过未刊用稿件</a>
					</li>
					<li>
						<a href="../editor/selectAllPaper.do">查询期刊目录</a>
					</li>
				</ul>
				
				<p class="map_up map_down">
					<a>信息管理</a>
				</p>
				<ul style="display: block;">
					
					<li>
						<a href="../lMessage/selectLMessageByUsernameAState.do?lMessageState=1&pageCode=1">接收的消息</a> 
					</li>
					<li>
						<a href="../lMessage/selectGetLMessage.do?lMessageState=1&pageCode=1">已发送消息</a> 
					</li>
				</ul>
				
			</div>
		</div>
	</div>
</div>
</body>
</html>