<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>期刊稿件在线处理系统首页</title>
<link rel="stylesheet" type="text/css" href="../css/index_css/index_css.css" />
<link rel="stylesheet" type="text/css" href="../css/all_paper_list.css" />
</head>
<body>
	<div class="body">
		<jsp:include page="../web/index_head.jsp"></jsp:include>
		<div class="content">
			<jsp:include page="../web/index_left.jsp"></jsp:include>
			<div class="content_right">
				<jsp:include page="../web/index_centerTop.jsp"></jsp:include>
				<div class="paper">
					<div class="paper_list">
						<jsp:include page="../web/index_list_nav.jsp"></jsp:include>
						<div class="list">
							<div class="select_paper">
								<form method="post" action="../paper/selectPaperByTitle.do">
									<input class="input_text" type="text" id="title" name="title" value="" placeholder="输入稿件期刊稿标题"/> 
									<input class="input_button" type="submit" value="搜索" />
									<input class="input_button" type="button" id="btnShowSelect" value="高级搜索" />
								</form>
							</div>
							<div class="workTable">
							<table width="80%"  align="center" style="line-height:35px;border-collapse: collapse;margin-left: 5px;">
							<c:forEach items="${yearList}" var="year">
							<tr>
								<td align="center" style="background-color: #EEE;border-bottom: 1px solid #aaa;"><c:out value="${year.key}"></c:out></td>
								<c:choose>
									<c:when test="${fn:length(year.value)<2}">
										<td>	
										<span class="paper_link"><a href="../index/selectPaperByYearAIssue?year=${year.key}&issue=01">01</a></span>
										</td>
									</c:when>
									<c:otherwise>
										<td align="left" style="border-bottom: 1px solid #aaa;">	
										<span class="paper_link"><a href="../index/selectPaperByYearAIssue.do?year=${year.key}&issue=01">01</a></span>
										</td>
										<td align="left" style="border-bottom: 1px solid #aaa;">
										<span class="paper_link"><a href="../index/selectPaperByYearAIssue.do?year=${year.key}&issue=02">02</a></span>
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
							</c:forEach>
						</table>
						</div>
						</div>
					</div>
				</div>
				<jsp:include page="../web/index_link.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<jsp:include page="../web/foot.jsp"></jsp:include>
<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>
<script>
$(function(){
	//btnSelect
	$("#btnSelect").click(function(){
		var title=$('#title').val();
		if(title){
			
		}
		 location.href="../paper/showSelectPaper.do";
	 });
	 $("#btnShowSelect").click(function(){
		 location.href="../paper/showSelectPaper.do";
	 });
});
	
	
	
	
</script>
</body>
</html>