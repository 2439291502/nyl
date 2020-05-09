<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投稿留言</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
</head>
<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#btnNext').click(function(){
		var lMessageContent = $("#lMessageContent").val();
		if(lMessageContent==''||lMessageContent==null){
			location.href="../essay/contributeUploadfile.do";
		}
		else{
			var data=$("#formleaveMessage").serialize();
			console.log(data)
			$.ajax({
				type : 'POST',
				url : '../essay/addContributeLeaveMessage.do',
				data : data,
				success : function(obj) {
					if(obj.state==1){
						location.href='../essay/contributeUploadfile.do';
					}else{
						 $("#msg").text("操作错误，重新操作");
						 $("#msg").css("color","red");
						location.href='../essay/contributeLeaveMessage.do';
					}
				} ,
		       error:function(){
		           //错误处理
		       	location.href="../essay/contributeLeaveMessage.do";
		       }
			});
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
					<a href="../essay/contributeFund.do" style="cursor:hand;">
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
					<form action="" name="formlMessage" id="formleaveMessage">
					<input type="hidden" name="essayId" value="${essay.essayId }">	
					<input type="hidden" name="leaveMessageId" value="${lMessage.leaveMessageId}">		
					<div class="createmanu" align="left">
					如果您有什么特殊要求，可以给编辑部留言, 编辑部会认真考虑您的意见。
					</div>
					<div class="createmanu" align="left">
						<textarea rows="10" cols="20" style="width: 95%;" name="lMessageContent" id="lMessageContent">${lMessage.lMessageContent}</textarea>
					</div>
					</form>
				</div>
			</div>
		</div>				 
	</div>
<jsp:include page="../web/foot.jsp"></jsp:include>
</body>
</html>