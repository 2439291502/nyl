<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>填写稿件参考文献</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
</head>
<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#reference").blur(function(){
		var reference = $("#reference").val();
 		/* alert(reference.length); */
		if ((reference==null || reference=="")&& reference.length<2000) {
			 $("#msg").text("文献长度不要超过2000个汉字（包括空格）且不能为空");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#reference").focus(); 
		   	 return;
		}
	});
	 
	$('#btnNext').click(function(){
		console.log($(".msg-error").length)
		if($(".msg-error").length<=0){
			$("#msg").removeClass(".msg-error");
			var data=$("#formEssay").serialize();
			console.log(data)
			$.ajax({
			type : 'POST',
			url : '../essay/addContributeReference.do',
			data : data,
			success : function(obj) {
				if(obj.state==1){
					location.href='../essay/contributeFund.do';
				}else{
					 $("#msg").text("题目长度不要超过125个汉字（包括空格）且不能为空");
					 $("#showMsg").css("color","red");
					location.href='../essay/contributereference.do';
				}
			} ,
	       error:function(){
	           //错误处理
	       	location.href="../essay/contributeReference.do";
	       }
		
			});
		}else{
		  	$("#msg").text("题目长度不要超过250个字符（包括空格）且不能为空");
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
					<a href="../essay/contributeStyle.do" style="cursor:hand;">
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
					<b>稿件参考文献</b>
					（或从您的论文中复制过来）
		    			
		    		<font color="red">
		    		<b>（必填）</b>
		    		</font>
					</div>
					<div class="createmanu" align="left">
						<textarea rows="10" cols="20" style="width: 95%;" name="reference" id="reference">${essay.reference }</textarea>
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