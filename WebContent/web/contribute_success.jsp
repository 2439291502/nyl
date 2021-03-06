<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投稿成功</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
</head>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
		<jsp:include page="../web/author_head.jsp"></jsp:include>
			<jsp:include page="../web/contribute_left.jsp"></jsp:include>
			<div class="work left">
				<div>
					<div class="createmanu" align="center">
						<font color="red" style="font-size: 20px; font-weight: 700;">
						投稿成功！！
						</font>
					</div>
					<input type="hidden" name="essay" value="essayId"/>
					<div class="createmanu" align="left">
						<div style="WORD-BREAK: break-all">
							<br />
							尊敬的<b>${essay.username }</b>作者，您们好。
							<br />
							<br /> 非常感谢您给本刊投稿。
							<br />
							<br /> 您们的稿件 "
							<strong>${essay.title }</strong> " 已经成功投递到编辑部, 一旦编辑部接受该投稿, 系统将对它进行编号。请等待编辑部进一步通知, 我们将尽快处理, 并把审稿意见及时反馈给您。
							<br />
							<br /> 您可以用投稿时的帐号登录本刊作者中心,随时查阅该稿件的处理进度.
						</div>
						<div style="WORD-BREAK: break-all">
							稿件审查结果一般在2～3月之内通知作者，有个别稿件可能送审时间较长，如果超过3个月后仍未接到审稿结果，作者可与编辑部取得联系后自投他处。
							<br />
							<br />再次感谢您们的投稿,欢迎继续投稿.
							<br />
							<br />&asymp;&asymp;&asymp;&asymp;&asymp;&asymp;&asymp;&asymp;&asymp;&asymp;&asymp;&asymp;&asymp;&asymp;&asymp;&asymp;&asymp;&asymp;&asymp;&asymp;&asymp;&asymp;&asymp;&asymp;编辑部门
							<br />
							<br />
						</div>
					</div>
					<div class="createmanu" align="left">
						<a href="../essay/paperCenter.do">
							<img src="../img/author_img/btnReturn.jpg" />
						</a>
					</div>
				</div>
			</div>
		</div>				 
	</div>
<jsp:include page="../web/foot.jsp"></jsp:include>
</body>
</html>