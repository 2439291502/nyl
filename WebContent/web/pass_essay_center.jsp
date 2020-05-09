<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>已通过期刊稿件</title>
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
							<span>后台信息管理中心</span><span>》》系统用户管理中心》》</span><span style="font-weight: 700;">系统用户信息</span>
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
						<div class="workTable_main">
						<c:if test="${pageInfo!=null}">
							<table width="100%">
								<tr>
									<th style="width: 11.5%;">稿件序号</th>
									<th style="width: 11.5%;">稿件编号</th>
									<th style="width: 11.5%;">稿件标题</th>
									<th style="width: 11.5%;">稿件作者</th>
        							<th style="width: 11.5%;">稿件状态</th>
									<th style="width: 11.5%;">稿件分类</th>
									<th style="width: 11.5%;">投稿时间</th>
									<th style="width: 11.5%;">稿件操作</th>
								</tr>
								<c:forEach items="${pageInfo.list}" var="essayInfo">
								<input type="hidden" name="styleId" id="styleId" value="${essayInfo.styleId}">
								<tr>
									<td><input name="essayIds" type="checkbox" id="essayIds" value="${essayInfo.essayId}">
									</td>
									<td><a href="../essay/download.do?contentUrl=${essayInfo.contentUrl}">${essayInfo.essayId}</a></td>
									<td>${essayInfo.title}</td>
									<td>${essayInfo.username}</td>
									<td>${essayInfo.statusId}</td>
									<td><font color="#85c5da"><b>${essayInfo.essayStyle.styleName}</b></font></td>
									<td><fmt:formatDate  value="${essayInfo.contributeDate}" type="both" pattern="yyyy.MM.dd"/></td>
									<td>
										<a href="../editor/selectPaperByStyle.do?styleId=${essayInfo.styleId}&essayId=${essayInfo.essayId}&pageCode=1" title="选择添加期刊栏目">选择添加期刊栏目</a>
<%-- 										<a href="../essay/deleteEssayInfo.do?statusId=${statusId }&essayIds=${essayInfo.essayId }&pageCode=${pageInfo.pageNum}" title="删除稿件">删除</a>
 --%>									</td>
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
														<input type="button" value="批量添加在期刊中"   onclick="toUpdate()"></td>
													</tr>
												</tbody>
											</table>
										</td>
										<td width="18%" align="right"></td>
										<td align="right" width="325" style="margin-right: 50px;">
											<input type="hidden" name="pageCode" id="pageCode" value="${pageInfo.pageNum}">
											<input type="hidden" name="pages" id="pages" value="${pageInfo.pages}">
											第<font color="red">${pageInfo.pageNum}</font>/${pageInfo.pages}页                  
											<a href="../editor/selectProduce.do?statusId=66&pageCode=1">首页</a>
											<c:if test="${pageInfo.hasPreviousPage }">
												<a href="../editor/selectProduce.do?statusId=66&pageCode=${pageInfo.prePage}">上一页</a>
											</c:if>
											<c:if test="${pageInfo.hasNextPage }">
												<a href="../editor/selectProduce.do?statusId=66&pageCode=${pageInfo.nextPage}">下一页</a>
											</c:if>
											<a href="../editor/selectProduce.do?statusId=66&pageCode=${pageInfo.pages}">尾页</a>
											  
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
//		var statusId=$('#statusId').val();
		var pageCode=$('#jumpNumTxt').val();
		var pages=$('#pages').val();
		if(pageCode==''||pageCode>pages){
			alert("跳转页面不能为空或不存在！");
		}else{
			location.href="../editor/selectProduce.do?statusId=66&pageCode="+pageCode;

		}
	});
	
	
	 
	</script>
</body>

</html>