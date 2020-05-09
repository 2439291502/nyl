<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询期刊结果</title>
<link rel="stylesheet" type="text/css" href="../css/index_css/index_css.css" />
<link rel="stylesheet" type="text/css" href="../css/all_paper_list.css" />

</head>
<body>
	<div class="body">
		<jsp:include page="../web/index_head.jsp"></jsp:include>
		<div class="content">
			<jsp:include page="../web/index_left.jsp"></jsp:include>
			<div class="right2">
				 <h3 align="center" class="paper_title">期刊列表</h3>
				 <c:forEach items="${paperList}" var="paper">
 				 <h4 class="list_columns">${paper.columns}</h4>
					 <ul class="contbox_list1">
			 		<li>
						<h3 align="center">
							<a href="#" title="复制稿件标题">
								<font style="font-size:15px;">${paper.essay.title}</font>
							</a>
						</h3> 
						<br>
						<span>作者：${paper.essay.username}</span> 
						<span style="color: #000000;">
						${paper.year}年${paper.issue}期 
						 [下载次数 <font color="red">${paper.downTime}</font>]
						 [浏览次数 <font color="red">${paper.readTime}</font>]
					</span> 
					<div class="operate_link">
						<a href="../paper/selectPaperDetails.do?paperId=${paper.paperId}">【在线阅读】</a>
						<a href="../essay/download.do?contentUrl=${essayInfo.contentUrl}">【下载文档】</a>
					</div>	
					</li>
				</ul>
				</c:forEach>
				
		   </div>
		</div>
	</div>
	
	<jsp:include page="../web/foot.jsp"></jsp:include>
</body>
</html>