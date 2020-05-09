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
				<a>稿件中心</a>
			</div>
			<div class="zoneCont" style="display: block;">
				<p class="map_up">
					<a>稿件管理中心</a>
				</p>
<!-- 				<input type="hidden" name="pageNum" value="">
 -->				<ul style="display: block;">
 					<li>
						<a href="../essay/selectEssayByUsernameAndStatusId.do?statusId=60&pageCode=1">未完成稿件</a>
					</li>
					<li>
						<a href="../essay/selectEssayByUsernameAndStatusId.do?statusId=67&pageCode=1">待修改稿件</a>
					</li>
					<li>
						<a href="../essay/selectEssayByUsernameAndStatusId.do?statusId=61&pageCode=1">已投稿件</a>
					</li>
					<li>
						<a href="../essay/selectEssayByUsernameAndStatusId.do?statusId=66&pageCode=1">已通过稿件</a>
					</li>
				</ul>
				<p class="map_up map_down">
					<a>信息管理</a>
				</p>
				<ul style="display: block;">
					
					<li>
						<a href="../lMessage/selectLMessageByUsernameAState.do?lMessageState=2&pageCode=1">接收信息</a>
					</li>
					<li>
						<a href="../lMessage/selectLMessageByUsernameAState.do?lMessageState=1&pageCode=1">已发送信息</a>
					</li>
					<li>
						<a href="../lMessage/selectLMessageByUsernameAState.do?lMessageState=0&pageCode=1">草稿</a>
					</li>
					<li>
						<a href="../lMessage/showLMessage.do">发送消息</a>
					</li>
				</ul>
				<p class="map_up map_down">
					<a href="#">投稿</a>
				</p>
				<ul style="display: block;">
					<li>
						<a href="../essay/contributeNotice.do">导航式投稿（推荐）</a>
					</li>
					<li>
						<a href="../essay/contributeOneStep.do">一部式投稿</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>