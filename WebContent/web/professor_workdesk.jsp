<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>作者工作空间</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_deskwork.css"/>

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
								<span style="font-size:13px;font-weight:700;padding:2px;color:#8f8adb;">稿件管理中心</span>
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
													<td width="61" align="right">操作</td>
												</tr>
											</tbody>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick="" style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">待审核的稿件</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="44"></td>
													<td width="61" align="right">
													<a href="../professor/selectPreHandleEssay.do?statusId=62&pageCode=1">查看详情</a>
												</td>
											</tr>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick="" style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">已审核稿件</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="44"></td>
												<td width="61" align="right">
													<a href="../professor/selectPreHandleEssay.do?statusId=63&pageCode=1">查看详情</a>
												</td>
											</tr>
										</table>
									</li>
								</ul>
							</div>
							<div class="userInfoList_yuegaochuli">
								<div class="userInfoList_yuegaochuli_tt left">
									<span style="font-size:13px;font-weight:700;padding:2px;color:#8f8adb;">消息管理中心</span>
								</div>
								<ul>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick="" style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">接收信息</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="44"></td>
												<td width="61" align="right">
													<a href="../lMessage/selectLMessageByUsernameAState.do?lMessageState=2&pageCode=1">查看详情</a>
												</td>
											</tr>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick="" style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">草稿</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="44"></td>
												<td width="61" align="right">
													<a href="../lMessage/selectLMessageByUsernameAState.do?lMessageState=0&pageCode=1">查看详情</a>
												</td>
											</tr>
										</table>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../web/foot.jsp"></jsp:include>

	</div>
</body>

</html>