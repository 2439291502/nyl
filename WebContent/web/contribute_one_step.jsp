<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>一步投稿</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
</head>
<style>
.linkcss {
    margin: auto 350px;
}

.linkcss .linkbtn{
	margin-right:37px;
	width:90px;
	height:28px;
}
</style>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
		<jsp:include page="author_head.jsp"></jsp:include>
		<div class="main contribute">
			<div class="contributeInfo1">
				投稿
				<p>
					提交新稿件（导航式） 注意：带(
					<font color="red">*</font>
					)的为必填项,各提示框的字符串计数方式为每个汉字按两个计
				</p>
			</div>
			<div class="upload">
				<div class="upload_content">
					<table width=1000; style="margin-left: 55px; margin-bottom: 20px;border:1px solid #D4D4D4">
						<tbody>
							<tr>
								<th>稿件序号</th>
								<th>稿件类型</th>
								<th>稿件标题</th>
								<th>稿件作者</th>
								<th>上传时间</th>
								<th>下载</th>
							</tr>
							<tr>
								<td>${essay.essayId}</td>
								<td>${essay.essayStyle.styleName}</td>
								<td>${essay.title}</td>
								<td>${essay.username}</td>
								<td><fmt:formatDate  value="${essay.contributeDate}" type="both" pattern="yyyy.MM.dd"/>${essay.contributeDate}</td>
								<%-- <c:if test="${essay.contentUrl !=null}">
									<td><a href="../essay/download.do?${essay.contentUrl}" title="点击查看详情">${essay.contentUrl}</a></td>
								</c:if> --%>
								<c:if test="${essay.contentUrl !=null}">
									<td><a href="../essay/download.do?${essay.contentUrl}" title="${essay.contentUrl}">点击下载文件</a></td>
								</c:if>
							</tr>

						</tbody>
					</table>

				</div>
				<form id="essayInfo">
				<div class="upload_content">
					<span id="originalTip" class="onShow">上传稿件<b><font color="red">(*)</font></b></span>
					
					<input type="hidden"  name="contentUrl" class="contentUrl">
					
					<!-- class="file_background" -->
					<input type="file"  name="file" id="file" onchange="fileSelected()">
					<!-- <img alt="" id="sign" src="" style="padding-top: 3px;width: 30px;height: 25px;">  -->
					<br>
					<span style="width:auto;line-height:22px; margin-left:30px;">(每种类型的文件只能上传一次，如果上传有误，请删除后重新上传)</span><br/>
				</div>
				<div class="upload_content">
					<span id="originalTip" class="onShow">中文标题<b><font color="red">(*)</font></b></span>
					<input type="hidden" name="essayId" id="essayId" value="${essay.essayId}"/>
					<input class="btn_content" type="text" name="title" value="${essay.title}">
					<!--<span style="width:auto;line-height:22px;">(每种类型的文件只能上传一次，如果上传有误，请删除后重新上传)</span>-->
				</div>
				<div class="upload_content">
					<span id="originalTip" class="onShow">英文标题</b></span>
					<input class="btn_content" type="text" name="etitle" value="${essay.etitle}">
				</div>
				<div class="upload_content">
					<span id="originalTip1" class="onShow">中文摘要<b><font color="red">(*)</font></b></span>
					<textarea cols="20" rows="8" style="width: 470px;margin-bottom: 10px;" name="abstracts">${essay.abstracts}</textarea>
					<!--<span style="width:auto;line-height:22px;">(每种类型的文件只能上传一次，如果上传有误，请删除后重新上传)</span>-->
				</div>
				<div class="upload_content">
					<span id="originalTip1" class="onShow">英文摘要</b></span>
					<textarea cols="20" rows="8" style="width: 470px;margin-bottom: 10px;" name="englishAbstract">${essay.englishAbstract}</textarea>
					<!--<span style="width:auto;line-height:22px;">(每种类型的文件只能上传一次，如果上传有误，请删除后重新上传)</span>-->
				</div>
				<div class="upload_content">
					<span id="originalTip" class="onShow">关键词<b><font color="red">(*)</font></b></span>
					<input class="btn_content" type="text" name="keywords" value="${essay.keywords}">
					<!--<span style="width:auto;line-height:22px;">(每种类型的文件只能上传一次，如果上传有误，请删除后重新上传)</span>-->
				</div>
				<div class="upload_content">
					<span id="originalTip" class="onShow">英文关键词</b></span>
					<input class="btn_content" type="text" name="englishKeywords" value="${essay.englishKeywords}">
					<!--<span style="width:auto;line-height:22px;">(每种类型的文件只能上传一次，如果上传有误，请删除后重新上传)</span>-->
				</div>
				<div class="upload_content">
					<span id="originalTip" class="onShow">稿件类型<b><font color="red">(*)</font></b></span>
					<%-- <input type="hidden" name="styleId" value="${essay.styleId}"/> --%>
					<select name="styleId" style="width:40%">
						<option value="0"></option>
						<option value="1">机械工程</option>
						<option value="2">精密仪器与机械</option>
						<option value="3">热能工程</option>
						<option value="4">汽车工程</option>
						<option value="5">航空航天工程</option>
						<option value="6">自动化</option>
						<option value="7">计算机</option>
						<option value="8">电子工程</option>
						<option value="9">微电子学</option>
						<option value="10">电机工程</option>
						<option value="11">工业工程</option>
						<option value="12">物理与工程物理</option>
						<option value="13">核能与新能源工程</option>
						<option value="14">化学和化学工程</option>
						<option value="15">生物与生物医学工程</option>
						<option value="16">数学</option>
						<option value="17">环境科学与工程</option>
						<option value="18">土木工程</option>
						<option value="19">建筑学与工程</option>
						<option value="20">材料科学与技术</option>
						<option value="21">经济管理与公共管理</option>
						<option value="22">水利水电工程</option>
						<option value="23">科学技术史</option>
						<option value="24">信息科学与技术</option>
						<option value="25">计算机科学与技术</option>
						<option value="26">建筑科学</option>
						<option value="27">生物与生物医学</option>
						<option value="28">经济与管理</option>
						<option value="29">微电子</option>
					</select>
<%-- 					<input class="btn_content" type="text" name="" value="${essay.essayStyle.styleName}">
 --%>					<!--<span style="width:auto;line-height:22px;">(每种类型的文件只能上传一次，如果上传有误，请删除后重新上传)</span>-->
				</div>
				<div class="upload_content">
					<span id="originalTip1" class="onShow">参考文献<b><font color="red">(*)</font></b></span>
					<textarea cols="20" rows="8" style="width: 470px;margin-bottom: 10px;" name="reference">${essay.reference}</textarea>
					<!--<span style="width:auto;line-height:22px;">(每种类型的文件只能上传一次，如果上传有误，请删除后重新上传)</span>-->
				</div>
				<div class="linkcss">
					<input class="linkbtn" type="button" value="更新&保存" id="update_essaybtm" style="margin-bottom:5px;margin-left:405px;"/>
				</div>
				<div class="upload_content">
				<table  width=1000; style="margin-left: 55px; margin-bottom: 20px;">
					<tbody>
					<tr>
						<td>项目基金列表</td>
						<td><input type="button" id="btnAddFund" value="添加基金信息"></td>
					</tr>
					</tbody>
				</table>
				</div>
				<div class="upload_content">
				<c:if test="${not empty essay.fundList}">
				<table  width=1000; style="margin-left: 55px; margin-bottom: 20px;border:1px solid #D4D4D4" border="1">
				<tbody>
					<tr>
						<th width="20%" align="center">基金级别</th>
						<th width="20%" align="center">基金中文名</th>
						<th width="20%" align="center">基金英文名</th>
						<th width="10%" align="center">基金号</th>
						<th width="20%" align="center">备注</th>
						<th width="10%" align="center">操作</th>
					</tr>
					<c:forEach items="${essay.fundList}" var="fund">
					<tr>
						<td width="20%" align="center">${fund.fundLevel }</td>
						<td width="20%" align="center">${fund.fundCName }</td>
						<td width="20%" align="center">${fund.fundEName }</td>
						<td width="10%" align="center">${fund.fundNumber }</td>
						<td width="20%" align="center">${fund.fundPs }</td>
						<td width="10%" align="center">
						<c:if test="${not empty essay.fundList}"></c:if>
						<a href="../essay/deleteFundReturn.do?fundId=${fund.fundId}">删除</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</c:if>		
				</div>
				项目作者信息
				<div class="upload_content">
					<table width=1000; style="margin-left: 55px; margin-bottom: 20px;border:1px solid #D4D4D4" border="1">
						<tbody>
							<tr>
								<th>文件序号</th>
								<th>通讯作者</th>
								<th>作者姓名</th>
								<th>工作单位</th>
								<th>地址及邮编</th>
								<th>手机或电话号码</th>
								<th>email</th>
								<th>操作</th>
							</tr>
							<tr>
								<td>${essay.essayId}</td>
								<td>${user.username}</td>
								<td>${essay.username}</td>
								<td>${user.workUnit}</td>
								<td>${user.address}</td>
								<td>${user.telephone};${user.phone}</td>
								<td>${user.email}</td>
								<td>
								<c:if test="${user !=null}">
									<td><a href="#">修改信息</a></td>
								</c:if>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				</form>
				<div class="linkcss">
					<input class="linkbtn" type="button" value="更新&保存" id="update_essaybtm2" />
					<input class="linkbtn" type="button" value="投稿" id="contribute_essaybtm" />
					<input class="linkbtn" type="button" value="返回稿件中心" id="btnReturn" />
				</div>
			</div>
	   </div>
	   </div>
	   </div>
<jsp:include page="../web/foot.jsp"></jsp:include>
<script type="text/javascript" src="../scripts/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="../scripts/js/ajaxfileupload.js"></script>
<script type="text/javascript">
function fileSelected() { 
	var file = $("#file").val(); // 文件选择后触发函数
	/* console.log(file) */
	$.ajaxFileUpload({
		url:"../essay/upload.do", //需要链接到服务器地址  
		secureuri:false,  //是否启用安全提交,默认为false
		fileElementId:"file", //文件选择框的id属性  
		dataType: 'json',  //json 
		/* allowType:'jpg,jpeg,png,JPG,JPEG,PNG', */
		success: function (rr) {
			var src="../img/file_IMG.jpg";
			//$("#sign").prop("src",src); //去替换掉img标签里src里的值
			$(".contentUrl").val(rr.data); 
			alert('上传成功！'); 
			},
			error:function(XMLHttpRequest, textStatus, errorThrown){ 
				alert('上传失败！'); 
			} 
	}); 
}

$(function() {
	//btnAddFund
	$("#btnAddFund").click(function (){
		var essayId=$("#essayId").val();
		alert(essayId);
    	location.href="../essay/showAddFund.do?essayId="+essayId;
	});
	$("#update_essaybtm").click(function (){
		var data=$("#essayInfo").serialize();
		$.ajax({
			type : 'POST',
            url : '../essay/insertEssayInfo.do',
            data : data,
            success : function(msg) {
            	alert("保存数据成功");
            } 
         });
	});
	$("#update_essaybtm2").click(function (){
		var data=$("#essayInfo").serialize();
		$.ajax({
			type : 'POST',
            url : '../essay/updatEssayInfo.do',
            data : data,
            success : function(msg) {
            	alert("更新并保存成功");
            	location.href='../essay/selectEssayByUsernameAndStatusId.do?statusId=60&pageCode=1';
            } 
         });
	});
	$("#contribute_essaybtm").click(function (){
		var data=$("#essayInfo").serialize();
		console.log(data)
		$.ajax({
			type : 'POST',
            url : '../essay/contributeEssay.do',
            data : data,
            success : function(msg) {
            	location.href='../essay/selectEssayByUsernameAndStatusId.do?statusId=66&pageCode=1';
            } 
         });
	});
	//btnReturn
	$("#btnReturn").click(function(){
		
    	location.href='../essay/paperCenter.do';
          
    });
});

</script>
</body>
</html>