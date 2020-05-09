<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
</head>
<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
$(function(){
	 $("#opassword").blur(function(){
		var password=$("#password").val();
		var opassword = $("#opassword").val();
		console.log(password)
		console.log(opassword)
 		/* alert(opassword.length); */
		if ((opassword==null || opassword=="")&& opassword.length<250) {
			 $("#msg").text("旧密码不能为空");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#opassword").focus(); 
		}else if(opassword != password){
			 $("#msg").text("旧密码输入错误");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#opassword").focus(); 
		}else{
			$("#msg").removeClass(".msg-error");
		}
	 });
	 $("#npassword").blur(function(){
		var password=$("#password").val();
		var npassword = $("#npassword").val();
 		/* alert(opassword.length); */
		if ((npassword==null || npassword=="")&& npassword.length<17) {
			 $("#msg").text("新密码不能为空");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#npassword").focus(); 
		}else if(opassword==password){
			 $("#msg").text("新密码与旧密码相同");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#npassword").focus(); 
		}else{
			$("#msg").removeClass(".msg-error");
		}		
	 });
	 $("#repassword").blur(function(){
		var repassword=$("#repassword").val();
		var npassword = $("#npassword").val();
 		/* alert(opassword.length); */
		if ((npassword==null || npassword=="")&& npassword.length<17) {
			 $("#msg").text("确认密码不能为空");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#repassword").focus(); 
		}else if(repassword!=npassword){
			 $("#msg").text("两次密码输入不一致");
			 $("#msg").css("color","red");
			 $("#msg").attr("class", "msg-error");
			 $("#repassword").focus(); 
		}else{
			$("#msg").removeClass(".msg-error");
		}
	 });
	$('#btnUpdateUser').click(function(){
		var data=$("#formUser").serialize();
		var opassword = $("#opassword").val();
		var npassword = $("#npassword").val();
		var repassword = $("#repassword").val();
  		if($(".msg-error").length<=0 && opassword!="" && npassword!="" && repassword!=""){
			$("#msg").removeClass(".msg-error");
 			console.log(data)
			$.ajax({
				type : 'POST',
				url : '../user/updateUser.do',
				data : data,
				success : function(obj) {
					if(obj.state==1){
						alert(obj.message);
						location.href='../essay/paperCenter.do';
					}else{
						 $("#msg").text(obj.message);
						 $("#msg").css("color","red");
						location.href='../user/showUserInfo.do';
					}
				}
			});
		}else{
			 $("#msg").text("输入不能为空");
			 $("#msg").css("color","red");
		}
	});
	$('#btnReturn').click(function(){
		location.href='../essay/paperCenter.do';
	});
	 
});
</script>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
		<%-- <jsp:include page="author_head.jsp"></jsp:include> --%>
		<div class="main">
			<%-- <jsp:include page="../web/author_paper_center_left.jsp"></jsp:include> --%>
			<div class="work_left">
				<div class="workAreaHead">
					<div class="stepName">
						<span>》》个人中心</span>
					</div>
				</div>
				<div class="createmanuBox">
					<div class="createmanu" align="left">
						<span id="msg"></span>
					</div>
					<form action="" name="formUser" id="formUser">
					<input type="hidden" name="userId" value="${user.userId}">		
					<input type="hidden" name="password"id="password" value="${user.password}">
					<div class="createmanu" align="left">
						<table width="100%">
							<tbody>
								<tr>
									<td width="30%" align="left">修改密码: </td>
									<td></td>
								</tr>
								<tr>
									<td width="30%" align="right">用户名:</td>
									<td width="70%">
										<input class="fundEle" name="username" value="${user.username}" disabled>
									</td>
								</tr>
								<tr>
									<td width="30%" align="right">旧密码：<font color="red">(*)</font>:</td>
									<td width="70%">
										<input type="password" class="fundEle" id="opassword" value=""></input>
									</td>
								</tr>
								
								<tr>
									<td width="30%" align="right">新密码：<font color="red">(*):</font></td>
									<td width="70%">
										<input class="fundEle" name="npassword" id="npassword" value=""></input>
									</td>
								</tr>
								<tr>
									<td width="30%" align="right">确认密码：<font color="red">(*)</font></td>
									<td width="70%">
										<input class="fundEle" name="repassword" id="repassword" value=""></input>
									</td>
								</tr>
								<tr>
									<td></td>
									<td width="70%">
										<input type="button" style="width:80px; margin-right:45px;" id="btnUpdateUser" value="确认修改">
										<input type="button" style="width:80px;" id="btnReturn" value="返回">
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