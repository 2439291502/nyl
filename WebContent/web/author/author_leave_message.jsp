<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>作者信息管理</title>
</head>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
			<jsp:include page="../author/author_head.jsp"></jsp:include>
			<div class="main">
				<jsp:include page="../../web/author/author_paper_center_left.jsp"></jsp:include>
				<div class="work_left">
					<div class="workAreaHead">
						<div class="stepName">
							<span>稿件中心</span><span>》》稿费管理中心</span>
						</div>
						<div class="stepHelpInfo">
							<div>
								请从左侧栏目导航中选择相应功能栏目完成处理操作
							</div>
						</div>
					</div>
					<div class="workTable">
						<div class="workTable_tt">
							<h3>信息管理</h3>
						</div>
						<div class="workTable_ctrl">
							<table>
								<tbody>
									<tr>
										<td width="50%"></td>
										<td align="center">
											共
											<font class="redfont">0</font>
											条记录
										</td>
										<td width="30%">
											每页显示
											<a>10</a>条记录 每页显示
											<a href="#">20</a>条记录
										</td>

									</tr>
									<tr>

									</tr>
								</tbody>
							</table>

						</div>
						<div class="workTable_main">
							<table>
								<tr>
									<th style="width: 11.5%;"></th>
									<th style="width: 11.5%;">稿件序号</th>
									<th style="width: 11.5%;">稿件编号</th>
									<th style="width: 11.5%;">稿件标题</th>
									<th style="width: 11.5%;">投稿作者</th>
									<th style="width: 11.5%;">通知时间</th>
									<th style="width: 11.5%;">催交时间</th>
									<th style="width: 11.5%;">实际金额</th>
									<th style="width: 11.5%;">稿件操作</th>
								</tr>
								<tr>
									<td><input name="paperName" type="checkbox">111</input>
									</td>
									<td>稿件编号</td>
									<td>稿件标题</td>
									<td>聂玉玲</td>
									<td>2019-11-28</td>
									<td>稿件状态</td>
									<td>稿件分类</td>
									<td>投稿时间</td>
									<td>
										<a href="#" title="修改稿件">修改</a>
										<a href="#" title="删除稿件">删除</a>
									</td>
								</tr>

							</table>
						</div>
						<div class="workTable_btn">
							<table>
								<tbody>
									<tr valign="top">
										<td>
											<table width="120" cellpadding="0" cellspacing="5" border="0">
												<tbody>
													<tr>
														<td width="25">
															<input type="checkbox" name="" value="" />
														</td>
														<td align="left">取消/全选</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td width="49%" align="right"></td>
										<td align="right" width="325" style="margin-right: 50px;">
											第1页 一共5页
											<input type="button" value="第一页" />
											<input type="button" name="prePage" value="上一页" />
											<input type="button" name="nextPage" value="上一页" />
											<input type="button" value="最后页" />
										</td>
										
									</tr>
								</tbody>
							</table>
						</div>
						<div class="div_goto" style="float: right;">
							<input type="text" name="" value="1" style="width:60px; height: 26px;" />
							<input type="button" name="" value="跳转" style="width:50px" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../web/foot.jsp"></jsp:include>
</body>
</html>