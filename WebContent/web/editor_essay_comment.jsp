<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>已分配稿件信息</title>
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
											<input type="text" name="title" id="title" value="" style="width:158px;" placeholder="稿件标题">
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
									<th width="10%">稿件类型</th>
									<th width="10%">分配编辑</th>
									<th width="10%">审核专家</th>
									<th width="20%">审核时间</th>
									<th width="10%">稿件状态</th>
									<th width="10%">专家审核结果</th>
								</tr>
								<c:forEach items="${pageInfo.list}" var="cEssay">
								<%-- <input type="hidden" name="styleId" id="styleId" value="${essay.styleId}">
								<input type="hidden" name="essayId" class="essayId" value="${essay.essayId}"> --%>
								<tr>							
									<td><a href="../essay/download.do?contentUrl=${essayInfo.contentUrl}">${cEssay.essayId}</a></td>
									<td>${cEssay.essay.title}</td>
									<td>${cEssay.essay.keywords}</td>
									<td>${cEssay.essay.essayStyle.styleName}</td>
									<td>${cEssay.editorId}</td>
									<td>${cEssay.checkUserId}</td>
									<td><fmt:formatDate  value="${cEssay.eCommentList.commentDate}" type="both" pattern="yyyy.MM.dd"/></td>
									<c:if test="${cEssay.essay.statusId eq 63}">
										<td>
											专已家审核
										</td>
										<td>
											<a href="">查看审核详情</a>
										</td>
									</c:if>
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
															<!-- <input type="checkbox" id="all"  value=""/> -->
														</td>
														<td align="left">
															<!-- <input type="button" value="批量激活" onclick="toUpdate()"> -->
														</td>
														<td>
														<!-- 	<input type="button" value="批量冻结用户" onclick="freezeUsers()"> -->
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
											<%-- <input type="button" id="firstPage" value="首页">
											<c:if test="${pageInfo.hasPreviousPage }">
												<input type="button" id="prePage" value="上一页">
											</c:if>
											<c:if test="${pageInfo.hasNextPage }">
												<input type="button" id="prePage" value="下一页">
											</c:if> 
											<input type="button" id="pages" value="尾页">   --%>   
											<a href="../editor/selectEssayComment.do?pageCode=1">首页</a>
											<c:if test="${pageInfo.hasPreviousPage }">
												<a href="../editor/selectEssayComment.do?pageCode==${pageInfo.prePage}">上一页</a>
											</c:if>
											<c:if test="${pageInfo.hasNextPage }">
											<a href="../editor/selectEssayComment.do?pageCode==${pageInfo.nextPage}">下一页</a>
											</c:if>
											<a href="../editor/selectEssayComment.do?pageCode==${pageInfo.pages}">尾页</a> 
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
<script type="text/javascript" src="../scripts/jquery/jquery-3.1.1.min.js"></script>

<script src="../scripts/layui.js"type="text/javascript"></script>
<!-- <script src="../scripts/lay/modules/layer.js"type="text/javascript"></script>
<script src="../scripts/layui.all.js" type="text/javascript"></script> -->
<script src="../scripts/lay/modules/jquery.js" type="text/javascript"></script>

<script type="text/javascript">
	//弹框
	$(".essayId").each(function(){
		var essayId=$(this).val();
		/* console.log(essayId) */
		$("#"+essayId+"addCheckUser").click(function(){
			layui.use('layer',function(){
			layer = layui.layer;  //layer初始化
			
			console.log(essayId+"addCheckUser.....")
			layer.open({
			      type: 2,
			      title: '分配稿件给相应的专家',
			      maxmin: true, 
			      shadeClose: true, //点击遮罩关闭层
			      area : ['800px' , '520px'],
			      content:'../editor/preAddCheckUser.do?essayId='+essayId,
			    });
			}); 
			
		});
	});
	//btnSelect
	$('#btnSelect').click(function(){
		var title=$('#title').val();
		location.href = "../editor/selectUsersBytitle.do?pageCode=1&title="+title;
	});
	$('#jumpBtn').click(function(){
		var statusId=$('#statusId').val();
		var pageCode=$('#jumpNumTxt').val();
		var pages=$('#pages').val();
		if(pageCode==''||pageCode>pages){
			alert("跳转页面不存在！");
		}else{
			location.href = "../editor/selectEssayComment.do?pageCode=="+pageCode;

		}
	});
</script>

</body>

</html>