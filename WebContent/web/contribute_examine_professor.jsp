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
<style type="text/css">
.button {

    margin-left: 260px;

}
.button input{

    margin-right: 30px;
	width: 60px; 
	height: 30px;
	border-bottom: 1px solid #FEFEFE;	
	background-color: #AFC2D1;
    cursor: pointer;
}
.button input:hover{
	background-color: #C6E2FF;
     
}

</style>
</head>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
		<jsp:include page="../web/author_head.jsp"></jsp:include>
		<div class="main contribute">
			
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
 								
									<input type="hidden" name="essayId" id="essayId" value="${essay.essayId}">
									<table width="80%">
										<tbody>
											<tr>
												<td align="right"><strong>稿件编号:</strong></td>
												<td align="left"><font color="red"><strong>${essay.essayId}</strong></font></td>
											</tr>
											<tr>
												<td align="right"><strong>contentUrl标题:</strong></td>
												<td align="left"><a href="../editor/showComment.do?essayId=${essay.essayId}" title="点击查看稿件原件">${essay.title}</a></td>
											</tr>
											<tr>
												<td align="right"><strong>关键词:</strong></td>
												<td align="left">${essay.keywords}</td>
											</tr>
											<tr>
												<td align="right"><strong>投稿日期:</strong></td>
												<td align="left"><fmt:formatDate  value="${essay.contributeDate}" type="both" pattern="yyyy.MM.dd"/></td>
											</tr>
										
										</tbody>
									</table>				
								</div>
								
								<div class="examine_table">
									<h2 style="color:#000;background:#C0D2F8;" align="center">审稿专家信息</h2>
									<h3>专家审核稿件信息</h3>
									<table width="100%"  class="list1">
										<tbody>
											<tr>
												<th width="6%"></th>
												<th width="12%">专家编号</th>
												<th width="12%">专家用户名</th>
												<th width="10%">真实姓名</th>
												<th width="10%">工作单位</th>
												<th width="10%">专业</th>
												<th width="10%">研究领域</th>
												<th width="10%">职称</th>
												<th width="10%">专家级别</th>
												<th width="10%">专家状态</th>
											</tr>
											<c:forEach items="${userList}" var="user">
											<tr>
												<td align="center"><input type="radio" name="userId" id="userId" value="${user.userId}"></td>
												<td>${user.userId}</td>
												<td>${user.username}</td>
												<td>${user.tureName}</td>
												<td>${user.workUnit}</td>
												<td>${user.profession}</td>
												<td>${user.research}</td>
												<td>${user.post.postName}</td>
												<td>${user.type.typeLevel}</td>
												<c:if test="${user.state eq 1}">
												<td><font color="green">激活状态</font></td>
												</c:if>
												<c:if test="${user.state eq 0}">
												<td><font color="red">待激活</font></td>
												</c:if>
											</tr>
											</c:forEach>
									</table>
									<div class="button">
										<input type="button" id="btnAddCheckEssay" value="确定">
										<input type="reset" value="取消">
									</div>
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
<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#btnAddCheckEssay').click(function(){
		var essayId=$('#essayId').val();
		var userId=$('#userId').val();
		if(userId!=null){
			alert("分配专家审核成功！")
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