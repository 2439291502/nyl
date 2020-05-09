<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>稿件管理中心</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
</head>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
			<jsp:include page="author_head.jsp"></jsp:include>
			<div class="main">
				<jsp:include page="../web/professor_paper_center_left.jsp"></jsp:include>
				<div class="work_left">
					<div class="workAreaHead">
						<div class="stepName">
							<span>稿件中心</span>》》<span style="font-weight: 700;">稿件管理中心</span>
						</div>
						<div class="stepHelpInfo">
							<div>
								请从左侧栏目导航中选择相应功能栏目完成处理操作
							</div>
						</div>
					</div>
					
					<div class="workTable">
						<!-- <div class="workTable_tt">
							<h3>待修稿件</h3>
						</div> -->
						<div class="workTable_ctrl">
							<table>
								<tbody>
									<tr>
										<td width="50%"></td>
										<td align="center">
											共
											<b><font color="red">${pageInfo.total}</font></b>
											条记录
										</td>
										<td width="20%">
											每页显示
											<b><font color="red">6</font></b>条记录 
											<!-- <a href="#">20</a>条记录 -->
										</td>
									</tr>
									<tr></tr>
								</tbody>
							</table>
						</div>
						<div class="workTable_main1">
						<c:if test="${pageInfo.list!=null}">
							<table width="100%">
								<tr>
									<th style="width: 5%;"></th>
									<th style="width: 5%;">编号</th>
									<th style="width: 40%;">标题</th>
									<th style="width: 10%;">作者</th>
									<th style="width: 5%;">关键词</th>
									<th style="width: 5%;">投稿人</th>
									<th style="width: 7%;">稿件状态</th>
									<th style="width: 8%;">分配时间</th>
									<th style="width: 10%;">稿件操作</th>
								</tr>
								<c:forEach items="${pageInfo.list}" var="cEssay">
							<%-- 	<input type="hidden" name="statusId" id="statusId" value="${statusId}"> --%>
								<tr>
									<td><input name="essayIds" type="checkbox" id="essayIds" value="${cEssay.essayId}">
									</td>
									<td><a href="../essay/download.do?contentUrl=${essayInfo.contentUrl}">${cEssay.essayId}</a></td>
									<td>${cEssay.essay.title}</td>
									<td>${cEssay.essay.username}</td>
									<td>${cEssay.essay.keywords}</td>
									<td>${cEssay.essay.contributor}</td>
									<c:if test="${cEssay.essay.statusId eq 62}">
										<td><font color="red">未审核</font></td>
										<td><fmt:formatDate  value="${cEssay.contributeDate}" type="both" pattern="yyyy.MM.dd"/></td>
										<td>
											<a href="../professor/showComment.do?essayId=${cEssay.essayId}" title="点击审核稿件">审核稿件</a>
											<a href="../professor/rejuctComment.do?essayIds=${cEssay.essayId}&pageCode=${pageInfo.pageNum}" title="点击退理审核">退审</a>
										</td>
									</c:if>
									<c:if test="${cEssay.essay.statusId eq 63}">
										<td><font color="blue">已审核</font></td>
										<td><fmt:formatDate  value="${cEssay.contributeDate}" type="both" pattern="yyyy.MM.dd"/></td>
										<td>
											<a href="../professor/selectCommentDetails.do?essayId=${cEssay.essayId}" title="点击审核稿件">查看审核详情</a>
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
															<input type="checkbox" id="all"  value=""/>
														</td>
														<td align="left">
														<input type="button" value="批量拒绝"   onclick="toUpdate()"></td>
													</tr>
												</tbody>
											</table>
										</td>
										<td width="18%" align="right"></td>
										<td align="right" width="325" style="margin-right: 50px;">
											<input type="hidden" name="pageCode" id="pageCode" value="${pageInfo.pageNum}">
											<input type="hidden" name="pages" id="pages" value="${pageInfo.pages}">
											第<font color="red">${pageInfo.pageNum}</font>/${pageInfo.pages}页                  
											<a href="../essay/selectEssayByUsernameAndStatusId.do?statusId=${statusId}&pageCode=1">首页</a>
											<c:if test="${pageInfo.hasPreviousPage }">
												<a href="../essay/selectEssayByUsernameAndStatusId.do?statusId=${statusId}&pageCode=${pageInfo.prePage}">上一页</a>
											</c:if>
											<c:if test="${pageInfo.hasNextPage }">
												<a href="../essay/selectEssayByUsernameAndStatusId.do?statusId=${statusId}&pageCode=${pageInfo.nextPage}">下一页</a>
											</c:if>
											<a href="../essay/selectEssayByUsernameAndStatusId.do?statusId=${statusId}&pageCode=${pageInfo.pages}">尾页</a>
											  
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
	
	$("#all").click(function() {
        $(":input[name='essayIds']").prop("checked", this.checked); // this指代的你当前选择的这个元素的JS对象
    });
    
	function toUpdate(){
		var chk_value = [];//定义一个数组
		
		//利用将name等于ids的多选按钮得到
		$("input[name='essayIds']:checked").each(function(){
			//将选中额数据存到数组里
			chk_value.push($(this).val());
			
		});
		/* console.log(chk_value)
		alert(chk_value); */
		if (chk_value.length == 0) {
		    alert("你还没有选择要删除的稿件！");
		}
		if (chk_value.length > 0) {
			console.log(chk_value)
		 	var pageCode=$('#pageCode').val();
			
		    location.href = "../professor/rejuctComment.do?essayIds=${cEssay.essayId}"+chk_value+"&pageCode="+pageCode;
		}
		      
	}
	
	$('#jumpBtn').click(function(){
		var statusId=$('#statusId').val();
		var pageCode=$('#jumpNumTxt').val();
		var pages=$('#pages').val();
		if(pageCode==''||pageCode>pages){
			alert("跳转页面不能为空！");
		}
		location.href="../essay/selectEssayByUsernameAndStatusId.do?statusId="+statusId+"&pageCode="+pageCode;
	});
	
	 
	</script>
</body>

</html>