<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加作者信息</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
</head>
<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
$(function(){
	 $("#tureName").blur(function(){
		var tureName = $("#tureName").val();
 		/* alert(fundLevel.length); */
		if ((tureName==null || tureName=="")&& tureName.length<250) {
			 $("#msg").text("姓名不能为空");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#tureName").focus(); 
/* 		   	 return;
 */		}
	 });
	 $("#phone").blur(function(){
		var phone = $("#phone").val();
		if ((phone==null || phone=="")&& phone.length<250) {
			 $("#msg").text("phone不能为空");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#phone").focus(); 
/* 		    return;
 */		}
	 });
	 $("#email").blur(function(){
		var email = $("#email").val();
		if ((email==null || email=="")&& email.length<250) {
			 $("#msg").text("emial不能为空");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#email").focus(); 
/* 		    return;
 */		}
	 });
	
	$('#btnAddAuthor').click(function(){
		var data=$("#formAList").serialize();
		/* alert(data); */
		if($(".msg-error").length<=0){
			$("#msg").removeClass(".msg-error");
			//var data=$("#formAList").serialize();
			console.log(data)
			$.ajax({
				type : 'POST',
				url : '../essay/addAuthor.do',
				data : data,
				success : function(obj) {
					if(obj.state==1){
						alert(obj.message);
						location.href='../essay/contributeAuthor.do';
					}else{
						 $("#msg").text(obj.message);
						 $("#msg").css("color","red");
						location.href='../essay/addContributeAuthor.do';
					}
				} ,
		       error:function(){
		           //错误处理
		       	location.href="../essay/addContributeAuthor.do";
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
		<jsp:include page="../web/author_head.jsp"></jsp:include>
		<jsp:include page="../web/contribute_left.jsp"></jsp:include>
			<div class="work left">
				<div>
					<div class="createmanu" align="left">
						<span id="msg"></span>
					</div>
					<form action="" name="formAList" id="formAList">
					<input type="hidden" name="essayId" value="${essay.essayId}">	
					<input type="hidden" name="contributor" value="${user.username}">
					<input type="hidden" name="userId" value="${user.userId}">	
					<div class="createmanu" align="left">
						<table width="100%">
							<tbody>
								<tr>
									<td width="28%" align="right">&asymp;&asymp;<b>添加作者信息</b>&asymp;&asymp;</td>
									<td></td>
								</tr>
								<tr>
									<td width="30%" align="right">作者真实姓名：<font color="red">(*)</font>:</td>
									<td width="70%">
										<input class="fundEle" name="tureName" id="tureName" value=""></input>
									</td>
								</tr>
								<tr>
									<td width="30%" align="right">作者电话号码：<font color="red">(*)</font>:</td>
									<td width="70%">
										<input class="fundEle" name="phone" id="phone" value=""></input>
									</td>
								</tr>
								<tr>
									<td width="30%" align="right">作者邮箱：<font color="red">(*):</font></td>
									<td width="70%">
										<input class="fundEle" name="email" id="email" value=""></input>
									</td>
								</tr>
								<tr>
									<td width="30%" align="right">职称：</td>
									<td width="70%">
										<select name="postId" id="postId" style="width:46%">
											<option value=""></option>
											<option value="1">院士</option>
											<option value="2">研究员</option>
											<option value="3">副研究员</option>
											<option value="4">教授</option>
											<option value="5">副教授</option>
											<option value="6">高级工程师</option>
											<option value="7">工程师</option>
											<option value="8">研究生</option>
											<option value="9">其他</option>
										</select>
									</td>
								</tr>
								<tr>
									<td width="30%" align="right">专业领域：</td>
									<td width="70%">
										<select name="styleId" style="width:46%">
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
									</td>
								</tr>
								<tr>
									<td width="30%" align="right">研究方向：</td>
									<td width="70%">
										<textarea style="width: 300px; height: 69px;" rows="4" cols="20" name="research" id="research"></textarea>
									</td>
								</tr>
								<tr>
									<td width="30%" align="right">工作单位：</td>
									<td width="70%">
										<input class="fundEle" name="workUnit" id="workUnit" value=""></input>
									</td>
								</tr>
								<tr>
									<td width="30%" align="right">通讯地址：</td>
									<td width="70%">
										<input class="fundEle" name="address" id="address" value=""></input>
									</td>
								</tr>
								<tr>
									<td width="30%" align="right">邮编：</td>
									<td width="70%">
										<input class="fundEle" name="postcode" id="postcode" value=""></input>
									</td>
								</tr>					
								<tr>
									<td></td>
									<td width="70%">
										<a class="fundlink" id="btnAddAuthor">添加</a>
										<a class="fundlink" href="../essay/contributeFund.do">返回</a>
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
<jsp:include page="../web/foot.jsp"></jsp:include>
</body>
</html>
















