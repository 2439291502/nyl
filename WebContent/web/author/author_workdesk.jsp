<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>作者工作空间</title>
</head>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
			<jsp:include page="../author/author_head.jsp"></jsp:include>
			<div class="desk_content">
				<div class="left_content left">
					<div class="desk_left">
						<div class="userInfoList">
							<div class="userInfoList_gaojianchuli">
								<div class="userInfoList_gaojianchuli_tt left"></div>
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
													<td width="64"></td>
													<td width="41" align="right">合计</td>
												</tr>
											</tbody>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick="" style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">待修理稿件</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="64"></td>
												<td width="41" align="right">
													<a href="#">0篇</a>
												</td>
											</tr>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick="" style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">已投稿件</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="64"></td>
												<td width="41" align="right">
													<a href="#">0篇</a>
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
												<td width="64"></td>
												<td width="41" align="right">
													<a href="#">0篇</a>
												</td>
											</tr>
										</table>
									</li>

								</ul>
							</div>
							<div class="userInfoList_yuegaochuli">
								<div class="userInfoList_yuegaochuli_tt left"></div>
								<ul>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick="" style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">我为通讯作者的投稿</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="64"></td>
												<td width="60" align="right">
													<a href="#">0篇</a>
												</td>
											</tr>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick="" style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">待我提交的约稿稿件</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="64"></td>
												<td width="41" align="right">
													<a class="" href="">0篇</a>
												</td>
											</tr>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr onclick="" style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">已完成约稿稿件</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="64"></td>
												<td width="41" align="right">
													<a href="#">0篇</a>
												</td>
											</tr>
										</table>
									</li>
								</ul>
							</div>
							<div class="userInfoList_yuegaochuli">
								<div class="userInfoList_feiyongguanli_tt left"></div>
								<ul>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">审稿费</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="64"></td>
												<td width="41" align="right">
													<a  href="#">0篇</a>
												</td>
											</tr>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">版面费</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="64"></td>
												<td width="41" align="right">
													<a class="" href="#">0篇</a>
												</td>
											</tr>
										</table>
									</li>
									<li>
										<table width="488" border="0" cellpadding="0" cellspacing="0">
											<tr
												style="cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
												<td width="135" align="left">作者费</td>
												<td width="51"></td>
												<td width="53"></td>
												<td width="82"></td>
												<td width="71"></td>
												<td width="64"></td>
												<td width="41" align="right">
													<a href="#">0篇</a>
												</td>
											</tr>
										</table>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="desk_right left">
					<div class="desktopAuthorArea">
						<div class="desktopAuthorAreaTitle"></div>
						<a href="#">导航式投稿（推荐）</a> <a href="#">一步式投稿</a>

					</div>
					<div class="author_contribute"></div>
				</div>
			</div>

		</div>
		<jsp:include page="../../web/foot.jsp"></jsp:include>

	</div>
</body>

</html>