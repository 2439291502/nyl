<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传稿件内容及附件</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
</head>
<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="../scripts/js/ajaxfileupload.js"></script>
<script type="text/javascript">
function fileSelected() { 
	var file = $("#file").val(); // 文件选择后触发函数
	$.ajaxFileUpload({
		url:"../essay/upload.do", //需要链接到服务器地址  
		secureuri:false,  //是否启用安全提交,默认为false
		fileElementId:"file", //文件选择框的id属性  
		dataType: 'json',  //json 
		/* allowType:'jpg,jpeg,png,JPG,JPEG,PNG', */
		success: function (rr) {
			//var src="../img/file_IMG.jpg";
			//$("#sign").prop("src",src); //去替换掉img标签里src里的值
			$("#contentUrl").val(rr.data); 
			alert('上传成功！'); 
			},
			error:function(XMLHttpRequest, textStatus, errorThrown){ 
				alert('上传失败！'); 
			} 
	}); 
}

$(function() {
	$("#btnNext").click(function (){
		var file = $("#file").val();
		if(file!=null){
			var data=$("#formEssay").serialize();
			console.log(data)
			$.ajax({
				type : 'POST',
	            url : '../essay/addUploadfile.do',
	            data : data,
	            success : function(msg) {
	            	location.href='../essay/contributeConfirm.do';
	            }
	         });
		}else{
			$("#msg").text("基金类别不能为空");
		    $("#msg").css("color","red");
		}
		
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
					<a href="../essay/contributeLeaveMessage.do" style="cursor:hand;">
						<img src="../img/author_img/btnPre.jpg" width="68" height="25"/>
					</a>
					<a id="btnNext" style="cursor:hand;">
						<img src="../img/author_img/btnNext.jpg" width="68" height="25"/>
					</a>	
				</div>	
				<div>
					<div class="createmanu" align="left">
						<span id="msg"></span>
					</div>
					<form action="" name="formEssay" id="formEssay">
					<input type="hidden" name="essayId" value="${essay.essayId }">		
					<input type="hidden"  name="contentUrl" id="contentUrl">
					<div class="createmanu" align="left">
					稿件上传
		    		<font color="red">
		    		<b>（必填）</b>
		    		</font>
		    		<br>
					选择您的稿件文件上传（上传文件前请确认文章已按编辑部提供的模板进行编辑！），如果上传错误，可以在列表中删除，然后选择正确的文件重新上传即可(注意：请分别对应一一上传)。
					</div>
					<div class="createmanu" align="left">
						稿件全文(或压缩包)<input type="file"  name="file" id="file" onchange="fileSelected()">
		    		<font color="red">
		    		<b>（必填）</b>
		    		</font>
		    		(rar|doc|zip|pdf|text|docx|.  20M)
					</div>
					<div class="createmanu" align="left">
						<div class="upload_content">
					<table width=900; style="margin-bottom: 20px;border:1px solid #D4D4D4">
						<tbody>
							<tr>
								<th>稿件序号</th>
								<th>稿件类型</th>
								<th>稿件标题</th>
								<th>稿件作者</th>
								<th>下载</th>
							</tr>
							<tr>
								<td>${essay.essayId}</td>
								<td>${essay.essayStyle.styleName}</td>
								<td>${essay.title}</td>
								<td>${essay.username}</td>
								<td><fmt:formatDate  value="${essay.contributeDate}" type="both" pattern="yyyy.MM.dd"/></td>
								<c:if test="${essay.contentUrl !=null}">
									<td><a href="../essay/download.do?contentUrl=${essay.contentUrl}" title="${essay.contentUrl}">点击下载文件</a></td>
								</c:if>
							</tr>

						</tbody>
					</table>

				</div>
					</div>
					</form>
				</div>
			</div>
		</div>				 
	</div>
<jsp:include page="../web/foot.jsp"></jsp:include>
</body>
</html>