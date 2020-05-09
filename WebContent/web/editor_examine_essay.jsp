<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看稿件所有评语</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
<link rel="stylesheet" type="text/css" href="../css/editor_css.css"/>

</head>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
		<jsp:include page="../web/author_head.jsp"></jsp:include>
		<div class="main contribute">
			<!-- <div class="contributeInfo1">
				投稿
				<p>
					提交新稿件（导航式） 注意：带(
					<font color="red">*</font>
					)的为必填项,各提示框的字符串计数方式为每个汉字按两个计
				</p>

			</div>
 -->			
			<div class="work_left1">
				<div class="workAreaHead">
					<div class="stepName">
						<span style="font-weight: 700;">审理稿件的基本信息及审理结果</span>
					</div>
					
					<div class="contributeContent">						 									 
						<div class="contribute_request">
							<div class="examine_f">
								<!-- <div class="examine_title">
									<h3>审理稿件的基本信息及审理结果</h3>
								</div> -->
 								<div class="examine_essayinfo">
									<table width="80%">
										<tbody>
											<tr>
												<td align="right"><strong>稿件编号:</strong></td>
												<td align="left"><font color="red"><strong><a href="../essay/download.do?contentUrl=${essayInfo.contentUrl}">${essay.essayId}</a></strong></font></td>
											</tr>
											<tr>
												<td align="right"><strong>contentUrl标题:</strong></td>
												<td align="left"><a href="../essay/download.do?contentUrl=${essayInfo.contentUrl}">${essay.title}</a></td>
											</tr>
											<tr>
												<td align="right"><strong>关键词:</strong></td>
												<td align="left">${essay.keywords}</td>
											</tr>
											<tr>
												<td align="right"><strong>投稿日期:</strong></td>
												<td align="left"><fmt:formatDate  value="${essay.contributeDate}" type="both" pattern="yyyy.MM.dd"/></td>
											</tr>
											<tr>
												<td align="right"><strong>审核稿件：</strong></td>
												<td align="left">
													<a href="../editor/showComment.do?essayId=${essay.essayId}">审核稿件</a>
													<!-- <input type="button" id="btnExamine" value="审核稿件"> -->
												</td>
											</tr>
											
										</tbody>
									</table>				
								</div>
								
								<div class="examine_table">
									<h2 style="color:#000;background:#C0D2F8;" align="center">审稿各阶段</h2>
									<h3>专家审核稿件信息</h3>
									<table width="100%"  class="list1">
										<tbody>
											<tr>
												<th>审稿编号</th>
												<th>评审人</th>
												<th>评审人ID</th>
												<th>评审结果</th>
												<th>评审详情</th>
												<th>评审时间</th>
											</tr>
											<c:forEach items="${essay.eCommentList}" var="eComment">
												<c:if test="${20 ==eComment.commentLevel}">
													<tr>
														<td>${eComment.commentId}</td>
														<td>一级专家</td>
														<td>${eComment.cUsernameId}</td>
														<td >${eComment.resultComment.resultCommentType}</td>
														<td ><a href="../editor/selectCommentDetailsById.do?essayId=${essay.essayId}&commentId=${eComment.commentId}">评审详细内容</a></td>
														<td><fmt:formatDate  value="${eComment.commentDate}" type="both" pattern="yyyy.MM.dd"/></td>
													</tr>
												</c:if>
												
												<c:if test="${21 ==eComment.commentLevel}">
													<tr>
														<td>${eComment.commentId}</td>
														<td>二级专家</td>
														<td>${eComment.cUsernameId}</td>
														<td >${eComment.resultComment.resultCommentType}</td>
														<td ><a href="../editor/selectCommentDetailsById.do?essayId=${essay.essayId}&commentId=${eComment.commentId}">评审详细内容</a></td>
														<td><fmt:formatDate  value="${eComment.commentDate}" type="both" pattern="yyyy.MM.dd"/></td>
													</tr>
												</c:if>
												<c:if test="${22 ==eComment.commentLevel}">
													<tr>
														<td>${eComment.commentId}</td>
														<td>二级专家</td>
														<td>${eComment.cUsernameId}</td>
														<td >${eComment.resultComment.resultCommentType}</td>
														<td ><a href="../editor/selectCommentDetailsById.do?essayId=${essay.essayId}&commentId=${eComment.commentId}">评审详细内容</a></td>
														<td><fmt:formatDate  value="${eComment.commentDate}" type="both" pattern="yyyy.MM.dd"/></td>
													</tr>
												</c:if>
												</c:forEach>
										</tbody>
									</table>
									<h3 style="margin-top:10px;">编辑的审核详情</h3>
									<table width="100%" class="list1">
										<tbody>
											<tr>
												<th>审稿编号</th>
												<th>评审编辑</th>
												<th>评审人ID</th>
												<th>评审结果</th>
												<th>评审详情</th>
												<th>评审时间</th>
											</tr>
											<c:forEach items="${essay.eCommentList}" var="eComment">
											<c:if test="${eComment.commentLevel ==30}">
													<tr>
														<td>${eComment.commentId}</td>
														<td>主编辑</td>
														<td>${eComment.cUsernameId}</td>
														<td >${eComment.resultComment.resultCommentType}</td>
														<td ><a href="../editor/selectCommentDetailsById.do?essayId=${essay.essayId}&commentId=${eComment.commentId}">评审详细内容</a></td>
														<td><fmt:formatDate  value="${eComment.commentDate}" type="both" pattern="yyyy.MM.dd"/></td>
													</tr>
												</c:if>
												</c:forEach>
										</tbody>
									</table>
								</div>
 							</div>
						</div>				 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../web/foot.jsp"></jsp:include>
</body>
</html>