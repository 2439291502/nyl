<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工作空间左边栏</title>
</head>
<link rel="stylesheet" type="text/css" href="../../css/author_css/author_paper_center.css"/>

<body>
<div class="map left">
	<div class="mapContainer">
		<div class="map_tt">
			<div class="map_zone selectZone">
				<a>稿件中心</a>
			</div>
			<div class="zoneCont" style="display: block;">
				<p class="map_up">
					<a>我的稿件管理</a>
				</p>
				<ul style="display: block;">
					<li>
						<a href="../../essay/selectEssayByUsernameAndStatusId.do?statusId=0">待修改稿件</a>
					</li>
					<li>
						<a href="../../essay/selectEssayByUsernameAndStatusId.do?statusId=2">待审核稿件</a>
					</li>
					<li>
						<a href="../../essay/selectEssayByUsernameAndStatusId.do?statusId=4">已通过稿件</a>
					</li>
				</ul>
				<p class="map_up map_down">
					<a>我的费用管理</a>
				</p>
				<ul style="display: block;">
					<li>
						<a href="#">审稿费(0)</a>
					</li>
					<li>
						<a href="#">版面费(0)</a>
					</li>
					<li>
						<a href="#">作者稿费(2)</a>
					</li>
				</ul>
				<p class="map_up map_down">
					<a>信息管理</a>
				</p>
				<ul style="display: block;">
					<li>
						<a href="#">编辑的信息</a>
					</li>
					<li>
						<a href="#">我发的信息</a>
					</li>
				</ul>
				<p class="map_up map_down">
					<a href="#">投稿</a>
				</p>
				<ul style="display: block;">
					<li>
						<a href="#">导航式投稿（推荐）</a>
					</li>
					<li>
						<a href="../../essay/contributeNotice.do">一部式投稿</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>