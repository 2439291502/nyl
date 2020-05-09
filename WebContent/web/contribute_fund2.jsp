<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看稿件基金列表</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
</head>
<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>

<script>
$(function() {
	//btnReturn
	$('#btnReturn').click(function() {		 
		location.href = "../editor/selectNContribute.do?statusId=61&pageCode=1";
	});
});
</script>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
			<div class="work left">
				<div>
					<input type="hidden" name="essayId" value="${essay.essayId }">
					<div class="createmanu" align="left">
					<table>
						<tr>
							<td width="50%">基金项目</td>
							<td></td>
						</tr>
						<tr>
							<td>本篇文章的基金列表</td>
							<td align="right">
								
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
								</tr>
								<c:forEach items="${fundList}" var="fund">
								<tr>
									<td width="20%" align="center">${fund.fundLevel}</td>
									<td width="20%" align="center">${fund.fundCName}</td>
									<td width="20%" align="center">${fund.fundEName}</td>
									<td width="10%" align="center">${fund.fundNumber}</td>
									<td width="20%" align="center">${fund.fundPs }</td>
								</tr>
								</c:forEach>
								<tr>
								<td align="right"><input class="linkbtn" type="button" id="btnReturn" value="返回" /></td>
								</tr>
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