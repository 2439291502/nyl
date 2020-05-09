<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>稿件初选分配专家信息</title>
</head>
<body>
	<div class="hidden">
		<form action="" id="checkEssayfrom">
		<input type="hidden" id="essayId" name="essayId" value="${essay.essayId}">
		<span id="showMsg"></span>
		<table align="center">
			<tbody>
				<tr>
					<td>稿件编号:</td>
					<td>${essay.essayId}</td>
				</tr>
				<tr>
					<td>稿件题目:</td>
					<td><a href="#" title="点击查看详情">${essay.title}</a></td>
				</tr>
				<tr>
					<td align="right">关键词:</td>
					<td>${essay.keywords}</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<th></th>
					<th>专家编号</th>
					<th>专家用户名</th>
					<th>真实姓名</th>
					<th>工作单位</th>
					<th>专业</th>
					<th>研究领域</th>
					<th>职称</th>
					<th>专家级别</th>
					<th>专家状态</th>
				</tr>
				<c:forEach items="${userList}" var="user">
				<tr>
					<td><input type="radio" name="userId" id="userId" value="${user.userId}"></td>
					<td>${user.userId}</td>
					<td>${user.username}</td>
					<td>${user.tureName}</td>
					<td>${user.workUnit}</td>
					<td>${user.profession}</td>
					<td>${user.research}</td>
					<td>${user.post.postName}</td>
					<td>${user.type.typeLevel}</td>
					<c:if test="${user.type.state eq 1}">
					<td><font color="green">激活状态</font></td>
					</c:if>
					<c:if test="${user.type.state eq 1}">
					<td><font color="red">待激活</font></td>
					</c:if>
				</tr>
				</c:forEach>
				<tr>
					<td></td>
					<td>
						<input type="button" id="btnAddCheckEssay" value="确定">
						<input type="reset" value="取消">
					</td>
				</tr>
			</tbody>
		</table>
		</form>
	</div>
<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#btnAddCheckEssay').click(function(){
		var essayId=$('#essayId').val();
		var userId=$('#userId').val();
		if(userId!=null){
			location.href="../editor/addContributeProfessor.do?essayId="+essayId+"&userId="+userId;
		}
		else{
			$("#showMsg").text("请选择专家");
			$("#showMsg").css("color","red");
		}
	});
});	
</script>
</body>
</html>