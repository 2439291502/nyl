<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加稿件作者</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
</head>
<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#addAuthor").click(function(){
		location.href="../essay/addContributeAuthor.do";
	});
	$("#deleteAuthor").click(function(){
		var data=$("formAuthor").val();
		$.ajax({
			type : 'POST',
			url : '../essay/delectUser.do',
			data : data,
			success : function(obj) {
				if(obj.state==1){
					alert(obj.message);
					//location.href='../essay/contributeAuthor.do';
				}else{
					 $("#msg").text(obj.message);
					 $("#msg").css("color","red");
					location.href='../essay/contributeAuthor.do';
				}
			} ,
	       error:function(){
	           //错误处理
	       	location.href="../essay/contributeAuthor.do";
	       }
		});
		location.href="../essay/contributeAuthor.do";
	});
	
});
</script>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
		<jsp:include page="../web/author_head.jsp"></jsp:include>
		<jsp:include page="../web/contribute_left.jsp"></jsp:include>
			<div class="work left">
				<div class="linkcss">
					<a href="../essay/showContributeTitle.do" style="cursor:hand;">
						<img src="../img/author_img/btnPre.jpg" width="68" height="25"/>
					</a>
					<a href="../essay/contributeAbstract.do" style="cursor:hand;">
						<img src="../img/author_img/btnNext.jpg" width="68" height="25"/>
					</a>	
				</div>	
				<div>
					<form id="formAuthor">
					<input type="hidden" name="essayId" value="${essay.essayId}">
					<input type="hidden" name="aListId" value="${aList.aListId}">
					<div class="createmanu" align="left">
						<table>
							<tr>
								<td>作者信息</td>
								<td><input type="button" id="addAuthor" value="添加作者"></td>	
							</tr>
						</table>
					</div>
					<div class="createmanu" align="left">
						<table class="list" cellpadding="2" border="1" cellspacing="0">
						<tbody>
							<tr>
								<!-- <th>稿件编号</th> -->
								<th>作者真实名</th>
								<th>email</th>
								<th>手机或电话号码</th>
								<th>研究方向</th>
								<th>工作单位</th>
								<th>通讯地址</th>
								<th>邮编</th>
								<th>操作</th>
							</tr>
							<tr>
								<%-- <td>${essay.essayId}</td> --%>
								<td>${user.tureName}</td>
								<td>${user.email}</td>
								<td>${user.telephone};${user.phone}</td>
								<td>${user.profession}</td>
								<td>${user.workUnit}</td>
								<td>${user.address}</td>
								<td>${user.postcode}</td>
								<td><input type="button" id="deleteAuthor" value="删除"></td>
							</tr>
							<c:if test="${not empty aList }">
							<tr>
								<td>${aList.tureName}</td>
								<td>${aList.email}</td>
								<td>${aList.phone}</td>
								<td>${aList.profession}</td>
								<td>${aList.workUnit}</td>
								<td>${aList.address}</td>
								<td>${aList.postcode}</td>
								<td><input type="button" id="deleteAuthor" value="删除"></td>
							</tr>
							</c:if>
						</tbody>
					</table>
					</div>
					</form>
				</div>
			</div>
		</div>				 
	</div>
<jsp:include page="../web/foot.jsp"></jsp:include>
</body>
</html>