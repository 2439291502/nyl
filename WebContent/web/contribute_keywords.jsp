<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>填写稿件关键词</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
</head>
<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
$(function(){
	 $("#keywords").blur(function(){
		var keywords = $("#keywords").val();
 		/* alert(keywords.length); */
		if ((keywords==null || keywords=="")&& keywords.length<250) {
			 $("#msg").text("关键词不能为空");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#keywords").focus(); 
		   	 return;
		}
	 });
	 $("#englishKeywords").blur(function(){
		var englishKeywords = $("#englishKeywords").val();
		if ((englishKeywords==null || englishKeywords=="")&& englishKeywords.length<250) {
			 $("#msg").text("英文关键词不能为空");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#englishKeywords").focus(); 
		    return;
		}
	 });
	$('#btnNext').click(function(){
		if($(".msg-error").length<=0){
			$("#msg").removeClass(".msg-error");
			var data=$("#formEssay").serialize();
			console.log(data)
			$.ajax({
				type : 'POST',
				url : '../essay/addContributeKeywords.do',
				data : data,
				success : function(obj) {
					if(obj.state==1){
						location.href='../essay/contributeStyle.do';
					}else{
						 $("#msg").text("关键词不能为空");
						 $("#msg").css("color","red");
						location.href='../essay/contributeKeywords.do';
					}
				} ,
		       error:function(){
		           //错误处理
		       	location.href="../essay/contributeKeywords.do";
		       }
			});
		}else{
		  	$("#msg").text("关键词不能为空");
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
					<a href="../essay/contributeAbstract.do" style="cursor:hand;">
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
					<div class="createmanu" align="left">
					请在下框中输入
					<b>稿件关键词</b>
					请在下框中输入稿件中文关键词(或从您的论文中复制过来)
					<font color="red">
					<b>注意：</b>
					</font>多个关键词用分号分割。
		    			
		    		<font color="red">
		    		<b>（必填）</b>
		    		</font>
					</div>
					<div class="createmanu" align="left">
						<textarea rows="4" cols="20" style="width: 95%;" name="keywords" id="keywords">${essay.keywords }</textarea>
					</div>
					<div class="createmanu" align="left">
					请在下框中输入
					<b>稿件英文关键词</b>
					请在下框中输入稿件英文关键词(或从您的论文中复制过来)
					<font color="red">
						<b>注意：</b>
					</font>
					多个关键词用分号分割。
		     		<font color="red">
		    			<b>（必填）</b>
		    		</font>
					</div>
					<div class="createmanu" align="left">
						<textarea rows="4" cols="20" style="width: 95%;" name="englishKeywords" id="englishKeywords">${essay.englishKeywords }</textarea>
					</div>
					</form>
				</div>
			</div>
		</div>				 
	</div>
<jsp:include page="../web/foot.jsp"></jsp:include>
</body>
</html>