<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>填写稿件摘要</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
</head>
<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
$(function(){
	 $("#abstracts").blur(function(){
		var abstracts = $("#abstracts").val();
 		/* alert(abstracts.length); */
		if ((abstracts==null || abstracts=="")&& abstracts.length<250) {
			 $("#msg").text("摘要不能为空");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#abstracts").focus(); 
		   	 return;
		}
	 });
	 $("#englishAbstract").blur(function(){
		var englishAbstract = $("#englishAbstract").val();
		if ((englishAbstract==null || englishAbstract=="")&& englishAbstract.length<250) {
			 $("#msg").text("英文摘要不能为空");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#englishAbstract").focus(); 
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
				url : '../essay/addContributeAbstract.do',
				data : data,
				success : function(obj) {
					if(obj.state==1){
						location.href='../essay/contributeKeywords.do';
					}else{
						 $("#msg").text("题目长度不要超过125个汉字（包括空格）且不能为空");
						 $("#msg").css("color","red");
						location.href='../essay/contributeAbstract.do';
					}
				} ,
		       error:function(){
		           //错误处理
		       	location.href="../essay/contributeAbstract.do";
		       }
			});
		}else{
		  	$("#msg").text("摘要不能为空");
			$("#msg").css("color","red");
		}
		
	});
	 
});
</script>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
		<jsp:include page="../web/author_head.jsp"></jsp:include>
		<div class="main contribute">
			<jsp:include page="../web/contribute_left.jsp"></jsp:include>
			<div class="work left">
				<div class="linkcss">
					<a href="../essay/contributeAuthor.do" style="cursor:hand;">
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
					<b>稿件摘要</b>
					请在下框中输入稿件中文摘要（或从您的论文中复制过来）
		    		<font color="red">
		    		<b>（必填）</b>
		    		</font>
					</div>
					<div class="createmanu" align="left">
						<textarea rows="10" cols="20" style="width: 95%;" id="abstracts" name="abstracts">${essay.abstracts } </textarea>
					</div>
					<div class="createmanu" align="left">
					请在下框中输入
					<b>稿件英文摘要</b>
					请在下框中输入稿件英文摘要（或从您的论文中复制过来）
		    			
		    		<font color="red">
		    		<b>（必填）</b>
		    		</font>
					</div>
					<div class="createmanu" align="left">
						<textarea rows="10" cols="20" style="width: 95%;" id="englishAbstract" name="englishAbstract">${essay.englishAbstract }</textarea>
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