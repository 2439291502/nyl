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
						<a href="../professor/selectPreHandleEssay.do?statusId=62&pageCode=1">待审核的稿件</a>
					</li>
					<li>
						<a href="../professor/selectPreHandleEssay.do?statusId=63&pageCode=1">已审核稿件</a>
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
						<a href="../lMessage/selectLMessageByUsernameAState.do?lMessageState=0&pageCode=1">草稿</a>
					</li>
					<li>
						<a href="../lMessage/selectLMessageByUsernameAState.do?lMessageState=1&pageCode=1">已发送消息</a>
					</li>
					<li>
						<a href="../lMessage/showLMessage.do">发送消息</a>
					</li>
				</ul>
				
			</div>
		</div>
	</div>
</div>
</body>
</html>