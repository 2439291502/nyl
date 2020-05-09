<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台用户信息管理中心</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
</head>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
			<jsp:include page="author_head.jsp"></jsp:include>
			<div class="main">
				<jsp:include page="../web/editor_paper_center_left.jsp"></jsp:include>
				<div class="work_left">
					<div class="workAreaHead">
						<div class="stepName">
							<span>后台信息管理中心</span><span>》》系统用户管理中心》》</span><span style="font-weight: 700;">系统用户信息</span>
						</div>
						<div class="stepHelpInfo">
							<div>
								请从左侧栏目导航中选择相应功能栏目完成处理操作
							</div>
						</div>
					</div>
					<div class="workTable">
						<div class="workTable_ctrl">
							<table>
								<tbody>
									<tr>
										<td width="30%"></td>
										<td align="center">
											共
											<font color="red"><b>${pageInfo.total}</b></font>
											条记录
										</td>
										<td width="20%">
											每页显示
											<font color="green"><b>10</b></font>条记录 
										</td>
										<td width="25%">
											<input type="text" name="username" id="username" value="" style="width:158px;" placeholder="输入用户名">
											<input type="button" id="btnSelect" style="width:50px;height:21px;cursor: pointer;" value="🔍"/>
										</td>
									</tr>
									<tr></tr>
								</tbody>
							</table>
						</div>
						<div class="workTable_main1">
						<c:if test="${pageInfo!=null}">
							<table width="963">
								<tr>
									<th></th>
									<th>用户编号</th>
									<th>用户名</th>
									<th>用户真实名</th>
									<th>教育背景</th>
									<th>工作单位</th>
									<th>专业领域</th>
									<th>申请为专家</th>
									<th>注册时间</th>
									<th>更改时间</th>
									<th>用户类型</th>
									<th>用户状态</th>
									<th>稿件操作</th>
								</tr>
								<c:forEach items="${pageInfo.list}" var="user">
								<input type="hidden" name="userId" id="userId" value="${userId}">
								<input type="hidden" name="state" id="state" value="${user.state}"/>
								<tr>
									<td>
										<input name="userIds" type="checkbox" id="userIds" value="${user.userId}">
									</td>
									<td>${user.userId}</td>
									<td>${user.username}</td>
									<td>${user.tureName}</td>
									<td>${user.eBackground.eBackgroundName}</td>
									<td>${user.workUnit}</td>
									<td>${user.profession}</td>
									<c:if test="${user.applyExpert eq 0 }">
									<td>否</td>
									</c:if>
									<c:if test="${user.applyExpert eq 1 }">
									<td>是</td>
									</c:if>
									<td><fmt:formatDate  value="${user.createData}" type="both" pattern="yyyy.MM.dd"/></td>
									<td><fmt:formatDate  value="${user.updateDate}" type="both" pattern="yyyy.MM.dd"/></td>
									<td>${user.type.typeLevel}</td>
									<c:if test="${user.state eq 0}">
									<td><a title="点击激活用户" href="../editor/activeUsers.do?state=${user.state}&userIds=${user.userId}&pageCode=${pageInfo.pageNum}"><font color="red">待激活</font></a></td>
									</c:if>
									<c:if test="${user.state eq 1}">
									<td><font color="blue">已激活</font></td>
									</c:if>
									<td>
										<a href="#">修改</a>
									</td>
								</tr>
							</c:forEach>
							</table>
							</c:if>
						</div>
						<div class="workTable_btn">
							<table>
								<tbody>
									<tr valign="top">
										<td>
											<table width="120" cellpadding="0" cellspacing="5" border="0">
												<tbody>
													<tr>
														<td width="25">
															<input type="checkbox" id="all"  value=""/>
														</td>
														<td align="left">
															<input type="button" value="批量激活" onclick="toUpdate()">
														</td>
														<td>
															<input type="button" value="批量冻结用户" onclick="freezeUsers()">
														</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td width="18%" align="right"></td>
										<td align="right" width="325" style="margin-right: 50px;">
											<input type="hidden" name="pageCode" id="pageCode" value="${pageInfo.pageNum}">
											<input type="hidden" name="prePage" id="prePage" value="${pageInfo.prePage}">
											<input type="hidden" name="nextPage" id="nextPage" value="${pageInfo.nextPage}">
											<input type="hidden" name="pages" id="pages" value="${pageInfo.pages}">
											第<font color="red">${pageInfo.pageNum}</font>/${pageInfo.pages}页    
											<%-- <input type="button" id="firstPage" value="首页">
											<c:if test="${pageInfo.hasPreviousPage }">
												<input type="button" id="prePage" value="上一页">
											</c:if>
											<c:if test="${pageInfo.hasNextPage }">
												<input type="button" id="prePage" value="下一页">
											</c:if> 
											<input type="button" id="pages" value="尾页">   --%>   
											<a href="../editor/selectAllUsers.do?pageCode=1">首页</a>
											<c:if test="${pageInfo.hasPreviousPage }">
												<a href="../editor/selectAllUsers.do?pageCode=${pageInfo.prePage}">上一页</a>
											</c:if>
											<c:if test="${pageInfo.hasNextPage }">
											<a href="../editor/selectAllUsers.do?pageCode=${pageInfo.nextPage}">下一页</a>
											</c:if>
											<a href="../editor/selectAllUsers.do?pageCode=${pageInfo.pages}">尾页</a> 
										</td>
										<td>
											<div class="div_goto" style="float: right;">
												<input type="text" id="jumpNumTxt" value="" style="width:60px; height: 26px;" />
												<input type="button" id="jumpBtn" value="跳转" style="width:50px" />
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../web/foot.jsp"></jsp:include>
	<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="../scripts/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript">
	$("#all").click(function() {
        $(":input[name='userIds']").prop("checked", this.checked); // this指代的你当前选择的这个元素的JS对象
    });
	//批量激活用户    
	function toUpdate(){
		var chk_value = [];//定义一个数组
		
		//利用将name等于ids的多选按钮得到
		$("input[name='userIds']:checked").each(function(){
			//将选中额数据存到数组里
			chk_value.push($(this).val());	
		});
		/* console.log(chk_value)
		alert(chk_value); */
		if (chk_value.length == 0) {
		    alert("你还未选中用户");
		}
		if (chk_value.length > 0) {
			console.log(chk_value)
			var username=$("#username").val();
			var state=$('#state').val();
			
		 	var pageCode=$('#pageCode').val();
		 	
		    location.href = "../editor/activeUsers.do?state="+state+"&userIds="+chk_value+"&pageCode="+pageCode;

		}
		      
	}
	//2批量冻结用户    
	function freezeUsers(){
		var chk_value = [];//定义一个数组
		
		//利用将name等于ids的多选按钮得到
		$("input[name='userIds']:checked").each(function(){
			//将选中额数据存到数组里
			chk_value.push($(this).val());
			
		});
		/* console.log(chk_value)
		alert(chk_value); */
		if (chk_value.length == 0) {
		    alert("你还未选中用户");
		}
		if (chk_value.length > 0) {
			console.log(chk_value)
			var username=$("#username").val();
			var state=$('#state').val();
			
		 	var pageCode=$('#pageCode').val();
			alert("批量冻结用户");
		    location.href = "../editor/freezeUsers.do?state="+state+"&userIds="+chk_value+"&pageCode="+pageCode;

		}
		      
	}
	
	$('#jumpBtn').click(function(){
		var state=$('#state').val();
		var pageCode=$('#jumpNumTxt').val();
		var pages=$('#pages').val();
		if(pageCode==''||pageCode>pages){
			alert("跳转页面不存在！");
		}else{
			location.href = "../editor/selectAllUsers.do?pageCode="+pageCode;
		}

	});
	//btnSelect
	$('#btnSelect').click(function(){
		var username=$('#username').val();
		location.href = "../editor/selectUsersByUsername.do?pageCode=1&username="+username;
	});
	
	</script>
</body>

</html>