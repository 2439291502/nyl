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
<link rel="stylesheet" type="text/css" href="../css/index_css/index_css.css" />

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
						<div class="right2">
							<div class="advSearch">
								<div class="advSearch_title">添加期刊栏目</div>
								<form action="" id="paperForm">
								<div class="advSearch_Geduan"></div>
								<ul>
									<li>
										<span class="advSearch_name">选择年(Year)</span>
										<span class="advSearch_name_issue">
											<input type="text" name="year">
										</span>
										
									</li>
									</ul>
								 <div class="advSearch_Geduan"></div>
								 <ul>
									<li>
										<span class="advSearch_name">选择期号(Issue)</span>
										<span class="advSearch_name_issue">
											<input type="text" name="issue" >
										</span>
									</li>
								</ul>
								<div class="advSearch_Geduan"></div>
								<ul>
									<li>
										<span class="advSearch_name">栏目类型(Style)</span>
										<select name="styleId">
											<option value="">请选择栏目类型</option>
											<option value="1">机械工程</option>
											<option value="2">精密仪器与机械</option>
											<option value="3">热能工程</option>
											<option value="4">汽车工程</option>
											<option value="5">航空航天工程</option>
											<option value="6">自动化</option>
										</select>
									</li>
								</ul>
								<div class="advSearch_Geduan"></div>
								<ul>
									<li>
										<span class="advSearch_name">指定栏目(Column)</span>
										<input type="text" name="column">
									</li>
								</ul>
								
								<div class="advSearch_contrl">
									<input type="button" id="btnAddPaper" value="添加期刊专栏(Clear)">
									<input type="button" id="btnReturn" value="返回(Return)">
								</div>
								</form>
							</div>
					   </div>	 
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>

	<script>
		//btnAddPaper
		$('#btnAddPaper').click(function() {
			var data = $("#paperForm").serialize();
			console.log(data)
			$.ajax({
				type : 'POST',
				url : '../editor/addPaper.do',
				data : data,
				success : function(obj) {
					if (obj.state == 1) {
						alert(obj.message);
						location.href = "../editor/selectProduce.do?statusId=66&pageCode=1";
					} else {
						alert(obj.message);
						//location.href = "../editor/selectCommentDetailsById.do?essayId=${essay.essayId}&commentId=${eComment.commentId}";
					}
				}
			});
		}); 
		//btnReturn
		$('#btnReturn').click(function() {
			var essayId=$('#essayId').val();
			console.log(essayId)
			location.href = "../editor/selectProduce.do?statusId=66&pageCode=1";
		});
	</script>
	<jsp:include page="../web/foot.jsp"></jsp:include>
	
</body>

</html>