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
				<jsp:include page="../web/author_paper_center_left.jsp"></jsp:include>
				<div class="work_left">
					<div class="workAreaHead">
						<div class="stepName">
							<span>稿件中心</span><span>》》稿件管理中心》》</span><span style="font-weight: 700;">待修稿件</span>
						</div>
						<div class="stepHelpInfo">
							<div>
								请从左侧栏目导航中选择相应功能栏目完成处理操作
							</div>
						</div>
					</div>
					
					<div class="workTable">
						<div class="workTable_tt">
							<h3>待修稿件</h3>
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
									<th style="width: 11.5%;">稿件序号</th>
									<th style="width: 11.5%;">稿件编号</th>
									<th style="width: 11.5%;">稿件标题</th>
									<th style="width: 11.5%;">稿件作者</th>
<!-- 								<th style="width: 11.5%;">稿件时间</th>
 -->								<th style="width: 11.5%;">稿件状态</th>
									<th style="width: 11.5%;">稿件分类</th>
									<th style="width: 11.5%;">投稿时间</th>
									<th style="width: 11.5%;">稿件操作</th>
								</tr>
								<c:forEach items="${pageInfo.list}" var="essayInfo">
								<input type="hidden" name="statusId" id="statusId" value="${statusId}">
								<tr>
									<td><input name="essayIds" type="checkbox" id="essayIds" value="${essayInfo.essayId}">
									</td>
									<td><a href="../essay/download.do?contentUrl=${essayInfo.contentUrl}">${essayInfo.essayId}</a></td>
									<td>${essayInfo.title}</td>
									<td>${essayInfo.username}</td>
									<td><font color="red">${essayInfo.status.statusName}</font></td>
									<td><font color="#3a4c9f">${essayInfo.essayStyle.styleName}</font></td>
									<td><fmt:formatDate  value="${essayInfo.contributeDate}" type="both" pattern="yyyy.MM.dd"/></td>
									<c:if test="${essayInfo.statusId eq 60||essayInfo.statusId eq 67}">
									<td>
										<a href="../essay/preLoadEssayInfo.do?essayId=${essayInfo.essayId}" title="修改稿件">修改</a>
										<a href="../essay/deleteEssayInfo.do?statusId=${statusId }&essayIds=${essayInfo.essayId }&pageCode=${pageInfo.pageNum}" title="删除稿件">删除</a>
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
														<input type="button" value="批量删除"   onclick="toUpdate()"></td>
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
			
			var statusId=$('#statusId').val();
			
		 	var pageCode=$('#pageCode').val();
			
		    location.href = "../essay/deleteEssayInfo.do?statusId="+statusId+"&essayIds="+chk_value+"&pageCode="+pageCode;
		}
		      
	}
	
	$('#jumpBtn').click(function(){
		var statusId=$('#statusId').val();
		var pageCode=$('#jumpNumTxt').val();
		var pages=$('#pages').val();
		if(pageCode==''||pageCode>pages){
			alert("跳转页面不能为空或不存在！");
		}else{
			location.href="../essay/selectEssayByUsernameAndStatusId.do?statusId="+statusId+"&pageCode="+pageCode;

		}
	});
	
	 
	</script>
</body>

</html>