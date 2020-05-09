<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>稿件管理中心</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
</head>
<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
$(function(){
	 $("#fundLevel").blur(function(){
		var fundLevel = $("#fundLevel").val();
 		/* alert(fundLevel.length); */
		if ((fundLevel==null || fundLevel=="")&& fundLevel.length<250) {
			 $("#msg").text("基金类别不能为空");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#fundLevel").focus(); 
		   	 return;
		}
	 });
	 $("#fundCName").blur(function(){
		var fundCName = $("#fundCName").val();
		if ((fundCName==null || fundCName=="")&& fundCName.length<250) {
			 $("#msg").text("基金中文不能为空");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#fundCName").focus(); 
		    return;
		}
	 });
	 $("#fundEName").blur(function(){
		var fundEName = $("#fundEName").val();
		if ((fundEName==null || fundEName=="")&& fundEName.length<250) {
			 $("#msg").text("基金英文名不能为空");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#fundEName").focus(); 
		    return;
		}
	 });
	 $("#fundNumber").blur(function(){
		var fundNumber = $("#fundNumber").val();
		if ((fundNumber==null || fundNumber=="")&& fundNumber.length<250) {
			 $("#msg").text("基金号不能为空");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#fundNumber").focus(); 
		    return;
		}
	 });
	$('#btnAddFund').click(function(){
		var data=$("#formEssay").serialize();
		var essayId=$("#essayId").val();
		/* alert(data); */
		if($(".msg-error").length<=0){
			$("#msg").removeClass(".msg-error");
			//var data=$("#formEssay").serialize();
			console.log(data)
			$.ajax({
				type : 'POST',
				url : '../essay/addFund.do',
				data : data,
				success : function(obj) {
					if(obj.state==1){
						location.href='../essay/editContributeEssay.do?essayId='+essayId;
					}else{
						 $("#msg").text(obj.message);
						 $("#msg").css("color","red");
						location.href='../essay/showAddFund.do';
					}
				} ,
		       error:function(){
		           //错误处理
		       	location.href="../essay/showAddFund.do";
		       }
			});
		}else{
		  	$("#msg").text("信息部分不能为空");
			$("#msg").css("color","red");
		}
	});
	 
});
</script>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
		<jsp:include page="author_head.jsp"></jsp:include>
		<div class="main">
			<jsp:include page="../web/author_paper_center_left.jsp"></jsp:include>
			<div class="work_left">
				<div class="workAreaHead">
					<div class="stepName">
						<span>稿件中心</span><span>》》推荐投稿》》</span><span style="font-weight: 700;">添加基金</span>
					</div>
					<div class="stepHelpInfo">
						<div>
							请从左侧栏目导航中选择相应功能栏目完成处理操作
						</div>
					</div>
				</div>
				<div class="createmanuBox">
					<div class="createmanu" align="left">
						<span id="msg"></span>
					</div>
					<form action="" name="formEssay" id="formEssay">
					<input type="hidden" name="essayId" value="${essay.essayId}">		
					<div class="createmanu" align="left">
						<table width="100%">
							<tbody>
								<tr>
									<td width="30%" align="left">请输入基金信息: </td>
									<td></td>
								</tr>
								<tr>
									<td width="30%" align="right">基金类别:</td>
									<td width="70%">
										<select class="fundEle" name="fundLevel" id="fundLevel">
											<option value=""></option>
											<option value="博士点 / 博士后项目">博士点 / 博士后项目</option>
											<option value="国家“八六三”高技术项目">国家“八六三”高技术项目</option>
											<option value="国家“九五”/“十五”计划">国家“九五”/“十五”计划</option>
											<option value="其他科研项目">其他科研项目</option>
										</select>
									</td>
								</tr>
								<tr>
									<td width="30%" align="right">基金中文名称<font color="red">(*)</font>:</td>
									<td width="70%">
										<input class="fundEle" name="fundCName" id="fundCName" value=""></input>
									</td>
								</tr>
								<tr>
									<td width="30%" align="right">基金英文名称<font color="red">(*):</font></td>
									<td width="70%">
										<input class="fundEle" name="fundEName" id="fundEName" value=""></input>
									</td>
								</tr>
								<tr>
									<td width="30%" align="right">基金号：<font color="red">(*)</font></td>
									<td width="70%">
										<input class="fundEle" name="fundNumber" id="fundNumber" value=""></input>
									</td>
								</tr>
								<tr>
									<td width="30%" align="right">备注：</td>
									<td width="70%">
										<input class="fundEle" name="fundPs" id="fundPs" value=""></input>
									</td>
								</tr>
								<tr>
									<td></td>
									<td width="70%">
										<a class="fundlink" id="btnAddFund">添加</a>
										<a class="fundlink" href="../essay/editContributeEssay.do">返回</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					</form>
				</div>
					</div>
				</div>
			</div>
		</div>
<jsp:include page="../web/foot.jsp"></jsp:include>
</body>
</html>