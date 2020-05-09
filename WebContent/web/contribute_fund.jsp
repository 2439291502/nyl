<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>填写稿件基金</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
</head>
<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
//addAuthor
$(function(){
	$("#btnAddFund").click(function(){
		location.href="../essay/addContributeFund.do";
	});
});
</script>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
		<jsp:include page="../web/author_head.jsp"></jsp:include>
		<jsp:include page="../web/contribute_left.jsp"></jsp:include>
			<div class="work left">
				<div class="linkcss">
					<a href="../essay/contributeReference.do" style="cursor:hand;">
						<img src="../img/author_img/btnPre.jpg" width="68" height="25"/>
					</a>
					<a href="../essay/contributeLeaveMessage.do" style="cursor:hand;">
						<img src="../img/author_img/btnNext.jpg" width="68" height="25"/>
					</a>	
				</div>	
				<div>
					<input type="hidden" name="essayId" value="${essay.essayId }">
					<%-- <input type="hidden" name="fundId" value="${fund.fundId }"> --%>
					<div class="createmanu" align="left">
					<table>
						<tr>
							<td width="50%">基金项目</td>
							<td></td>
						</tr>
						<tr>
							<td>本篇文章的基金列表</td>
							<td align="right">
								<input type="button" id="btnAddFund" value="添加基金" style="">
								<!-- <a class="fundlink" href="../essay/addContributeFund.do">添加基金</a> -->
							</td>
						</tr>
					</table>
						<table class="list" cellpadding="2" border="1" cellspacing="0">
							<tbody>
								<tr>
									<th width="20%" align="center">基金级别</th>
									<th width="20%" align="center">基金中文名</th>
									<th width="20%" align="center">基金英文名</th>
									<th width="10%" align="center">基金号</th>
									<th width="20%" align="center">备注</th>
									<th width="10%" align="center">操作</th>
								</tr>
								<c:forEach items="${essay.fundList}" var="fund">
								<tr>
									<td width="20%" align="center">${fund.fundLevel}</td>
									<td width="20%" align="center">${fund.fundCName}</td>
									<td width="20%" align="center">${fund.fundEName}</td>
									<td width="10%" align="center">${fund.fundNumber}</td>
									<td width="20%" align="center">${fund.fundPs }</td>
									<c:if test="${not empty fund.fundId }">
									<td width="10%" align="center">
										<a href="../essay/deleteFund.do?fundId=${fund.fundId}">删除</a>
									</td>
									</c:if>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>				 
	</div>
<jsp:include page="../web/foot.jsp"></jsp:include>
</body>
</html>