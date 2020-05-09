<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投稿前最后确认</title>
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
						<font style="font-size:18px;">
						投稿前最后确认
			    		</font>
					</div>
					<input type="hidden" name="essay" value="${essay.essayId }"/>
					<input type="hidden" name="leaveMessageId" value="${essay.lMessage.leaveMessageId }">
					<div class="createmanu" align="left">
						<table style="border-collapse:collapse;border:1px solid #000;" width="100%" border="1">
							<tbody>
								<tr>
									<td nowrap="nowrap" height="25" align="left"><b>稿件标题</b></td>
									<td align="left" width="85%">${essay.title }</td>
									<td width="10%" height="25" align="center"><a href="#">修改</a></td>
								</tr>
								<tr>
									<td nowrap="nowrap" height="25" align="left"><b>稿件英文标题</b></td>
									<td align="left" width="85%">${essay.etitle }</td>
									<td width="10%" height="25" align="center"><a href="#">修改</a></td>
								</tr>
								<tr>
									<td nowrap="nowrap" height="25" align="left"><b>稿件作者</b></td>
									<td align="left" width="85%">${essay.username }</td>
									<td width="10%" height="25" align="center"><a href="#">修改</a></td>
								</tr>
								<tr>
									<td nowrap="nowrap" height="25" align="left"><b>稿件摘要</b></td>
									<td align="left" width="85%">${essay.abstracts }</td>
									<td width="10%" height="25" align="center"><a href="#">修改</a></td>
								</tr>
								<tr>
									<td nowrap="nowrap" height="25" align="left"><b>英文稿件摘要</b></td>
									<td align="left" width="85%">${essay.englishAbstract }</td>
									<td width="10%" height="25" align="center"><a href="#">修改</a></td>
								</tr>
								<tr>
									<td nowrap="nowrap" height="25" align="left"><b>稿件关键词</b></td>
									<td align="left" width="85%">${essay.keywords}</td>
									<td width="10%" height="25" align="center"><a href="#">修改</a></td>
								</tr>
								<tr>
									<td nowrap="nowrap" height="25" align="left"><b>稿件学科分类信息</b></td>
									<td align="left" width="85%">${essay.essayStyle.styleName}</td>
									<td width="10%" height="25" align="center"><a href="#">修改</a></td>
								</tr>
								<tr></tr>
								<tr>
									<td nowrap="nowrap" height="25" align="left"><b>参考文献</b></td>
									<td align="left" width="85%">${essay.reference}</td>
									<td width="10%" height="25" align="center"><a href="#">修改</a></td>
								</tr>
								<tr>
									<td nowrap="nowrap" height="25" align="left"><b>留言</b></td>
									<td align="left" width="85%">${essay.lMessage.lMessageContent}</td>
									<td width="10%" height="25" align="center"><a href="#">修改</a></td>
								</tr>
								<tr>
									<td nowrap="nowrap" height="25" align="left"><b>原稿</b></td>
									<td align="left" width="85%">${essay.contentUrl}</td>
									<td width="10%" height="25" align="center"><a href="#">修改</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="createmanu" align="left">
						请确认您填写的信息，如果没有问题请点击
						<a href="../essay/contributeSuccess.do?essayId=${essay.essayId}&leaveMessageId=${essay.lMessage.leaveMessageId}" style="cursor:hand;">
							<img src="../img/author_img/btnContribute.png" width="98" height="25" style="margin-top:3px;"/>
						</a>
						<br>
						如果放弃以上的内容请点击
						<a href="../essay/saveEssay.do?essayId=${essay.essayId}" style="cursor:hand;">
							<img src="../img/author_img/btnReturn.jpg" width="98" height="25"/>
						</a>.以上信息将保存在“未完成投稿”列表中.
						<br>
						<font color="red"><b>注意：</b></font>
						<br>（1）投稿成功以后，稿件仍然可以修改，但是在稿件开始审理之后，稿件将不能修改。
						<br>（2）如果编辑部根据审稿意见要求您修改的，该稿件将出现在作者主界面的“需要修改稿件”列表中。
						<br>（3）如果您取消投稿或关闭本窗口，则本稿件将出现在作者主界面的“草稿”列表中，您可以继续投稿。	
					</div>
				</div>
			</div>
		</div>				 
	</div>
<jsp:include page="../web/foot.jsp"></jsp:include>
</body>
</html>