<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息管理中心</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
</head>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
			<jsp:include page="author_head.jsp"></jsp:include>
			<div class="main">
				<jsp:include page="../web/editor_paper_center_left.jsp"></jsp:include>
				<div class="work_left">
					<div class="workAreaHead">
						<div class="stepName">
							<span>信息中心</span><span>》》信息管理中心》》</span><span style="font-weight: 700;">消息管理</span>
						</div>
						<div class="stepHelpInfo">
							<div>
								请从左侧栏目导航中选择相应功能栏目完成处理操作
							</div>
						</div>
					</div>
					
					<div class="workTable">
						<div class="workTable_tt">
							<h3>审核稿件中心</h3>
						</div>
						<div class="workTable_ctrl">
							<table>
								<tbody>
									<tr>
										<td width="50%"></td>
										<td align="center">
											共
											<font color="red"><b>${pageInfo.total}</b></font>
											条记录
										</td>
										<td width="20%">
											每页显示
											<font color="green"><b>4</b></font>条记录 
											<!-- <a href="#">20</a>条记录 -->
										</td>
									</tr>
									<tr></tr>
								</tbody>
							</table>
						</div>
						<div class="workTable_main">
						<c:if test="${pageInfo!=null}">
							<table width="970">
								<tr>
								   <!--  <th style="width: 11.5%;"></th> -->
									<th style="width: 10%;">留言序号</th>
									<th style="width: 10%;">留言信息编号</th>
									<th style="width: 20%;">留言内容</th>
									<th style="width: 10%;">留言|收件人</th>
									<th style="width: 10%;">留言时间</th>
									<th style="width: 10%;">操作</th>	
								</tr>
								<c:forEach items="${pageInfo.list}" var="lMessage">
								<input type="hidden" name="lMessageState" id="lMessageState" value="${lMessage.lMessageState}">
								<input type="hidden" name="pages" id="pages" value="${pageInfo.pages}">
								<tr>
									<td>${lMessage.leaveMessageId}</td>
									<c:if test="${empty lMessage.essayId}">
										<td align="center">--------</td>		
									</c:if>
									<c:if test="${not empty lMessage.essayId}">
										<td>${lMessage.essayId}</td>
									</c:if>
										
 									<td>${lMessage.lMessageContent}</td>
									<td>${lMessage.username}</td>	
									<td>${lMessage.lMessageTime}</td>
									<td>
										<c:if test="${lMessage.lMessageState eq 1}">
											<a href="../lMessage/preRespondLMessage.do?username=${lMessage.username}&essayId=${lMessage.essayId}" title="修改信息">回复</a>
										</c:if>
										<a href="../lMessage/deleteLMessage.do?leaveMessageId=${lMessage.leaveMessageId}&pageCode=${pageInfo.pageNum}&lMessageState=${lMessage.lMessageState}" title="删除信息">删除</a>
									</td>
								</tr>
							</c:forEach>
							</table>
							</c:if>
						<%-- 	<c:if test="${msg !=null }">
								<h2>${msg}</h2>
							</c:if> --%>
						</div>
						<div class="workTable_btn">
							<table>
								<tbody>
									<tr valign="top">
										<td>
											<table width="120" cellpadding="0" cellspacing="5" border="0">
												<tbody>
													<tr>
<!-- 														<td width="25">
															<input type="checkbox" id="all"  value=""/>
														</td>
														<td align="left">
														
														<input type="button" value="批量删除"   onclick="toUpdate()"></td>
 -->													</tr>
												</tbody>
											</table>
										</td>
										<td width="18%" align="right"></td>
										<td align="right" width="325" style="margin-right: 50px;">
											<input type="hidden" name="pageCode" id="pageCode" value="${pageInfo.pageNum}">
											第<font color="red">${pageInfo.pageNum}</font>/${pageInfo.pages}页                  
											<a href="../lMessage/selectLMessageByUsernameAState.do?lMessageState=1&pageCode=1">首页</a>
											<c:if test="${pageInfo.hasPreviousPage }">
												<a href="../lMessage/selectLMessageByUsernameAState.do?lMessageState=1&pageCode=${pageInfo.prePage}">上一页</a>
											</c:if>
											<c:if test="${pageInfo.hasNextPage }">
												<a href="../lMessage/selectLMessageByUsernameAState.do?lMessageState=1&pageCode=${pageInfo.nextPage}">下一页</a>
											</c:if>
											<a href="../lMessage/selectLMessageByUsernameAState.do?lMessageState=1&pageCode=${pageInfo.pages}">尾页</a>
											
										</td>
										<td>
											<div class="div_goto" style="float: right;">
												<input type="text" id="jumpNumTxt" value="" style="width:60px; height: 26px;" />
												<input type="button" id="jumpBtn" value="跳转" style="width:50px" />
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../web/foot.jsp"></jsp:include>
	<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="../scripts/js/jquery-1.10.2.min.js"></script>
	
	<script type="text/javascript">
	
	
	$('#jumpBtn').click(function(){
		var lMessageState=$('#lMessageState').val();
		var pageCode=$('#jumpNumTxt').val();
		var pages=$('#pages').val();
		if(pageCode==''||pageCode>pages){
			alert("跳转页面不能为空！");
		}
		location.href="../lMessage/selectLMessageByUsernameAState.do?lMessageState="+lMessageState+"&pageCode="+pageCode;
	});
	
	 
	</script>
</body>

</html>