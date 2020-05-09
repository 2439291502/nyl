<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑管理员工作空间</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
<!-- <link rel="stylesheet" type="text/css" href="../css/author_css/author_deskwork.css"/> -->

</head>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
			<jsp:include page="author_head.jsp"></jsp:include>
			<div class="desk_content">
				<div class="left_content left">
					<div class="desk_left">
						<div class="userInfoList">
							<div class="userInfoList_gaojianchuli">
								<div class="userInfoList_gaojianchuli_tt left">
								<span style="font-size:13px;font-weight:700;padding:2px;color:#8f8adb;">用户管理中心</span>
								</div>
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
													<td width="44"></td>
													<td width="61" align="right">
												</tr>
											</tbody>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick="" style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">审核待激活用户</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="44"></td>
												<td width="61" align="right">
													<a  href="../editor/selectState.do?state=0&pageCode=1">点击查看</a>
												</td>
											</tr>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick="" style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">所有用户</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="44"></td>
												<td width="61" align="right">
													<a  href="../editor/selectAllUsers.do?pageCode=1">点击查看</a>
												</td>
											</tr>
										</table>
									</li>
									
								</ul>
							</div>
							<div class="userInfoList_yuegaochuli">
								<div class="userInfoList_yuegaochuli_tt left">
									<span style="font-size:13px;font-weight:700;padding:2px;color:#8f8adb;">稿件管理中心</span>
								</div>
								<ul>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick="" style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">待分配稿件</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="44"></td>
												<td width="61" align="right">
													<a  href="../editor/selectNContribute.do?statusId=61&pageCode=1">点击查看</a>
												</td>
											</tr>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick="" style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">已分配稿件</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="44"></td>
												<td width="61" align="right">
													<a  href="../editor/selectContributeEssay.do?pageCode=1">点击查看</a>
												</td>
											</tr>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick="" style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">已通过未刊用稿件</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="44"></td>
												<td width="61" align="right">
													<a href="../editor/selectProduce.do?statusId=66&pageCode=1"></a>
												</td>
											</tr>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick="" style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">查询期刊目录</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="44"></td>
												<td width="61" align="right">
													<a  href="../editor/selectAllPaper.do">点击查看</a>
												</td>
											</tr>
										</table>
									</li>
								</ul>
							</div>
							<div class="userInfoList_yuegaochuli">
								<div class="userInfoList_feiyongguanli_tt left">
									<span style="font-size:13px;font-weight:700;padding:2px;color:#8f8adb;">信息管理中心</span>
								</div>
								<ul>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">接收的消息</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="44"></td>
												<td width="61" align="right">
													<a  href="../lMessage/selectLMessageByUsernameAState.do?lMessageState=1&pageCode=1">点击查看</a>
												</td>
											</tr>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">已发送消息</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="44"></td>
												<td width="61" align="right">
													<a class="" href="../lMessage/selectGetLMessage.do?lMessageState=1&pageCode=1">点击查看</a>
												</td>
											</tr>
										</table>
									</li>
									
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="desk_right left">
					<div class="desktopAuthorArea">
						<div class="desktopAuthorAreaTitle"></div>
						<a href="../essay/contributeNotice.do">导航式投稿（推荐）</a> <a href="../essay/contributeNotice.do">一步式投稿</a>

					</div>
					<div class="author_contribute"></div>
				</div> -->
			</div>

		</div>
		<jsp:include page="../web/foot.jsp"></jsp:include>

	</div>
</body>

</html>