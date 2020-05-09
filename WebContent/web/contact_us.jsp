<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>联系我们</title>
</head>
<style>
.content_magazine_details {
	width: 760px;
	height: 800px;
	border: 1px solid red;
	margin-left: 15px;
}

.magazine_title {
	width: 760px;
	height: 35px;
	background-color: rgba( 255, 250, 240, 0.5);
}

.maginze_content p{
	text-indent:5px;
	padding: 20px;
	
	
}
</style>
<body>
	<div class="body">
		<jsp:include page="../web/index_head.jsp"></jsp:include>
		<div class="content">
			<jsp:include page="../web/index_left.jsp"></jsp:include>
			<div class="content_right">
				<div class="content_magazine_details">
					<div class="magazine_title">
						<p
							style="text-align: center; font-family: '微软雅黑'; size: 16px; padding-top: 5px;">联系我们</p>
					</div>
					<div class="maginze_content">
						<P>《期刊稿见在线处理系统》编辑部联系方式</P>

						<P>地址：XXXXXXX，邮编：XXXXXX</P>

						<P>联系电话：XXXX-XXXXXXX</P>

						<P><a href="../user/showLogin.do">在线投稿</a></P>

					</div>
				</div>

			</div>
		</div>

	</div>
</body>
</html>