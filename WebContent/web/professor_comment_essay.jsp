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
	font-size:14px;
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
	text-align:center;

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
		<input type="hidden" name="essayId" value="${essay.essayId}">
		<table width="60%" align="center"
			style="border: 1px solid black; border-collapse: collapse;">
			<col style="width: 10%"/>
			<col style="width: 10%"/>
			<col style="width: 10%"/>
			<col style="width: 10%"/>
			<col style="width: 10%"/>
			<col style="width: 10%"/>
			<tbody>
				<tr>
					<td style="width: 10%; height: 20px; padding-left: 36px;" valign="middle">题目</td>
					<td style="width: 10%; height: 20px;" colspan="2">${essay.title}</td>
					<td style="width: 10%; height: 20px; padding-left: 36px;">编号</td>
					<td style="width: 10%; height: 20px;" colspan="2">${essay.essayId}</td>
				</tr>
				<tr>
					<td style="width: 10%; height: 20px; padding-left: 32px;" valign="middle">作者姓名</td>
					<td style="width: 10%; height: 20px;" colspan="2">${essay.username}</td>
					<td style="width: 10%; height: 20px; padding-left: 32px;" valign="middle">收稿时间</td>
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
						<input type="radio" name="designCommentId" value="1">合理
						<input type="radio" name="designCommentId" value="2">有创新
						<input type="radio" name="designCommentId" value="3">完整
						<input type="radio" name="designCommentId" value="4">不完整
						<input type="radio" name="designCommentId" value="5">不合理
						<input type="radio" name="designCommentId" value="6">有误
					</td>
				</tr>
				<tr>
					<td style="width: 10%; height: 20px; padding-left: 36px;"
						valign="middle">内容</td>
					<td style="width: 10%; height: 20px;" valign="middle" colspan="4">
						<input type="radio" name="contentCommentId" value="1">有创新
						<input type="radio" name="contentCommentId" value="2">无新意可作为资料
						<input type="radio" name="contentCommentId" value="3">有自己经验
						<input type="radio" name="contentCommentId" value="4">无参考价值
					</td>
				</tr>
				<tr>
					<td style="width: 10%; height: 20px; padding-left: 36px;"
						valign="middle">数据</td>
					<td style="width: 10%; height: 20px;" valign="middle" colspan="4">
						<input type="radio" name="dataCommentId" value="1">正确可靠
						<input type="radio" name="dataCommentId" value="2">有误
						<input type="radio" name="dataCommentId" value="3">统计学处理不当
					</td>
				</tr>
				<tr>
					<td style="width: 10%; height: 20px; padding-left: 36px;"
						valign="middle">论点</td>
					<td style="width: 10%; height: 20px;" valign="middle" colspan="4">
						<input type="radio" name="discussCommentId" value="4">论点明确与内容相符
						<input type="radio" name="discussCommentId" value="1">论点明确与内容不符
						<input type="radio" name="discussCommentId" value="2">重点不明确
						<input type="radio" name="discussCommentId" value="3">重复结论没有深入讨论
					
					</td>
				</tr>
				<tr>
					<td style="width: 10%; height: 20px; padding-left: 36px;"
						valign="middle">处理</td>
					<td style="width: 10%; height: 20px; padding-left: 36px;"
						valign="middle">结果</td>
					<td style="width: 10%; height: 20px;" valign="middle" colspan="4">
						<input type="radio" name="resultCommentId" value="1">可刊用
						<input type="radio" name="resultCommentId" value="2">修改再审
						<input type="radio" name="resultCommentId" value="3">改为短篇、简报或经验介绍
						<input type="radio" name="resultCommentId" value="4">不适合本刊
						<input type="radio" name="resultCommentId" value="5">退稿
					</td>
				</tr>
				<tr>
					<td
						style="width: 10%; height: 20px; padding-left: 32px; border-bottom: 1px solid #FEFEFE;"
						colspan="6">具体意见:</td>

				</tr>
				<tr>
					<td
						style="width: 10%; height: 80px; padding-left: 32px; border-bottom: 1px solid #FEFEFE;"
						colspan="6"><textarea rows="13" cols="90" style="border: 1px solid #00F;" name="commentDetails">${eComment.commentDetails}</textarea></td>
				</tr>
				<tr>
					<td
						style="width: 10%; height: 20px; padding: 20px; padding-left: 36px; border-right: 1px solid #FEFEFE;"
						valign="middle" colspan="2"></td>
					<td
						style="width: 10%; height: 20px; padding-left: 32px; border-right: 1px solid #FEFEFE;">
						<input type="button" id="btnAddComment" value="提交评审意见" />
					</td>
					<td
						style="width: 10%; height: 20px; padding-left: 32px; border-right: 1px solid #FEFEFE;">
						<input type="button" id="btnReturn" value="取消并返回评审" />
					</td>
					<td style="width: 10%; height: 20px; padding-left: 32px;"
						valign="middle" colspan="2"></td>
				</tr>
			</tbody>
		</table>
		</form>
</div>
<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>

<script>
//addEssayComment
$('#btnAddComment').click(function(){
	var data=$("#commentForm").serialize();
	console.log(data)
	$.ajax({
		type : 'POST',
        url : '../professor/addEssayComment.do',
        data : data,
        success : function(obj) {
        	if (obj.state == 1){
        		alert(obj.message);
        		location.href="../professor/selectPreHandleEssay.do?statusId=62&pageCode=1";
        	}else{
        		$("#showMsg").text("操作失败");
				$("#showMsg").css("color","red");
        	}
        } 
     });
});
//btnReturn
$('#btnReturn').click(function(){
	location.href="../professor/selectPreHandleEssay.do?statusId=62&pageCode=1";
});
</script>
</body>
</html>
