<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>请看稿件详情</title>
</head>
<link rel="stylesheet" type="text/css" href="../css/paper_details.css"/>
<script type="text/javascript" src="../scripts/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript">
$(function() {
	$(".download").click(function(){ 
		var contentUrl=$("#contentUrl").val();
		var essayId=$("#essayId").val();
		location.href="../essay/download.do?contentUrl="+contentUrl+"&essayId="+essayId;
	});
});
</script>
<body>
<div>
	<div class="header">
		<div class="header_title">
			<h3>期刊稿在线处理系统</h3>
			<h2>${paper.year}年${paper.issue}期,${paper.essayStyle.styleName}</h2>
			<br><fmt:formatDate type="both" pattern="yyyy.MM.dd" value="${paper.date}"/>
		</div>
		<div class="header_close">
		<!-- [<a>打印页面</a>] -->
		[<a href="../index/showIndex.do">关闭页面</a>]
		
		</div>
		<div class="header_info">
		<a href="../paper/selectPaperByYearAIssue.do?year=${paper.year}&issue=${paper.issue}">本期刊目录</a>|
		<a href="../index/selectPaperCatalog.do">过往期刊</a>|
		<a href="../paper/showSelectPaper.do">高级搜素</a>
		
		</div>
	</div>
 	<div class="main">
		<h3>
			<input type="hidden" name="contentUrl" id="contentUrl" value="${paper.essay.contentUrl}">
			<input type="hidden" name="essayId" id="essayId" value="${paper.essay.essayId}">
			<input class="download" value="立即下载文档" style="font-weight:700;margin-left:5px;">
			<span id="lblDownUrl"></span>
			${paper.essay.title}
			<br>
			${paper.essay.etitle}
		</h3>
		<div style=" width:85%; float:left;">
			<div class="content1">
				<h4>${paper.essay.etitle}</h4>
				<ul>
					<li class="authorUnit1" style="display: block;">1工作单位:${paper.essay.user.workUnit}</li>
				</ul>
				<p id="Abstract">
					<strong>摘要(Abstract):</strong>
				</p>
				<p>${paper.essay.abstracts}</p>
				<br>
				<p id="">
					<strong>摘要(KeyWords):</strong>${paper.essay.keywords}
				</p>
				<p id="">
					<strong>作者(Author):${paper.essay.username}</strong>
				</p>
				<p id="">
					<strong>Email:</strong>
				</p>
			</div>
			<div class="content1">
				<h4>参考文献(References):</h4>
				<ul class="UL_list1">
					<li>
						<a>${paper.essay.reference}</a>
					</li>
					<li>
						<a>[1]习近平.在庆祝中国共产党成立95周年大会上的讲话[J].党的文献, 2016,(4).</a>
					</li>
					<li>
						<a>[2]习近平.在庆祝中国共产党成立95周年大会上的讲话[J].党的文献, 2016,(4).</a>
					</li>
					<li>
						<a>[3]习近平.在庆祝中国共产党成立95周年大会上的讲话[J].党的文献, 2016,(4).</a>
					</li>
					<li>
						<a>[4]习近平.在庆祝中国共产党成立95周年大会上的讲话[J].党的文献, 2016,(4).</a>
					</li>
					<li>
						<a>[5]习近平.在庆祝中国共产党成立95周年大会上的讲话[J].党的文献, 2016,(4).</a>
					</li>
					<li>
						<a>[6]习近平.在庆祝中国共产党成立95周年大会上的讲话[J].党的文献, 2016,(4).</a>
					</li>
				</ul>
			</div>
		
		</div>
		<div class="addAction" style=" width:12%; float:left;" ></div>
	
	</div>
	<div class="footer">Copyright by 期刊稿在线处理系统</div>
</div>

</body>
</html>