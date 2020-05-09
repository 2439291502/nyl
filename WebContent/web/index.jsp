<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>稿件处理系统首页</title>
<link rel="stylesheet" type="text/css" href="../css/index_css/index_css.css" />
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
								<!-- <form method="post" action="../paper/selectPaperByTitle.do"> -->
									<input class="input_text" type="text" id="title" name="title" value="" placeholder="输入稿件期刊稿标题"/> 
									<input class="input_button" type="button" id="btnSelect" value="搜索" />
									<input class="input_button" type="button" id="btnShowSelect" value="高级搜索" />
								<!-- </form> -->
							</div>
							<ul class="contbox_list">
								<c:forEach items="${paperList}" var="paper">
								<span style="padding:5px;font-size:16px;">${paper.essayStyle.styleName}*${paper.columns}</span>
								<li>
									<h3>
										<a href="../paper/selectPaperDetails.do?paperId=${paper.paperId}" title="复制稿件标题">${paper.essay.title}</a>
									</h3>
									<br>
									<span>作者:${paper.essay.username}</span> 
									<br>
									<span style="color: #000000;">${paper.year}年${paper.issue}期                       
										[下载次数 <font color="red">${paper.downTime}</font>]
										[浏览次数 <font color="red">${paper.readTime}</font>]
									</span>
										<a href="../paper/selectPaperDetails.do?paperId=${paper.paperId}">【在线阅读】</a> 
										<a href="../paper/download.do?contentUrl=${essayInfo.contentUrl}?paperId=${paper.paperId}">【下载文档】</a>
									<br/>
								</li>
								</c:forEach>
							</ul>
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
	$("#btnSelect").click(function(){
		var title=$("#title").val();
		 location.href="../paper/selectPaperByTitle.do?title="+title;
	 });
	 $("#btnShowSelect").click(function(){
		 location.href="../paper/showSelectPaper.do";
	 });
});	
</script>
</body>
</html>