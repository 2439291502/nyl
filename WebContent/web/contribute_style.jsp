<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>填写稿件类型</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
</head>
<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
$(function(){
	 $("#title").blur(function(){
		var title = $("#title").val();
 		/* alert(title.length); */
		if ((title==null || title=="")&& title.length<250) {
			 $("#msg").text("中文题目长度不要超过125个汉字（包括空格）且不能为空");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#title").focus(); 
		   	 return;
		}
	 });
	 $("#etitle").blur(function(){
		var etitle = $("#etitle").val();
		if ((etitle==null || etitle=="")&& etitle.length<250) {
			 $("#msg").text("英文标题长度不要超过250个字符（包括空格）且不能为空");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#etitle").focus(); 
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
				url : '../essay/addContributeStyle.do',
				data : data,
				success : function(obj) {
					if(obj.state==1){
						location.href='../essay/contributeReference.do';
					}else{
						 $("#msg").text("题目长度不要超过125个汉字（包括空格）且不能为空");
						 $("#showMsg").css("color","red");
						location.href='../essay/contributeStyle.do';
					}
				} ,
		       error:function(){
		           //错误处理
		       	location.href="../essay/contributeStyle.do";
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
					<a href="../essay/contributeKeywords.do" style="cursor:hand;">
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
					请在下框中输入稿件拟投栏目
					<b>稿件类型</b>
		    			
		    		<font color="red">
		    		<b>（必填）</b>
		    		</font>
					</div>
					<div class="createmanu" align="left">
						<select name="styleId" style="width:80%">
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