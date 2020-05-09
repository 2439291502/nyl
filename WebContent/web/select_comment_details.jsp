<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>专家审理稿件</title>
</head>
<style>
* {
	font-family: microsoft YaHei;
	font-size: 14px;
}

.comment_table table tr, td {
	border: 1px solid #b4aaaa;
	line-height: 30px;
}

.comment_table table tr td input {
	height: 28px;
	background-color: #E3E3EF;
	color: #3a4c9f;
	cursor: pointer;
}

.span_words {
	text-align: center;
}

.comment_table table tr td input:hover {
	background-color: #BDBDDD;
}
</style>
<body>
	<div class="comment_table">
		<h4 align="center">请填写审核表格</h4>
		<span id="showMsg"></span>
		<form action="" id="commentForm">
		<input type="hidden" name="commentId" value="${eComment.commentId}">
		<input type="hidden" name="essayId" id="essayId" value="${eComment.essayId}">
			<table width="60%" align="center"
				style="border: 1px solid black; border-collapse: collapse;">
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<tbody>
					<tr>
						<td style="width: 10%; height: 20px; padding-left: 36px;"
							valign="middle">题目</td>
						<td style="width: 10%; height: 20px;" colspan="2">${essay.title}</td>
						<td style="width: 10%; height: 20px; padding-left: 36px;">编号</td>
						<td style="width: 10%; height: 20px;" colspan="2">${essay.essayId}</td>
					</tr>
					<tr>
						<td style="width: 10%; height: 20px; padding-left: 32px;"
							valign="middle">作者姓名</td>
						<td style="width: 10%; height: 20px;" colspan="2">${essay.username}</td>
						<td style="width: 10%; height: 20px; padding-left: 32px;"
							valign="middle">收稿时间</td>
						<td style="width: 10%; height: 20px;" colspan="2">${essay.contributeDate}</td>
					</tr>
					<tr>
						<td style="width: 10%; height: 20px; padding-left: 32px;"
							valign="middle">通讯地址</td>
						<td style="width: 10%; height: 20px;" colspan="2">${user.address}</td>
						<td style="width: 10%; height: 20px; padding-left: 32px;"
							valign="middle">邮政编码</td>
						<td style="width: 10%; height: 20px;" colspan="2">${user.postcode}</td>
					</tr>
					<tr>
						<td style="width: 10%; height: 60px; padding-left: 28px;"
							rowspan="5" valign="middle">评价参考</td>
					</tr>
					<tr>
						<td style="width: 10%; height: 20px; padding-left: 20px;"
							valign="middle">设计及方法</td>
						<td style="width: 10%; height: 20px;" valign="middle" colspan="4">
							<c:if test="${eComment.designCommentId=='1'}">
								<input type="radio" name="designCommentId" value="1" checked>
								<font color="blue"><b>${eComment.designComment.designType}</b></font>
								<input type="radio" name="designCommentId" value="2">有创新
								<input type="radio" name="designCommentId" value="3">不完整
								<input type="radio" name="designCommentId" value="4">不合理
								<input type="radio" name="designCommentId" value="5">有误
							</c:if> 
							<c:if test="${eComment.designCommentId=='2'}">
								<input type="radio" name="designCommentId" value="1">合理
								<input type="radio" name="designCommentId" value="2" checked>
								<font color="blue"><b>${eComment.designComment.designType}</b></font>
								<input type="radio" name="designCommentId" value="3">不完整
								<input type="radio" name="designCommentId" value="4">不合理
								<input type="radio" name="designCommentId" value="5">有误
							</c:if> 
							<c:if test="${eComment.designCommentId=='3'}">
								<input type="radio" name="designCommentId" value="1">合理
								<input type="radio" name="designCommentId" value="2">有创新
								<input type="radio" name="designCommentId" value="3" checked>
								<font color="blue"><b>${eComment.designComment.designType}</b></font>
								<input type="radio" name="designCommentId" value="4">不合理
								<input type="radio" name="designCommentId" value="5">有误
							</c:if> 
							<c:if test="${eComment.designCommentId=='4'}">
								<input type="radio" name="designCommentId" value="1">合理
								<input type="radio" name="designCommentId" value="2">有创新
								<input type="radio" name="designCommentId" value="3">不完整
								<input type="radio" name="designCommentId" value="4" checked>
								<font color="blue"><b>${eComment.designComment.designType}</b></font>
								<input type="radio" name="designCommentId" value="5">有误
							</c:if> 
							<c:if test="${eComment.designCommentId=='5'}">
								<input type="radio" name="designCommentId" value="1">合理
								<input type="radio" name="designCommentId" value="2">有创新
								<input type="radio" name="designCommentId" value="3">不完整
								<input type="radio" name="designCommentId" value="4">不合理
								<input type="radio" name="designCommentId" value="5" checked>
								<font color="blue"><b>${eComment.designComment.designType}</b></font>
							</c:if> 
							 
						</td>
					</tr>
					<tr>
						<td style="width: 10%; height: 20px; padding-left: 36px;"
							valign="middle">内容</td>
						<td style="width: 10%; height: 20px;" valign="middle" colspan="4">
							<c:if test="${eComment.contentCommentId=='1'}">
								<input type="radio" name="contentCommentId" value="1" checked>
								<font color="blue"><b>${eComment.contentComment.contentType}</b></font>
								<input type="radio" name="contentCommentId" value="2">无新意可作为资料
								<input type="radio" name="contentCommentId" value="3">有自己经验
								<input type="radio" name="contentCommentId" value="4">无参考价值
							</c:if> 
							<c:if test="${eComment.contentCommentId=='2'}">
								<input type="radio" name="contentCommentId" value="1">有创新
								<input type="radio" name="contentCommentId" value="2" checked>
								<font color="blue"><b>${eComment.contentComment.contentType}</b></font>
								<input type="radio" name="contentCommentId" value="3">有自己经验
								<input type="radio" name="contentCommentId" value="4">无参考价值
							</c:if>
							<c:if test="${eComment.contentCommentId=='3'}">
								<input type="radio" name="contentCommentId" value="1">有创新
								<input type="radio" name="contentCommentId" value="2">无新意可作为资料
								
								<input type="radio" name="contentCommentId" value="3" checked>
								<font color="blue"><b>${eComment.contentComment.contentType}</b></font>
								<input type="radio" name="contentCommentId" value="4">无参考价值
							</c:if>
							<c:if test="${eComment.contentCommentId=='4'}">
								<input type="radio" name="contentCommentId" value="1">有创新
								<input type="radio" name="contentCommentId" value="2">无新意可作为资料
								<input type="radio" name="contentCommentId" value="3">有自己经验
								<input type="radio" name="contentCommentId" value="4" checked>
								<font color="blue"><b>${eComment.contentComment.contentType}</b></font>
							</c:if>
							

						</td>
					</tr>
					<tr>
						<td style="width: 10%; height: 20px; padding-left: 36px;"
							valign="middle">数据</td>
						<td style="width: 10%; height: 20px;" valign="middle" colspan="4">
							<c:if test="${eComment.dataCommentId=='1'}">
								<input type="radio" name="dataCommentId" value="1" checked>
								<font color="blue"><b>${eComment.dataComment.dataCommentType}</b></font>
								<input type="radio" name="dataCommentId" value="2">有误
								<input type="radio" name="dataCommentId" value="3">统计学处理不当
							</c:if> 
							<c:if test="${eComment.dataCommentId=='2'}">
								<input type="radio" name="dataCommentId" value="1">正确可靠
								<input type="radio" name="dataCommentId" value="2" checked>
								<font color="blue"><b>${eComment.dataComment.dataCommentType}</b></font>
								<input type="radio" name="dataCommentId" value="3">统计学处理不当
							</c:if> 
							<c:if test="${eComment.dataCommentId=='3'}">
								<input type="radio" name="dataCommentId" value="1">正确可靠
								<input type="radio" name="dataCommentId" value="2">有误
								<input type="radio" name="dataCommentId" value="3" checked>
								<font color="blue"><b>${eComment.dataComment.dataCommentType}</b></font>
							</c:if>
						</td>
					</tr>
					<tr>
						<td style="width: 10%; height: 20px; padding-left: 36px;" valign="middle">论点</td>
						<td style="width: 10%; height: 20px;" valign="middle" colspan="4">
							<c:if test="${eComment.discussCommentId =='1'}">
								<input type="radio" name="discussCommentId" value="4">论点明确与内容相符
								<input type="radio" name="discussCommentId" value="1" checked>
								<font color="blue"><b>${eComment.discussComment.discussCommentType}</b></font>
								<input type="radio" name="discussCommentId" value="2">重点不明确
								<input type="radio" name="discussCommentId" value="3">重复结论没有深入讨论
							</c:if>
							<c:if test="${eComment.discussCommentId =='2'}">
								<input type="radio" name="discussCommentId" value="4">论点明确与内容相符
								<input type="radio" name="discussCommentId" value="1">论点明确与内容不符
								<input type="radio" name="discussCommentId" value="2" checked>
								<font color="blue"><b>${eComment.discussComment.discussCommentType}</b></font>
								<input type="radio" name="discussCommentId" value="3">重复结论没有深入讨论
							</c:if>
							<c:if test="${eComment.discussCommentId =='3'}">
								<input type="radio" name="discussCommentId" value="4">论点明确与内容相符
								<input type="radio" name="discussCommentId" value="1">论点明确与内容不符
								<input type="radio" name="discussCommentId" value="2">重点不明确
								<input type="radio" name="discussCommentId" value="3" checked>
								<font color="blue"><b>${eComment.discussComment.discussCommentType}</b></font>
							</c:if>
							<c:if test="${eComment.discussCommentId =='4'}">
								<input type="radio" name="discussCommentId" value="4" checked>
								<font color="blue"><b>${eComment.discussComment.discussCommentType}</b></font>
								<input type="radio" name="discussCommentId" value="1">论点明确与内容不符
								<input type="radio" name="discussCommentId" value="2">重点不明确
								<input type="radio" name="discussCommentId" value="3">重复结论没有深入讨论
							</c:if>
						</td>
					</tr>
					<tr>
						<td style="width: 10%; height: 20px; padding-left: 36px;"
							valign="middle">处理</td>
						<td style="width: 10%; height: 20px; padding-left: 36px;"
							valign="middle">结果</td>
						<td style="width: 10%; height: 20px;" valign="middle" colspan="4">
							<c:if test="${eComment.resultCommentId=='1'}">
								<input type="radio" name="resultCommentId" value="1" checked>
								<font color="blue"><b>${eComment.resultComment.resultCommentType}</b></font>
								<input type="radio" name="resultCommentId" value="2">修改再审
								<input type="radio" name="resultCommentId" value="3">改为短篇、简报或经验介绍
								<input type="radio" name="resultCommentId" value="4">不适合本刊
								<input type="radio" name="resultCommentId" value="5">退稿
							</c:if> 
							<c:if test="${eComment.resultCommentId=='2'}">							
								<input type="radio" name="resultCommentId" value="1">可刊用
								<input type="radio" name="resultCommentId" value="2" checked>
								<font color="blue"><b>${eComment.resultComment.resultCommentType}</b></font>
								<input type="radio" name="resultCommentId" value="3">改为短篇、简报或经验介绍
								<input type="radio" name="resultCommentId" value="4">不适合本刊
								<input type="radio" name="resultCommentId" value="5">退稿
							</c:if> 
							<c:if test="${eComment.resultCommentId=='3'}">
								<input type="radio" name="resultCommentId" value="1">可刊用
								<input type="radio" name="resultCommentId" value="2">修改再审
								<input type="radio" name="resultCommentId" value="3" checked>
								<font color="blue"><b>${eComment.resultComment.resultCommentType}</b></font>
								<input type="radio" name="resultCommentId" value="4">不适合本刊
								<input type="radio" name="resultCommentId" value="5">退稿
							</c:if> 
							<c:if test="${eComment.resultCommentId=='4'}">
								<input type="radio" name="resultCommentId" value="1">可刊用
								<input type="radio" name="resultCommentId" value="2">修改再审
								<input type="radio" name="resultCommentId" value="3">改为短篇、简报或经验介绍
								<input type="radio" name="resultCommentId" value="4" checked>
								<font color="blue"><b>${eComment.resultComment.resultCommentType}</b></font>
								<input type="radio" name="resultCommentId" value="5">退稿
							</c:if> 
							<c:if test="${eComment.resultCommentId=='5'}">
								<input type="radio" name="resultCommentId" value="1">可刊用
								<input type="radio" name="resultCommentId" value="2">修改再审
								<input type="radio" name="resultCommentId" value="3">改为短篇、简报或经验介绍
								<input type="radio" name="resultCommentId" value="4">不适合本刊
								<input type="radio" name="resultCommentId" value="5" checked>
								<font color="blue"><b>${eComment.resultComment.resultCommentType}</b></font>
							</c:if> 
							

						</td>
					</tr>
					<tr>
						<td style="width: 10%; height: 20px; padding-left: 32px; border-bottom: 1px solid #FEFEFE;" colspan="6">具体意见:</td>
					</tr>
					<tr>
						<td style="width: 10%; height: 80px; padding-left: 32px; border-bottom: 1px solid #FEFEFE;" colspan="6">
							<textarea rows="13" cols="90" style="border: 1px solid #00F;" name="commentDetails">${eComment.commentDetails}</textarea>
						</td>
					</tr>
					<tr>
						<td style="width: 10%; height: 20px; padding: 20px; padding-left: 36px; border-right: 1px solid #FEFEFE;" valign="middle" colspan="2"></td>
						<c:if test="${user.typeId == 30}">
						<c:if test="${eComment.commentLevel == 30}">
							<td style="width: 10%; height: 20px; border-right: 1px solid #FEFEFE;" valign="middle">
								<input type="button" id="updateComment" value="修改稿件评语" />
							</td>
							<td style="width: 10%; height: 20px; border-right: 1px solid #FEFEFE;" valign="middle">
								<input type="button" id="btnReturn" value="返回评审" />
							</td>
						</c:if>
						<c:if test="${eComment.commentLevel == 20 ||eComment.commentLevel == 21||eComment.commentLevel == 22}">
							<td style="width: 20%; height: 20px; border-right: 1px solid #FEFEFE;" valign="middle" colspan="2">
								<input type="button" id="btnReturn" value="返回评审" />
							</td>
						</c:if>
						</c:if>
						<c:if test="${user.typeId == 20||user.typeId == 21||user.typeId == 22}">
						<c:if test="${eComment.commentLevel == 20 ||eComment.commentLevel == 21||eComment.commentLevel == 22}">
							<td style="width: 10%; height: 20px; border-right: 1px solid #FEFEFE;" valign="middle">
								<input type="button" id="updateComment2" value="修改稿件评语" />
							</td>
							<td style="width: 10%; height: 20px; border-right: 1px solid #FEFEFE;" valign="middle">
								<input type="button" id="btnReturn2" value="返回评审" />
							</td>
						</c:if>
						<c:if test="${eComment.commentLevel == 30}">
							<td style="width: 20%; height: 20px; border-right: 1px solid #FEFEFE;" valign="middle" colspan="2">
								<input type="button" id="btnReturn2" value="返回评审" />
							</td>
						</c:if>
						</c:if>
						
						<td style="width: 10%; height: 20px; padding-left: 32px;" valign="middle" colspan="2"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>

	<script>
		//updateComment
		$('#updateComment').click(function() {
			var data = $("#commentForm").serialize();
			var essayId=$("#essayId").val();
			var commentId=$("#commentId").val();
			console.log(data)
			$.ajax({
				type : 'POST',
				url : '../editor/updateEssayComment.do',
				data : data,
				success : function(obj) {
					if (obj.state == 1) {
						alert(obj.message);
						location.href = "../editor/selectECommentById.do?essayId="+essayId;
					} else {
						alert(obj.message);
						location.href = "../editor/selectCommentDetailsById.do?essayId="+essayId+"&commentId="+commentId;
					}
				}
			});
		}); 
		//btnReturn
		$('#btnReturn').click(function() {
			var essayId=$('#essayId').val();
			console.log(essayId)
			location.href = "../editor/selectECommentById.do?essayId="+essayId;
		});
		$('#updateComment2').click(function() {
			var data = $("#commentForm").serialize();
			var essayId=$("#essayId").val();
			console.log(data)
			$.ajax({
				type : 'POST',
				url : '../professor/updateEssayComment.do',
				data : data,
				success : function(obj) {
					if (obj.state == 1) {
						alert(obj.message);
						//更新成功
						location.href = "../professor/selectPreHandleEssay.do?statusId=63&pageCode=1";
					} else {
						alert(obj.message);
						location.href="../professor/selectPreHandleEssay.do?statusId=62&pageCode=1";
					}
				}
			});
		}); 
		//btnReturn
		$('#btnReturn2').click(function() {
			/* var essayId=$('#essayId').val();
			console.log(essayId) */
			location.href="../professor/selectPreHandleEssay.do?statusId=62&pageCode=1";
		});
	</script>
</body>
</html>
