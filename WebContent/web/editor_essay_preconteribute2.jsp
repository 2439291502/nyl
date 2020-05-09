<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台信息管理中心</title>
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
							<span>后台信息管理中心</span><span>》》稿件信息管理中心》》</span><span style="font-weight: 700;">系统用户信息</span>
						</div>
						<div class="stepHelpInfo">
							<div>
								请从左侧栏目导航中选择相应功能栏目完成处理操作
							</div>
						</div>
					</div>
					<div class="workTable">
						<div class="workTable_ctrl">
							<table>
								<tbody>
									<tr>
										<td width="30%"></td>
										<td align="center">
											共
											<font color="red"><b>${pageInfo.total}</b></font>
											条记录
										</td>
										<td width="20%">
											每页显示
											<font color="green"><b>10</b></font>条记录 
										</td>
										<td width="25%">
											<input type="text" name="username" id="username" value="" style="width:158px;" placeholder="输入用户名">
											<input type="button" id="btnSelect" style="width:50px;height:21px;cursor: pointer;" value="🔍"/>
										</td>
									</tr>
									<tr></tr>
								</tbody>
							</table>
						</div>
						<div class="workTable_main1">
						<c:if test="${pageInfo!=null}">
							
							<table width="963">
								<tr>
									<th width="10%">稿件编号</th>
									<th width="10%">稿件标题</th>
									<th width="10%">稿件关键词</th>
									<th width="10%">稿件类别</th>
									<th width="10%">基金信息</th>
									<th width="20%">留言</th>
									<th width="10%">提交时间</th>
									<th width="10%">稿件状态</th>
									<th width="10%">操作</th>
								</tr>
								<c:forEach items="${pageInfo.list}" var="essay">
								<input type="hidden" name="styleId" class="styleId" value="${essay.styleId}">
								<tr>
									<td><a href="../essay/download.do?contentUrl=${essayInfo.contentUrl}">${essay.essayId}</a></td>
									<td>${essay.title}</td>
									<td>${essay.keywords}</td>
									<td>${essay.essayStyle.styleName}</td>
									<td><a href="" title="点击查看详情"><font color="red">点击查看详情</font></a></td>
									<td title="${essay.lMessage.lMessageContent}">留言${essay.lMessage.lMessageContent}</td>
									<td><fmt:formatDate  value="${essay.contributeDate}" type="both" pattern="yyyy.MM.dd"/></td>
									
									<c:if test="${essay.statusId eq 61 }">
										<td><a id="${essay.styleId}addCheckUser" title="点击去分配"><font color="red">待分配</font></a></td>
									</c:if>
									<c:if test="${essay.statusId != 61}">
										<td><font color="bule">已分配</font></td>
									</c:if>
									<td>
										<a href="">修改</a>
									</td>
								</tr>
							</c:forEach>
							</table>
							</c:if>
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
															<input type="checkbox" id="all"  value=""/>
														</td>
														<td align="left">
															<input type="button" value="批量激活" onclick="toUpdate()">
														</td>
														<td>
															<input type="button" value="批量冻结用户" onclick="freezeUsers()">
														</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td width="18%" align="right"></td>
										<td align="right" width="325" style="margin-right: 50px;">
											<input type="hidden" name="pageCode" id="pageCode" value="${pageInfo.pageNum}">
											<input type="hidden" name="prePage" id="prePage" value="${pageInfo.prePage}">
											<input type="hidden" name="nextPage" id="nextPage" value="${pageInfo.nextPage}">
											<input type="hidden" name="pages" id="pages" value="${pageInfo.pages}">
											第<font color="red">${pageInfo.pageNum}</font>/${pageInfo.pages}页    
										
											<a href="../editor/selectAllUsers.do?pageCode=1">首页</a>
											<c:if test="${pageInfo.hasPreviousPage }">
												<a href="../editor/selectAllUsers.do?pageCode=${pageInfo.prePage}">上一页</a>
											</c:if>
											<c:if test="${pageInfo.hasNextPage }">
											<a href="../editor/selectAllUsers.do?pageCode=${pageInfo.nextPage}">下一页</a>
											</c:if>
											<a href="../editor/selectAllUsers.do?pageCode=${pageInfo.pages}">尾页</a> 
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
<script src="../scripts/js/jquery-3.1.1.min.js"type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	//btnSelect
	/* $('#btnSelect').click(function(){
		var username=$('#username').val();
		location.href = "../editor/selectUsersByUsername.do?pageCode=1&username="+username;
	}); */
	//弹框
	$(".styleId").each(function(){
		var styleId=$(this).val();
		console.log(styleId);
		$("#"+styleId+"addCheckUser").click(function(){
			
			layui.use( 'layer', function(){
				layer = layui.layer 
				layer.open({
				      type: 2,
				      title: '编辑产品',
				      maxmin: true,
				      shadeClose: true, //点击遮罩关闭层
				      area : ['800px' , '520px'],
				      content:'../editor/preAddCheckUser.do?styleId='+styleId,
				    });
				});
		});
	});
	
	$('#jumpBtn').click(function(){
		var statusId=$('#statusId').val();
		var pageCode=$('#jumpNumTxt').val();
		var pages=$('#pages').val();
		if(pageCode==''||pageCode>pages){
			alert("跳转页面不存在！");
		}
		location.href = "../editor/selectNContribute.do?statusId=61&pageCode="+pageCode;

	});
});
</script>
</body>

</html>