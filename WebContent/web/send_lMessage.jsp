<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>作者留言</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
</head>
<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#btnSendLMessage').click(function(){
		var lMessageContent=$("#lMessageContent").val();
		/* alert(lMessageContent); */
		if(lMessageContent.length>0){
			var data=$("#formlMessage").serialize();
			$.ajax({
				type : 'POST',
				url : '../lMessage/sendLMessage.do',
				data : data,
				success : function(obj) {
					if(obj.state==1){
						alert(obj.message);
						location.href="../lMessage/showLMessage.do";
					}else{
						 $("#msg").text(obj.message);
						 $("#msg").css("color","red");
						 location.href="../lMessage/showLMessage.do";
					}
				} ,
		       error:function(){
		           //错误处理
		       	location.href="../lMessage/showLMessage.do";
		       }
			});
		}else{
		  	$("#msg").text("提交留言不能为空");
			$("#msg").css("color","red");
		}
		
	});
	$('#saveLMessage').click(function(){
		var lMessageContent=$("#lMessageContent").val();
		
		if(lMessageContent.length>0){
			var data=$("#formlMessage").serialize();
			$.ajax({
				type : 'POST',
				url : '../lMessage/saveLMessage.do',
				data : data,
				success : function(obj) {
					if(obj.state==1){
						alert(obj.message);
						location.href="../lMessage/showLMessage.do";
					}else{
						 $("#msg").text(obj.message);
						 $("#msg").css("color","red");
						/*  location.href="../lMessage/sendLMessage.do"; */
					}
				} ,
		       error:function(){
		           //错误处理
		    	 location.href="../lMessage/showLMessage.do";
		       }
			});
		}else{
			/* alert() */
		  	$("#msg").text("保存留言不能为空");
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
							<span>稿件中心</span><span>》》稿件管理中心》》</span><span style="font-weight: 700;">消息管理</span>
						</div>
						<div class="stepHelpInfo">
							<div>
								请从左侧栏目导航中选择相应功能栏目完成处理操作
							</div>
						</div>
					</div>
					<div>
						<div class="createmanu" align="left">
							<span id="msg"></span>
						</div>
						<form action="" name="formlMessage" id="formlMessage">
						<input type="hidden" name="leaveMessageId" value="">		
						<div class="createmanu" align="left">
						如果您有什么特殊要求，可以给编辑部留言, 编辑部会认真考虑您的意见。
						</div>
						<div class="createmanu" align="left">
							<textarea rows="10" cols="20" style="width: 95%;" name="lMessageContent" id="lMessageContent"></textarea>
						</div>
						</form>
					</div>
					<div class="linkcss">
					<input type="button" style="width:80px;padding:3px;margin:40px;margin-left:280px;" id="btnSendLMessage" value="发送消息">
					<input type="button" style="width:80px;padding:3px;margin:40px;margin-left:180px;"  id="saveLMessage" value="保存">
					<!-- <a href="../lMessage/updateLMessage.do" style="cursor:hand;">
						发送消息
					</a>
					<input type="button" id="saveLMessage" value="保存"> -->
				</div>	
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../web/foot.jsp"></jsp:include>
</body>
</html>